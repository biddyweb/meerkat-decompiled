package com.google.android.gms.games.internal.game;

import com.google.android.gms.common.data.AbstractDataBuffer;

public final class GameBadgeBuffer extends AbstractDataBuffer<GameBadge>
{
  public GameBadge zzeM(int paramInt)
  {
    return new GameBadgeRef(this.zzMd, paramInt);
  }
}