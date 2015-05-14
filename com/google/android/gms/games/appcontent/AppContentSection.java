package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;
import java.util.List;

public abstract interface AppContentSection extends Parcelable, Freezable<AppContentSection>
{
  public abstract List<AppContentAction> getActions();

  public abstract Bundle getExtras();

  public abstract String getId();

  public abstract String getTitle();

  public abstract String getType();

  public abstract String zzmJ();

  public abstract List<AppContentAnnotation> zzmT();

  public abstract String zzmV();

  public abstract List<AppContentCard> zznd();

  public abstract String zzne();
}