package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.TrackInfo;
import java.io.IOException;
import java.util.List;

public abstract interface ChunkSource
{
  public abstract void continueBuffering(long paramLong);

  public abstract void disable(List<? extends MediaChunk> paramList);

  public abstract void enable();

  public abstract void getChunkOperation(List<? extends MediaChunk> paramList, long paramLong1, long paramLong2, ChunkOperationHolder paramChunkOperationHolder);

  public abstract IOException getError();

  public abstract void getMaxVideoDimensions(MediaFormat paramMediaFormat);

  public abstract TrackInfo getTrackInfo();

  public abstract void onChunkLoadError(Chunk paramChunk, Exception paramException);
}