package com.google.android.exoplayer.hls;

import com.google.android.exoplayer.hls.parser.HlsExtractor;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import java.io.IOException;

public final class TsChunk extends HlsChunk
{
  private static final byte[] SCRATCH_SPACE = new byte[4096];
  public final int chunkIndex;
  public final long endTimeUs;
  public final HlsExtractor extractor;
  public final boolean isLastChunk;
  private volatile boolean loadCanceled;
  private volatile boolean loadFinished;
  private int loadPosition;
  public final long startTimeUs;
  public final int variantIndex;

  public TsChunk(DataSource paramDataSource, DataSpec paramDataSpec, HlsExtractor paramHlsExtractor, int paramInt1, long paramLong1, long paramLong2, int paramInt2, boolean paramBoolean)
  {
    super(paramDataSource, paramDataSpec);
    this.extractor = paramHlsExtractor;
    this.variantIndex = paramInt1;
    this.startTimeUs = paramLong1;
    this.endTimeUs = paramLong2;
    this.chunkIndex = paramInt2;
    this.isLastChunk = paramBoolean;
  }

  public void cancelLoad()
  {
    this.loadCanceled = true;
  }

  public void consume()
    throws IOException
  {
  }

  public boolean isLoadCanceled()
  {
    return this.loadCanceled;
  }

  public boolean isLoadFinished()
  {
    return this.loadFinished;
  }

  public void load()
    throws IOException, InterruptedException
  {
    try
    {
      this.dataSource.open(this.dataSpec);
      int i = 0;
      int j = 0;
      while ((i != -1) && (!this.loadCanceled) && (j < this.loadPosition))
      {
        int k = Math.min(this.loadPosition - j, SCRATCH_SPACE.length);
        i = this.dataSource.read(SCRATCH_SPACE, 0, k);
        if (i != -1)
          j += i;
      }
      while ((i != -1) && (!this.loadCanceled))
      {
        i = this.extractor.read(this.dataSource);
        if (i != -1)
          this.loadPosition = (i + this.loadPosition);
      }
    }
    finally
    {
      this.dataSource.close();
    }
    boolean bool1 = this.loadCanceled;
    boolean bool2 = false;
    if (!bool1)
      bool2 = true;
    this.loadFinished = bool2;
    this.dataSource.close();
  }
}