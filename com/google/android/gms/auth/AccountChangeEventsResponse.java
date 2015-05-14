package com.google.android.gms.auth;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import java.util.List;

public class AccountChangeEventsResponse
  implements SafeParcelable
{
  public static final AccountChangeEventsResponseCreator CREATOR = new AccountChangeEventsResponseCreator();
  final int zzHe;
  final List<AccountChangeEvent> zzmv;

  AccountChangeEventsResponse(int paramInt, List<AccountChangeEvent> paramList)
  {
    this.zzHe = paramInt;
    this.zzmv = ((List)zzx.zzl(paramList));
  }

  public AccountChangeEventsResponse(List<AccountChangeEvent> paramList)
  {
    this.zzHe = 1;
    this.zzmv = ((List)zzx.zzl(paramList));
  }

  public int describeContents()
  {
    return 0;
  }

  public List<AccountChangeEvent> getEvents()
  {
    return this.zzmv;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    AccountChangeEventsResponseCreator.zza(this, paramParcel, paramInt);
  }
}