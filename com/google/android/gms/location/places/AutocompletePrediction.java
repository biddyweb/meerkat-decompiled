package com.google.android.gms.location.places;

import com.google.android.gms.common.data.Freezable;
import java.util.List;

public abstract interface AutocompletePrediction extends Freezable<AutocompletePrediction>
{
  public abstract String getDescription();

  public abstract List<? extends Substring> getMatchedSubstrings();

  public abstract String getPlaceId();

  public abstract List<Integer> getPlaceTypes();

  public static abstract interface Substring
  {
    public abstract int getLength();

    public abstract int getOffset();
  }
}