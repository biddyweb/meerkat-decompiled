package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.TrackInfo;
import com.google.android.exoplayer.upstream.DataSource;
import com.google.android.exoplayer.upstream.DataSpec;
import java.io.IOException;
import java.util.List;

public class SingleSampleChunkSource
  implements ChunkSource
{
  private final DataSource dataSource;
  private final DataSpec dataSpec;
  private final long durationUs;
  private final Format format;
  private final MediaFormat mediaFormat;
  private final TrackInfo trackInfo;

  public SingleSampleChunkSource(DataSource paramDataSource, DataSpec paramDataSpec, Format paramFormat, long paramLong, MediaFormat paramMediaFormat)
  {
    this.dataSource = paramDataSource;
    this.dataSpec = paramDataSpec;
    this.format = paramFormat;
    this.durationUs = paramLong;
    this.mediaFormat = paramMediaFormat;
    this.trackInfo = new TrackInfo(paramFormat.mimeType, paramLong);
  }

  private SingleSampleMediaChunk initChunk()
  {
    return new SingleSampleMediaChunk(this.dataSource, this.dataSpec, this.format, 0, 0L, this.durationUs, -1, this.mediaFormat);
  }

  public void continueBuffering(long paramLong)
  {
  }

  public void disable(List<? extends MediaChunk> paramList)
  {
  }

  public void enable()
  {
  }

  public void getChunkOperation(List<? extends MediaChunk> paramList, long paramLong1, long paramLong2, ChunkOperationHolder paramChunkOperationHolder)
  {
    if (!paramList.isEmpty())
      return;
    paramChunkOperationHolder.chunk = initChunk();
  }

  public IOException getError()
  {
    return null;
  }

  public void getMaxVideoDimensions(MediaFormat paramMediaFormat)
  {
  }

  public TrackInfo getTrackInfo()
  {
    return this.trackInfo;
  }

  public void onChunkLoadError(Chunk paramChunk, Exception paramException)
  {
  }
}