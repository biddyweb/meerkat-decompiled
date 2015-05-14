package com.google.android.gms.games.request;

import com.google.android.gms.common.data.AbstractDataBuffer;

public final class GameRequestSummaryBuffer extends AbstractDataBuffer<GameRequestSummary>
{
  public GameRequestSummary zzeZ(int paramInt)
  {
    return new GameRequestSummaryRef(this.zzMd, paramInt);
  }
}