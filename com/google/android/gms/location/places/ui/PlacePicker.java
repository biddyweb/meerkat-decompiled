package com.google.android.gms.location.places.ui;

import android.content.Context;
import android.content.Intent;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.internal.safeparcel.zzc;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzpy;
import com.google.android.gms.internal.zzqf;
import com.google.android.gms.location.places.Place;
import com.google.android.gms.maps.model.LatLngBounds;

public class PlacePicker
{
  public static final int RESULT_ERROR = 2;

  public static String getAttributions(Intent paramIntent)
  {
    return paramIntent.getStringExtra("third_party_attributions");
  }

  public static LatLngBounds getLatLngBounds(Intent paramIntent)
  {
    return (LatLngBounds)zzc.zza(paramIntent, "final_latlng_bounds", LatLngBounds.CREATOR);
  }

  public static Place getPlace(Intent paramIntent, Context paramContext)
  {
    zzx.zzb(paramContext, "context must not be null");
    zzpy localzzpy = (zzpy)zzc.zza(paramIntent, "selected_place", zzpy.CREATOR);
    localzzpy.zza(zzqf.zzab(paramContext));
    return localzzpy;
  }

  public static class IntentBuilder
  {
    private final Intent mIntent = new Intent("com.google.android.gms.location.places.ui.PICK_PLACE");

    public IntentBuilder()
    {
      this.mIntent.setPackage("com.google.android.gms");
    }

    public Intent build(Context paramContext)
      throws GooglePlayServicesRepairableException, GooglePlayServicesNotAvailableException
    {
      GooglePlayServicesUtil.zzI(paramContext);
      return this.mIntent;
    }

    public IntentBuilder setLatLngBounds(LatLngBounds paramLatLngBounds)
    {
      zzx.zzl(paramLatLngBounds);
      zzc.zza(paramLatLngBounds, this.mIntent, "latlng_bounds");
      return this;
    }
  }
}