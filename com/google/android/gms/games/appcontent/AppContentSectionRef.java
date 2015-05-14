package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import java.util.ArrayList;

public final class AppContentSectionRef extends MultiDataBufferRef
  implements AppContentSection
{
  private final int zzadF;

  AppContentSectionRef(ArrayList<DataHolder> paramArrayList, int paramInt1, int paramInt2)
  {
    super(paramArrayList, 0, paramInt1);
    this.zzadF = paramInt2;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return AppContentSectionEntity.zza(this, paramObject);
  }

  public Bundle getExtras()
  {
    return AppContentUtils.zzd(this.zzMd, this.zzadC, "section_data", this.zzNQ);
  }

  public String getId()
  {
    return getString("section_id");
  }

  public String getTitle()
  {
    return getString("section_title");
  }

  public String getType()
  {
    return getString("section_type");
  }

  public int hashCode()
  {
    return AppContentSectionEntity.zza(this);
  }

  public String toString()
  {
    return AppContentSectionEntity.zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((AppContentSectionEntity)zznf()).writeToParcel(paramParcel, paramInt);
  }

  public String zzmJ()
  {
    return getString("section_content_description");
  }

  public String zzmV()
  {
    return getString("section_subtitle");
  }

  public String zzne()
  {
    return getString("section_card_type");
  }

  public AppContentSection zznf()
  {
    return new AppContentSectionEntity(this);
  }

  public ArrayList<AppContentAction> zzng()
  {
    return AppContentUtils.zza(this.zzMd, this.zzadC, "section_actions", this.zzNQ);
  }

  public ArrayList<AppContentAnnotation> zznh()
  {
    return AppContentUtils.zzb(this.zzMd, this.zzadC, "section_annotations", this.zzNQ);
  }

  public ArrayList<AppContentCard> zzni()
  {
    ArrayList localArrayList = new ArrayList(this.zzadF);
    for (int i = 0; i < this.zzadF; i++)
      localArrayList.add(new AppContentCardRef(this.zzadC, i + this.zzNQ));
    return localArrayList;
  }
}