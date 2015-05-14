package com.google.android.gms.location.places;

import com.google.android.gms.common.api.Api.ApiOptions.Optional;

public final class PlacesOptions
  implements Api.ApiOptions.Optional
{
  public final String zzaob;

  private PlacesOptions(Builder paramBuilder)
  {
    this.zzaob = Builder.zza(paramBuilder);
  }

  public static class Builder
  {
    private String zzaoc;

    public PlacesOptions build()
    {
      return new PlacesOptions(this, null);
    }
  }
}