package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.text.TextUtils;
import com.google.android.gms.cast.ApplicationMetadata;
import com.google.android.gms.cast.Cast.ApplicationConnectionResult;
import com.google.android.gms.cast.Cast.Listener;
import com.google.android.gms.cast.Cast.MessageReceivedCallback;
import com.google.android.gms.cast.CastDevice;
import com.google.android.gms.cast.LaunchOptions;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zzb;
import com.google.android.gms.common.internal.BinderWrapper;
import com.google.android.gms.common.internal.zzk;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

public final class zzju extends zzk<zzjz>
{
  private static final Object zzKB = new Object();
  private static final Object zzKC = new Object();
  private static final zzkc zzKh = new zzkc("CastClientImpl");
  private final Cast.Listener zzIB;
  private double zzJm;
  private boolean zzJn;
  private zza.zzb<Status> zzKA;
  private ApplicationMetadata zzKi;
  private final CastDevice zzKj;
  private final Map<String, Cast.MessageReceivedCallback> zzKk;
  private final long zzKl;
  private zzc zzKm;
  private String zzKn;
  private boolean zzKo;
  private boolean zzKp;
  private boolean zzKq;
  private int zzKr;
  private int zzKs;
  private final AtomicLong zzKt;
  private String zzKu;
  private String zzKv;
  private Bundle zzKw;
  private final Map<Long, zza.zzb<Status>> zzKx;
  private final zzb zzKy;
  private zza.zzb<Cast.ApplicationConnectionResult> zzKz;

  public zzju(Context paramContext, Looper paramLooper, CastDevice paramCastDevice, long paramLong, Cast.Listener paramListener, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    super(paramContext, paramLooper, 10, paramConnectionCallbacks, paramOnConnectionFailedListener);
    this.zzKj = paramCastDevice;
    this.zzIB = paramListener;
    this.zzKl = paramLong;
    this.zzKk = new HashMap();
    this.zzKt = new AtomicLong(0L);
    this.zzKx = new HashMap();
    zzho();
    this.zzKy = new zzb(null);
    registerConnectionFailedListener(this.zzKy);
  }

  private void zza(zzjp paramzzjp)
  {
    String str = paramzzjp.zzhl();
    if (!zzjv.zza(str, this.zzKn))
      this.zzKn = str;
    for (boolean bool = true; ; bool = false)
    {
      zzkc localzzkc = zzKh;
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Boolean.valueOf(bool);
      arrayOfObject[1] = Boolean.valueOf(this.zzKo);
      localzzkc.zzb("hasChanged=%b, mFirstApplicationStatusUpdate=%b", arrayOfObject);
      if ((this.zzIB != null) && ((bool) || (this.zzKo)))
        this.zzIB.onApplicationStatusChanged();
      this.zzKo = false;
      return;
    }
  }

  private void zza(zzjw paramzzjw)
  {
    ApplicationMetadata localApplicationMetadata = paramzzjw.getApplicationMetadata();
    if (!zzjv.zza(localApplicationMetadata, this.zzKi))
    {
      this.zzKi = localApplicationMetadata;
      this.zzIB.onApplicationMetadataChanged(this.zzKi);
    }
    double d = paramzzjw.zzhs();
    if ((d != (0.0D / 0.0D)) && (Math.abs(d - this.zzJm) > 1.0E-07D))
      this.zzJm = d;
    for (boolean bool1 = true; ; bool1 = false)
    {
      boolean bool2 = paramzzjw.zzhA();
      if (bool2 != this.zzJn)
      {
        this.zzJn = bool2;
        bool1 = true;
      }
      zzkc localzzkc1 = zzKh;
      Object[] arrayOfObject1 = new Object[2];
      arrayOfObject1[0] = Boolean.valueOf(bool1);
      arrayOfObject1[1] = Boolean.valueOf(this.zzKp);
      localzzkc1.zzb("hasVolumeChanged=%b, mFirstDeviceStatusUpdate=%b", arrayOfObject1);
      if ((this.zzIB != null) && ((bool1) || (this.zzKp)))
        this.zzIB.onVolumeChanged();
      int i = paramzzjw.zzhB();
      if (i != this.zzKr)
        this.zzKr = i;
      for (boolean bool3 = true; ; bool3 = false)
      {
        zzkc localzzkc2 = zzKh;
        Object[] arrayOfObject2 = new Object[2];
        arrayOfObject2[0] = Boolean.valueOf(bool3);
        arrayOfObject2[1] = Boolean.valueOf(this.zzKp);
        localzzkc2.zzb("hasActiveInputChanged=%b, mFirstDeviceStatusUpdate=%b", arrayOfObject2);
        if ((this.zzIB != null) && ((bool3) || (this.zzKp)))
          this.zzIB.zzab(this.zzKr);
        int j = paramzzjw.zzhC();
        if (j != this.zzKs)
          this.zzKs = j;
        for (boolean bool4 = true; ; bool4 = false)
        {
          zzkc localzzkc3 = zzKh;
          Object[] arrayOfObject3 = new Object[2];
          arrayOfObject3[0] = Boolean.valueOf(bool4);
          arrayOfObject3[1] = Boolean.valueOf(this.zzKp);
          localzzkc3.zzb("hasStandbyStateChanged=%b, mFirstDeviceStatusUpdate=%b", arrayOfObject3);
          if ((this.zzIB != null) && ((bool4) || (this.zzKp)))
            this.zzIB.zzac(this.zzKs);
          this.zzKp = false;
          return;
        }
      }
    }
  }

