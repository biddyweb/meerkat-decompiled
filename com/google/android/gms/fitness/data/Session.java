package com.google.android.gms.fitness.data;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.text.TextUtils;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.safeparcel.zzc;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.FitnessActivities;
import java.util.concurrent.TimeUnit;

public class Session
  implements SafeParcelable
{
  public static final Parcelable.Creator<Session> CREATOR = new zzp();
  public static final String EXTRA_SESSION = "vnd.google.fitness.session";
  public static final String MIME_TYPE_PREFIX = "vnd.google.fitness.session/";
  private final String mName;
  private final int zzFG;
  private final long zzON;
  private final int zzYC;
  private final zza zzYP;
  private final long zzYq;
  private final String zzZN;
  private final String zzZO;

  Session(int paramInt1, long paramLong1, long paramLong2, String paramString1, String paramString2, String paramString3, int paramInt2, zza paramzza)
  {
    this.zzFG = paramInt1;
    this.zzON = paramLong1;
    this.zzYq = paramLong2;
    this.mName = paramString1;
    this.zzZN = paramString2;
    this.zzZO = paramString3;
    this.zzYC = paramInt2;
    this.zzYP = paramzza;
  }

  private Session(Builder paramBuilder)
  {
    this.zzFG = 2;
    this.zzON = Builder.zza(paramBuilder);
    this.zzYq = Builder.zzb(paramBuilder);
    this.mName = Builder.zzc(paramBuilder);
    this.zzZN = Builder.zzd(paramBuilder);
    this.zzZO = Builder.zze(paramBuilder);
    this.zzYC = Builder.zzf(paramBuilder);
    this.zzYP = Builder.zzg(paramBuilder);
  }

  public static Session extract(Intent paramIntent)
  {
    if (paramIntent == null)
      return null;
    return (Session)zzc.zza(paramIntent, "vnd.google.fitness.session", CREATOR);
  }

  public static String getMimeType(String paramString)
  {
    return "vnd.google.fitness.session/" + paramString;
  }

  private boolean zza(Session paramSession)
  {
    return (this.zzON == paramSession.zzON) && (this.zzYq == paramSession.zzYq) && (zzw.equal(this.mName, paramSession.mName)) && (zzw.equal(this.zzZN, paramSession.zzZN)) && (zzw.equal(this.zzZO, paramSession.zzZO)) && (zzw.equal(this.zzYP, paramSession.zzYP)) && (this.zzYC == paramSession.zzYC);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (paramObject == this) || (((paramObject instanceof Session)) && (zza((Session)paramObject)));
  }

  public String getActivity()
  {
    return FitnessActivities.getName(this.zzYC);
  }

  public String getAppPackageName()
  {
    if (this.zzYP == null)
      return null;
    return this.zzYP.getPackageName();
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public long getEndTime(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(this.zzYq, TimeUnit.MILLISECONDS);
  }

  public String getIdentifier()
  {
    return this.zzZN;
  }

  public String getName()
  {
    return this.mName;
  }

  public long getStartTime(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(this.zzON, TimeUnit.MILLISECONDS);
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Long.valueOf(this.zzON);
    arrayOfObject[1] = Long.valueOf(this.zzYq);
    arrayOfObject[2] = this.zzZN;
    return zzw.hashCode(arrayOfObject);
  }

  public boolean isOngoing()
  {
    return this.zzYq == 0L;
  }

  public String toString()
  {
    return zzw.zzk(this).zza("startTime", Long.valueOf(this.zzON)).zza("endTime", Long.valueOf(this.zzYq)).zza("name", this.mName).zza("identifier", this.zzZN).zza("description", this.zzZO).zza("activity", Integer.valueOf(this.zzYC)).zza("application", this.zzYP).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzp.zza(this, paramParcel, paramInt);
  }

  public int zzln()
  {
    return this.zzYC;
  }

  public long zzlp()
  {
    return this.zzON;
  }

  public long zzlq()
  {
    return this.zzYq;
  }

  public zza zzlz()
  {
    return this.zzYP;
  }

  public static class Builder
  {
    private String mName = null;
    private long zzON = 0L;
    private int zzYC = 4;
    private zza zzYP;
    private long zzYq = 0L;
    private String zzZN;
    private String zzZO;

    public Session build()
    {
      boolean bool1;
      StringBuilder localStringBuilder;
      if (this.zzON > 0L)
      {
        bool1 = true;
        zzx.zza(bool1, "Start time should be specified.");
        boolean bool2;
        if (this.zzYq != 0L)
        {
          boolean bool3 = this.zzYq < this.zzON;
          bool2 = false;
          if (!bool3);
        }
        else
        {
          bool2 = true;
        }
        zzx.zza(bool2, "End time should be later than start time.");
        if (this.zzZN == null)
        {
          localStringBuilder = new StringBuilder();
          if (this.mName != null)
            break label113;
        }
      }
      label113: for (String str = ""; ; str = this.mName)
      {
        this.zzZN = (str + this.zzON);
        return new Session(this, null);
        bool1 = false;
        break;
      }
    }

    public Builder setActivity(String paramString)
    {
      return zzds(FitnessActivities.zzbG(paramString));
    }

    public Builder setDescription(String paramString)
    {
      if (paramString.length() <= 1000);
      for (boolean bool = true; ; bool = false)
      {
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Integer.valueOf(1000);
        zzx.zzb(bool, "Session description cannot exceed %d characters", arrayOfObject);
        this.zzZO = paramString;
        return this;
      }
    }

    public Builder setEndTime(long paramLong, TimeUnit paramTimeUnit)
    {
      if (paramLong >= 0L);
      for (boolean bool = true; ; bool = false)
      {
        zzx.zza(bool, "End time should be positive.");
        this.zzYq = paramTimeUnit.toMillis(paramLong);
        return this;
      }
    }

    public Builder setIdentifier(String paramString)
    {
      if ((paramString != null) && (TextUtils.getTrimmedLength(paramString) > 0));
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzO(bool);
        this.zzZN = paramString;
        return this;
      }
    }

    public Builder setName(String paramString)
    {
      if (paramString.length() <= 100);
      for (boolean bool = true; ; bool = false)
      {
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Integer.valueOf(100);
        zzx.zzb(bool, "Session name cannot exceed %d characters", arrayOfObject);
        this.mName = paramString;
        return this;
      }
    }

    public Builder setStartTime(long paramLong, TimeUnit paramTimeUnit)
    {
      if (paramLong > 0L);
      for (boolean bool = true; ; bool = false)
      {
        zzx.zza(bool, "Start time should be positive.");
        this.zzON = paramTimeUnit.toMillis(paramLong);
        return this;
      }
    }

    public Builder zzbL(String paramString)
    {
      this.zzYP = zza.zzbI(paramString);
      return this;
    }

    public Builder zzds(int paramInt)
    {
      this.zzYC = paramInt;
      return this;
    }
  }
}