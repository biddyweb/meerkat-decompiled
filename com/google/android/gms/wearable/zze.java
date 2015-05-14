package com.google.android.gms.wearable;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;

public class zze
  implements SafeParcelable
{
  public static final Parcelable.Creator<zze> CREATOR = new zzf();
  private final String mName;
  final int zzFG;
  private final int zzJp;
  private final String zzYy;
  private final int zzaFt;
  private final boolean zzaFu;
  private boolean zzaFv;
  private String zzaFw;

  zze(int paramInt1, String paramString1, String paramString2, int paramInt2, int paramInt3, boolean paramBoolean1, boolean paramBoolean2, String paramString3)
  {
    this.zzFG = paramInt1;
    this.mName = paramString1;
    this.zzYy = paramString2;
    this.zzJp = paramInt2;
    this.zzaFt = paramInt3;
    this.zzaFu = paramBoolean1;
    this.zzaFv = paramBoolean2;
    this.zzaFw = paramString3;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof zze));
    zze localzze;
    do
    {
      return false;
      localzze = (zze)paramObject;
    }
    while ((!zzw.equal(Integer.valueOf(this.zzFG), Integer.valueOf(localzze.zzFG))) || (!zzw.equal(this.mName, localzze.mName)) || (!zzw.equal(this.zzYy, localzze.zzYy)) || (!zzw.equal(Integer.valueOf(this.zzJp), Integer.valueOf(localzze.zzJp))) || (!zzw.equal(Integer.valueOf(this.zzaFt), Integer.valueOf(localzze.zzaFt))) || (!zzw.equal(Boolean.valueOf(this.zzaFu), Boolean.valueOf(localzze.zzaFu))));
    return true;
  }

  public String getAddress()
  {
    return this.zzYy;
  }

  public String getName()
  {
    return this.mName;
  }

  public int getRole()
  {
    return this.zzaFt;
  }

  public int getType()
  {
    return this.zzJp;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[6];
    arrayOfObject[0] = Integer.valueOf(this.zzFG);
    arrayOfObject[1] = this.mName;
    arrayOfObject[2] = this.zzYy;
    arrayOfObject[3] = Integer.valueOf(this.zzJp);
    arrayOfObject[4] = Integer.valueOf(this.zzaFt);
    arrayOfObject[5] = Boolean.valueOf(this.zzaFu);
    return zzw.hashCode(arrayOfObject);
  }

  public boolean isConnected()
  {
    return this.zzaFv;
  }

  public boolean isEnabled()
  {
    return this.zzaFu;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("ConnectionConfiguration[ ");
    localStringBuilder.append("mName=" + this.mName);
    localStringBuilder.append(", mAddress=" + this.zzYy);
    localStringBuilder.append(", mType=" + this.zzJp);
    localStringBuilder.append(", mRole=" + this.zzaFt);
    localStringBuilder.append(", mEnabled=" + this.zzaFu);
    localStringBuilder.append(", mIsConnected=" + this.zzaFv);
    localStringBuilder.append(", mEnabled=" + this.zzaFw);
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzf.zza(this, paramParcel, paramInt);
  }

  public String zzuX()
  {
    return this.zzaFw;
  }
}