package com.google.android.gms.games.internal.game;

import android.net.Uri;
import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;

public abstract interface GameBadge extends Parcelable, Freezable<GameBadge>
{
  public abstract String getDescription();

  public abstract Uri getIconImageUri();

  public abstract String getTitle();

  public abstract int getType();
}