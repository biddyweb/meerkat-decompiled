package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import java.util.Map;
import java.util.UUID;

public abstract class MediaChunk extends Chunk
{
  public final long endTimeUs;
  public final int nextChunkIndex;
  public final long startTimeUs;

  public MediaChunk(DataSource paramDataSource, DataSpec paramDataSpec, Format paramFormat, int paramInt1, long paramLong1, long paramLong2, int paramInt2)
  {
    super(paramDataSource, paramDataSpec, paramFormat, paramInt1);
    this.startTimeUs = paramLong1;
    this.endTimeUs = paramLong2;
    this.nextChunkIndex = paramInt2;
  }

  public abstract MediaFormat getMediaFormat();

  public abstract Map<UUID, byte[]> getPsshInfo();

  public final boolean isLastChunk()
  {
    return this.nextChunkIndex == -1;
  }

  public abstract boolean prepare()
    throws ParserException;

  public abstract boolean read(SampleHolder paramSampleHolder)
    throws ParserException;

  public abstract boolean sampleAvailable()
    throws ParserException;

  public abstract boolean seekTo(long paramLong, boolean paramBoolean);

  public abstract void seekToStart();
}