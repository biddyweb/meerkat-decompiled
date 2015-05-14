package com.google.android.gms.games.achievement;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.common.internal.zzb;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerRef;

public final class AchievementRef extends zzd
  implements Achievement
{
  AchievementRef(DataHolder paramDataHolder, int paramInt)
  {
    super(paramDataHolder, paramInt);
  }

  public int describeContents()
  {
    return 0;
  }

  public Achievement freeze()
  {
    return new AchievementEntity(this);
  }

  public String getAchievementId()
  {
    return getString("external_achievement_id");
  }

  public int getCurrentSteps()
  {
    int i = 1;
    if (getType() == i);
    while (true)
    {
      zzb.zzN(i);
      return getInteger("current_steps");
      int j = 0;
    }
  }

  public String getDescription()
  {
    return getString("description");
  }

  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    zza("description", paramCharArrayBuffer);
  }

  public String getFormattedCurrentSteps()
  {
    int i = 1;
    if (getType() == i);
    while (true)
    {
      zzb.zzN(i);
      return getString("formatted_current_steps");
      int j = 0;
    }
  }

  public void getFormattedCurrentSteps(CharArrayBuffer paramCharArrayBuffer)
  {
    int i = 1;
    if (getType() == i);
    while (true)
    {
      zzb.zzN(i);
      zza("formatted_current_steps", paramCharArrayBuffer);
      return;
      int j = 0;
    }
  }

  public String getFormattedTotalSteps()
  {
    int i = 1;
    if (getType() == i);
    while (true)
    {
      zzb.zzN(i);
      return getString("formatted_total_steps");
      int j = 0;
    }
  }

  public void getFormattedTotalSteps(CharArrayBuffer paramCharArrayBuffer)
  {
    int i = 1;
    if (getType() == i);
    while (true)
    {
      zzb.zzN(i);
      zza("formatted_total_steps", paramCharArrayBuffer);
      return;
      int j = 0;
    }
  }

  public long getLastUpdatedTimestamp()
  {
    return getLong("last_updated_timestamp");
  }

  public String getName()
  {
    return getString("name");
  }

  public void getName(CharArrayBuffer paramCharArrayBuffer)
  {
    zza("name", paramCharArrayBuffer);
  }

  public Player getPlayer()
  {
    return new PlayerRef(this.zzMd, this.zzNQ);
  }

  public Uri getRevealedImageUri()
  {
    return zzbb("revealed_icon_image_uri");
  }

  public String getRevealedImageUrl()
  {
    return getString("revealed_icon_image_url");
  }

  public int getState()
  {
    return getInteger("state");
  }

  public int getTotalSteps()
  {
    int i = 1;
    if (getType() == i);
    while (true)
    {
      zzb.zzN(i);
      return getInteger("total_steps");
      int j = 0;
    }
  }

  public int getType()
  {
    return getInteger("type");
  }

  public Uri getUnlockedImageUri()
  {
    return zzbb("unlocked_icon_image_uri");
  }

  public String getUnlockedImageUrl()
  {
    return getString("unlocked_icon_image_url");
  }

  public long getXpValue()
  {
    if ((!zzba("instance_xp_value")) || (zzbc("instance_xp_value")))
      return getLong("definition_xp_value");
    return getLong("instance_xp_value");
  }

  public String toString()
  {
    return AchievementEntity.zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((AchievementEntity)freeze()).writeToParcel(paramParcel, paramInt);
  }
}