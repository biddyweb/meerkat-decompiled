package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public final class NotifyTransactionStatusRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<NotifyTransactionStatusRequest> CREATOR = new zzn();
  int status;
  final int zzFG;
  String zzaCY;
  String zzaEf;

  NotifyTransactionStatusRequest()
  {
    this.zzFG = 1;
  }

  NotifyTransactionStatusRequest(int paramInt1, String paramString1, int paramInt2, String paramString2)
  {
    this.zzFG = paramInt1;
    this.zzaCY = paramString1;
    this.status = paramInt2;
    this.zzaEf = paramString2;
  }

  public static Builder newBuilder()
  {
    NotifyTransactionStatusRequest localNotifyTransactionStatusRequest = new NotifyTransactionStatusRequest();
    localNotifyTransactionStatusRequest.getClass();
    return new Builder(null);
  }

  public int describeContents()
  {
    return 0;
  }

  public String getDetailedReason()
  {
    return this.zzaEf;
  }

  public String getGoogleTransactionId()
  {
    return this.zzaCY;
  }

  public int getStatus()
  {
    return this.status;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzn.zza(this, paramParcel, paramInt);
  }

  public final class Builder
  {
    private Builder()
    {
    }

    public NotifyTransactionStatusRequest build()
    {
      int i = 1;
      if (!TextUtils.isEmpty(NotifyTransactionStatusRequest.this.zzaCY))
      {
        int k = i;
        zzx.zzb(k, "googleTransactionId is required");
        if ((NotifyTransactionStatusRequest.this.status < i) || (NotifyTransactionStatusRequest.this.status > 8))
          break label62;
      }
      while (true)
      {
        zzx.zzb(i, "status is an unrecognized value");
        return NotifyTransactionStatusRequest.this;
        int m = 0;
        break;
        label62: int j = 0;
      }
    }

    public Builder setDetailedReason(String paramString)
    {
      NotifyTransactionStatusRequest.this.zzaEf = paramString;
      return this;
    }

    public Builder setGoogleTransactionId(String paramString)
    {
      NotifyTransactionStatusRequest.this.zzaCY = paramString;
      return this;
    }

    public Builder setStatus(int paramInt)
    {
      NotifyTransactionStatusRequest.this.status = paramInt;
      return this;
    }
  }

  public static abstract interface Status
  {
    public static final int SUCCESS = 1;

    public static abstract interface Error
    {
      public static final int AVS_DECLINE = 7;
      public static final int BAD_CARD = 4;
      public static final int BAD_CVC = 3;
      public static final int DECLINED = 5;
      public static final int FRAUD_DECLINE = 8;
      public static final int OTHER = 6;
      public static final int UNKNOWN = 2;
    }
  }
}