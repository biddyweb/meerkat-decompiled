package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zzu
  implements Parcelable.Creator<Tile>
{
  static void zza(Tile paramTile, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramTile.getVersionCode());
    zzb.zzc(paramParcel, 2, paramTile.width);
    zzb.zzc(paramParcel, 3, paramTile.height);
    zzb.zza(paramParcel, 4, paramTile.data, false);
    zzb.zzH(paramParcel, i);
  }

  public Tile zzee(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    byte[] arrayOfByte = null;
    int k = 0;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        k = zza.zzg(paramParcel, n);
        break;
      case 3:
        i = zza.zzg(paramParcel, n);
        break;
      case 4:
        arrayOfByte = zza.zzr(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new Tile(m, k, i, arrayOfByte);
  }

  public Tile[] zzgh(int paramInt)
  {
    return new Tile[paramInt];
  }
}