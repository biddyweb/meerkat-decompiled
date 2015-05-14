package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzls;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.wallet.wobs.zzd;
import com.google.android.gms.wallet.wobs.zzf;
import com.google.android.gms.wallet.wobs.zzj;
import com.google.android.gms.wallet.wobs.zzl;
import com.google.android.gms.wallet.wobs.zzn;
import com.google.android.gms.wallet.wobs.zzp;
import java.util.ArrayList;

public final class LoyaltyWalletObject
  implements SafeParcelable
{
  public static final Parcelable.Creator<LoyaltyWalletObject> CREATOR = new zzk();
  int state;
  private final int zzFG;
  String zzaDA;
  String zzaDB;
  String zzaDC;
  String zzaDD;
  String zzaDE;
  ArrayList<zzp> zzaDF;
  zzl zzaDG;
  ArrayList<LatLng> zzaDH;
  String zzaDI;
  String zzaDJ;
  ArrayList<zzd> zzaDK;
  boolean zzaDL;
  ArrayList<zzn> zzaDM;
  ArrayList<zzj> zzaDN;
  ArrayList<zzn> zzaDO;
  zzf zzaDP;
  String zzaDx;
  String zzaDy;
  String zzaDz;
  String zzapd;
  String zzfl;

  LoyaltyWalletObject()
  {
    this.zzFG = 4;
    this.zzaDF = zzls.zzkb();
    this.zzaDH = zzls.zzkb();
    this.zzaDK = zzls.zzkb();
    this.zzaDM = zzls.zzkb();
    this.zzaDN = zzls.zzkb();
    this.zzaDO = zzls.zzkb();
  }

  LoyaltyWalletObject(int paramInt1, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7, String paramString8, String paramString9, String paramString10, int paramInt2, ArrayList<zzp> paramArrayList, zzl paramzzl, ArrayList<LatLng> paramArrayList1, String paramString11, String paramString12, ArrayList<zzd> paramArrayList2, boolean paramBoolean, ArrayList<zzn> paramArrayList3, ArrayList<zzj> paramArrayList4, ArrayList<zzn> paramArrayList5, zzf paramzzf)
  {
    this.zzFG = paramInt1;
    this.zzfl = paramString1;
    this.zzaDx = paramString2;
    this.zzaDy = paramString3;
    this.zzaDz = paramString4;
    this.zzapd = paramString5;
    this.zzaDA = paramString6;
    this.zzaDB = paramString7;
    this.zzaDC = paramString8;
    this.zzaDD = paramString9;
    this.zzaDE = paramString10;
    this.state = paramInt2;
    this.zzaDF = paramArrayList;
    this.zzaDG = paramzzl;
    this.zzaDH = paramArrayList1;
    this.zzaDI = paramString11;
    this.zzaDJ = paramString12;
    this.zzaDK = paramArrayList2;
    this.zzaDL = paramBoolean;
    this.zzaDM = paramArrayList3;
    this.zzaDN = paramArrayList4;
    this.zzaDO = paramArrayList5;
    this.zzaDP = paramzzf;
  }

  public int describeContents()
  {
    return 0;
  }

  public String getAccountId()
  {
    return this.zzaDx;
  }

  public String getAccountName()
  {
    return this.zzapd;
  }

  public String getBarcodeAlternateText()
  {
    return this.zzaDA;
  }

  public String getBarcodeType()
  {
    return this.zzaDB;
  }

  public String getBarcodeValue()
  {
    return this.zzaDC;
  }

  public String getId()
  {
    return this.zzfl;
  }

  public String getIssuerName()
  {
    return this.zzaDy;
  }

  public String getProgramName()
  {
    return this.zzaDz;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzk.zza(this, paramParcel, paramInt);
  }
}