package com.google.android.gms.auth;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzx;

public class AccountChangeEvent
  implements SafeParcelable
{
  public static final AccountChangeEventCreator CREATOR = new AccountChangeEventCreator();
  final int zzHe;
  final long zzHf;
  final String zzHg;
  final int zzHh;
  final int zzHi;
  final String zzHj;

  AccountChangeEvent(int paramInt1, long paramLong, String paramString1, int paramInt2, int paramInt3, String paramString2)
  {
    this.zzHe = paramInt1;
    this.zzHf = paramLong;
    this.zzHg = ((String)zzx.zzl(paramString1));
    this.zzHh = paramInt2;
    this.zzHi = paramInt3;
    this.zzHj = paramString2;
  }

  public AccountChangeEvent(long paramLong, String paramString1, int paramInt1, int paramInt2, String paramString2)
  {
    this.zzHe = 1;
    this.zzHf = paramLong;
    this.zzHg = ((String)zzx.zzl(paramString1));
    this.zzHh = paramInt1;
    this.zzHi = paramInt2;
    this.zzHj = paramString2;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    AccountChangeEvent localAccountChangeEvent;
    do
    {
      return true;
      if (!(paramObject instanceof AccountChangeEvent))
        break;
      localAccountChangeEvent = (AccountChangeEvent)paramObject;
    }
    while ((this.zzHe == localAccountChangeEvent.zzHe) && (this.zzHf == localAccountChangeEvent.zzHf) && (zzw.equal(this.zzHg, localAccountChangeEvent.zzHg)) && (this.zzHh == localAccountChangeEvent.zzHh) && (this.zzHi == localAccountChangeEvent.zzHi) && (zzw.equal(this.zzHj, localAccountChangeEvent.zzHj)));
    return false;
    return false;
  }

  public String getAccountName()
  {
    return this.zzHg;
  }

  public String getChangeData()
  {
    return this.zzHj;
  }

  public int getChangeType()
  {
    return this.zzHh;
  }

  public int getEventIndex()
  {
    return this.zzHi;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[6];
    arrayOfObject[0] = Integer.valueOf(this.zzHe);
    arrayOfObject[1] = Long.valueOf(this.zzHf);
    arrayOfObject[2] = this.zzHg;
    arrayOfObject[3] = Integer.valueOf(this.zzHh);
    arrayOfObject[4] = Integer.valueOf(this.zzHi);
    arrayOfObject[5] = this.zzHj;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    String str = "UNKNOWN";
    switch (this.zzHh)
    {
    default:
    case 1:
    case 2:
    case 4:
    case 3:
    }
    while (true)
    {
      return "AccountChangeEvent {accountName = " + this.zzHg + ", changeType = " + str + ", changeData = " + this.zzHj + ", eventIndex = " + this.zzHi + "}";
      str = "ADDED";
      continue;
      str = "REMOVED";
      continue;
      str = "RENAMED_TO";
      continue;
      str = "RENAMED_FROM";
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    AccountChangeEventCreator.zza(this, paramParcel, paramInt);
  }
}