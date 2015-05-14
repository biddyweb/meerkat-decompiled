package co.getair.meerkat.video.broadcast;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import android.graphics.YuvImage;
import android.hardware.Camera;
import android.hardware.Camera.CameraInfo;
import android.hardware.Camera.Parameters;
import android.hardware.Camera.PreviewCallback;
import android.hardware.Camera.Size;
import android.media.AudioRecord;
import android.media.MediaCodec;
import android.media.MediaCodec.BufferInfo;
import android.media.MediaFormat;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.opengl.GLES20;
import android.os.Handler;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import co.getair.meerkat.utilities.objectPool.NoUnlockedObjectException;
import co.getair.meerkat.utilities.objectPool.ObjectPool;
import co.getair.meerkat.video.broadcast.dfh.thread.ThreadPuddle;
import co.getair.meerkat.video.broadcast.mp4writer.MediaSample;
import co.getair.meerkat.video.broadcast.mp4writer.MeerkatMp4Builder;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.nio.ShortBuffer;
import java.util.Iterator;
import java.util.List;

public class ChunkedHWRecorder
  implements Camera.PreviewCallback
{
  public static final int AUDIO_FORMAT = 2;
  private static final String AUDIO_MIME_TYPE = "audio/mp4a-latm";
  public static final int CHANNEL_CONFIG = 16;
  private static final int FRAME_RATE = 30;
  public static final int IFRAME_INTERVAL = 3;
  private static final int POOL_SIZE = 300;
  private static final int PREVIEW_HEIGHT = 720;
  private static final int PREVIEW_WIDTH = 1280;
  public static final int SAMPLES_PER_FRAME = 1024;
  public static final int SAMPLE_RATE = 44100;
  private static final String TAG = "CameraToMpegTest";
  private static final boolean TRACE = false;
  private static final boolean VERBOSE = false;
  private static final int VIDEO_HEIGHT = 640;
  private static final String VIDEO_MIME_TYPE = "video/avc";
  private static final int VIDEO_WIDTH = 360;
  public static ObjectPool<MediaSample> mediaSamplesPool = null;
  boolean audioEosRequested = false;
  private AudioRecord audioRecord;
  public MeerkatMp4Builder builder;
  private RunnableWithResultObject cameraOnPreviewFrameCallback;
  private int cameraOrientation = 1;
  private EglCore eglCore;
  boolean eosReceived = false;
  boolean eosSentToAudioEncoder = false;
  boolean eosSentToVideoEncoder = false;
  boolean firstFrameReady = false;
  private boolean flashOn = false;
  int frameCount = 0;
  boolean fullStopPerformed = false;
  boolean fullStopReceived = false;
  private long lastEncodedAudioTimeStamp = 0L;
  private MediaCodec.BufferInfo mAudioBufferInfo;
  private MediaCodec mAudioEncoder;
  private MediaFormat mAudioFormat;
  private Camera mCamera;
  private int mCameraId = 0;
  private EGLSurface mEGLDisplaySurface;
  private CodecInputSurface mInputSurface;
  private SurfaceTextureManager mStManager;
  private MediaCodec.BufferInfo mVideoBufferInfo;
  private MediaCodec mVideoEncoder;
  private MediaFormat mVideoFormat;
  private ThreadPuddle puddle = new ThreadPuddle(1);
  private int screenHeight;
  private int screenWidth;
  long startTime;
  long startWhen;
  SurfaceHolder surfaceHolder;
  int totalFrameCount = 0;

  public ChunkedHWRecorder(MeerkatMp4Builder paramMeerkatMp4Builder, int paramInt1, int paramInt2)
  {
    this.screenWidth = paramInt1;
    this.screenHeight = paramInt2;
    if (paramInt2 / paramInt1 != 1.777777777777778D)
      this.screenHeight = ((int)Math.round(1.777777777777778D * paramInt1));
    this.puddle.setPriority(10);
    this.builder = paramMeerkatMp4Builder;
    mediaSamplesPool = new ObjectPool(300);
    for (int i = 0; i < 300; i++)
      mediaSamplesPool.add(new MediaSample(new MediaCodec.BufferInfo()));
  }

  private static void choosePreviewSize(Camera.Parameters paramParameters, int paramInt1, int paramInt2)
  {
    Camera.Size localSize1 = paramParameters.getPreferredPreviewSizeForVideo();
    Iterator localIterator = paramParameters.getSupportedPreviewSizes().iterator();
    while (localIterator.hasNext())
    {
      Camera.Size localSize2 = (Camera.Size)localIterator.next();
      if ((localSize2.width == paramInt1) && (localSize2.height == paramInt2))
        paramParameters.setPreviewSize(paramInt1, paramInt2);
    }
    do
    {
      return;
      Log.w("CameraToMpegTest", "Unable to set preview size to " + paramInt1 + "x" + paramInt2);
    }
    while (localSize1 == null);
    paramParameters.setPreviewSize(localSize1.width, localSize1.height);
  }

  private void chunkAudioEncoder()
    throws IOException
  {
    stopAndReleaseAudioEncoder();
    this.mAudioBufferInfo = new MediaCodec.BufferInfo();
    this.mAudioEncoder = MediaCodec.createEncoderByType("audio/mp4a-latm");
    this.mAudioEncoder.configure(this.mAudioFormat, null, null, 1);
    this.mAudioEncoder.start();
  }

  private void chunkVideoEncoder()
    throws IOException
  {
    stopAndReleaseVideoEncoder();
    this.mVideoBufferInfo = new MediaCodec.BufferInfo();
    this.mVideoEncoder = MediaCodec.createEncoderByType("video/avc");
    this.mVideoEncoder.configure(this.mVideoFormat, null, null, 1);
    this.mInputSurface.updateSurface(this.mVideoEncoder.createInputSurface());
    this.mVideoEncoder.start();
    this.mInputSurface.makeEncodeContextCurrent();
  }

  private void drainEncoder(final MediaCodec paramMediaCodec, final MediaCodec.BufferInfo paramBufferInfo, final boolean paramBoolean)
    throws IOException, NoUnlockedObjectException
  {
    this.puddle.run(new Runnable()
    {
      public void run()
      {
        if ((paramBoolean) && (paramMediaCodec != null) && (paramMediaCodec == ChunkedHWRecorder.this.mVideoEncoder) && (paramMediaCodec != null))
        {
          paramMediaCodec.signalEndOfInputStream();
          ChunkedHWRecorder.this.eosSentToVideoEncoder = true;
        }
        if ((paramMediaCodec == null) || (ChunkedHWRecorder.this.fullStopPerformed));
        label220: 
        do
        {
          do
          {
            return;
            ByteBuffer[] arrayOfByteBuffer;
            int i;
            while (true)
            {
              try
              {
                arrayOfByteBuffer = paramMediaCodec.getOutputBuffers();
                i = paramMediaCodec.dequeueOutputBuffer(paramBufferInfo, 50L);
                if (i == -1)
                {
                  if (!paramBoolean)
                    break;
                  System.nanoTime();
                  continue;
                }
              }
              catch (Exception localException)
              {
                return;
              }
              if (i != -3)
                if (i == -2)
                {
                  MediaFormat localMediaFormat = paramMediaCodec.getOutputFormat();
                  if (paramMediaCodec == ChunkedHWRecorder.this.mVideoEncoder)
                  {
                    byte[] arrayOfByte1 = localMediaFormat.getByteBuffer("csd-1").array();
                    byte[] arrayOfByte2 = localMediaFormat.getByteBuffer("csd-0").array();
                    ChunkedHWRecorder.this.builder.setParametersSets(arrayOfByte1, arrayOfByte2);
                  }
                }
                else
                {
                  if (i >= 0)
                    break label220;
                  Log.w("CameraToMpegTest", "unexpected result from encoder.dequeueOutputBuffer: " + i);
                }
            }
            ByteBuffer localByteBuffer = arrayOfByteBuffer[i];
            if (localByteBuffer == null)
              throw new RuntimeException("encoderOutputBuffer " + i + " was null");
            if ((0x2 & paramBufferInfo.flags) != 0)
              paramBufferInfo.size = 0;
            if (paramBufferInfo.size != 0)
            {
              localByteBuffer.position(paramBufferInfo.offset);
              localByteBuffer.limit(paramBufferInfo.offset + paramBufferInfo.size);
              if (paramMediaCodec == ChunkedHWRecorder.this.mAudioEncoder)
              {
                if (paramBufferInfo.presentationTimeUs < ChunkedHWRecorder.this.lastEncodedAudioTimeStamp)
                  paramBufferInfo.presentationTimeUs = ChunkedHWRecorder.access$702(ChunkedHWRecorder.this, 23219L + ChunkedHWRecorder.this.lastEncodedAudioTimeStamp);
                ChunkedHWRecorder.access$702(ChunkedHWRecorder.this, paramBufferInfo.presentationTimeUs);
              }
              if (paramBufferInfo.presentationTimeUs < 0L)
                paramBufferInfo.presentationTimeUs = 0L;
              if (paramMediaCodec != ChunkedHWRecorder.this.mVideoEncoder)
                break label575;
            }
            while (true)
            {
              try
              {
                localMediaSample2 = (MediaSample)ChunkedHWRecorder.mediaSamplesPool.get();
                localMediaSample2.setBuffer(ByteBuffer.allocate(localByteBuffer.remaining()));
                localMediaSample2.buffer.put(localByteBuffer);
                localMediaSample2.buffer.position(0);
                localMediaSample2.info.set(paramBufferInfo.offset, paramBufferInfo.size, paramBufferInfo.presentationTimeUs, paramBufferInfo.flags);
                ChunkedHWRecorder.this.builder.processVideoSample(localMediaSample2);
                paramMediaCodec.releaseOutputBuffer(i, false);
                if ((0x4 & paramBufferInfo.flags) == 0)
                  break;
                if (paramBoolean)
                  break label684;
                Log.w("CameraToMpegTest", "reached end of stream unexpectedly");
                return;
              }
              catch (NoUnlockedObjectException localNoUnlockedObjectException2)
              {
                localNoUnlockedObjectException2.printStackTrace();
                MediaSample localMediaSample2 = null;
                continue;
              }
              try
              {
                localMediaSample1 = (MediaSample)ChunkedHWRecorder.mediaSamplesPool.get();
                localMediaSample1.setBuffer(ByteBuffer.allocate(localByteBuffer.remaining()));
                localMediaSample1.buffer.put(localByteBuffer);
                localMediaSample1.buffer.position(0);
                localMediaSample1.info.set(paramBufferInfo.offset, paramBufferInfo.size, paramBufferInfo.presentationTimeUs, paramBufferInfo.flags);
                ChunkedHWRecorder.this.builder.processAudioSample(localMediaSample1);
              }
              catch (NoUnlockedObjectException localNoUnlockedObjectException1)
              {
                while (true)
                {
                  localNoUnlockedObjectException1.printStackTrace();
                  MediaSample localMediaSample1 = null;
                }
              }
            }
          }
          while (!ChunkedHWRecorder.this.fullStopReceived);
          if (paramMediaCodec == ChunkedHWRecorder.this.mVideoEncoder)
          {
            Log.i("CameraToMpegTest", "Stopping and releasing video encoder");
            ChunkedHWRecorder.this.stopAndReleaseVideoEncoder();
            return;
          }
        }
        while (paramMediaCodec != ChunkedHWRecorder.this.mAudioEncoder);
        label575: Log.i("CameraToMpegTest", "Stopping and releasing audio encoder");
        label684: ChunkedHWRecorder.this.stopAndReleaseAudioEncoder();
      }
    });
  }

  private void prepareCamera(int paramInt1, int paramInt2, int paramInt3)
  {
    if ((paramInt3 != 1) && (paramInt3 != 0))
      throw new RuntimeException("Invalid cameraType");
    Camera.CameraInfo localCameraInfo = new Camera.CameraInfo();
    int i = Camera.getNumberOfCameras();
    for (int j = 0; ; j++)
      if (j < i)
      {
        Camera.getCameraInfo(j, localCameraInfo);
        if (localCameraInfo.facing == paramInt3)
          this.mCamera = Camera.open(j);
      }
      else
      {
        if (this.mCamera == null)
        {
          Log.d("CameraToMpegTest", "No front-facing camera found; opening default");
          this.mCamera = Camera.open();
        }
        if (this.mCamera != null)
          break;
        throw new RuntimeException("Unable to open camera");
      }
    Camera.Parameters localParameters = this.mCamera.getParameters();
    localParameters.setFlashMode("off");
    localParameters.setRecordingHint(true);
    if (localParameters.getSupportedFocusModes().contains("auto"))
      localParameters.setFocusMode("auto");
    choosePreviewSize(localParameters, 1280, 720);
    List localList = localParameters.getSupportedPreviewFpsRange();
    int[] arrayOfInt = (int[])localList.get(-1 + localList.size());
    localParameters.setPreviewFpsRange(arrayOfInt[0], arrayOfInt[1]);
    if (localParameters.isVideoStabilizationSupported())
      localParameters.setVideoStabilization(true);
    this.mCamera.setParameters(localParameters);
    Camera.Size localSize = localParameters.getPreviewSize();
    Log.d("CameraToMpegTest", "Camera preview size is " + localSize.width + "x" + localSize.height);
  }

  private void prepareEncoder(int paramInt1, int paramInt2, int paramInt3)
    throws IOException
  {
    this.eosSentToAudioEncoder = false;
    this.eosSentToVideoEncoder = false;
    this.fullStopReceived = false;
    this.mVideoBufferInfo = new MediaCodec.BufferInfo();
    this.mVideoFormat = MediaFormat.createVideoFormat("video/avc", paramInt1, paramInt2);
    this.mVideoFormat.setInteger("color-format", 2130708361);
    this.mVideoFormat.setInteger("bitrate", paramInt3);
    this.mVideoFormat.setInteger("frame-rate", 30);
    this.mVideoFormat.setInteger("i-frame-interval", 3);
    Log.d("CameraToMpegTest", "format: " + this.mVideoFormat);
    this.mVideoEncoder = MediaCodec.createEncoderByType("video/avc");
    this.mVideoEncoder.configure(this.mVideoFormat, null, null, 1);
    this.mInputSurface = new CodecInputSurface(this.mVideoEncoder.createInputSurface(), this.mEGLDisplaySurface, this.eglCore);
    this.mVideoEncoder.start();
    this.mAudioBufferInfo = new MediaCodec.BufferInfo();
    this.mAudioFormat = new MediaFormat();
    this.mAudioFormat.setString("mime", "audio/mp4a-latm");
    this.mAudioFormat.setInteger("aac-profile", 2);
    this.mAudioFormat.setInteger("sample-rate", 44100);
    this.mAudioFormat.setInteger("channel-count", 1);
    this.mAudioFormat.setInteger("bitrate", 64000);
    this.mAudioFormat.setInteger("max-input-size", 16384);
    this.mAudioEncoder = MediaCodec.createEncoderByType("audio/mp4a-latm");
    this.mAudioEncoder.configure(this.mAudioFormat, null, null, 1);
    this.mAudioEncoder.start();
  }

  private void prepareSurfaceTexture()
  {
    int i = 1;
    if ((this.mCameraId == i) && (this.cameraOrientation != 270));
    while (true)
    {
      this.mStManager = new SurfaceTextureManager(i);
      SurfaceTexture localSurfaceTexture = this.mStManager.getSurfaceTexture();
      try
      {
        this.mCamera.setPreviewTexture(localSurfaceTexture);
        return;
        int j = 0;
      }
      catch (IOException localIOException)
      {
        throw new RuntimeException("setPreviewTexture failed", localIOException);
      }
    }
  }

  private void releaseCamera()
  {
    if (this.mCamera != null)
    {
      this.mCamera.setPreviewCallback(null);
      this.mCamera.stopPreview();
      this.mCamera.release();
      this.mCamera = null;
    }
  }

  private void releaseEncodersAndMuxer()
  {
    stopAndReleaseEncoders();
  }

  private void releaseSurfaceTexture()
  {
    if (this.mStManager != null)
    {
      this.mStManager.release();
      this.mStManager = null;
    }
  }

  private void setupAudioRecord()
  {
    int i = AudioRecord.getMinBufferSize(44100, 16, 2);
    int j = 10240;
    if (j < i)
      j = 2 * (1024 * (1 + i / 1024));
    this.audioRecord = new AudioRecord(1, 44100, 16, 2, j);
  }

  private void startAudioRecord()
  {
    if (this.audioRecord != null)
      new Thread(new Runnable()
      {
        public void run()
        {
          ChunkedHWRecorder.this.audioRecord.startRecording();
          while (true)
          {
            if (!ChunkedHWRecorder.this.firstFrameReady)
              continue;
            boolean bool1 = ChunkedHWRecorder.this.audioEosRequested;
            if ((bool1) || (ChunkedHWRecorder.this.fullStopReceived))
            {
              Log.i("CameraToMpegTest", "Audio loop caught audioEosRequested / fullStopReceived " + bool1 + " " + ChunkedHWRecorder.this.fullStopReceived);
              ChunkedHWRecorder.this.sendAudioToEncoder(true);
            }
            if (ChunkedHWRecorder.this.fullStopReceived)
            {
              Log.i("CameraToMpegTest", "Stopping AudioRecord");
              ChunkedHWRecorder.this.audioRecord.stop();
            }
            try
            {
              ChunkedHWRecorder localChunkedHWRecorder = ChunkedHWRecorder.this;
              MediaCodec localMediaCodec = ChunkedHWRecorder.this.mAudioEncoder;
              MediaCodec.BufferInfo localBufferInfo = ChunkedHWRecorder.this.mAudioBufferInfo;
              if (!bool1)
              {
                if (ChunkedHWRecorder.this.fullStopReceived)
                  break label224;
                while (true)
                {
                  localChunkedHWRecorder.drainEncoder(localMediaCodec, localBufferInfo, bool2);
                  if (bool1)
                    ChunkedHWRecorder.this.audioEosRequested = false;
                  if (ChunkedHWRecorder.this.fullStopReceived)
                    break label219;
                  ChunkedHWRecorder.this.sendAudioToEncoder(false);
                  break;
                  bool2 = false;
                }
              }
            }
            catch (IOException localIOException)
            {
              while (true)
                localIOException.printStackTrace();
              return;
            }
            catch (NoUnlockedObjectException localNoUnlockedObjectException)
            {
              while (true)
              {
                label219: continue;
                label224: boolean bool2 = true;
              }
            }
          }
        }
      }).start();
  }

  private void stopAndReleaseAudioEncoder()
  {
    this.lastEncodedAudioTimeStamp = 0L;
    this.eosSentToAudioEncoder = false;
    if (this.mAudioEncoder != null)
    {
      this.mAudioEncoder.stop();
      this.mAudioEncoder.release();
      this.mAudioEncoder = null;
    }
  }

  private void stopAndReleaseEncoders()
  {
    stopAndReleaseVideoEncoder();
    stopAndReleaseAudioEncoder();
  }

  private void stopAndReleaseVideoEncoder()
  {
    this.eosSentToVideoEncoder = false;
    this.frameCount = 0;
    if (this.mVideoEncoder != null)
    {
      this.mVideoEncoder.stop();
      this.mVideoEncoder.release();
      this.mVideoEncoder = null;
    }
  }

  public void endStream()
  {
    this.builder.finishStreaming();
  }

  public int getCameraId()
  {
    return this.mCameraId;
  }

  public void onPreviewFrame(final byte[] paramArrayOfByte, Camera paramCamera)
  {
    this.puddle.run(new Runnable()
    {
      public void run()
      {
        if (ChunkedHWRecorder.this.cameraOnPreviewFrameCallback == null)
          return;
        RunnableWithResultObject localRunnableWithResultObject = ChunkedHWRecorder.this.cameraOnPreviewFrameCallback;
        ChunkedHWRecorder.access$402(ChunkedHWRecorder.this, null);
        Log.d("CameraToMpegTest", "TAKING PHOTO");
        Camera.Parameters localParameters = ChunkedHWRecorder.this.mCamera.getParameters();
        int i = localParameters.getPreviewSize().width;
        int j = localParameters.getPreviewSize().height;
        int k = localParameters.getPreviewFormat();
        YuvImage localYuvImage = new YuvImage(paramArrayOfByte, k, i, j, null);
        ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
        localYuvImage.compressToJpeg(new Rect(0, 0, i, j), 50, localByteArrayOutputStream);
        Bitmap localBitmap1 = BitmapFactory.decodeByteArray(localByteArrayOutputStream.toByteArray(), 0, localByteArrayOutputStream.size());
        Matrix localMatrix = new Matrix();
        localMatrix.postRotate(90.0F);
        Bitmap localBitmap2 = Bitmap.createBitmap(localBitmap1, 0, 0, localBitmap1.getWidth(), localBitmap1.getHeight(), localMatrix, true);
        if (localBitmap2 != null)
        {
          localRunnableWithResultObject.resultObject = localBitmap2;
          localRunnableWithResultObject.run();
        }
        while (true)
        {
          ChunkedHWRecorder.access$402(ChunkedHWRecorder.this, null);
          ChunkedHWRecorder.this.mCamera.setPreviewCallback(null);
          return;
          Log.e("CameraToMpegTest", "ERROR ON COVER IMAGE");
        }
      }
    });
  }

  public void requestFrameFromCamera(final RunnableWithResultObject paramRunnableWithResultObject)
  {
    if (this.mCamera == null)
    {
      new Handler().postDelayed(new Runnable()
      {
        public void run()
        {
          ChunkedHWRecorder.this.requestFrameFromCamera(paramRunnableWithResultObject);
        }
      }
      , 1000L);
      return;
    }
    this.mCamera.setPreviewCallback(this);
    this.cameraOnPreviewFrameCallback = paramRunnableWithResultObject;
  }

  public void sendAudioToEncoder(boolean paramBoolean)
  {
    try
    {
      ByteBuffer[] arrayOfByteBuffer = this.mAudioEncoder.getInputBuffers();
      int i = this.mAudioEncoder.dequeueInputBuffer(-1L);
      if (i >= 0)
      {
        ByteBuffer localByteBuffer = arrayOfByteBuffer[i];
        localByteBuffer.clear();
        long l1 = System.nanoTime();
        int j = this.audioRecord.read(localByteBuffer, 1024);
        long l2 = ()(l1 - j / 44100.0D / 1000000000.0D);
        if (j == -3)
          Log.e("CameraToMpegTest", "Audio read error");
        long l3 = ()(l2 / 1000.0D);
        if (paramBoolean)
        {
          Log.i("CameraToMpegTest", "EOS received in sendAudioToEncoder");
          this.mAudioEncoder.queueInputBuffer(i, 0, j, l3, 4);
          this.eosSentToAudioEncoder = true;
          return;
        }
        this.mAudioEncoder.queueInputBuffer(i, 0, j, l3, 0);
        return;
      }
    }
    catch (Throwable localThrowable)
    {
      Log.e("CameraToMpegTest", "_offerAudioEncoder exception");
      localThrowable.printStackTrace();
    }
  }

  public void setBitRateRatio(double paramDouble)
  {
  }

  public void setCameraDisplayOrientation(int paramInt)
  {
    this.cameraOrientation = paramInt;
  }

  public void setCameraId(int paramInt)
  {
    this.mCameraId = paramInt;
  }

  public void setDisplayEGLContext(EGLContext paramEGLContext)
  {
    CodecInputSurface.mEGLDisplayContext = paramEGLContext;
  }

  public void setSurfaceHolder(SurfaceHolder paramSurfaceHolder)
  {
    this.surfaceHolder = paramSurfaceHolder;
  }

  // ERROR //
  public void startRecording()
  {
    // Byte code:
    //   0: aload_0
    //   1: new 631\011co/getair/meerkat/video/broadcast/EglCore
    //   4: dup
    //   5: aconst_null
    //   6: iconst_1
    //   7: invokespecial 634\011co/getair/meerkat/video/broadcast/EglCore:<init>\011(Landroid/opengl/EGLContext;I)V
    //   10: putfield 448\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:eglCore\011Lco/getair/meerkat/video/broadcast/EglCore;
    //   13: aload_0
    //   14: aload_0
    //   15: getfield 448\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:eglCore\011Lco/getair/meerkat/video/broadcast/EglCore;
    //   18: aload_0
    //   19: getfield 626\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:surfaceHolder\011Landroid/view/SurfaceHolder;
    //   22: invokeinterface 639 1 0
    //   27: invokevirtual 643\011co/getair/meerkat/video/broadcast/EglCore:createWindowSurface\011(Ljava/lang/Object;)Landroid/opengl/EGLSurface;
    //   30: putfield 446\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mEGLDisplaySurface\011Landroid/opengl/EGLSurface;
    //   33: aload_0
    //   34: getfield 448\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:eglCore\011Lco/getair/meerkat/video/broadcast/EglCore;
    //   37: aload_0
    //   38: getfield 446\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mEGLDisplaySurface\011Landroid/opengl/EGLSurface;
    //   41: invokevirtual 647\011co/getair/meerkat/video/broadcast/EglCore:makeCurrent\011(Landroid/opengl/EGLSurface;)V
    //   44: aload_0
    //   45: sipush 360
    //   48: sipush 640
    //   51: aload_0
    //   52: getfield 134\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mCameraId\011I
    //   55: invokespecial 649\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:prepareCamera\011(III)V
    //   58: aload_0
    //   59: sipush 360
    //   62: sipush 640
    //   65: ldc_w 650
    //   68: invokespecial 652\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:prepareEncoder\011(III)V
    //   71: aload_0
    //   72: invokespecial 654\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:prepareSurfaceTexture\011()V
    //   75: aload_0
    //   76: getfield 301\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mInputSurface\011Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;
    //   79: invokevirtual 314\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface:makeEncodeContextCurrent\011()V
    //   82: aload_0
    //   83: invokespecial 656\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:setupAudioRecord\011()V
    //   86: aload_0
    //   87: invokespecial 658\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:startAudioRecord\011()V
    //   90: aload_0
    //   91: invokestatic 583\011java/lang/System:nanoTime\011()J
    //   94: putfield 660\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:startWhen\011J
    //   97: aload_0
    //   98: getfield 198\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mCamera\011Landroid/hardware/Camera;
    //   101: invokevirtual 663\011android/hardware/Camera:startPreview\011()V
    //   104: aload_0
    //   105: getfield 474\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mStManager\011Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;
    //   108: invokevirtual 478\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager:getSurfaceTexture\011()Landroid/graphics/SurfaceTexture;
    //   111: astore 4
    //   113: aload_0
    //   114: iconst_0
    //   115: putfield 132\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:eosReceived\011Z
    //   118: aload_0
    //   119: getfield 118\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:fullStopReceived\011Z
    //   122: ifeq +17 -> 139
    //   125: aload_0
    //   126: getfield 116\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:eosSentToVideoEncoder\011Z
    //   129: ifeq +10 -> 139
    //   132: aload_0
    //   133: getfield 301\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mInputSurface\011Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;
    //   136: ifnonnull +102 -> 238
    //   139: aload_0
    //   140: iconst_0
    //   141: putfield 132\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:eosReceived\011Z
    //   144: aload_0
    //   145: getfield 132\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:eosReceived\011Z
    //   148: ifeq +32 -> 180
    //   151: ldc 32
    //   153: new 256\011java/lang/StringBuilder
    //   156: dup
    //   157: invokespecial 257\011java/lang/StringBuilder:<init>\011()V
    //   160: ldc_w 665
    //   163: invokevirtual 263\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   166: aload_0
    //   167: getfield 110\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:frameCount\011I
    //   170: invokevirtual 266\011java/lang/StringBuilder:append\011(I)Ljava/lang/StringBuilder;
    //   173: invokevirtual 272\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   176: invokestatic 603\011android/util/Log:i\011(Ljava/lang/String;Ljava/lang/String;)I
    //   179: pop
    //   180: aload_0
    //   181: aload_0
    //   182: getfield 132\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:eosReceived\011Z
    //   185: putfield 114\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:audioEosRequested\011Z
    //   188: aload_0
    //   189: getfield 201\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mVideoEncoder\011Landroid/media/MediaCodec;
    //   192: astore 5
    //   194: aload_0
    //   195: getfield 297\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mVideoBufferInfo\011Landroid/media/MediaCodec$BufferInfo;
    //   198: astore 6
    //   200: aload_0
    //   201: getfield 132\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:eosReceived\011Z
    //   204: ifne +201 -> 405
    //   207: aload_0
    //   208: getfield 118\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:fullStopReceived\011Z
    //   211: ifeq +32 -> 243
    //   214: goto +191 -> 405
    //   217: aload_0
    //   218: aload 5
    //   220: aload 6
    //   222: iload 7
    //   224: invokespecial 188\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:drainEncoder\011(Landroid/media/MediaCodec;Landroid/media/MediaCodec$BufferInfo;Z)V
    //   227: aload_0
    //   228: getfield 118\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:fullStopReceived\011Z
    //   231: istore 8
    //   233: iload 8
    //   235: ifeq +14 -> 249
    //   238: aload_0
    //   239: invokevirtual 668\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:stopRecording\011()V
    //   242: return
    //   243: iconst_0
    //   244: istore 7
    //   246: goto -29 -> 217
    //   249: aload_0
    //   250: iconst_1
    //   251: aload_0
    //   252: getfield 110\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:frameCount\011I
    //   255: iadd
    //   256: putfield 110\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:frameCount\011I
    //   259: aload_0
    //   260: iconst_1
    //   261: aload_0
    //   262: getfield 122\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:totalFrameCount\011I
    //   265: iadd
    //   266: putfield 122\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:totalFrameCount\011I
    //   269: aload_0
    //   270: getfield 474\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mStManager\011Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;
    //   273: invokevirtual 671\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager:awaitNewImage\011()V
    //   276: aload_0
    //   277: getfield 301\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mInputSurface\011Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;
    //   280: invokevirtual 674\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface:makeDisplayContextCurrent\011()V
    //   283: aload_0
    //   284: getfield 474\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mStManager\011Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;
    //   287: aload_0
    //   288: getfield 136\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:screenWidth\011I
    //   291: aload_0
    //   292: getfield 138\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:screenHeight\011I
    //   295: invokevirtual 677\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager:drawImage\011(II)V
    //   298: aload_0
    //   299: getfield 301\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mInputSurface\011Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;
    //   302: invokevirtual 680\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface:swapBuffers\011()Z
    //   305: pop
    //   306: aload_0
    //   307: getfield 301\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mInputSurface\011Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;
    //   310: invokevirtual 314\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface:makeEncodeContextCurrent\011()V
    //   313: aload_0
    //   314: getfield 474\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mStManager\011Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager;
    //   317: sipush 360
    //   320: sipush 640
    //   323: invokevirtual 677\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder$SurfaceTextureManager:drawImage\011(II)V
    //   326: aload_0
    //   327: getfield 301\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mInputSurface\011Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;
    //   330: aload 4
    //   332: invokevirtual 685\011android/graphics/SurfaceTexture:getTimestamp\011()J
    //   335: invokevirtual 689\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface:setPresentationTime\011(J)V
    //   338: aload_0
    //   339: getfield 130\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:firstFrameReady\011Z
    //   342: ifne +10 -> 352
    //   345: aload_0
    //   346: invokestatic 583\011java/lang/System:nanoTime\011()J
    //   349: putfield 691\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:startTime\011J
    //   352: aload_0
    //   353: iconst_1
    //   354: putfield 130\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:firstFrameReady\011Z
    //   357: aload_0
    //   358: getfield 301\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:mInputSurface\011Lco/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface;
    //   361: invokevirtual 680\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder$CodecInputSurface:swapBuffers\011()Z
    //   364: pop
    //   365: goto -247 -> 118
    //   368: astore_2
    //   369: ldc 32
    //   371: ldc_w 693
    //   374: aload_2
    //   375: invokestatic 696\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   378: pop
    //   379: aload_0
    //   380: invokevirtual 668\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:stopRecording\011()V
    //   383: return
    //   384: astore 9
    //   386: ldc 32
    //   388: ldc_w 698
    //   391: invokestatic 596\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;)I
    //   394: pop
    //   395: goto -119 -> 276
    //   398: astore_1
    //   399: aload_0
    //   400: invokevirtual 668\011co/getair/meerkat/video/broadcast/ChunkedHWRecorder:stopRecording\011()V
    //   403: aload_1
    //   404: athrow
    //   405: iconst_1
    //   406: istore 7
    //   408: goto -191 -> 217
    //
    // Exception table:
    //   from\011to\011target\011type
    //   44\011118\011368\011java/lang/Exception
    //   118\011139\011368\011java/lang/Exception
    //   139\011180\011368\011java/lang/Exception
    //   180\011214\011368\011java/lang/Exception
    //   217\011233\011368\011java/lang/Exception
    //   249\011269\011368\011java/lang/Exception
    //   269\011276\011368\011java/lang/Exception
    //   276\011352\011368\011java/lang/Exception
    //   352\011365\011368\011java/lang/Exception
    //   386\011395\011368\011java/lang/Exception
    //   269\011276\011384\011java/lang/RuntimeException
    //   44\011118\011398\011finally
    //   118\011139\011398\011finally
    //   139\011180\011398\011finally
    //   180\011214\011398\011finally
    //   217\011233\011398\011finally
    //   249\011269\011398\011finally
    //   269\011276\011398\011finally
    //   276\011352\011398\011finally
    //   352\011365\011398\011finally
    //   369\011379\011398\011finally
    //   386\011395\011398\011finally
  }

  public void stopRecording()
  {
    Log.i("CameraToMpegTest", "stopRecording");
    if (this.mCamera != null)
    {
      this.fullStopReceived = true;
      releaseCamera();
      releaseEncodersAndMuxer();
      releaseSurfaceTexture();
      if (this.mInputSurface != null)
      {
        this.mInputSurface.release();
        this.mInputSurface = null;
      }
      this.builder.stop();
      double d = (System.nanoTime() - this.startTime) / 1000000000.0D;
      Log.i("CameraToMpegTest", "Recorded " + d + " s. Expected " + 30.0D * d + " frames. Got " + this.totalFrameCount + " for " + this.totalFrameCount / d + " fps");
    }
  }

  public void toggleFlashMode()
  {
    try
    {
      this.mCamera.lock();
    }
    catch (Throwable localThrowable2)
    {
      try
      {
        Camera.Parameters localParameters = this.mCamera.getParameters();
        if (localParameters.getFlashMode().equals("torch"))
        {
          str = "off";
          localParameters.setFlashMode(str);
          this.mCamera.setParameters(localParameters);
        }
      }
      catch (Throwable localThrowable2)
      {
        try
        {
          while (true)
          {
            this.mCamera.unlock();
            return;
            localThrowable1 = localThrowable1;
            Log.d("CameraToMpegTest", "Could not lock camera ", localThrowable1);
            continue;
            String str = "torch";
            continue;
            localThrowable2 = localThrowable2;
            Log.d("CameraToMpegTest", "Could not set Flash Parameters on camera ", localThrowable2);
          }
        }
        catch (Throwable localThrowable3)
        {
          Log.d("CameraToMpegTest", "Could not unlock camera ", localThrowable3);
        }
      }
    }
  }

  private static class CodecInputSurface
  {
    private static final int EGL_RECORDABLE_ANDROID = 12610;
    public static EGLContext mEGLDisplayContext = EGL14.EGL_NO_CONTEXT;
    EGLConfig[] configs;
    private EGLSurface mCurrentSurface = EGL14.EGL_NO_SURFACE;
    private EGLDisplay mEGLDisplay = EGL14.EGL_NO_DISPLAY;
    private EGLSurface mEGLDisplaySurface = EGL14.EGL_NO_SURFACE;
    private EGLContext mEGLEncodeContext = EGL14.EGL_NO_CONTEXT;
    private EGLSurface mEGLEncodeSurface = EGL14.EGL_NO_SURFACE;
    private EglCore mEglCore;
    private Surface mEncodingSurface;
    int[] surfaceAttribs = { 12344 };

    public CodecInputSurface(Surface paramSurface, EGLSurface paramEGLSurface, EglCore paramEglCore)
    {
      if (paramSurface == null)
        throw new NullPointerException();
      this.mEncodingSurface = paramSurface;
      this.mEGLDisplaySurface = paramEGLSurface;
      this.mEglCore = paramEglCore;
      eglSetup();
    }

    private void checkEglError(String paramString)
    {
      int i = EGL14.eglGetError();
      if (i != 12288)
        throw new RuntimeException(paramString + ": EGL error: 0x" + Integer.toHexString(i));
    }

    private void eglSetup()
    {
      this.mEglCore.makeCurrent(this.mEGLDisplaySurface);
      this.mCurrentSurface = this.mEGLDisplaySurface;
      if (this.mEGLEncodeSurface != EGL14.EGL_NO_SURFACE)
        throw new IllegalStateException("surface already created");
      this.mEGLEncodeSurface = this.mEglCore.createWindowSurface(this.mEncodingSurface);
    }

    private void makeCurrent(EGLSurface paramEGLSurface)
    {
      this.mEglCore.makeCurrent(paramEGLSurface);
      checkEglError("eglMakeCurrent");
    }

    public void makeDisplayContextCurrent()
    {
      this.mCurrentSurface = this.mEGLDisplaySurface;
      makeCurrent(this.mEGLDisplaySurface);
    }

    public void makeEncodeContextCurrent()
    {
      this.mCurrentSurface = this.mEGLEncodeSurface;
      makeCurrent(this.mEGLEncodeSurface);
    }

    public void release()
    {
      if (this.mEGLDisplay != EGL14.EGL_NO_DISPLAY)
      {
        this.mEglCore.makeNothingCurrent();
        this.mEglCore.releaseSurface(this.mEGLDisplaySurface);
        this.mEglCore.releaseSurface(this.mEGLEncodeSurface);
        this.mEglCore.release();
      }
      this.mEGLDisplay = EGL14.EGL_NO_DISPLAY;
      this.mEGLEncodeContext = EGL14.EGL_NO_CONTEXT;
      this.mEGLDisplaySurface = EGL14.EGL_NO_SURFACE;
      this.mEGLDisplaySurface = null;
      this.mEGLEncodeSurface = null;
      System.gc();
    }

    public void setPresentationTime(long paramLong)
    {
      this.mEglCore.setPresentationTime(this.mEGLEncodeSurface, paramLong);
      checkEglError("eglPresentationTimeANDROID");
    }

    public boolean swapBuffers()
    {
      boolean bool = this.mEglCore.swapBuffers(this.mCurrentSurface);
      checkEglError("eglSwapBuffers");
      return bool;
    }

    public void updateSurface(Surface paramSurface)
    {
      EGL14.eglDestroySurface(this.mEGLDisplay, this.mEGLEncodeSurface);
      this.mEncodingSurface = paramSurface;
      this.mEGLEncodeSurface = EGL14.eglCreateWindowSurface(this.mEGLDisplay, this.configs[0], this.mEncodingSurface, this.surfaceAttribs, 0);
      checkEglError("eglCreateWindowSurface");
    }
  }

  private static class STextureRender
  {
    private static final int COORDS_PER_VERTEX = 2;
    static float[] squareCoords = { -1.0F, 1.0F, -1.0F, -1.0F, 1.0F, -1.0F, 1.0F, 1.0F };
    static float[] textureVertices = { 0.0F, 1.0F, 1.0F, 1.0F, 1.0F, 0.0F, 0.0F, 0.0F };
    private ShortBuffer drawListBuffer;
    private short[] drawOrder = { 0, 1, 2, 0, 2, 3 };
    private final String fragmentShaderCode = "#extension GL_OES_EGL_image_external : require\nprecision mediump float;varying vec2 textureCoordinate;\nuniform samplerExternalOES s_texture;\nvoid main() {\nvec4 fragColor = texture2D( s_texture, textureCoordinate );\nif ( textureCoordinate.x > 0.995 && textureCoordinate.y > 0.995 ) { \nfragColor = vec4( 1.0, 1.0, 1.0, 0.1 ) ; \n } \ngl_FragColor = fragColor;\n}";
    private final String fragmentShaderCodeFlipped = "#extension GL_OES_EGL_image_external : require\nprecision mediump float;varying vec2 textureCoordinate;\nuniform samplerExternalOES s_texture;\nvoid main() {vec2 vTexCoord = vec2( 1.0 - textureCoordinate.x, textureCoordinate.y);vec4 fragColor = texture2D( s_texture, vTexCoord );\nif ( textureCoordinate.x > 0.995 && textureCoordinate.y > 0.995 ) { \nfragColor = vec4( 1.0, 1.0, 1.0, 0.1 ) ; \n } \ngl_FragColor = fragColor;\n}";
    private int mPositionHandle;
    private int mProgram;
    private int mTextureCoordHandle;
    private int textureId;
    private FloatBuffer textureVerticesBuffer;
    private FloatBuffer vertexBuffer;
    private final String vertexShaderCode = "attribute vec4 vPosition;attribute vec2 inputTextureCoordinate;varying vec2 textureCoordinate;void main(){gl_Position = vPosition;textureCoordinate = inputTextureCoordinate;}";
    private final int vertexStride = 8;

    private int createTexture()
    {
      int[] arrayOfInt = new int[1];
      GLES20.glGenTextures(1, arrayOfInt, 0);
      GLES20.glBindTexture(36197, arrayOfInt[0]);
      GLES20.glTexParameterf(36197, 10241, 9729.0F);
      GLES20.glTexParameterf(36197, 10240, 9729.0F);
      GLES20.glTexParameteri(36197, 10242, 33071);
      GLES20.glTexParameteri(36197, 10243, 33071);
      return arrayOfInt[0];
    }

    private int loadShader(int paramInt, String paramString)
    {
      int i = GLES20.glCreateShader(paramInt);
      checkGlError("glCreateShader type=" + paramInt);
      GLES20.glShaderSource(i, paramString);
      GLES20.glCompileShader(i);
      int[] arrayOfInt = new int[1];
      GLES20.glGetShaderiv(i, 35713, arrayOfInt, 0);
      if (arrayOfInt[0] == 0)
      {
        Log.e("CameraToMpegTest", "Could not compile shader " + paramInt + ":");
        Log.e("CameraToMpegTest", " " + GLES20.glGetShaderInfoLog(i));
        GLES20.glDeleteShader(i);
        i = 0;
      }
      return i;
    }

    public void checkGlError(String paramString)
    {
      int i = GLES20.glGetError();
      if (i != 0)
      {
        Log.e("CameraToMpegTest", paramString + ": glError " + i);
        throw new RuntimeException(paramString + ": glError " + i);
      }
    }

    public void drawFrame(SurfaceTexture paramSurfaceTexture, int paramInt1, int paramInt2)
    {
      GLES20.glUseProgram(this.mProgram);
      GLES20.glViewport(0, 0, paramInt1, paramInt2);
      GLES20.glActiveTexture(33984);
      GLES20.glBindTexture(36197, this.textureId);
      this.mPositionHandle = GLES20.glGetAttribLocation(this.mProgram, "vPosition");
      GLES20.glEnableVertexAttribArray(this.mPositionHandle);
      GLES20.glVertexAttribPointer(this.mPositionHandle, 2, 5126, false, 8, this.vertexBuffer);
      this.mTextureCoordHandle = GLES20.glGetAttribLocation(this.mProgram, "inputTextureCoordinate");
      GLES20.glEnableVertexAttribArray(this.mTextureCoordHandle);
      GLES20.glVertexAttribPointer(this.mTextureCoordHandle, 2, 5126, false, 8, this.textureVerticesBuffer);
      GLES20.glDrawElements(4, this.drawOrder.length, 5123, this.drawListBuffer);
      GLES20.glDisableVertexAttribArray(this.mPositionHandle);
      GLES20.glDisableVertexAttribArray(this.mTextureCoordHandle);
    }

    public int getTextureId()
    {
      return this.textureId;
    }

    public void surfaceCreated(boolean paramBoolean)
    {
      ByteBuffer localByteBuffer1 = ByteBuffer.allocateDirect(4 * squareCoords.length);
      localByteBuffer1.order(ByteOrder.nativeOrder());
      this.vertexBuffer = localByteBuffer1.asFloatBuffer();
      this.vertexBuffer.put(squareCoords);
      this.vertexBuffer.position(0);
      ByteBuffer localByteBuffer2 = ByteBuffer.allocateDirect(2 * this.drawOrder.length);
      localByteBuffer2.order(ByteOrder.nativeOrder());
      this.drawListBuffer = localByteBuffer2.asShortBuffer();
      this.drawListBuffer.put(this.drawOrder);
      this.drawListBuffer.position(0);
      ByteBuffer localByteBuffer3 = ByteBuffer.allocateDirect(4 * textureVertices.length);
      localByteBuffer3.order(ByteOrder.nativeOrder());
      this.textureVerticesBuffer = localByteBuffer3.asFloatBuffer();
      this.textureVerticesBuffer.put(textureVertices);
      this.textureVerticesBuffer.position(0);
      int i = loadShader(35633, "attribute vec4 vPosition;attribute vec2 inputTextureCoordinate;varying vec2 textureCoordinate;void main(){gl_Position = vPosition;textureCoordinate = inputTextureCoordinate;}");
      if (paramBoolean);
      for (int j = loadShader(35632, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;varying vec2 textureCoordinate;\nuniform samplerExternalOES s_texture;\nvoid main() {vec2 vTexCoord = vec2( 1.0 - textureCoordinate.x, textureCoordinate.y);vec4 fragColor = texture2D( s_texture, vTexCoord );\nif ( textureCoordinate.x > 0.995 && textureCoordinate.y > 0.995 ) { \nfragColor = vec4( 1.0, 1.0, 1.0, 0.1 ) ; \n } \ngl_FragColor = fragColor;\n}"); ; j = loadShader(35632, "#extension GL_OES_EGL_image_external : require\nprecision mediump float;varying vec2 textureCoordinate;\nuniform samplerExternalOES s_texture;\nvoid main() {\nvec4 fragColor = texture2D( s_texture, textureCoordinate );\nif ( textureCoordinate.x > 0.995 && textureCoordinate.y > 0.995 ) { \nfragColor = vec4( 1.0, 1.0, 1.0, 0.1 ) ; \n } \ngl_FragColor = fragColor;\n}"))
      {
        this.mProgram = GLES20.glCreateProgram();
        GLES20.glAttachShader(this.mProgram, i);
        GLES20.glAttachShader(this.mProgram, j);
        GLES20.glLinkProgram(this.mProgram);
        this.textureId = createTexture();
        return;
      }
    }
  }

  private static class SurfaceTextureManager
    implements SurfaceTexture.OnFrameAvailableListener
  {
    private boolean mFrameAvailable;
    private Object mFrameSyncObject = new Object();
    private SurfaceTexture mSurfaceTexture;
    private ChunkedHWRecorder.STextureRender mTextureRender = new ChunkedHWRecorder.STextureRender();

    public SurfaceTextureManager(boolean paramBoolean)
    {
      this.mTextureRender.surfaceCreated(paramBoolean);
      this.mSurfaceTexture = new SurfaceTexture(this.mTextureRender.getTextureId());
      this.mSurfaceTexture.setOnFrameAvailableListener(this);
    }

    public void awaitNewImage()
    {
      Object localObject1 = this.mFrameSyncObject;
      int i = 0;
      try
      {
        while (true)
        {
          boolean bool = this.mFrameAvailable;
          if (!bool)
            try
            {
              this.mFrameSyncObject.wait(100L);
              i += 100;
              if ((!this.mFrameAvailable) && (i > 1500))
                throw new RuntimeException("Camera frame wait timed out");
            }
            catch (InterruptedException localInterruptedException)
            {
              throw new RuntimeException(localInterruptedException);
            }
        }
      }
      finally
      {
      }
      this.mFrameAvailable = false;
      this.mTextureRender.checkGlError("before updateTexImage");
      this.mSurfaceTexture.updateTexImage();
    }

    public void drawImage(int paramInt1, int paramInt2)
    {
      this.mTextureRender.drawFrame(this.mSurfaceTexture, paramInt1, paramInt2);
    }

    public SurfaceTexture getSurfaceTexture()
    {
      return this.mSurfaceTexture;
    }

    public void onFrameAvailable(SurfaceTexture paramSurfaceTexture)
    {
      synchronized (this.mFrameSyncObject)
      {
        if (this.mFrameAvailable)
          throw new RuntimeException("mFrameAvailable already set, frame could be dropped");
      }
      this.mFrameAvailable = true;
      this.mFrameSyncObject.notifyAll();
    }

    public void release()
    {
      this.mTextureRender = null;
      this.mSurfaceTexture = null;
    }
  }
}