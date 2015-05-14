package com.google.android.gms.wearable.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.wearable.zzb;

public class zze
  implements SafeParcelable, zzb
{
  public static final Parcelable.Creator<zze> CREATOR = new zzf();
  private int mId;
  private final String zzBc;
  final int zzFG;
  private String zzSJ;
  private final String zzSy;
  private final String zzaFP;
  private final String zzaFQ;
  private byte zzaFR;
  private byte zzaFS;
  private byte zzaFT;
  private byte zzaFU;
  private final String zzadw;

  zze(int paramInt1, int paramInt2, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, byte paramByte1, byte paramByte2, byte paramByte3, byte paramByte4)
  {
    this.mId = paramInt2;
    this.zzFG = paramInt1;
    this.zzBc = paramString1;
    this.zzaFP = paramString2;
    this.zzaFQ = paramString3;
    this.zzSy = paramString4;
    this.zzadw = paramString5;
    this.zzSJ = paramString6;
    this.zzaFR = paramByte1;
    this.zzaFS = paramByte2;
    this.zzaFT = paramByte3;
    this.zzaFU = paramByte4;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zze localzze;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localzze = (zze)paramObject;
      if (this.zzaFU != localzze.zzaFU)
        return false;
      if (this.zzaFT != localzze.zzaFT)
        return false;
      if (this.zzaFS != localzze.zzaFS)
        return false;
      if (this.zzaFR != localzze.zzaFR)
        return false;
      if (this.mId != localzze.mId)
        return false;
      if (this.zzFG != localzze.zzFG)
        return false;
      if (!this.zzBc.equals(localzze.zzBc))
        return false;
      if (this.zzaFP != null)
      {
        if (this.zzaFP.equals(localzze.zzaFP));
      }
      else
        while (localzze.zzaFP != null)
          return false;
      if (!this.zzSJ.equals(localzze.zzSJ))
        return false;
      if (!this.zzaFQ.equals(localzze.zzaFQ))
        return false;
      if (!this.zzadw.equals(localzze.zzadw))
        return false;
    }
    while (this.zzSy.equals(localzze.zzSy));
    return false;
  }

  public String getDisplayName()
  {
    if (this.zzSJ == null)
      return this.zzBc;
    return this.zzSJ;
  }

  public int getId()
  {
    return this.mId;
  }

  public String getTitle()
  {
    return this.zzSy;
  }

  public int hashCode()
  {
    int i = 31 * (31 * (31 * this.zzFG + this.mId) + this.zzBc.hashCode());
    if (this.zzaFP != null);
    for (int j = this.zzaFP.hashCode(); ; j = 0)
      return 31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (j + i) + this.zzaFQ.hashCode()) + this.zzSy.hashCode()) + this.zzadw.hashCode()) + this.zzSJ.hashCode()) + this.zzaFR) + this.zzaFS) + this.zzaFT) + this.zzaFU;
  }

  public String toString()
  {
    return "AncsNotificationParcelable{mVersionCode=" + this.zzFG + ", mId=" + this.mId + ", mAppId='" + this.zzBc + '\'' + ", mDateTime='" + this.zzaFP + '\'' + ", mNotificationText='" + this.zzaFQ + '\'' + ", mTitle='" + this.zzSy + '\'' + ", mSubtitle='" + this.zzadw + '\'' + ", mDisplayName='" + this.zzSJ + '\'' + ", mEventId=" + this.zzaFR + ", mEventFlags=" + this.zzaFS + ", mCategoryId=" + this.zzaFT + ", mCategoryCount=" + this.zzaFU + '}';
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzf.zza(this, paramParcel, paramInt);
  }

  public String zzmV()
  {
    return this.zzadw;
  }

  public String zznE()
  {
    return this.zzBc;
  }

  public String zzvb()
  {
    return this.zzaFP;
  }

  public String zzvc()
  {
    return this.zzaFQ;
  }

  public byte zzvd()
  {
    return this.zzaFR;
  }

  public byte zzve()
  {
    return this.zzaFS;
  }

  public byte zzvf()
  {
    return this.zzaFT;
  }

  public byte zzvg()
  {
    return this.zzaFU;
  }
}