  private void zzc(zza.zzb<Cast.ApplicationConnectionResult> paramzzb)
  {
    synchronized (zzKB)
    {
      if (this.zzKz != null)
        this.zzKz.zzd(new zza(new Status(2002)));
      this.zzKz = paramzzb;
      return;
    }
  }

  private void zze(zza.zzb<Status> paramzzb)
  {
    synchronized (zzKC)
    {
      if (this.zzKA != null)
      {
        paramzzb.zzd(new Status(2001));
        return;
      }
      this.zzKA = paramzzb;
      return;
    }
  }

  private void zzho()
  {
    this.zzKq = false;
    this.zzKr = -1;
    this.zzKs = -1;
    this.zzKi = null;
    this.zzKn = null;
    this.zzJm = 0.0D;
    this.zzJn = false;
  }

  private void zzht()
  {
    zzKh.zzb("removing all MessageReceivedCallbacks", new Object[0]);
    synchronized (this.zzKk)
    {
      this.zzKk.clear();
      return;
    }
  }

  private void zzhu()
    throws IllegalStateException
  {
    if ((!this.zzKq) || (this.zzKm == null) || (this.zzKm.zzhz()))
      throw new IllegalStateException("Not connected to a device");
  }

  public void disconnect()
  {
    zzkc localzzkc1 = zzKh;
    Object[] arrayOfObject1 = new Object[2];
    arrayOfObject1[0] = this.zzKm;
    arrayOfObject1[1] = Boolean.valueOf(isConnected());
    localzzkc1.zzb("disconnect(); ServiceListener=%s, isConnected=%b", arrayOfObject1);
    zzc localzzc = this.zzKm;
    this.zzKm = null;
    if ((localzzc == null) || (localzzc.zzhy() == null))
    {
      zzKh.zzb("already disposed, so short-circuiting", new Object[0]);
      return;
    }
    zzht();
    try
    {
      if ((isConnected()) || (isConnecting()))
        ((zzjz)zzjb()).disconnect();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzkc localzzkc2 = zzKh;
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = localRemoteException.getMessage();
      localzzkc2.zza(localRemoteException, "Error while disconnecting the controller interface: %s", arrayOfObject2);
      return;
    }
    finally
    {
      super.disconnect();
    }
  }

  public ApplicationMetadata getApplicationMetadata()
    throws IllegalStateException
  {
    zzhu();
    return this.zzKi;
  }

  public String getApplicationStatus()
    throws IllegalStateException
  {
    zzhu();
    return this.zzKn;
  }

  public boolean isMute()
    throws IllegalStateException
  {
    zzhu();
    return this.zzJn;
  }

  public void zzL(boolean paramBoolean)
    throws IllegalStateException, RemoteException
  {
    ((zzjz)zzjb()).zza(paramBoolean, this.zzJm, this.zzJn);
  }

  protected zzjz zzO(IBinder paramIBinder)
  {
    return zzjz.zza.zzP(paramIBinder);
  }

  public void zza(double paramDouble)
    throws IllegalArgumentException, IllegalStateException, RemoteException
  {
    if ((Double.isInfinite(paramDouble)) || (Double.isNaN(paramDouble)))
      throw new IllegalArgumentException("Volume cannot be " + paramDouble);
    ((zzjz)zzjb()).zza(paramDouble, this.zzJm, this.zzJn);
  }

