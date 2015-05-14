package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.fitness.data.Subscription;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class ListSubscriptionsResult
  implements Result, SafeParcelable
{
  public static final Parcelable.Creator<ListSubscriptionsResult> CREATOR = new zzi();
  private final int zzFG;
  private final Status zzHb;
  private final List<Subscription> zzabT;

  ListSubscriptionsResult(int paramInt, List<Subscription> paramList, Status paramStatus)
  {
    this.zzFG = paramInt;
    this.zzabT = paramList;
    this.zzHb = paramStatus;
  }

  public ListSubscriptionsResult(List<Subscription> paramList, Status paramStatus)
  {
    this.zzFG = 3;
    this.zzabT = Collections.unmodifiableList(paramList);
    this.zzHb = ((Status)zzx.zzb(paramStatus, "status"));
  }

  public static ListSubscriptionsResult zzE(Status paramStatus)
  {
    return new ListSubscriptionsResult(Collections.emptyList(), paramStatus);
  }

  private boolean zzb(ListSubscriptionsResult paramListSubscriptionsResult)
  {
    return (this.zzHb.equals(paramListSubscriptionsResult.zzHb)) && (zzw.equal(this.zzabT, paramListSubscriptionsResult.zzabT));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof ListSubscriptionsResult)) && (zzb((ListSubscriptionsResult)paramObject)));
  }

  public Status getStatus()
  {
    return this.zzHb;
  }

  public List<Subscription> getSubscriptions()
  {
    return this.zzabT;
  }

  public List<Subscription> getSubscriptions(DataType paramDataType)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.zzabT.iterator();
    while (localIterator.hasNext())
    {
      Subscription localSubscription = (Subscription)localIterator.next();
      if (paramDataType.equals(localSubscription.zzlJ()))
        localArrayList.add(localSubscription);
    }
    return Collections.unmodifiableList(localArrayList);
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.zzHb;
    arrayOfObject[1] = this.zzabT;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("status", this.zzHb).zza("subscriptions", this.zzabT).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzi.zza(this, paramParcel, paramInt);
  }
}