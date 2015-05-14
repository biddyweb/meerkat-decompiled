package com.google.android.gms.fitness.result;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.fitness.data.Session;
import java.util.Collections;
import java.util.List;

public class SessionStopResult
  implements Result, SafeParcelable
{
  public static final Parcelable.Creator<SessionStopResult> CREATOR = new zzm();
  private final int zzFG;
  private final Status zzHb;
  private final List<Session> zzaaP;

  SessionStopResult(int paramInt, Status paramStatus, List<Session> paramList)
  {
    this.zzFG = paramInt;
    this.zzHb = paramStatus;
    this.zzaaP = Collections.unmodifiableList(paramList);
  }

  public SessionStopResult(Status paramStatus, List<Session> paramList)
  {
    this.zzFG = 3;
    this.zzHb = paramStatus;
    this.zzaaP = Collections.unmodifiableList(paramList);
  }

  public static SessionStopResult zzG(Status paramStatus)
  {
    return new SessionStopResult(paramStatus, Collections.emptyList());
  }

  private boolean zzb(SessionStopResult paramSessionStopResult)
  {
    return (this.zzHb.equals(paramSessionStopResult.zzHb)) && (zzw.equal(this.zzaaP, paramSessionStopResult.zzaaP));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof SessionStopResult)) && (zzb((SessionStopResult)paramObject)));
  }

  public List<Session> getSessions()
  {
    return this.zzaaP;
  }

  public Status getStatus()
  {
    return this.zzHb;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.zzHb;
    arrayOfObject[1] = this.zzaaP;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    return zzw.zzk(this).zza("status", this.zzHb).zza("sessions", this.zzaaP).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzm.zza(this, paramParcel, paramInt);
  }
}