  protected void zza(int paramInt, IBinder paramIBinder, Bundle paramBundle)
  {
    zzkc localzzkc = zzKh;
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Integer.valueOf(paramInt);
    localzzkc.zzb("in onPostInitHandler; statusCode=%d", arrayOfObject);
    if ((paramInt == 0) || (paramInt == 1001))
    {
      this.zzKq = true;
      this.zzKo = true;
      this.zzKp = true;
    }
    while (true)
    {
      if (paramInt == 1001)
      {
        this.zzKw = new Bundle();
        this.zzKw.putBoolean("com.google.android.gms.cast.EXTRA_APP_NO_LONGER_RUNNING", true);
        paramInt = 0;
      }
      super.zza(paramInt, paramIBinder, paramBundle);
      return;
      this.zzKq = false;
    }
  }

  public void zza(String paramString, Cast.MessageReceivedCallback paramMessageReceivedCallback)
    throws IllegalArgumentException, IllegalStateException, RemoteException
  {
    zzjv.zzaK(paramString);
    zzaJ(paramString);
    if (paramMessageReceivedCallback != null);
    synchronized (this.zzKk)
    {
      this.zzKk.put(paramString, paramMessageReceivedCallback);
      ((zzjz)zzjb()).zzaN(paramString);
      return;
    }
  }

  public void zza(String paramString, LaunchOptions paramLaunchOptions, zza.zzb<Cast.ApplicationConnectionResult> paramzzb)
    throws IllegalStateException, RemoteException
  {
    zzc(paramzzb);
    ((zzjz)zzjb()).zza(paramString, paramLaunchOptions);
  }

  public void zza(String paramString, zza.zzb<Status> paramzzb)
    throws IllegalStateException, RemoteException
  {
    zze(paramzzb);
    ((zzjz)zzjb()).zzaM(paramString);
  }

  public void zza(String paramString1, String paramString2, zza.zzb<Status> paramzzb)
    throws IllegalArgumentException, IllegalStateException, RemoteException
  {
    if (TextUtils.isEmpty(paramString2))
      throw new IllegalArgumentException("The message payload cannot be null or empty");
    if (paramString2.length() > 65536)
      throw new IllegalArgumentException("Message exceeds maximum size");
    zzjv.zzaK(paramString1);
    zzhu();
    long l = this.zzKt.incrementAndGet();
    try
    {
      this.zzKx.put(Long.valueOf(l), paramzzb);
      ((zzjz)zzjb()).zza(paramString1, paramString2, l);
      return;
    }
    catch (Throwable localThrowable)
    {
      this.zzKx.remove(Long.valueOf(l));
      throw localThrowable;
    }
  }

  public void zza(String paramString, boolean paramBoolean, zza.zzb<Cast.ApplicationConnectionResult> paramzzb)
    throws IllegalStateException, RemoteException
  {
    zzc(paramzzb);
    ((zzjz)zzjb()).zzf(paramString, paramBoolean);
  }

  public void zzaJ(String paramString)
    throws IllegalArgumentException, RemoteException
  {
    if (TextUtils.isEmpty(paramString))
      throw new IllegalArgumentException("Channel namespace cannot be null or empty");
    synchronized (this.zzKk)
    {
      Cast.MessageReceivedCallback localMessageReceivedCallback = (Cast.MessageReceivedCallback)this.zzKk.remove(paramString);
      if (localMessageReceivedCallback == null);
    }
    try
    {
      ((zzjz)zzjb()).zzaO(paramString);
      return;
      localObject = finally;
      throw localObject;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      zzkc localzzkc = zzKh;
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = paramString;
      arrayOfObject[1] = localIllegalStateException.getMessage();
      localzzkc.zza(localIllegalStateException, "Error unregistering namespace (%s): %s", arrayOfObject);
    }
  }

  public void zzb(String paramString1, String paramString2, zza.zzb<Cast.ApplicationConnectionResult> paramzzb)
    throws IllegalStateException, RemoteException
  {
    zzc(paramzzb);
    ((zzjz)zzjb()).zzo(paramString1, paramString2);
  }

  protected String zzcF()
  {
    return "com.google.android.gms.cast.service.BIND_CAST_DEVICE_CONTROLLER_SERVICE";
  }

  protected String zzcG()
  {
    return "com.google.android.gms.cast.internal.ICastDeviceController";
  }

  public void zzd(zza.zzb<Status> paramzzb)
    throws IllegalStateException, RemoteException
  {
    zze(paramzzb);
    ((zzjz)zzjb()).zzhD();
  }

  public Bundle zzhp()
  {
    if (this.zzKw != null)
    {
      Bundle localBundle = this.zzKw;
      this.zzKw = null;
      return localBundle;
    }
    return super.zzhp();
  }

