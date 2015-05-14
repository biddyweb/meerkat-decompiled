package com.google.android.gms.maps.internal;

import android.os.Bundle;
import android.os.Parcelable;

public final class zzw
{
  public static void zza(Bundle paramBundle, String paramString, Parcelable paramParcelable)
  {
    paramBundle.setClassLoader(zzw.class.getClassLoader());
    Bundle localBundle = paramBundle.getBundle("map_state");
    if (localBundle == null)
      localBundle = new Bundle();
    localBundle.setClassLoader(zzw.class.getClassLoader());
    localBundle.putParcelable(paramString, paramParcelable);
    paramBundle.putBundle("map_state", localBundle);
  }
}