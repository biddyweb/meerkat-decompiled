package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import java.util.ArrayList;

public final class AppContentConditionRef extends MultiDataBufferRef
  implements AppContentCondition
{
  AppContentConditionRef(ArrayList<DataHolder> paramArrayList, int paramInt)
  {
    super(paramArrayList, 4, paramInt);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return AppContentConditionEntity.zza(this, paramObject);
  }

  public int hashCode()
  {
    return AppContentConditionEntity.zza(this);
  }

  public String toString()
  {
    return AppContentConditionEntity.zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((AppContentConditionEntity)zznc()).writeToParcel(paramParcel, paramInt);
  }

  public String zzmY()
  {
    return getString("condition_default_value");
  }

  public String zzmZ()
  {
    return getString("condition_expected_value");
  }

  public String zzna()
  {
    return getString("condition_predicate");
  }

  public Bundle zznb()
  {
    return AppContentUtils.zzd(this.zzMd, this.zzadC, "condition_predicate_parameters", this.zzNQ);
  }

  public AppContentCondition zznc()
  {
    return new AppContentConditionEntity(this);
  }
}