  protected Bundle zzhq()
  {
    Bundle localBundle = new Bundle();
    zzkc localzzkc = zzKh;
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.zzKu;
    arrayOfObject[1] = this.zzKv;
    localzzkc.zzb("getRemoteService(): mLastApplicationId=%s, mLastSessionId=%s", arrayOfObject);
    this.zzKj.putInBundle(localBundle);
    localBundle.putLong("com.google.android.gms.cast.EXTRA_CAST_FLAGS", this.zzKl);
    this.zzKm = new zzc(this);
    localBundle.putParcelable("listener", new BinderWrapper(this.zzKm.asBinder()));
    if (this.zzKu != null)
    {
      localBundle.putString("last_application_id", this.zzKu);
      if (this.zzKv != null)
        localBundle.putString("last_session_id", this.zzKv);
    }
    return localBundle;
  }

  public void zzhr()
    throws IllegalStateException, RemoteException
  {
    ((zzjz)zzjb()).zzhr();
  }

  public double zzhs()
    throws IllegalStateException
  {
    zzhu();
    return this.zzJm;
  }

  private static final class zza
    implements Cast.ApplicationConnectionResult
  {
    private final Status zzHb;
    private final ApplicationMetadata zzKD;
    private final String zzKE;
    private final boolean zzKF;
    private final String zzyL;

    public zza(Status paramStatus)
    {
      this(paramStatus, null, null, null, false);
    }

    public zza(Status paramStatus, ApplicationMetadata paramApplicationMetadata, String paramString1, String paramString2, boolean paramBoolean)
    {
      this.zzHb = paramStatus;
      this.zzKD = paramApplicationMetadata;
      this.zzKE = paramString1;
      this.zzyL = paramString2;
      this.zzKF = paramBoolean;
    }

    public ApplicationMetadata getApplicationMetadata()
    {
      return this.zzKD;
    }

    public String getApplicationStatus()
    {
      return this.zzKE;
    }

    public String getSessionId()
    {
      return this.zzyL;
    }

    public Status getStatus()
    {
      return this.zzHb;
    }

    public boolean getWasLaunched()
    {
      return this.zzKF;
    }
  }

  private class zzb
    implements GoogleApiClient.OnConnectionFailedListener
  {
    private zzb()
    {
    }

    public void onConnectionFailed(ConnectionResult paramConnectionResult)
    {
      zzju.zzb(zzju.this);
    }
  }

  private static class zzc extends zzka.zza
  {
    private final Handler mHandler;
    private final AtomicReference<zzju> zzKH;

    public zzc(zzju paramzzju)
    {
      this.zzKH = new AtomicReference(paramzzju);
      this.mHandler = new Handler(paramzzju.getLooper());
    }

    private void zza(zzju paramzzju, long paramLong, int paramInt)
    {
      synchronized (zzju.zzh(paramzzju))
      {
        zza.zzb localzzb = (zza.zzb)zzju.zzh(paramzzju).remove(Long.valueOf(paramLong));
        if (localzzb != null)
          localzzb.zzd(new Status(paramInt));
        return;
      }
    }

    private boolean zza(zzju paramzzju, int paramInt)
    {
      synchronized (zzju.zzhx())
      {
        if (zzju.zzi(paramzzju) != null)
        {
          zzju.zzi(paramzzju).zzd(new Status(paramInt));
          zzju.zzb(paramzzju, null);
          return true;
        }
        return false;
      }
    }

    public void onApplicationDisconnected(final int paramInt)
    {
      final zzju localzzju = (zzju)this.zzKH.get();
      if (localzzju == null);
      do
      {
        return;
        zzju.zza(localzzju, null);
        zzju.zzb(localzzju, null);
        zza(localzzju, paramInt);
      }
      while (zzju.zze(localzzju) == null);
      this.mHandler.post(new Runnable()
      {
        public void run()
        {
          if (zzju.zze(localzzju) != null)
            zzju.zze(localzzju).onApplicationDisconnected(paramInt);
        }
      });
    }

    public void zza(ApplicationMetadata paramApplicationMetadata, String paramString1, String paramString2, boolean paramBoolean)
    {
      zzju localzzju = (zzju)this.zzKH.get();
      if (localzzju == null)
        return;
      zzju.zza(localzzju, paramApplicationMetadata);
      zzju.zza(localzzju, paramApplicationMetadata.getApplicationId());
      zzju.zzb(localzzju, paramString2);
      synchronized (zzju.zzhw())
      {
        if (zzju.zzd(localzzju) != null)
        {
          zzju.zzd(localzzju).zzd(new zzju.zza(new Status(0), paramApplicationMetadata, paramString1, paramString2, paramBoolean));
          zzju.zza(localzzju, null);
        }
        return;
      }
    }

