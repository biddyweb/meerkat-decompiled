package com.google.android.gms.games.appcontent;

import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;

public abstract interface AppContentTuple extends Parcelable, Freezable<AppContentTuple>
{
  public abstract String getName();

  public abstract String getValue();
}