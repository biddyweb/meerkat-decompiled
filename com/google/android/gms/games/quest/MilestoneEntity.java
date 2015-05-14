package com.google.android.gms.games.quest;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public final class MilestoneEntity
  implements SafeParcelable, Milestone
{
  public static final MilestoneEntityCreator CREATOR = new MilestoneEntityCreator();
  private final int mState;
  private final int zzFG;
  private final String zzadJ;
  private final String zzaeR;
  private final long zzakk;
  private final long zzakl;
  private final byte[] zzakm;

  MilestoneEntity(int paramInt1, String paramString1, long paramLong1, long paramLong2, byte[] paramArrayOfByte, int paramInt2, String paramString2)
  {
    this.zzFG = paramInt1;
    this.zzaeR = paramString1;
    this.zzakk = paramLong1;
    this.zzakl = paramLong2;
    this.zzakm = paramArrayOfByte;
    this.mState = paramInt2;
    this.zzadJ = paramString2;
  }

  public MilestoneEntity(Milestone paramMilestone)
  {
    this.zzFG = 4;
    this.zzaeR = paramMilestone.getMilestoneId();
    this.zzakk = paramMilestone.getCurrentProgress();
    this.zzakl = paramMilestone.getTargetProgress();
    this.mState = paramMilestone.getState();
    this.zzadJ = paramMilestone.getEventId();
    byte[] arrayOfByte = paramMilestone.getCompletionRewardData();
    if (arrayOfByte == null)
    {
      this.zzakm = null;
      return;
    }
    this.zzakm = new byte[arrayOfByte.length];
    System.arraycopy(arrayOfByte, 0, this.zzakm, 0, arrayOfByte.length);
  }

  static int zza(Milestone paramMilestone)
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = paramMilestone.getMilestoneId();
    arrayOfObject[1] = Long.valueOf(paramMilestone.getCurrentProgress());
    arrayOfObject[2] = Long.valueOf(paramMilestone.getTargetProgress());
    arrayOfObject[3] = Integer.valueOf(paramMilestone.getState());
    arrayOfObject[4] = paramMilestone.getEventId();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(Milestone paramMilestone, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Milestone))
      bool = false;
    Milestone localMilestone;
    do
    {
      do
        return bool;
      while (paramMilestone == paramObject);
      localMilestone = (Milestone)paramObject;
    }
    while ((zzw.equal(localMilestone.getMilestoneId(), paramMilestone.getMilestoneId())) && (zzw.equal(Long.valueOf(localMilestone.getCurrentProgress()), Long.valueOf(paramMilestone.getCurrentProgress()))) && (zzw.equal(Long.valueOf(localMilestone.getTargetProgress()), Long.valueOf(paramMilestone.getTargetProgress()))) && (zzw.equal(Integer.valueOf(localMilestone.getState()), Integer.valueOf(paramMilestone.getState()))) && (zzw.equal(localMilestone.getEventId(), paramMilestone.getEventId())));
    return false;
  }

  static String zzb(Milestone paramMilestone)
  {
    return zzw.zzk(paramMilestone).zza("MilestoneId", paramMilestone.getMilestoneId()).zza("CurrentProgress", Long.valueOf(paramMilestone.getCurrentProgress())).zza("TargetProgress", Long.valueOf(paramMilestone.getTargetProgress())).zza("State", Integer.valueOf(paramMilestone.getState())).zza("CompletionRewardData", paramMilestone.getCompletionRewardData()).zza("EventId", paramMilestone.getEventId()).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public Milestone freeze()
  {
    return this;
  }

  public byte[] getCompletionRewardData()
  {
    return this.zzakm;
  }

  public long getCurrentProgress()
  {
    return this.zzakk;
  }

  public String getEventId()
  {
    return this.zzadJ;
  }

  public String getMilestoneId()
  {
    return this.zzaeR;
  }

  public int getState()
  {
    return this.mState;
  }

  public long getTargetProgress()
  {
    return this.zzakl;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    return zza(this);
  }

  public boolean isDataValid()
  {
    return true;
  }

  public String toString()
  {
    return zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    MilestoneEntityCreator.zza(this, paramParcel, paramInt);
  }
}