package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.wallet.wobs.CommonWalletObject;
import com.google.android.gms.wallet.wobs.CommonWalletObject.zza;

public final class GiftCardWalletObject
  implements SafeParcelable
{
  public static final Parcelable.Creator<GiftCardWalletObject> CREATOR = new zzh();
  String pin;
  final int zzFG;
  CommonWalletObject zzaDk = CommonWalletObject.zzuV().zzuW();
  String zzaDl;
  String zzaDm;
  long zzaDn;
  String zzaDo;
  long zzaDp;
  String zzaDq;

  GiftCardWalletObject()
  {
    this.zzFG = 1;
  }

  GiftCardWalletObject(int paramInt, CommonWalletObject paramCommonWalletObject, String paramString1, String paramString2, String paramString3, long paramLong1, String paramString4, long paramLong2, String paramString5)
  {
    this.zzFG = paramInt;
    this.zzaDk = paramCommonWalletObject;
    this.zzaDl = paramString1;
    this.pin = paramString2;
    this.zzaDn = paramLong1;
    this.zzaDo = paramString4;
    this.zzaDp = paramLong2;
    this.zzaDq = paramString5;
    this.zzaDm = paramString3;
  }

  public int describeContents()
  {
    return 0;
  }

  public String getId()
  {
    return this.zzaDk.getId();
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzh.zza(this, paramParcel, paramInt);
  }
}