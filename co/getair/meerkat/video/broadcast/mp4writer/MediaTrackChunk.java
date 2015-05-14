package co.getair.meerkat.video.broadcast.mp4writer;

import co.getair.meerkat.utilities.objectPool.ObjectPool;
import co.getair.meerkat.video.broadcast.ChunkedHWRecorder;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import java.nio.ByteBuffer;
import java.nio.IntBuffer;

public class MediaTrackChunk
{
  public static final int AUDIO_TRACK_ID = 2;
  public static final int CHUNK_MAX_SIZE = 150000;
  public static final int SAMPLE_CAP = 300;
  private static final String TAG = "MediaTrackChunk";
  public static final int VIDEO_TRACK_ID = 1;
  private int count = 0;
  private int iFrameCount = 0;
  private IntBuffer iFrameIndexes;
  private int index = 0;
  private ByteBuffer mediaData;
  private IntBuffer sampleDurations;
  private IntBuffer sampleSizes;
  private int size = 0;
  private Object sync = new Object();
  private int trackId = 0;

  public MediaTrackChunk(int paramInt1, int paramInt2)
  {
    this.index = paramInt2;
    this.mediaData = ByteBuffer.allocateDirect(150000);
    this.mediaData.rewind();
    this.sampleSizes = IntBuffer.allocate(300);
    this.sampleDurations = IntBuffer.allocate(300);
    if (paramInt1 == 1)
      this.iFrameIndexes = IntBuffer.allocate(300);
    this.count = 0;
    this.trackId = paramInt1;
  }

  private byte[] fillInADTSHeader(int paramInt)
  {
    byte[] arrayOfByte = new byte[7];
    int i = paramInt + 7;
    int j = (0x7 & (i & 0xFFFF)) << 5;
    int k = (i & 0xFFFF) >> 3;
    int m = (0x1800 & (i & 0xFFFF)) >> 11;
    arrayOfByte[0] = -1;
    arrayOfByte[1] = -15;
    arrayOfByte[2] = 80;
    arrayOfByte[3] = ((byte)(0x40 | (m & 0xFF) << 6));
    arrayOfByte[4] = ((byte)k);
    arrayOfByte[5] = ((byte)j);
    arrayOfByte[6] = 0;
    return arrayOfByte;
  }

  private void releaseSample(MediaSample paramMediaSample)
  {
    try
    {
      synchronized (this.sync)
      {
        ChunkedHWRecorder.mediaSamplesPool.release(paramMediaSample);
        label14: return;
      }
    }
    catch (Exception localException)
    {
      break label14;
    }
  }

  public void addSample(MediaSample paramMediaSample)
  {
    Object localObject1 = this.sync;
    try
    {
      int i = paramMediaSample.getType();
      this.sampleDurations.put(paramMediaSample.duration);
      if ((this.trackId == 1) && (this.index > 0))
      {
        IsoTypeWriter.writeUInt32(this.mediaData, -4 + paramMediaSample.buffer.limit());
        this.mediaData.put(paramMediaSample.getData().array(), 4, -4 + paramMediaSample.buffer.limit());
        this.sampleSizes.put(paramMediaSample.buffer.limit());
        this.size += paramMediaSample.buffer.limit();
        if (i == 5)
        {
          this.iFrameIndexes.put(this.count);
          this.iFrameCount = (1 + this.iFrameCount);
        }
        this.count = (1 + this.count);
      }
    }
    catch (Throwable localThrowable)
    {
      while (true)
      {
        this.sampleSizes.put(paramMediaSample.buffer.limit());
        this.size += paramMediaSample.buffer.limit();
        this.mediaData.put(paramMediaSample.getData().array(), 0, paramMediaSample.buffer.limit());
      }
    }
    finally
    {
      releaseSample(paramMediaSample);
    }
  }

  public ByteBuffer getData()
  {
    return this.mediaData;
  }

  public int[] getIFrameIndexes()
  {
    int[] arrayOfInt = new int[this.iFrameCount];
    if (this.iFrameCount > 0)
    {
      this.iFrameIndexes.position(0);
      this.iFrameIndexes.limit(this.iFrameCount);
      this.iFrameIndexes.get(arrayOfInt, 0, this.iFrameCount);
    }
    return arrayOfInt;
  }

  public int getSampleCount()
  {
    synchronized (this.sync)
    {
      int i = this.count;
      return i;
    }
  }

  public int[] getSampleDurations()
  {
    int[] arrayOfInt = new int[this.count];
    this.sampleDurations.position(0);
    this.sampleDurations.limit(this.count);
    this.sampleDurations.get(arrayOfInt, 0, this.count);
    return arrayOfInt;
  }

  public int[] getSampleSizes()
  {
    int[] arrayOfInt = new int[this.count];
    this.sampleSizes.position(0);
    this.sampleSizes.limit(this.count);
    this.sampleSizes.get(arrayOfInt, 0, this.count);
    return arrayOfInt;
  }

  public int getSize()
  {
    synchronized (this.sync)
    {
      int i = this.size;
      return i;
    }
  }

  public int getTrackId()
  {
    return this.trackId;
  }

  public void release()
  {
    synchronized (this.sync)
    {
      this.count = 0;
      this.size = 0;
      this.mediaData.clear();
      this.sampleSizes.clear();
      this.sampleDurations.clear();
      if (this.trackId == 1)
      {
        this.iFrameIndexes.clear();
        this.iFrameCount = 0;
      }
      return;
    }
  }
}