    public void zza(String paramString, double paramDouble, boolean paramBoolean)
    {
      zzju.zzhv().zzb("Deprecated callback: \"onStatusreceived\"", new Object[0]);
    }

    public void zza(String paramString, long paramLong)
    {
      zzju localzzju = (zzju)this.zzKH.get();
      if (localzzju == null)
        return;
      zza(localzzju, paramLong, 0);
    }

    public void zza(String paramString, long paramLong, int paramInt)
    {
      zzju localzzju = (zzju)this.zzKH.get();
      if (localzzju == null)
        return;
      zza(localzzju, paramLong, paramInt);
    }

    public void zzai(int paramInt)
    {
      zzju localzzju = zzhy();
      if (localzzju == null);
      do
      {
        return;
        zzkc localzzkc = zzju.zzhv();
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Integer.valueOf(paramInt);
        localzzkc.zzb("ICastDeviceControllerListener.onDisconnected: %d", arrayOfObject);
      }
      while (paramInt == 0);
      localzzju.zzaI(2);
    }

    public void zzaj(int paramInt)
    {
      zzju localzzju = (zzju)this.zzKH.get();
      if (localzzju == null)
        return;
      synchronized (zzju.zzhw())
      {
        if (zzju.zzd(localzzju) != null)
        {
          zzju.zzd(localzzju).zzd(new zzju.zza(new Status(paramInt)));
          zzju.zza(localzzju, null);
        }
        return;
      }
    }

    public void zzak(int paramInt)
    {
      zzju localzzju = (zzju)this.zzKH.get();
      if (localzzju == null)
        return;
      zza(localzzju, paramInt);
    }

    public void zzal(int paramInt)
    {
      zzju localzzju = (zzju)this.zzKH.get();
      if (localzzju == null)
        return;
      zza(localzzju, paramInt);
    }

    public void zzb(final zzjp paramzzjp)
    {
      final zzju localzzju = (zzju)this.zzKH.get();
      if (localzzju == null)
        return;
      zzju.zzhv().zzb("onApplicationStatusChanged", new Object[0]);
      this.mHandler.post(new Runnable()
      {
        public void run()
        {
          zzju.zza(localzzju, paramzzjp);
        }
      });
    }

    public void zzb(final zzjw paramzzjw)
    {
      final zzju localzzju = (zzju)this.zzKH.get();
      if (localzzju == null)
        return;
      zzju.zzhv().zzb("onDeviceStatusChanged", new Object[0]);
      this.mHandler.post(new Runnable()
      {
        public void run()
        {
          zzju.zza(localzzju, paramzzjw);
        }
      });
    }

    public void zzb(String paramString, byte[] paramArrayOfByte)
    {
      if ((zzju)this.zzKH.get() == null)
        return;
      zzkc localzzkc = zzju.zzhv();
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = paramString;
      arrayOfObject[1] = Integer.valueOf(paramArrayOfByte.length);
      localzzkc.zzb("IGNORING: Receive (type=binary, ns=%s) <%d bytes>", arrayOfObject);
    }

    public zzju zzhy()
    {
      zzju localzzju = (zzju)this.zzKH.getAndSet(null);
      if (localzzju == null)
        return null;
      zzju.zzc(localzzju);
      return localzzju;
    }

    public boolean zzhz()
    {
      return this.zzKH.get() == null;
    }

    public void zzn(final String paramString1, final String paramString2)
    {
      final zzju localzzju = (zzju)this.zzKH.get();
      if (localzzju == null)
        return;
      zzju.zzhv().zzb("Receive (type=text, ns=%s) %s", new Object[] { paramString1, paramString2 });
      this.mHandler.post(new Runnable()
      {
        public void run()
        {
          synchronized (zzju.zzf(localzzju))
          {
            Cast.MessageReceivedCallback localMessageReceivedCallback = (Cast.MessageReceivedCallback)zzju.zzf(localzzju).get(paramString1);
            if (localMessageReceivedCallback != null)
            {
              localMessageReceivedCallback.onMessageReceived(zzju.zzg(localzzju), paramString1, paramString2);
              return;
            }
          }
          zzkc localzzkc = zzju.zzhv();
          Object[] arrayOfObject = new Object[1];
          arrayOfObject[0] = paramString1;
          localzzkc.zzb("Discarded message for unknown namespace '%s'", arrayOfObject);
        }
      });
    }
  }
}