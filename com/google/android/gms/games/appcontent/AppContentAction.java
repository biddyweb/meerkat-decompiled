package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;
import java.util.List;

public abstract interface AppContentAction extends Parcelable, Freezable<AppContentAction>
{
  public abstract Bundle getExtras();

  public abstract String getId();

  public abstract String getType();

  public abstract AppContentAnnotation zzmH();

  public abstract List<AppContentCondition> zzmI();

  public abstract String zzmJ();

  public abstract String zzmK();
}