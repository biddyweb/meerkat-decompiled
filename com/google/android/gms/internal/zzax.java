package com.google.android.gms.internal;

import android.location.Location;
import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.List;

@zzgi
public final class zzax
  implements SafeParcelable
{
  public static final zzay CREATOR = new zzay();
  public final Bundle extras;
  public final int versionCode;
  public final long zzoL;
  public final int zzoM;
  public final List<String> zzoN;
  public final boolean zzoO;
  public final int zzoP;
  public final boolean zzoQ;
  public final String zzoR;
  public final zzbs zzoS;
  public final Location zzoT;
  public final String zzoU;
  public final Bundle zzoV;
  public final Bundle zzoW;
  public final List<String> zzoX;
  public final String zzoY;

  public zzax(int paramInt1, long paramLong, Bundle paramBundle1, int paramInt2, List<String> paramList1, boolean paramBoolean1, int paramInt3, boolean paramBoolean2, String paramString1, zzbs paramzzbs, Location paramLocation, String paramString2, Bundle paramBundle2, Bundle paramBundle3, List<String> paramList2, String paramString3)
  {
    this.versionCode = paramInt1;
    this.zzoL = paramLong;
    this.extras = paramBundle1;
    this.zzoM = paramInt2;
    this.zzoN = paramList1;
    this.zzoO = paramBoolean1;
    this.zzoP = paramInt3;
    this.zzoQ = paramBoolean2;
    this.zzoR = paramString1;
    this.zzoS = paramzzbs;
    this.zzoT = paramLocation;
    this.zzoU = paramString2;
    this.zzoV = paramBundle2;
    this.zzoW = paramBundle3;
    this.zzoX = paramList2;
    this.zzoY = paramString3;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzay.zza(this, paramParcel, paramInt);
  }
}