package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzk
  implements Parcelable.Creator<LocationSettingsStates>
{
  static void zza(LocationSettingsStates paramLocationSettingsStates, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramLocationSettingsStates.isGpsUsable());
    zzb.zzc(paramParcel, 1000, paramLocationSettingsStates.getVersionCode());
    zzb.zza(paramParcel, 2, paramLocationSettingsStates.isNetworkLocationUsable());
    zzb.zza(paramParcel, 3, paramLocationSettingsStates.isBleUsable());
    zzb.zza(paramParcel, 4, paramLocationSettingsStates.isGpsPresent());
    zzb.zza(paramParcel, 5, paramLocationSettingsStates.isNetworkLocationPresent());
    zzb.zza(paramParcel, 6, paramLocationSettingsStates.isBlePresent());
    zzb.zzH(paramParcel, i);
  }

  public LocationSettingsStates zzds(Parcel paramParcel)
  {
    boolean bool1 = false;
    int i = zza.zzJ(paramParcel);
    boolean bool2 = false;
    boolean bool3 = false;
    boolean bool4 = false;
    boolean bool5 = false;
    boolean bool6 = false;
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        bool6 = zza.zzc(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        bool5 = zza.zzc(paramParcel, k);
        break;
      case 3:
        bool4 = zza.zzc(paramParcel, k);
        break;
      case 4:
        bool3 = zza.zzc(paramParcel, k);
        break;
      case 5:
        bool2 = zza.zzc(paramParcel, k);
        break;
      case 6:
        bool1 = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new LocationSettingsStates(j, bool6, bool5, bool4, bool3, bool2, bool1);
  }

  public LocationSettingsStates[] zzfo(int paramInt)
  {
    return new LocationSettingsStates[paramInt];
  }
}