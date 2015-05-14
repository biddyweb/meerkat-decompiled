package com.google.android.gms.games.appcontent;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;

public abstract interface AppContentAnnotation extends Parcelable, Freezable<AppContentAnnotation>
{
  public abstract String getDescription();

  public abstract String getId();

  public abstract String getTitle();

  public abstract String zzmM();

  public abstract int zzmN();

  public abstract Uri zzmO();

  public abstract Bundle zzmP();

  public abstract int zzmQ();

  public abstract String zzmR();
}