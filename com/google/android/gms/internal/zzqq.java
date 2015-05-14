package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import java.util.List;

public class zzqq
  implements SafeParcelable
{
  public static final zzqs CREATOR = new zzqs();
  final int zzFG;
  private final String zzHg;
  private final String zzanM;
  private final List<zzqu> zzapk;
  private final List<zzqo> zzapl;
  private final List<zzqm> zzapm;

  zzqq(int paramInt, String paramString1, String paramString2, List<zzqu> paramList, List<zzqo> paramList1, List<zzqm> paramList2)
  {
    this.zzFG = paramInt;
    this.zzHg = paramString1;
    this.zzanM = paramString2;
    this.zzapk = paramList;
    this.zzapl = paramList1;
    this.zzapm = paramList2;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zzqq localzzqq;
    do
    {
      return true;
      if (!(paramObject instanceof zzqq))
        return false;
      localzzqq = (zzqq)paramObject;
    }
    while ((this.zzHg.equals(localzzqq.zzHg)) && (this.zzanM.equals(localzzqq.zzanM)) && (this.zzapk.equals(localzzqq.zzapk)) && (this.zzapl.equals(localzzqq.zzapl)) && (this.zzapm.equals(localzzqq.zzapm)));
    return false;
  }

  public String getPlaceId()
  {
    return this.zzanM;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = this.zzHg;
    arrayOfObject[1] = this.zzanM;
    arrayOfObject[2] = this.zzapk;
    arrayOfObject[3] = this.zzapl;
    arrayOfObject[4] = this.zzapm;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("accountName", this.zzHg).zza("placeId", this.zzanM).zza("testDataImpls", this.zzapk).zza("placeAliases", this.zzapl).zza("hereContents", this.zzapm).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzqs.zza(this, paramParcel, paramInt);
  }

  public String zzpZ()
  {
    return this.zzHg;
  }

  public List<zzqo> zzqa()
  {
    return this.zzapl;
  }

  public List<zzqm> zzqb()
  {
    return this.zzapm;
  }

  public List<zzqu> zzqc()
  {
    return this.zzapk;
  }
}