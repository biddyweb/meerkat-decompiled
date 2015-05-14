package com.google.android.gms.games.internal.notification;

import com.google.android.gms.common.data.AbstractDataBuffer;

public final class GameNotificationBuffer extends AbstractDataBuffer<GameNotification>
{
  public GameNotification zzeR(int paramInt)
  {
    return new GameNotificationRef(this.zzMd, paramInt);
  }
}