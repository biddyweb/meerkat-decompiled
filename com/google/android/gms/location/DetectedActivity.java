package com.google.android.gms.location;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Comparator;

public class DetectedActivity
  implements SafeParcelable
{
  public static final DetectedActivityCreator CREATOR = new DetectedActivityCreator();
  public static final int IN_VEHICLE = 0;
  public static final int ON_BICYCLE = 1;
  public static final int ON_FOOT = 2;
  public static final int RUNNING = 8;
  public static final int STILL = 3;
  public static final int TILTING = 5;
  public static final int UNKNOWN = 4;
  public static final int WALKING = 7;
  public static final Comparator<DetectedActivity> zzalK = new Comparator()
  {
    public int zza(DetectedActivity paramAnonymousDetectedActivity1, DetectedActivity paramAnonymousDetectedActivity2)
    {
      int i = Integer.valueOf(paramAnonymousDetectedActivity2.getConfidence()).compareTo(Integer.valueOf(paramAnonymousDetectedActivity1.getConfidence()));
      if (i == 0)
        i = Integer.valueOf(paramAnonymousDetectedActivity1.getType()).compareTo(Integer.valueOf(paramAnonymousDetectedActivity2.getType()));
      return i;
    }
  };
  private final int zzFG;
  int zzalL;
  int zzalM;

  public DetectedActivity(int paramInt1, int paramInt2)
  {
    this.zzFG = 1;
    this.zzalL = paramInt1;
    this.zzalM = paramInt2;
  }

  public DetectedActivity(int paramInt1, int paramInt2, int paramInt3)
  {
    this.zzFG = paramInt1;
    this.zzalL = paramInt2;
    this.zzalM = paramInt3;
  }

  private int zzff(int paramInt)
  {
    if (paramInt > 9)
      paramInt = 4;
    return paramInt;
  }

  public int describeContents()
  {
    return 0;
  }

  public int getConfidence()
  {
    return this.zzalM;
  }

  public int getType()
  {
    return zzff(this.zzalL);
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public String toString()
  {
    return "DetectedActivity [type=" + getType() + ", confidence=" + this.zzalM + "]";
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    DetectedActivityCreator.zza(this, paramParcel, paramInt);
  }
}