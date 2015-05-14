package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;

public abstract interface AppContentCondition extends Parcelable, Freezable<AppContentCondition>
{
  public abstract String zzmY();

  public abstract String zzmZ();

  public abstract String zzna();

  public abstract Bundle zznb();
}