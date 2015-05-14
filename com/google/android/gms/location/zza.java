package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.internal.zzpk;
import java.util.ArrayList;

public class zza
  implements Parcelable.Creator<GeofencingRequest>
{
  static void zza(GeofencingRequest paramGeofencingRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramGeofencingRequest.zzpp(), false);
    zzb.zzc(paramParcel, 1000, paramGeofencingRequest.getVersionCode());
    zzb.zzc(paramParcel, 2, paramGeofencingRequest.getInitialTrigger());
    zzb.zzH(paramParcel, i);
  }

  public GeofencingRequest zzdn(Parcel paramParcel)
  {
    int i = 0;
    int j = com.google.android.gms.common.internal.safeparcel.zza.zzJ(paramParcel);
    ArrayList localArrayList = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = com.google.android.gms.common.internal.safeparcel.zza.zzI(paramParcel);
      switch (com.google.android.gms.common.internal.safeparcel.zza.zzaP(m))
      {
      default:
        com.google.android.gms.common.internal.safeparcel.zza.zzb(paramParcel, m);
        break;
      case 1:
        localArrayList = com.google.android.gms.common.internal.safeparcel.zza.zzc(paramParcel, m, zzpk.CREATOR);
        break;
      case 1000:
        k = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
        break;
      case 2:
        i = com.google.android.gms.common.internal.safeparcel.zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new GeofencingRequest(k, localArrayList, i);
  }

  public GeofencingRequest[] zzfh(int paramInt)
  {
    return new GeofencingRequest[paramInt];
  }
}