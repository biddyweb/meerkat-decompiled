package com.google.android.gms.common.internal;

import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class zzae
  implements SafeParcelable
{
  public static final Parcelable.Creator<zzae> CREATOR = new zzaf();
  final int zzFG;
  final IBinder zzPn;
  private final Scope[] zzPo;
  private final int zzQv;
  private final Bundle zzQw;
  private final String zzQx;

  zzae(int paramInt1, int paramInt2, IBinder paramIBinder, Scope[] paramArrayOfScope, Bundle paramBundle, String paramString)
  {
    this.zzFG = paramInt1;
    this.zzQv = paramInt2;
    this.zzPn = paramIBinder;
    this.zzPo = paramArrayOfScope;
    this.zzQw = paramBundle;
    this.zzQx = paramString;
  }

  public zzae(zzq paramzzq, Scope[] paramArrayOfScope, String paramString, Bundle paramBundle)
  {
  }

  public int describeContents()
  {
    return 0;
  }

  public String getCallingPackage()
  {
    return this.zzQx;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzaf.zza(this, paramParcel, paramInt);
  }

  public int zzjr()
  {
    return this.zzQv;
  }

  public Scope[] zzjs()
  {
    return this.zzPo;
  }

  public Bundle zzjt()
  {
    return this.zzQw;
  }
}