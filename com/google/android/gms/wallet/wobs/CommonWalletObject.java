package com.google.android.gms.wallet.wobs;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzls;
import com.google.android.gms.maps.model.LatLng;
import java.util.ArrayList;

public class CommonWalletObject
  implements SafeParcelable
{
  public static final Parcelable.Creator<CommonWalletObject> CREATOR = new zza();
  String name;
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
  String zzaDy;
  String zzfl;

  CommonWalletObject()
  {
    this.zzFG = 1;
    this.zzaDF = zzls.zzkb();
    this.zzaDH = zzls.zzkb();
    this.zzaDK = zzls.zzkb();
    this.zzaDM = zzls.zzkb();
    this.zzaDN = zzls.zzkb();
    this.zzaDO = zzls.zzkb();
  }

  CommonWalletObject(int paramInt1, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7, String paramString8, int paramInt2, ArrayList<zzp> paramArrayList, zzl paramzzl, ArrayList<LatLng> paramArrayList1, String paramString9, String paramString10, ArrayList<zzd> paramArrayList2, boolean paramBoolean, ArrayList<zzn> paramArrayList3, ArrayList<zzj> paramArrayList4, ArrayList<zzn> paramArrayList5)
  {
    this.zzFG = paramInt1;
    this.zzfl = paramString1;
    this.zzaDE = paramString2;
    this.name = paramString3;
    this.zzaDy = paramString4;
    this.zzaDA = paramString5;
    this.zzaDB = paramString6;
    this.zzaDC = paramString7;
    this.zzaDD = paramString8;
    this.state = paramInt2;
    this.zzaDF = paramArrayList;
    this.zzaDG = paramzzl;
    this.zzaDH = paramArrayList1;
    this.zzaDI = paramString9;
    this.zzaDJ = paramString10;
    this.zzaDK = paramArrayList2;
    this.zzaDL = paramBoolean;
    this.zzaDM = paramArrayList3;
    this.zzaDN = paramArrayList4;
    this.zzaDO = paramArrayList5;
  }

  public static zza zzuV()
  {
    CommonWalletObject localCommonWalletObject = new CommonWalletObject();
    localCommonWalletObject.getClass();
    return new zza(null);
  }

  public int describeContents()
  {
    return 0;
  }

  public String getId()
  {
    return this.zzfl;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }

  public final class zza
  {
    private zza()
    {
    }

    public zza zzdJ(String paramString)
    {
      CommonWalletObject.this.zzfl = paramString;
      return this;
    }

    public CommonWalletObject zzuW()
    {
      return CommonWalletObject.this;
    }
  }
}