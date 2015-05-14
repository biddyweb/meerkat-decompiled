package com.google.android.gms.drive.realtime.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class ParcelableCollaborator
  implements SafeParcelable
{
  public static final Parcelable.Creator<ParcelableCollaborator> CREATOR = new zzp();
  final int zzFG;
  final String zzSJ;
  final boolean zzWX;
  final boolean zzWY;
  final String zzWZ;
  final String zzXa;
  final String zzXb;
  final String zzyL;

  ParcelableCollaborator(int paramInt, boolean paramBoolean1, boolean paramBoolean2, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    this.zzFG = paramInt;
    this.zzWX = paramBoolean1;
    this.zzWY = paramBoolean2;
    this.zzyL = paramString1;
    this.zzWZ = paramString2;
    this.zzSJ = paramString3;
    this.zzXa = paramString4;
    this.zzXb = paramString5;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject)
      return true;
    if (!(paramObject instanceof ParcelableCollaborator))
      return false;
    ParcelableCollaborator localParcelableCollaborator = (ParcelableCollaborator)paramObject;
    return this.zzyL.equals(localParcelableCollaborator.zzyL);
  }

  public int hashCode()
  {
    return this.zzyL.hashCode();
  }

  public String toString()
  {
    return "Collaborator [isMe=" + this.zzWX + ", isAnonymous=" + this.zzWY + ", sessionId=" + this.zzyL + ", userId=" + this.zzWZ + ", displayName=" + this.zzSJ + ", color=" + this.zzXa + ", photoUrl=" + this.zzXb + "]";
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzp.zza(this, paramParcel, paramInt);
  }
}