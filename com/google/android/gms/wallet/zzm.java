package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class zzm
  implements Parcelable.Creator<MaskedWalletRequest>
{
  static void zza(MaskedWalletRequest paramMaskedWalletRequest, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramMaskedWalletRequest.getVersionCode());
    zzb.zza(paramParcel, 2, paramMaskedWalletRequest.zzaCZ, false);
    zzb.zza(paramParcel, 3, paramMaskedWalletRequest.zzaDT);
    zzb.zza(paramParcel, 4, paramMaskedWalletRequest.zzaDU);
    zzb.zza(paramParcel, 5, paramMaskedWalletRequest.zzaDV);
    zzb.zza(paramParcel, 6, paramMaskedWalletRequest.zzaDW, false);
    zzb.zza(paramParcel, 7, paramMaskedWalletRequest.zzaCS, false);
    zzb.zza(paramParcel, 8, paramMaskedWalletRequest.zzaDX, false);
    zzb.zza(paramParcel, 9, paramMaskedWalletRequest.zzaDi, paramInt, false);
    zzb.zza(paramParcel, 10, paramMaskedWalletRequest.zzaDY);
    zzb.zza(paramParcel, 11, paramMaskedWalletRequest.zzaDZ);
    zzb.zza(paramParcel, 12, paramMaskedWalletRequest.zzaEa, paramInt, false);
    zzb.zza(paramParcel, 13, paramMaskedWalletRequest.zzaEb);
    zzb.zza(paramParcel, 14, paramMaskedWalletRequest.zzaEc);
    zzb.zzc(paramParcel, 15, paramMaskedWalletRequest.zzaEd, false);
    zzb.zzH(paramParcel, i);
  }

  public MaskedWalletRequest zzeZ(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    boolean bool1 = false;
    boolean bool2 = false;
    boolean bool3 = false;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    Cart localCart = null;
    boolean bool4 = false;
    boolean bool5 = false;
    CountrySpecification[] arrayOfCountrySpecification = null;
    boolean bool6 = true;
    boolean bool7 = true;
    ArrayList localArrayList = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str1 = zza.zzo(paramParcel, k);
        break;
      case 3:
        bool1 = zza.zzc(paramParcel, k);
        break;
      case 4:
        bool2 = zza.zzc(paramParcel, k);
        break;
      case 5:
        bool3 = zza.zzc(paramParcel, k);
        break;
      case 6:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 7:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 8:
        str4 = zza.zzo(paramParcel, k);
        break;
      case 9:
        localCart = (Cart)zza.zza(paramParcel, k, Cart.CREATOR);
        break;
      case 10:
        bool4 = zza.zzc(paramParcel, k);
        break;
      case 11:
        bool5 = zza.zzc(paramParcel, k);
        break;
      case 12:
        arrayOfCountrySpecification = (CountrySpecification[])zza.zzb(paramParcel, k, CountrySpecification.CREATOR);
        break;
      case 13:
        bool6 = zza.zzc(paramParcel, k);
        break;
      case 14:
        bool7 = zza.zzc(paramParcel, k);
        break;
      case 15:
        localArrayList = zza.zzc(paramParcel, k, com.google.android.gms.identity.intents.model.CountrySpecification.CREATOR);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new MaskedWalletRequest(j, str1, bool1, bool2, bool3, str2, str3, str4, localCart, bool4, bool5, arrayOfCountrySpecification, bool6, bool7, localArrayList);
  }

  public MaskedWalletRequest[] zzhw(int paramInt)
  {
    return new MaskedWalletRequest[paramInt];
  }
}