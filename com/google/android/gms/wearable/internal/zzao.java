package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.wearable.Node;

public class zzao
  implements SafeParcelable, Node
{
  public static final Parcelable.Creator<zzao> CREATOR = new zzap();
  private final String zzFA;
  final int zzFG;
  private final String zzSJ;

  zzao(int paramInt, String paramString1, String paramString2)
  {
    this.zzFG = paramInt;
    this.zzFA = paramString1;
    this.zzSJ = paramString2;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof zzao));
    zzao localzzao;
    do
    {
      return false;
      localzzao = (zzao)paramObject;
    }
    while ((!localzzao.zzFA.equals(this.zzFA)) || (!localzzao.zzSJ.equals(this.zzSJ)));
    return true;
  }

  public String getDisplayName()
  {
    return this.zzSJ;
  }

  public String getId()
  {
    return this.zzFA;
  }

  public int hashCode()
  {
    return 37 * (629 + this.zzFA.hashCode()) + this.zzSJ.hashCode();
  }

  public String toString()
  {
    return "NodeParcelable{" + this.zzFA + "," + this.zzSJ + "}";
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzap.zza(this, paramParcel, paramInt);
  }
}