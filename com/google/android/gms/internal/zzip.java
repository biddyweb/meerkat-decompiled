package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzip
  implements SafeParcelable
{
  public static final zziq CREATOR = new zziq();
  final int zzFG;
  final String zzFO;
  final String zzFP;
  final String zzFQ;

  zzip(int paramInt, String paramString1, String paramString2, String paramString3)
  {
    this.zzFG = paramInt;
    this.zzFO = paramString1;
    this.zzFP = paramString2;
    this.zzFQ = paramString3;
  }

  public zzip(String paramString1, String paramString2, String paramString3)
  {
    this(1, paramString1, paramString2, paramString3);
  }

  public int describeContents()
  {
    return 0;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.zzFO;
    arrayOfObject[1] = this.zzFP;
    arrayOfObject[2] = this.zzFQ;
    return String.format("DocumentId[packageName=%s, corpusName=%s, uri=%s]", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zziq.zza(this, paramParcel, paramInt);
  }
}