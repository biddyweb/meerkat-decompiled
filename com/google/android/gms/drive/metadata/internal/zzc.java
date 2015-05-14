package com.google.android.gms.drive.metadata.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.drive.metadata.CustomPropertyKey;

public class zzc
  implements Parcelable.Creator<CustomProperty>
{
  static void zza(CustomProperty paramCustomProperty, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramCustomProperty.zzFG);
    zzb.zza(paramParcel, 2, paramCustomProperty.zzVo, paramInt, false);
    zzb.zza(paramParcel, 3, paramCustomProperty.mValue, false);
    zzb.zzH(paramParcel, i);
  }

  public CustomProperty zzbd(Parcel paramParcel)
  {
    Object localObject1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Object localObject2 = null;
    if (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      Object localObject3;
      Object localObject4;
      int m;
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        localObject3 = localObject1;
        localObject4 = localObject2;
        m = j;
      case 1:
      case 2:
      case 3:
      }
      while (true)
      {
        j = m;
        localObject2 = localObject4;
        localObject1 = localObject3;
        break;
        int n = zza.zzg(paramParcel, k);
        Object localObject5 = localObject1;
        localObject4 = localObject2;
        m = n;
        localObject3 = localObject5;
        continue;
        CustomPropertyKey localCustomPropertyKey = (CustomPropertyKey)zza.zza(paramParcel, k, CustomPropertyKey.CREATOR);
        m = j;
        localObject3 = localObject1;
        localObject4 = localCustomPropertyKey;
        continue;
        localObject3 = zza.zzo(paramParcel, k);
        localObject4 = localObject2;
        m = j;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new CustomProperty(j, localObject2, localObject1);
  }

  public CustomProperty[] zzcw(int paramInt)
  {
    return new CustomProperty[paramInt];
  }
}