package com.google.android.gms.games.internal.game;

import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;

public final class GameBadgeRef extends zzd
  implements GameBadge
{
  GameBadgeRef(DataHolder paramDataHolder, int paramInt)
  {
    super(paramDataHolder, paramInt);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return GameBadgeEntity.zza(this, paramObject);
  }

  public String getDescription()
  {
    return getString("badge_description");
  }

  public Uri getIconImageUri()
  {
    return zzbb("badge_icon_image_uri");
  }

  public String getTitle()
  {
    return getString("badge_title");
  }

  public int getType()
  {
    return getInteger("badge_type");
  }

  public int hashCode()
  {
    return GameBadgeEntity.zza(this);
  }

  public String toString()
  {
    return GameBadgeEntity.zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((GameBadgeEntity)zzot()).writeToParcel(paramParcel, paramInt);
  }

  public GameBadge zzot()
  {
    return new GameBadgeEntity(this);
  }
}