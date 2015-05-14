package com.google.android.gms.common.api;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.IntentSender.SendIntentException;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public final class Status
  implements Result, SafeParcelable
{
  public static final StatusCreator CREATOR = new StatusCreator();
  public static final Status zzNo = new Status(0);
  public static final Status zzNp = new Status(14);
  public static final Status zzNq = new Status(8);
  public static final Status zzNr = new Status(15);
  public static final Status zzNs = new Status(16);
  private final PendingIntent mPendingIntent;
  private final int zzFG;
  private final int zzLs;
  private final String zzNt;

  public Status(int paramInt)
  {
    this(paramInt, null);
  }

  Status(int paramInt1, int paramInt2, String paramString, PendingIntent paramPendingIntent)
  {
    this.zzFG = paramInt1;
    this.zzLs = paramInt2;
    this.zzNt = paramString;
    this.mPendingIntent = paramPendingIntent;
  }

  public Status(int paramInt, String paramString)
  {
    this(1, paramInt, paramString, null);
  }

  public Status(int paramInt, String paramString, PendingIntent paramPendingIntent)
  {
    this(1, paramInt, paramString, paramPendingIntent);
  }

  private String zzhK()
  {
    if (this.zzNt != null)
      return this.zzNt;
    return CommonStatusCodes.getStatusCodeString(this.zzLs);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof Status));
    Status localStatus;
    do
    {
      return false;
      localStatus = (Status)paramObject;
    }
    while ((this.zzFG != localStatus.zzFG) || (this.zzLs != localStatus.zzLs) || (!zzw.equal(this.zzNt, localStatus.zzNt)) || (!zzw.equal(this.mPendingIntent, localStatus.mPendingIntent)));
    return true;
  }

  public PendingIntent getResolution()
  {
    return this.mPendingIntent;
  }

  public Status getStatus()
  {
    return this;
  }

  public int getStatusCode()
  {
    return this.zzLs;
  }

  public String getStatusMessage()
  {
    return this.zzNt;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public boolean hasResolution()
  {
    return this.mPendingIntent != null;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = Integer.valueOf(this.zzFG);
    arrayOfObject[1] = Integer.valueOf(this.zzLs);
    arrayOfObject[2] = this.zzNt;
    arrayOfObject[3] = this.mPendingIntent;
    return zzw.hashCode(arrayOfObject);
  }

  public boolean isCanceled()
  {
    return this.zzLs == 16;
  }

  public boolean isInterrupted()
  {
    return this.zzLs == 14;
  }

  public boolean isSuccess()
  {
    return this.zzLs <= 0;
  }

  public void startResolutionForResult(Activity paramActivity, int paramInt)
    throws IntentSender.SendIntentException
  {
    if (!hasResolution())
      return;
    paramActivity.startIntentSenderForResult(this.mPendingIntent.getIntentSender(), paramInt, null, 0, 0, 0);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("statusCode", zzhK()).zza("resolution", this.mPendingIntent).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    StatusCreator.zza(this, paramParcel, paramInt);
  }

  PendingIntent zzip()
  {
    return this.mPendingIntent;
  }
}