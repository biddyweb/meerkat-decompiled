package com.google.android.gms.nearby.connection;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class AppIdentifierCreator
  implements Parcelable.Creator<AppIdentifier>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(AppIdentifier paramAppIdentifier, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramAppIdentifier.getIdentifier(), false);
    zzb.zzc(paramParcel, 1000, paramAppIdentifier.getVersionCode());
    zzb.zzH(paramParcel, i);
  }

  public AppIdentifier createFromParcel(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        str = zza.zzo(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new AppIdentifier(j, str);
  }

  public AppIdentifier[] newArray(int paramInt)
  {
    return new AppIdentifier[paramInt];
  }
}