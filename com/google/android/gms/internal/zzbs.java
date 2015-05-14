package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.ads.search.SearchAdRequest;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

@zzgi
public final class zzbs
  implements SafeParcelable
{
  public static final zzbt CREATOR = new zzbt();
  public final int backgroundColor;
  public final int versionCode;
  public final int zzpN;
  public final int zzpO;
  public final int zzpP;
  public final int zzpQ;
  public final int zzpR;
  public final int zzpS;
  public final int zzpT;
  public final String zzpU;
  public final int zzpV;
  public final String zzpW;
  public final int zzpX;
  public final int zzpY;
  public final String zzpZ;

  zzbs(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, String paramString1, int paramInt10, String paramString2, int paramInt11, int paramInt12, String paramString3)
  {
    this.versionCode = paramInt1;
    this.zzpN = paramInt2;
    this.backgroundColor = paramInt3;
    this.zzpO = paramInt4;
    this.zzpP = paramInt5;
    this.zzpQ = paramInt6;
    this.zzpR = paramInt7;
    this.zzpS = paramInt8;
    this.zzpT = paramInt9;
    this.zzpU = paramString1;
    this.zzpV = paramInt10;
    this.zzpW = paramString2;
    this.zzpX = paramInt11;
    this.zzpY = paramInt12;
    this.zzpZ = paramString3;
  }

  public zzbs(SearchAdRequest paramSearchAdRequest)
  {
    this.versionCode = 1;
    this.zzpN = paramSearchAdRequest.getAnchorTextColor();
    this.backgroundColor = paramSearchAdRequest.getBackgroundColor();
    this.zzpO = paramSearchAdRequest.getBackgroundGradientBottom();
    this.zzpP = paramSearchAdRequest.getBackgroundGradientTop();
    this.zzpQ = paramSearchAdRequest.getBorderColor();
    this.zzpR = paramSearchAdRequest.getBorderThickness();
    this.zzpS = paramSearchAdRequest.getBorderType();
    this.zzpT = paramSearchAdRequest.getCallButtonColor();
    this.zzpU = paramSearchAdRequest.getCustomChannels();
    this.zzpV = paramSearchAdRequest.getDescriptionTextColor();
    this.zzpW = paramSearchAdRequest.getFontFace();
    this.zzpX = paramSearchAdRequest.getHeaderTextColor();
    this.zzpY = paramSearchAdRequest.getHeaderTextSize();
    this.zzpZ = paramSearchAdRequest.getQuery();
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzbt.zza(this, paramParcel, paramInt);
  }
}