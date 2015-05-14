package com.google.android.gms.games.quest;

import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;

public final class MilestoneRef extends zzd
  implements Milestone
{
  MilestoneRef(DataHolder paramDataHolder, int paramInt)
  {
    super(paramDataHolder, paramInt);
  }

  private long zzoY()
  {
    return getLong("initial_value");
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return MilestoneEntity.zza(this, paramObject);
  }

  public Milestone freeze()
  {
    return new MilestoneEntity(this);
  }

  public byte[] getCompletionRewardData()
  {
    return getByteArray("completion_reward_data");
  }

  public long getCurrentProgress()
  {
    switch (getState())
    {
    case 1:
    default:
      return 0L;
    case 3:
    case 4:
      return getTargetProgress();
    case 2:
    }
    return getLong("current_value") - zzoY();
  }

  public String getEventId()
  {
    return getString("external_event_id");
  }

  public String getMilestoneId()
  {
    return getString("external_milestone_id");
  }

  public int getState()
  {
    return getInteger("milestone_state");
  }

  public long getTargetProgress()
  {
    return getLong("target_value");
  }

  public int hashCode()
  {
    return MilestoneEntity.zza(this);
  }

  public String toString()
  {
    return MilestoneEntity.zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((MilestoneEntity)freeze()).writeToParcel(paramParcel, paramInt);
  }
}