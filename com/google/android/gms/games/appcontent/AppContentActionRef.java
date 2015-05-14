package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import java.util.ArrayList;
import java.util.List;

public final class AppContentActionRef extends MultiDataBufferRef
  implements AppContentAction
{
  AppContentActionRef(ArrayList<DataHolder> paramArrayList, int paramInt)
  {
    super(paramArrayList, 1, paramInt);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return AppContentActionEntity.zza(this, paramObject);
  }

  public Bundle getExtras()
  {
    return AppContentUtils.zzd(this.zzMd, this.zzadC, "action_data", this.zzNQ);
  }

  public String getId()
  {
    return getString("action_id");
  }

  public String getType()
  {
    return getString("action_type");
  }

  public int hashCode()
  {
    return AppContentActionEntity.zza(this);
  }

  public String toString()
  {
    return AppContentActionEntity.zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((AppContentActionEntity)zzmL()).writeToParcel(paramParcel, paramInt);
  }

  public AppContentAnnotation zzmH()
  {
    ArrayList localArrayList = AppContentUtils.zzb(this.zzMd, this.zzadC, "action_annotation", this.zzNQ);
    if (localArrayList.size() == 1)
      return (AppContentAnnotation)localArrayList.get(0);
    return null;
  }

  public List<AppContentCondition> zzmI()
  {
    return AppContentUtils.zzc(this.zzMd, this.zzadC, "action_conditions", this.zzNQ);
  }

  public String zzmJ()
  {
    return getString("action_content_description");
  }

  public String zzmK()
  {
    return getString("overflow_text");
  }

  public AppContentAction zzmL()
  {
    return new AppContentActionEntity(this);
  }
}