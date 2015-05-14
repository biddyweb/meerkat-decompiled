package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class zze
  implements Parcelable.Creator<zzd>
{
  static void zza(zzd paramzzd, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramzzd.getVersionCode());
    zzb.zza(paramParcel, 2, paramzzd.zzaCV, paramInt, false);
    zzb.zza(paramParcel, 3, paramzzd.zzaCW, paramInt, false);
    zzb.zza(paramParcel, 4, paramzzd.zzaCX, paramInt, false);
    zzb.zzH(paramParcel, i);
  }

  public zzd zzeR(Parcel paramParcel)
  {
    Object localObject1 = null;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    Object localObject2 = null;
    Object localObject3 = null;
    if (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      Object localObject4;
      Object localObject5;
      Object localObject6;
      int m;
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        localObject4 = localObject1;
        localObject5 = localObject2;
        localObject6 = localObject3;
        m = j;
      case 1:
      case 2:
      case 3:
      case 4:
      }
      while (true)
      {
        j = m;
        localObject3 = localObject6;
        localObject2 = localObject5;
        localObject1 = localObject4;
        break;
        int n = zza.zzg(paramParcel, k);
        Object localObject9 = localObject1;
        localObject5 = localObject2;
        localObject6 = localObject3;
        m = n;
        localObject4 = localObject9;
        continue;
        LoyaltyWalletObject localLoyaltyWalletObject = (LoyaltyWalletObject)zza.zza(paramParcel, k, LoyaltyWalletObject.CREATOR);
        m = j;
        Object localObject8 = localObject2;
        localObject6 = localLoyaltyWalletObject;
        localObject4 = localObject1;
        localObject5 = localObject8;
        continue;
        OfferWalletObject localOfferWalletObject = (OfferWalletObject)zza.zza(paramParcel, k, OfferWalletObject.CREATOR);
        localObject6 = localObject3;
        m = j;
        Object localObject7 = localObject1;
        localObject5 = localOfferWalletObject;
        localObject4 = localObject7;
        continue;
        localObject4 = (GiftCardWalletObject)zza.zza(paramParcel, k, GiftCardWalletObject.CREATOR);
        localObject5 = localObject2;
        localObject6 = localObject3;
        m = j;
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzd(j, localObject3, localObject2, localObject1);
  }

  public zzd[] zzho(int paramInt)
  {
    return new zzd[paramInt];
  }
}