package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;
import java.util.List;

public abstract interface AppContentCard extends Parcelable, Freezable<AppContentCard>
{
  public abstract List<AppContentAction> getActions();

  public abstract String getDescription();

  public abstract Bundle getExtras();

  public abstract String getId();

  public abstract String getTitle();

  public abstract String getType();

  public abstract List<AppContentCondition> zzmI();

  public abstract String zzmJ();

  public abstract List<AppContentAnnotation> zzmT();

  public abstract int zzmU();

  public abstract String zzmV();

  public abstract int zzmW();
}