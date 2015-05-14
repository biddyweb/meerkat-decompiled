package com.google.android.gms.plus.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.ICancelToken;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.internal.zzlk;
import com.google.android.gms.internal.zztt;
import com.google.android.gms.internal.zztw;
import com.google.android.gms.plus.Moments.LoadMomentsResult;
import com.google.android.gms.plus.People.LoadPeopleResult;
import com.google.android.gms.plus.model.moments.Moment;
import com.google.android.gms.plus.model.moments.MomentBuffer;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.PersonBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

public class zze extends zzk<zzd>
{
  private Person zzaur;
  private final zzh zzaus;

  public zze(Context paramContext, Looper paramLooper, zzf paramzzf, zzh paramzzh, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramLooper, 2, paramConnectionCallbacks, paramOnConnectionFailedListener, paramzzf);
    this.zzaus = paramzzh;
  }

  public static boolean zzf(String[] paramArrayOfString)
  {
    if ((paramArrayOfString == null) || (paramArrayOfString.length == 0));
    while ((paramArrayOfString.length == 1) && ("plus_one_placeholder_scope".equals(paramArrayOfString[0])))
      return false;
    return true;
  }

  private Bundle zzrP()
  {
    Bundle localBundle = this.zzaus.zzsa();
    localBundle.putStringArray("request_visible_actions", this.zzaus.zzrT());
    localBundle.putString("auth_package", this.zzaus.zzrV());
    return localBundle;
  }

  public String getAccountName()
  {
    zzfc();
    try
    {
      String str = ((zzd)zzjb()).getAccountName();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  public ICancelToken zza(zza.zzb<People.LoadPeopleResult> paramzzb, int paramInt, String paramString)
  {
    zzfc();
    zze localzze = new zze(paramzzb);
    try
    {
      ICancelToken localICancelToken = ((zzd)zzjb()).zza(localzze, 1, paramInt, -1, paramString);
      return localICancelToken;
    }
    catch (RemoteException localRemoteException)
    {
      localzze.zza(DataHolder.zzay(8), null);
    }
    return null;
  }

  protected void zza(int paramInt, IBinder paramIBinder, Bundle paramBundle)
  {
    if ((paramInt == 0) && (paramBundle != null) && (paramBundle.containsKey("loaded_person")))
      this.zzaur = zztw.zzj(paramBundle.getByteArray("loaded_person"));
    super.zza(paramInt, paramIBinder, paramBundle);
  }

  public void zza(zza.zzb<Moments.LoadMomentsResult> paramzzb, int paramInt, String paramString1, Uri paramUri, String paramString2, String paramString3)
  {
    zzfc();
    zzd localzzd;
    if (paramzzb != null)
      localzzd = new zzd(paramzzb);
    try
    {
      while (true)
      {
        ((zzd)zzjb()).zza(localzzd, paramInt, paramString1, paramUri, paramString2, paramString3);
        return;
        localzzd = null;
      }
    }
    catch (RemoteException localRemoteException)
    {
      localzzd.zza(DataHolder.zzay(8), null, null);
    }
  }

  public void zza(zza.zzb<Status> paramzzb, Moment paramMoment)
  {
    zzfc();
    zzc localzzc;
    if (paramzzb != null)
      localzzc = new zzc(paramzzb);
    try
    {
      while (true)
      {
        zzlk localzzlk = zzlk.zza((zztt)paramMoment);
        ((zzd)zzjb()).zza(localzzc, localzzlk);
        return;
        localzzc = null;
      }
    }
    catch (RemoteException localRemoteException)
    {
      if (localzzc == null)
        throw new IllegalStateException(localRemoteException);
      localzzc.zzaI(new Status(8, null, null));
    }
  }

  public void zza(zza.zzb<People.LoadPeopleResult> paramzzb, Collection<String> paramCollection)
  {
    zzfc();
    zze localzze = new zze(paramzzb);
    try
    {
      ((zzd)zzjb()).zza(localzze, new ArrayList(paramCollection));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      localzze.zza(DataHolder.zzay(8), null);
    }
  }

  public void zzcE(String paramString)
  {
    zzfc();
    try
    {
      ((zzd)zzjb()).zzcE(paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  protected String zzcF()
  {
    return "com.google.android.gms.plus.service.START";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.plus.internal.IPlusService";
  }

  protected zzd zzcz(IBinder paramIBinder)
  {
    return zzd.zza.zzcy(paramIBinder);
  }

  public void zzd(zza.zzb<People.LoadPeopleResult> paramzzb, String[] paramArrayOfString)
  {
    zza(paramzzb, Arrays.asList(paramArrayOfString));
  }

  public boolean zzhc()
  {
    return zzf(zzja().zziQ());
  }

  protected Bundle zzhq()
  {
    return zzrP();
  }

  public void zzj(zza.zzb<Moments.LoadMomentsResult> paramzzb)
  {
    zza(paramzzb, 20, null, null, null, "me");
  }

  protected Bundle zzjc()
  {
    return zzrP();
  }

  public void zzk(zza.zzb<People.LoadPeopleResult> paramzzb)
  {
    zzfc();
    zze localzze = new zze(paramzzb);
    try
    {
      ((zzd)zzjb()).zza(localzze, 2, 1, -1, null);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      localzze.zza(DataHolder.zzay(8), null);
    }
  }

  public void zzl(zza.zzb<Status> paramzzb)
  {
    zzfc();
    zzrK();
    zzf localzzf = new zzf(paramzzb);
    try
    {
      ((zzd)zzjb()).zzb(localzzf);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      localzzf.zzj(8, null);
    }
  }

  public ICancelToken zzr(zza.zzb<People.LoadPeopleResult> paramzzb, String paramString)
  {
    return zza(paramzzb, 0, paramString);
  }

  public void zzrK()
  {
    zzfc();
    try
    {
      this.zzaur = null;
      ((zzd)zzjb()).zzrK();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      throw new IllegalStateException(localRemoteException);
    }
  }

  public Person zzrO()
  {
    zzfc();
    return this.zzaur;
  }

  static final class zza
    implements Moments.LoadMomentsResult
  {
    private final Status zzHb;
    private final String zzaut;
    private final String zzauu;
    private final MomentBuffer zzauv;

    public zza(Status paramStatus, DataHolder paramDataHolder, String paramString1, String paramString2)
    {
      this.zzHb = paramStatus;
      this.zzaut = paramString1;
      this.zzauu = paramString2;
      if (paramDataHolder != null);
      for (MomentBuffer localMomentBuffer = new MomentBuffer(paramDataHolder); ; localMomentBuffer = null)
      {
        this.zzauv = localMomentBuffer;
        return;
      }
    }

    public MomentBuffer getMomentBuffer()
    {
      return this.zzauv;
    }

    public String getNextPageToken()
    {
      return this.zzaut;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }

    public String getUpdated()
    {
      return this.zzauu;
    }

    public void release()
    {
      if (this.zzauv != null)
        this.zzauv.release();
    }
  }

  static final class zzb
    implements People.LoadPeopleResult
  {
    private final Status zzHb;
    private final String zzaut;
    private final PersonBuffer zzauw;

    public zzb(Status paramStatus, DataHolder paramDataHolder, String paramString)
    {
      this.zzHb = paramStatus;
      this.zzaut = paramString;
      if (paramDataHolder != null);
      for (PersonBuffer localPersonBuffer = new PersonBuffer(paramDataHolder); ; localPersonBuffer = null)
      {
        this.zzauw = localPersonBuffer;
        return;
      }
    }

    public String getNextPageToken()
    {
      return this.zzaut;
    }

    public PersonBuffer getPersonBuffer()
    {
      return this.zzauw;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }

    public void release()
    {
      if (this.zzauw != null)
        this.zzauw.release();
    }
  }

  static final class zzc extends zza
  {
    private final zza.zzb<Status> zzanf;

    public zzc(zza.zzb<Status> paramzzb)
    {
      this.zzanf = paramzzb;
    }

    public void zzaI(Status paramStatus)
    {
      this.zzanf.zzd(paramStatus);
    }
  }

  static final class zzd extends zza
  {
    private final zza.zzb<Moments.LoadMomentsResult> zzanf;

    public zzd(zza.zzb<Moments.LoadMomentsResult> paramzzb)
    {
      this.zzanf = paramzzb;
    }

    public void zza(DataHolder paramDataHolder, String paramString1, String paramString2)
    {
      if (paramDataHolder.zziu() != null);
      for (PendingIntent localPendingIntent = (PendingIntent)paramDataHolder.zziu().getParcelable("pendingIntent"); ; localPendingIntent = null)
      {
        Status localStatus = new Status(paramDataHolder.getStatusCode(), null, localPendingIntent);
        if ((!localStatus.isSuccess()) && (paramDataHolder != null))
        {
          if (!paramDataHolder.isClosed())
            paramDataHolder.close();
          paramDataHolder = null;
        }
        this.zzanf.zzd(new zze.zza(localStatus, paramDataHolder, paramString1, paramString2));
        return;
      }
    }
  }

  static final class zze extends zza
  {
    private final zza.zzb<People.LoadPeopleResult> zzanf;

    public zze(zza.zzb<People.LoadPeopleResult> paramzzb)
    {
      this.zzanf = paramzzb;
    }

    public void zza(DataHolder paramDataHolder, String paramString)
    {
      if (paramDataHolder.zziu() != null);
      for (PendingIntent localPendingIntent = (PendingIntent)paramDataHolder.zziu().getParcelable("pendingIntent"); ; localPendingIntent = null)
      {
        Status localStatus = new Status(paramDataHolder.getStatusCode(), null, localPendingIntent);
        if ((!localStatus.isSuccess()) && (paramDataHolder != null))
        {
          if (!paramDataHolder.isClosed())
            paramDataHolder.close();
          paramDataHolder = null;
        }
        this.zzanf.zzd(new zze.zzb(localStatus, paramDataHolder, paramString));
        return;
      }
    }
  }

  static final class zzf extends zza
  {
    private final zza.zzb<Status> zzanf;

    public zzf(zza.zzb<Status> paramzzb)
    {
      this.zzanf = paramzzb;
    }

    public void zzj(int paramInt, Bundle paramBundle)
    {
      if (paramBundle != null);
      for (PendingIntent localPendingIntent = (PendingIntent)paramBundle.getParcelable("pendingIntent"); ; localPendingIntent = null)
      {
        Status localStatus = new Status(paramInt, null, localPendingIntent);
        this.zzanf.zzd(localStatus);
        return;
      }
    }
  }
}