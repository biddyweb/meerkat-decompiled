package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.ExoPlaybackException;
import com.google.android.exoplayer.ExoPlayer.ExoPlayerComponent;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.TrackInfo;
import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;
import java.util.List;

public class MultiTrackChunkSource
  implements ChunkSource, ExoPlayer.ExoPlayerComponent
{
  public static final int MSG_SELECT_TRACK = 1;
  private final ChunkSource[] allSources;
  private boolean enabled;
  private ChunkSource selectedSource;

  public MultiTrackChunkSource(List<ChunkSource> paramList)
  {
    this(toChunkSourceArray(paramList));
  }

  public MultiTrackChunkSource(ChunkSource[] paramArrayOfChunkSource)
  {
    this.allSources = paramArrayOfChunkSource;
    this.selectedSource = paramArrayOfChunkSource[0];
  }

  private static ChunkSource[] toChunkSourceArray(List<ChunkSource> paramList)
  {
    ChunkSource[] arrayOfChunkSource = new ExoPlayer.ExoPlayerComponent[paramList.size()];
    paramList.toArray(arrayOfChunkSource);
    return arrayOfChunkSource;
  }

  public void continueBuffering(long paramLong)
  {
    this.selectedSource.continueBuffering(paramLong);
  }

  public void disable(List<? extends MediaChunk> paramList)
  {
    this.selectedSource.disable(paramList);
    this.enabled = false;
  }

  public void enable()
  {
    this.selectedSource.enable();
    this.enabled = true;
  }

  public void getChunkOperation(List<? extends MediaChunk> paramList, long paramLong1, long paramLong2, ChunkOperationHolder paramChunkOperationHolder)
  {
    this.selectedSource.getChunkOperation(paramList, paramLong1, paramLong2, paramChunkOperationHolder);
  }

  public IOException getError()
  {
    return null;
  }

  public void getMaxVideoDimensions(MediaFormat paramMediaFormat)
  {
    this.selectedSource.getMaxVideoDimensions(paramMediaFormat);
  }

  public int getTrackCount()
  {
    return this.allSources.length;
  }

  public TrackInfo getTrackInfo()
  {
    return this.selectedSource.getTrackInfo();
  }

  public void handleMessage(int paramInt, Object paramObject)
    throws ExoPlaybackException
  {
    if (!this.enabled);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      if (paramInt == 1)
        this.selectedSource = this.allSources[((java.lang.Integer)paramObject).intValue()];
      return;
    }
  }

  public void onChunkLoadError(Chunk paramChunk, Exception paramException)
  {
    this.selectedSource.onChunkLoadError(paramChunk, paramException);
  }
}