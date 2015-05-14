package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.chunk.parser.Extractor;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import com.google.android.exoplayer.upstream.NonBlockingInputStream;
import com.google.android.exoplayer.util.Assertions;
import java.util.Map;
import java.util.UUID;

public final class ContainerMediaChunk extends MediaChunk
{
  private final Extractor extractor;
  private final boolean maybeSelfContained;
  private MediaFormat mediaFormat;
  private boolean prepared;
  private Map<UUID, byte[]> psshInfo;
  private final long sampleOffsetUs;

  public ContainerMediaChunk(DataSource paramDataSource, DataSpec paramDataSpec, Format paramFormat, int paramInt1, long paramLong1, long paramLong2, int paramInt2, Extractor paramExtractor, Map<UUID, byte[]> paramMap, boolean paramBoolean, long paramLong3)
  {
    super(paramDataSource, paramDataSpec, paramFormat, paramInt1, paramLong1, paramLong2, paramInt2);
    this.extractor = paramExtractor;
    this.maybeSelfContained = paramBoolean;
    this.sampleOffsetUs = paramLong3;
    this.psshInfo = paramMap;
  }

  @Deprecated
  public ContainerMediaChunk(DataSource paramDataSource, DataSpec paramDataSpec, Format paramFormat, int paramInt1, long paramLong1, long paramLong2, int paramInt2, Extractor paramExtractor, boolean paramBoolean, long paramLong3)
  {
    this(paramDataSource, paramDataSpec, paramFormat, paramInt1, paramLong1, paramLong2, paramInt2, paramExtractor, null, paramBoolean, paramLong3);
  }

  public MediaFormat getMediaFormat()
  {
    return this.mediaFormat;
  }

  public Map<UUID, byte[]> getPsshInfo()
  {
    return this.psshInfo;
  }

  public boolean prepare()
    throws ParserException
  {
    boolean bool1 = true;
    boolean bool2;
    if (!this.prepared)
    {
      if (!this.maybeSelfContained)
        break label110;
      NonBlockingInputStream localNonBlockingInputStream = getNonBlockingInputStream();
      if (localNonBlockingInputStream == null)
        break label99;
      bool2 = bool1;
      Assertions.checkState(bool2);
      if ((0x20 & this.extractor.read(localNonBlockingInputStream, null)) == 0)
        break label105;
    }
    label50: label99: label105: label110: for (this.prepared = bool1; ; this.prepared = bool1)
    {
      if (this.prepared)
      {
        this.mediaFormat = this.extractor.getFormat();
        Map localMap = this.extractor.getPsshInfo();
        if (localMap != null)
          this.psshInfo = localMap;
      }
      return this.prepared;
      bool2 = false;
      break;
      bool1 = false;
      break label50;
    }
  }

  public boolean read(SampleHolder paramSampleHolder)
    throws ParserException
  {
    NonBlockingInputStream localNonBlockingInputStream = getNonBlockingInputStream();
    boolean bool1;
    if (localNonBlockingInputStream != null)
    {
      bool1 = true;
      Assertions.checkState(bool1);
      if ((0x4 & this.extractor.read(localNonBlockingInputStream, paramSampleHolder)) == 0)
        break label60;
    }
    label60: for (boolean bool2 = true; ; bool2 = false)
    {
      if (bool2)
        paramSampleHolder.timeUs -= this.sampleOffsetUs;
      return bool2;
      bool1 = false;
      break;
    }
  }

  public boolean sampleAvailable()
    throws ParserException
  {
    NonBlockingInputStream localNonBlockingInputStream = getNonBlockingInputStream();
    return (0x20 & this.extractor.read(localNonBlockingInputStream, null)) != 0;
  }

  public boolean seekTo(long paramLong, boolean paramBoolean)
  {
    long l = paramLong + this.sampleOffsetUs;
    boolean bool = this.extractor.seekTo(l, paramBoolean);
    if (bool)
      resetReadPosition();
    return bool;
  }

  public void seekToStart()
  {
    this.extractor.seekTo(0L, false);
    resetReadPosition();
  }
}