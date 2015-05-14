package com.google.android.gms.games.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class ConnectionInfoCreator
  implements Parcelable.Creator<ConnectionInfo>
{
  static void zza(ConnectionInfo paramConnectionInfo, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramConnectionInfo.zznl(), false);
    zzb.zzc(paramParcel, 1000, paramConnectionInfo.getVersionCode());
    zzb.zzc(paramParcel, 2, paramConnectionInfo.zznm());
    zzb.zzH(paramParcel, i);
  }

  public ConnectionInfo zzcX(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    String str = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        str = zza.zzo(paramParcel, m);
        break;
      case 1000:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        i = zza.zzg(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new ConnectionInfo(k, str, i);
  }

  public ConnectionInfo[] zzeA(int paramInt)
  {
    return new ConnectionInfo[paramInt];
  }
}