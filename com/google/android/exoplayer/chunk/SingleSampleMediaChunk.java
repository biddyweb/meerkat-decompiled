package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.upstream.NonBlockingInputStream;
import com.google.android.exoplayer.util.Assertions;
import java.nio.ByteBuffer;
import java.util.Map;
import java.util.UUID;

public class SingleSampleMediaChunk extends MediaChunk
{
  public final byte[] headerData;
  private final MediaFormat sampleFormat;

  public SingleSampleMediaChunk(DataSource paramDataSource, DataSpec paramDataSpec, Format paramFormat, int paramInt1, long paramLong1, long paramLong2, int paramInt2, MediaFormat paramMediaFormat)
  {
    this(paramDataSource, paramDataSpec, paramFormat, paramInt1, paramLong1, paramLong2, paramInt2, paramMediaFormat, null);
  }

  public SingleSampleMediaChunk(DataSource paramDataSource, DataSpec paramDataSpec, Format paramFormat, int paramInt1, long paramLong1, long paramLong2, int paramInt2, MediaFormat paramMediaFormat, byte[] paramArrayOfByte)
  {
    super(paramDataSource, paramDataSpec, paramFormat, paramInt1, paramLong1, paramLong2, paramInt2);
    this.sampleFormat = paramMediaFormat;
    this.headerData = paramArrayOfByte;
  }

  public MediaFormat getMediaFormat()
  {
    return this.sampleFormat;
  }

  public Map<UUID, byte[]> getPsshInfo()
  {
    return null;
  }

  public boolean prepare()
  {
    return true;
  }

  public boolean read(SampleHolder paramSampleHolder)
  {
    NonBlockingInputStream localNonBlockingInputStream = getNonBlockingInputStream();
    if (localNonBlockingInputStream != null);
    for (boolean bool1 = true; ; bool1 = false)
    {
      Assertions.checkState(bool1);
      if (sampleAvailable())
        break;
      return false;
    }
    int i = (int)bytesLoaded();
    int j = i;
    if (this.headerData != null)
      j += this.headerData.length;
    if ((paramSampleHolder.data == null) || (paramSampleHolder.data.capacity() < j))
      paramSampleHolder.replaceBuffer(j);
    int k;
    if (paramSampleHolder.data != null)
    {
      if (this.headerData != null)
        paramSampleHolder.data.put(this.headerData);
      k = localNonBlockingInputStream.read(paramSampleHolder.data, i);
    }
    for (paramSampleHolder.size = j; ; paramSampleHolder.size = 0)
    {
      boolean bool2 = false;
      if (k == i)
        bool2 = true;
      Assertions.checkState(bool2);
      paramSampleHolder.timeUs = this.startTimeUs;
      return true;
      k = localNonBlockingInputStream.skip(i);
    }
  }

  public boolean sampleAvailable()
  {
    return (isLoadFinished()) && (!isReadFinished());
  }

  public boolean seekTo(long paramLong, boolean paramBoolean)
  {
    resetReadPosition();
    return true;
  }

  public void seekToStart()
  {
    resetReadPosition();
  }
}