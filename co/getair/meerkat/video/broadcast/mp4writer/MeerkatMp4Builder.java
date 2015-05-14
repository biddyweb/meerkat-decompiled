package co.getair.meerkat.video.broadcast.mp4writer;

import android.media.MediaCodec.BufferInfo;
import android.util.Log;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.dfh.thread.ThreadPuddle;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class MeerkatMp4Builder
{
  public static final int AUDIO_TICK = 1024;
  public static final int AUDIO_TRACK_TIMESCALE = 44100;
  public static final double CHUNK_AFTER_SECONDS = 1.0D;
  private static final String TAG = "MeerkatMp4Builder";
  public static final int VIDEO_FPS = 30;
  public static final int VIDEO_TICK = 3020;
  public static final int VIDEO_TRACK_TIMESCALE = 90000;
  private long baseFileOffset = 0L;
  public int chunkIndex = 0;
  private long currentAudioDuration = 0L;
  private MediaTrackChunk currentAudioSamples = new MediaTrackChunk(2, 0);
  private int currentIFrameCount = 0;
  private long currentVideoDuration = 0L;
  private MediaTrackChunk currentVideoSamples = new MediaTrackChunk(1, 0);
  private boolean didWriteHeader;
  private long[] durationsBuffer = new long[1000];
  private boolean isStopped = false;
  private long lastAudioTime = 0L;
  private long lastVideoTime = 0L;
  private OutputStream outStream;
  private byte[] parametersSets;
  private ThreadPuddle puddle;
  private long totalAudioDuration = 0L;
  private long totalVideoDuration = 0L;

  public MeerkatMp4Builder(OutputStream paramOutputStream)
  {
    this.outStream = paramOutputStream;
    this.puddle = new ThreadPuddle(1);
    this.puddle.setPriority(1);
  }

  private void resetChunks()
  {
    this.currentVideoSamples = new MediaTrackChunk(1, 1 + this.chunkIndex);
    this.currentAudioSamples = new MediaTrackChunk(2, 1 + this.chunkIndex);
    this.currentVideoDuration = 0L;
    this.currentAudioDuration = 0L;
    this.currentIFrameCount = 0;
  }

  private void streamChunk(byte[] paramArrayOfByte)
  {
    streamChunk(paramArrayOfByte, false);
  }

  private void streamChunk(final byte[] paramArrayOfByte, final boolean paramBoolean)
  {
    this.puddle.run(new Runnable()
    {
      public void run()
      {
        if (!MeerkatMp4Builder.this.isStopped);
        try
        {
          MeerkatMp4Builder.this.outStream.write(paramArrayOfByte);
          MeerkatMp4Builder.this.outStream.flush();
          if (paramBoolean)
            MeerkatMp4Builder.this.outStream.close();
          MeerkatMp4Builder.access$002(MeerkatMp4Builder.this, paramBoolean);
          return;
        }
        catch (Throwable localThrowable)
        {
          while (true)
            localThrowable.printStackTrace();
        }
      }
    });
    this.baseFileOffset += paramArrayOfByte.length;
  }

  private void writeChunk()
  {
    Log.d("MeerkatMp4Builder", "Video Duration " + this.totalVideoDuration / 90000.0D);
    Log.d("MeerkatMp4Builder", "Audio Duration " + this.totalAudioDuration / 44100.0D);
    MediaTrackChunk localMediaTrackChunk1 = this.currentVideoSamples;
    MediaTrackChunk localMediaTrackChunk2 = this.currentAudioSamples;
    long[] arrayOfLong = Arrays.copyOfRange(this.durationsBuffer, 0, localMediaTrackChunk1.getSampleCount());
    resetChunks();
    byte[] arrayOfByte = this.parametersSets;
    int i = this.chunkIndex;
    this.chunkIndex = (i + 1);
    Iterator localIterator = BoxWriter.getFragment(localMediaTrackChunk1, arrayOfLong, localMediaTrackChunk2, arrayOfByte, i, this.baseFileOffset).iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      Log.d("MeerkatMp4Builder", "Writing Box " + localBox.getType() + " size " + localBox.getSize());
      streamChunk(BoxWriter.getBytes(localBox), false);
    }
    Log.d("MeerkatMp4Builder", "Writing Fragment Done");
  }

  private void writeHeader()
  {
    Log.d("MeerkatMp4Builder", "Writing Chunk audio duration " + this.currentAudioDuration / 44100.0D + " video duration " + this.currentVideoDuration / 90000.0D);
    MediaTrackChunk localMediaTrackChunk1 = this.currentVideoSamples;
    MediaTrackChunk localMediaTrackChunk2 = this.currentAudioSamples;
    long[] arrayOfLong = Arrays.copyOfRange(this.durationsBuffer, 0, localMediaTrackChunk1.getSampleCount());
    resetChunks();
    this.chunkIndex = (1 + this.chunkIndex);
    this.didWriteHeader = true;
    Iterator localIterator = BoxWriter.getFirstChunk(localMediaTrackChunk1, arrayOfLong, localMediaTrackChunk2, this.parametersSets).iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      Log.d("MeerkatMp4Builder", "Writing Box " + localBox.getType() + " size " + localBox.getSize());
      streamChunk(BoxWriter.getBytes(localBox));
    }
  }

  public MeerkatMp4Builder createRecoveryBuilder(OutputStream paramOutputStream)
  {
    MeerkatMp4Builder localMeerkatMp4Builder = new MeerkatMp4Builder(paramOutputStream);
    localMeerkatMp4Builder.setParametersSets(this.parametersSets);
    return localMeerkatMp4Builder;
  }

  public void finishStreaming()
  {
    streamChunk(new byte[] { 0, 0, 0, 8, 119, 105, 100, 101, 0, 0, 0, 8, 119, 105, 100, 101, 0, 0, 0, 8, 119, 105, 100, 101 }, true);
  }

  public void processAudioSample(MediaSample paramMediaSample)
  {
    (()(44100.0D * (paramMediaSample.info.presentationTimeUs / 1000000.0D - this.lastAudioTime / 1000000.0D)));
    if (this.lastAudioTime == 0L);
    paramMediaSample.duration = 1024;
    this.currentAudioDuration = (1024L + this.currentAudioDuration);
    this.totalAudioDuration = (1024L + this.totalAudioDuration);
    this.currentAudioSamples.addSample(paramMediaSample);
    this.lastAudioTime = paramMediaSample.info.presentationTimeUs;
  }

  public void processVideoSample(MediaSample paramMediaSample)
  {
    if (paramMediaSample.buffer.limit() > 4)
    {
      int i = paramMediaSample.getType();
      long l = ()(90000.0D * (paramMediaSample.info.presentationTimeUs / 1000000.0D - this.lastVideoTime / 1000000.0D));
      if ((this.lastVideoTime == 0L) || (l < 0L))
        l = 3020L;
      paramMediaSample.duration = ((int)l);
      this.durationsBuffer[this.currentVideoSamples.getSampleCount()] = l;
      this.totalVideoDuration = (l + this.totalVideoDuration);
      if ((i == 1) || (i == 5))
      {
        if (i == 5)
          this.currentIFrameCount = (1 + this.currentIFrameCount);
        this.currentVideoSamples.addSample(paramMediaSample);
        this.currentVideoDuration = (l + this.currentVideoDuration);
        this.lastVideoTime = paramMediaSample.info.presentationTimeUs;
      }
      if (this.currentVideoDuration > 90000.0D)
      {
        if (this.didWriteHeader)
          break label170;
        writeHeader();
      }
    }
    return;
    label170: writeChunk();
  }

  public void setParametersSets(byte[] paramArrayOfByte)
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(paramArrayOfByte.length);
    localByteBuffer.put(paramArrayOfByte);
    this.parametersSets = localByteBuffer.array();
  }

  public void setParametersSets(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(paramArrayOfByte1.length + paramArrayOfByte2.length);
    localByteBuffer.put(paramArrayOfByte1);
    localByteBuffer.put(paramArrayOfByte2);
    this.parametersSets = localByteBuffer.array();
  }

  public void stop()
  {
    try
    {
      this.currentAudioSamples.release();
      this.currentVideoSamples.release();
      resetChunks();
      this.outStream.close();
      return;
    }
    catch (Throwable localThrowable)
    {
      Log.e("MeerkatMp4Builder", "Error: ", localThrowable);
    }
  }
}