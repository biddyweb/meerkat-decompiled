package com.google.android.gms.location;

import android.os.SystemClock;
import com.google.android.gms.internal.zzpk;

public abstract interface Geofence
{
  public static final int GEOFENCE_TRANSITION_DWELL = 4;
  public static final int GEOFENCE_TRANSITION_ENTER = 1;
  public static final int GEOFENCE_TRANSITION_EXIT = 2;
  public static final long NEVER_EXPIRE = -1L;

  public abstract String getRequestId();

  public static final class Builder
  {
    private int zzalN = 0;
    private long zzalO = -9223372036854775808L;
    private short zzalP = -1;
    private double zzalQ;
    private double zzalR;
    private float zzalS;
    private int zzalT = 0;
    private int zzalU = -1;
    private String zzxv = null;

    public Geofence build()
    {
      if (this.zzxv == null)
        throw new IllegalArgumentException("Request ID not set.");
      if (this.zzalN == 0)
        throw new IllegalArgumentException("Transitions types not set.");
      if (((0x4 & this.zzalN) != 0) && (this.zzalU < 0))
        throw new IllegalArgumentException("Non-negative loitering delay needs to be set when transition types include GEOFENCE_TRANSITION_DWELLING.");
      if (this.zzalO == -9223372036854775808L)
        throw new IllegalArgumentException("Expiration not set.");
      if (this.zzalP == -1)
        throw new IllegalArgumentException("Geofence region not set.");
      if (this.zzalT < 0)
        throw new IllegalArgumentException("Notification responsiveness should be nonnegative.");
      return new zzpk(this.zzxv, this.zzalN, (short)1, this.zzalQ, this.zzalR, this.zzalS, this.zzalO, this.zzalT, this.zzalU);
    }

    public Builder setCircularRegion(double paramDouble1, double paramDouble2, float paramFloat)
    {
      this.zzalP = 1;
      this.zzalQ = paramDouble1;
      this.zzalR = paramDouble2;
      this.zzalS = paramFloat;
      return this;
    }

    public Builder setExpirationDuration(long paramLong)
    {
      if (paramLong < 0L)
      {
        this.zzalO = -1L;
        return this;
      }
      this.zzalO = (paramLong + SystemClock.elapsedRealtime());
      return this;
    }

    public Builder setLoiteringDelay(int paramInt)
    {
      this.zzalU = paramInt;
      return this;
    }

    public Builder setNotificationResponsiveness(int paramInt)
    {
      this.zzalT = paramInt;
      return this;
    }

    public Builder setRequestId(String paramString)
    {
      this.zzxv = paramString;
      return this;
    }

    public Builder setTransitionTypes(int paramInt)
    {
      this.zzalN = paramInt;
      return this;
    }
  }
}