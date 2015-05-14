package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.Api.zza;
import com.google.android.gms.common.api.GoogleApiClient.Builder;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.GoogleApiClient.zza;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.internal.zzmh;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public abstract class zzk<T extends IInterface>
  implements Api.zza, zzl.zza
{
  public static final String[] zzPR = { "service_esmobile", "service_googleme" };
  private final Context mContext;
  final Handler mHandler;
  private final Account zzFN;
  private final List<String> zzMM;
  private final Looper zzMc;
  private final zzl zzMu;
  private final zzf zzPG;
  private final zzm zzPH;
  private zzs zzPI;
  private boolean zzPJ = false;
  private GoogleApiClient.zza zzPK;
  private T zzPL;
  private final ArrayList<zzk<T>.zzc<?>> zzPM = new ArrayList();
  private zzk<T>.zze zzPN;
  private int zzPO = 1;
  boolean zzPP = false;
  private final int zzPQ;
  private final Object zznh = new Object();

  @Deprecated
  protected zzk(Context paramContext, Looper paramLooper, int paramInt, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.mContext = ((Context)zzx.zzl(paramContext));
    this.zzMc = ((Looper)zzx.zzb(paramLooper, "Looper must not be null"));
    this.zzPH = zzm.zzP(paramContext);
    this.zzMu = new zzl(paramLooper, this);
    this.mHandler = new zzb(paramLooper);
    this.zzPQ = paramInt;
    this.zzFN = null;
    this.zzMM = null;
    this.zzPG = new GoogleApiClient.Builder(paramContext).zzhY();
    registerConnectionCallbacks((GoogleApiClient.ConnectionCallbacks)zzx.zzl(paramConnectionCallbacks));
    registerConnectionFailedListener((GoogleApiClient.OnConnectionFailedListener)zzx.zzl(paramOnConnectionFailedListener));
  }

  protected zzk(Context paramContext, Looper paramLooper, int paramInt, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener, zzf paramzzf)
  {
    this(paramContext, paramLooper, zzm.zzP(paramContext), paramInt, paramzzf, paramConnectionCallbacks, paramOnConnectionFailedListener);
  }

  protected zzk(Context paramContext, Looper paramLooper, zzm paramzzm, int paramInt, zzf paramzzf)
  {
    this.mContext = ((Context)zzx.zzb(paramContext, "Context must not be null"));
    this.zzMc = ((Looper)zzx.zzb(paramLooper, "Looper must not be null"));
    this.zzPH = ((zzm)zzx.zzb(paramzzm, "Supervisor must not be null"));
    this.zzMu = new zzl(paramLooper, this);
    this.mHandler = new zzb(paramLooper);
    this.zzPQ = paramInt;
    this.zzPG = ((zzf)zzx.zzl(paramzzf));
    this.zzFN = paramzzf.getAccount();
    this.zzMM = zzh(paramzzf.zziP());
  }

  protected zzk(Context paramContext, Looper paramLooper, zzm paramzzm, int paramInt, zzf paramzzf, GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this(paramContext, paramLooper, paramzzm, paramInt, paramzzf);
    registerConnectionCallbacks((GoogleApiClient.ConnectionCallbacks)zzx.zzl(paramConnectionCallbacks));
    registerConnectionFailedListener((GoogleApiClient.OnConnectionFailedListener)zzx.zzl(paramOnConnectionFailedListener));
  }

  private void zza(int paramInt, T paramT)
  {
    boolean bool1 = true;
    boolean bool2;
    boolean bool3;
    if (paramInt == 3)
    {
      bool2 = bool1;
      if (paramT == null)
        break label65;
      bool3 = bool1;
      label17: if (bool2 != bool3)
        break label71;
    }
    while (true)
    {
      zzx.zzO(bool1);
      synchronized (this.zznh)
      {
        this.zzPO = paramInt;
        this.zzPL = paramT;
        return;
      }
      bool2 = false;
      break;
      label65: bool3 = false;
      break label17;
      label71: bool1 = false;
    }
  }

  private boolean zza(int paramInt1, int paramInt2, T paramT)
  {
    synchronized (this.zznh)
    {
      if (this.zzPO != paramInt1)
        return false;
      zza(paramInt2, paramT);
      return true;
    }
  }

  private List<String> zzh(List<String> paramList)
  {
    List localList = zzf(paramList);
    if ((localList == null) || (localList == paramList))
      return localList;
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
      if (!paramList.contains((String)localIterator.next()))
        throw new IllegalStateException("Expanding scopes is not permitted, use implied scopes instead");
    return localList;
  }

  public void connect()
  {
    this.zzPP = true;
    zza(2, null);
    int i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(this.mContext);
    if (i != 0)
    {
      zza(1, null);
      this.mHandler.sendMessage(this.mHandler.obtainMessage(3, Integer.valueOf(i)));
    }
    do
    {
      return;
      if (this.zzPN != null)
      {
        Log.e("GmsClient", "Calling connect() while still connected, missing disconnect() for " + zzcF());
        this.zzPH.zzb(zzcF(), this.zzPN, zziZ());
      }
      this.zzPN = new zze();
    }
    while (this.zzPH.zza(zzcF(), this.zzPN, zziZ()));
    Log.e("GmsClient", "unable to connect to service: " + zzcF());
    this.mHandler.sendMessage(this.mHandler.obtainMessage(3, Integer.valueOf(9)));
  }

  public void disconnect()
  {
    this.zzPP = false;
    synchronized (this.zzPM)
    {
      int i = this.zzPM.size();
      for (int j = 0; j < i; j++)
        ((zzc)this.zzPM.get(j)).zzjh();
      this.zzPM.clear();
      zza(1, null);
      if (this.zzPN != null)
      {
        this.zzPH.zzb(zzcF(), this.zzPN, zziZ());
        this.zzPN = null;
      }
      return;
    }
  }

  public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
  {
    paramPrintWriter.append(paramString).println("GmsClient:");
    String str = paramString + "  ";
    paramPrintWriter.append(str).append("mStartServiceAction=").println(zzcF());
    IInterface localIInterface;
    while (true)
    {
      synchronized (this.zznh)
      {
        int i = this.zzPO;
        localIInterface = this.zzPL;
        paramPrintWriter.append(str).append("mConnectState=");
        switch (i)
        {
        default:
          paramPrintWriter.print("UNKNOWN");
          paramPrintWriter.append(" mService=");
          if (localIInterface != null)
            break label196;
          paramPrintWriter.println("null");
          return;
        case 2:
        case 3:
        case 4:
        case 1:
        }
      }
      paramPrintWriter.print("CONNECTING");
      continue;
      paramPrintWriter.print("CONNECTED");
      continue;
      paramPrintWriter.print("DISCONNECTING");
      continue;
      paramPrintWriter.print("DISCONNECTED");
    }
    label196: paramPrintWriter.append(zzcG()).append("@").println(Integer.toHexString(System.identityHashCode(localIInterface.asBinder())));
  }

  public final Context getContext()
  {
    return this.mContext;
  }

  public final Looper getLooper()
  {
    return this.zzMc;
  }

  public boolean isConnected()
  {
    while (true)
    {
      synchronized (this.zznh)
      {
        if (this.zzPO == 3)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }

  public boolean isConnecting()
  {
    while (true)
    {
      synchronized (this.zznh)
      {
        if (this.zzPO == 2)
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }

  public void registerConnectionCallbacks(GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.zzMu.registerConnectionCallbacks(paramConnectionCallbacks);
  }

  public void registerConnectionFailedListener(GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.zzMu.registerConnectionFailedListener(paramOnConnectionFailedListener);
  }

  protected void zza(int paramInt, IBinder paramIBinder, Bundle paramBundle)
  {
    this.mHandler.sendMessage(this.mHandler.obtainMessage(1, new zzf(paramInt, paramIBinder, paramBundle)));
  }

  public void zza(GoogleApiClient.zza paramzza)
  {
    this.zzPK = ((GoogleApiClient.zza)zzx.zzb(paramzza, "Must provide a non-null ConnectionStatusReportCallbacks"));
    this.zzPJ = true;
  }

  @Deprecated
  public final void zza(zzk<T>.zzc<?> paramzzk)
  {
    synchronized (this.zzPM)
    {
      this.zzPM.add(paramzzk);
      this.mHandler.sendMessage(this.mHandler.obtainMessage(2, paramzzk));
      return;
    }
  }

  public void zza(zzq paramzzq)
  {
    Bundle localBundle = zzjc();
    Scope[] arrayOfScope;
    if (this.zzMM == null)
      arrayOfScope = null;
    while (true)
    {
      zzae localzzae = new zzae(paramzzq, arrayOfScope, this.mContext.getPackageName(), localBundle);
      try
      {
        this.zzPI.zza(new zzd(this), localzzae);
        return;
        arrayOfScope = zzmh.zzi(this.zzMM);
      }
      catch (DeadObjectException localDeadObjectException)
      {
        Log.w("GmsClient", "service died");
        zzaI(1);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        Log.w("GmsClient", "Remote exception occurred", localRemoteException);
      }
    }
  }

  public void zzaI(int paramInt)
  {
    this.mHandler.sendMessage(this.mHandler.obtainMessage(4, Integer.valueOf(paramInt)));
  }

  protected void zzb(int paramInt, Bundle paramBundle)
  {
    this.mHandler.sendMessage(this.mHandler.obtainMessage(5, new zzh(paramInt, paramBundle)));
  }

  public void zzb(zzq paramzzq)
  {
    try
    {
      Bundle localBundle = zzhq();
      zzi localzzi = new zzi(this.zzPQ).zzbg(this.mContext.getPackageName()).zzi(localBundle);
      if (this.zzMM != null)
        localzzi.zza(zzmh.zzi(this.zzMM));
      if (zzhc())
        localzzi.zzb(zziN()).zzd(paramzzq);
      while (true)
      {
        this.zzPI.zza(new zzd(this), localzzi);
        return;
        if (zzjd())
          localzzi.zzb(this.zzFN);
      }
    }
    catch (DeadObjectException localDeadObjectException)
    {
      Log.w("GmsClient", "service died");
      zzaI(1);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      Log.w("GmsClient", "Remote exception occurred", localRemoteException);
    }
  }

  protected abstract String zzcF();

  protected abstract String zzcG();

  protected List<String> zzf(List<String> paramList)
  {
    return paramList;
  }

  protected final void zzfc()
  {
    if (!isConnected())
      throw new IllegalStateException("Not connected. Call connect() and wait for onConnected() to be called.");
  }

  public boolean zzhc()
  {
    return false;
  }

  public Bundle zzhp()
  {
    return null;
  }

  protected Bundle zzhq()
  {
    return new Bundle();
  }

  public final Account zziN()
  {
    if (this.zzFN != null)
      return this.zzFN;
    return new Account("<<default account>>", "com.google");
  }

  public final List<String> zziP()
  {
    return this.zzMM;
  }

  protected String zziZ()
  {
    return this.zzPG.zziS();
  }

  public boolean zzin()
  {
    return this.zzPP;
  }

  protected final zzf zzja()
  {
    return this.zzPG;
  }

  public final T zzjb()
    throws DeadObjectException
  {
    synchronized (this.zznh)
    {
      if (this.zzPO == 4)
        throw new DeadObjectException();
    }
    zzfc();
    if (this.zzPL != null);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zza(bool, "Client is connected but service is null");
      IInterface localIInterface = this.zzPL;
      return localIInterface;
    }
  }

  protected Bundle zzjc()
  {
    return null;
  }

  public boolean zzjd()
  {
    return false;
  }

  protected abstract T zzp(IBinder paramIBinder);

  private abstract class zza extends zzk<T>.zzc<Boolean>
  {
    public final int statusCode;
    public final Bundle zzPS;

    protected zza(int paramBundle, Bundle arg3)
    {
      super(Boolean.valueOf(true));
      this.statusCode = paramBundle;
      Object localObject;
      this.zzPS = localObject;
    }

    protected void zzc(Boolean paramBoolean)
    {
      if (paramBoolean == null)
      {
        zzk.zza(zzk.this, 1, null);
        return;
      }
      switch (this.statusCode)
      {
      default:
        if (this.zzPS == null)
          break;
      case 0:
      case 10:
      }
      for (PendingIntent localPendingIntent = (PendingIntent)this.zzPS.getParcelable("pendingIntent"); ; localPendingIntent = null)
      {
        if (zzk.zzf(zzk.this) != null)
        {
          zzk.zzg(zzk.this).zzb(zzk.this.zzcF(), zzk.zzf(zzk.this), zzk.this.zziZ());
          zzk.zza(zzk.this, null);
        }
        zzk.zza(zzk.this, 1, null);
        zzf(new ConnectionResult(this.statusCode, localPendingIntent));
        return;
        if (zzje())
          break;
        if (zzk.zzf(zzk.this) != null)
        {
          zzk.zzg(zzk.this).zzb(zzk.this.zzcF(), zzk.zzf(zzk.this), zzk.this.zziZ());
          zzk.zza(zzk.this, null);
        }
        zzk.zza(zzk.this, 1, null);
        zzf(new ConnectionResult(8, null));
        return;
        zzk.zza(zzk.this, 1, null);
        throw new IllegalStateException("A fatal developer error has occurred. Check the logs for further information.");
      }
    }

    protected void zzf(ConnectionResult paramConnectionResult)
    {
      zzk.zza(zzk.this).zzg(paramConnectionResult);
    }

    protected abstract boolean zzje();

    protected void zzjf()
    {
    }
  }

  final class zzb extends Handler
  {
    public zzb(Looper arg2)
    {
      super();
    }

    public void handleMessage(Message paramMessage)
    {
      if (((paramMessage.what == 1) || (paramMessage.what == 5) || (paramMessage.what == 6)) && (!zzk.this.isConnecting()))
      {
        zzk.zzc localzzc2 = (zzk.zzc)paramMessage.obj;
        localzzc2.zzjf();
        localzzc2.unregister();
        return;
      }
      if (paramMessage.what == 3)
      {
        zzk.zza(zzk.this).zzg(new ConnectionResult(((Integer)paramMessage.obj).intValue(), null));
        return;
      }
      if (paramMessage.what == 4)
      {
        zzk.zza(zzk.this, 4, null);
        zzk.zza(zzk.this).zzaJ(((Integer)paramMessage.obj).intValue());
        zzk.zza(zzk.this, 4, 1, null);
        return;
      }
      if ((paramMessage.what == 2) && (!zzk.this.isConnected()))
      {
        zzk.zzc localzzc1 = (zzk.zzc)paramMessage.obj;
        localzzc1.zzjf();
        localzzc1.unregister();
        return;
      }
      if ((paramMessage.what == 2) || (paramMessage.what == 1) || (paramMessage.what == 5) || (paramMessage.what == 6))
      {
        ((zzk.zzc)paramMessage.obj).zzjg();
        return;
      }
      Log.wtf("GmsClient", "Don't know how to handle this message.");
    }
  }

  protected abstract class zzc<TListener>
  {
    private TListener mListener;
    private boolean zzPU;

    public zzc()
    {
      Object localObject;
      this.mListener = localObject;
      this.zzPU = false;
    }

    public void unregister()
    {
      zzjh();
      synchronized (zzk.zzb(zzk.this))
      {
        zzk.zzb(zzk.this).remove(this);
        return;
      }
    }

    protected abstract void zzi(TListener paramTListener);

    protected abstract void zzjf();

    // ERROR //
    public void zzjg()
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 21\011com/google/android/gms/common/internal/zzk$zzc:mListener\011Ljava/lang/Object;
      //   6: astore_2
      //   7: aload_0
      //   8: getfield 23\011com/google/android/gms/common/internal/zzk$zzc:zzPU\011Z
      //   11: ifeq +33 -> 44
      //   14: ldc 47
      //   16: new 49\011java/lang/StringBuilder
      //   19: dup
      //   20: invokespecial 50\011java/lang/StringBuilder:<init>\011()V
      //   23: ldc 52
      //   25: invokevirtual 56\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   28: aload_0
      //   29: invokevirtual 59\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
      //   32: ldc 61
      //   34: invokevirtual 56\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   37: invokevirtual 65\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
      //   40: invokestatic 71\011android/util/Log:w\011(Ljava/lang/String;Ljava/lang/String;)I
      //   43: pop
      //   44: aload_0
      //   45: monitorexit
      //   46: aload_2
      //   47: ifnull +36 -> 83
      //   50: aload_0
      //   51: aload_2
      //   52: invokevirtual 73\011com/google/android/gms/common/internal/zzk$zzc:zzi\011(Ljava/lang/Object;)V
      //   55: aload_0
      //   56: monitorenter
      //   57: aload_0
      //   58: iconst_1
      //   59: putfield 23\011com/google/android/gms/common/internal/zzk$zzc:zzPU\011Z
      //   62: aload_0
      //   63: monitorexit
      //   64: aload_0
      //   65: invokevirtual 75\011com/google/android/gms/common/internal/zzk$zzc:unregister\011()V
      //   68: return
      //   69: astore_1
      //   70: aload_0
      //   71: monitorexit
      //   72: aload_1
      //   73: athrow
      //   74: astore 4
      //   76: aload_0
      //   77: invokevirtual 77\011com/google/android/gms/common/internal/zzk$zzc:zzjf\011()V
      //   80: aload 4
      //   82: athrow
      //   83: aload_0
      //   84: invokevirtual 77\011com/google/android/gms/common/internal/zzk$zzc:zzjf\011()V
      //   87: goto -32 -> 55
      //   90: astore_3
      //   91: aload_0
      //   92: monitorexit
      //   93: aload_3
      //   94: athrow
      //
      // Exception table:
      //   from\011to\011target\011type
      //   2\01144\01169\011finally
      //   44\01146\01169\011finally
      //   70\01172\01169\011finally
      //   50\01155\01174\011java/lang/RuntimeException
      //   57\01164\01190\011finally
      //   91\01193\01190\011finally
    }

    public void zzjh()
    {
      try
      {
        this.mListener = null;
        return;
      }
      finally
      {
      }
    }
  }

  public static final class zzd extends zzr.zza
  {
    private zzk zzPV;

    public zzd(zzk paramzzk)
    {
      this.zzPV = paramzzk;
    }

    private void zzji()
    {
      this.zzPV = null;
    }

    public void zzb(int paramInt, IBinder paramIBinder, Bundle paramBundle)
    {
      zzx.zzb(this.zzPV, "onPostInitComplete can be called only once per call to getRemoteService");
      this.zzPV.zza(paramInt, paramIBinder, paramBundle);
      zzji();
    }

    public void zzc(int paramInt, Bundle paramBundle)
    {
      zzx.zzb(this.zzPV, "onAccountValidationComplete can be called only once per call to validateAccount");
      this.zzPV.zzb(paramInt, paramBundle);
      zzji();
    }
  }

  public final class zze
    implements ServiceConnection
  {
    public zze()
    {
    }

    public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
    {
      zzx.zzb(paramIBinder, "Expecting a valid IBinder");
      zzk.zza(zzk.this, zzs.zza.zzU(paramIBinder));
      zzk.this.mHandler.sendMessage(zzk.this.mHandler.obtainMessage(6, new zzk.zzg(zzk.this)));
    }

    public void onServiceDisconnected(ComponentName paramComponentName)
    {
      zzk.this.mHandler.sendMessage(zzk.this.mHandler.obtainMessage(4, Integer.valueOf(1)));
    }
  }

  protected final class zzf extends zzk<T>.zza
  {
    public final IBinder zzPW;

    public zzf(int paramIBinder, IBinder paramBundle, Bundle arg4)
    {
      super(paramIBinder, localBundle);
      this.zzPW = paramBundle;
    }

    protected boolean zzje()
    {
      IInterface localIInterface;
      do
      {
        try
        {
          String str = this.zzPW.getInterfaceDescriptor();
          if (!zzk.this.zzcG().equals(str))
            return false;
        }
        catch (RemoteException localRemoteException)
        {
          Log.w("GmsClient", "service probably died");
          return false;
        }
        localIInterface = zzk.this.zzp(this.zzPW);
      }
      while ((localIInterface == null) || (!zzk.zza(zzk.this, 2, 3, localIInterface)));
      zzk.zza(zzk.this).zzfe();
      GooglePlayServicesUtil.zzL(zzk.zze(zzk.this));
      return true;
    }
  }

  protected final class zzg extends zzk<T>.zza
  {
    public zzg()
    {
      super(0, null);
    }

    protected boolean zzje()
    {
      if (zzk.zzc(zzk.this))
      {
        if (zzk.zzd(zzk.this) != null);
        for (boolean bool = true; ; bool = false)
        {
          zzx.zza(bool, "mConnectionProgressReportCallbacks should not be null if mReportProgress");
          zzk.zzd(zzk.this).zzia();
          return true;
        }
      }
      zzk.this.zzb(null);
      return true;
    }
  }

  protected final class zzh extends zzk<T>.zza
  {
    public zzh(int paramBundle, Bundle arg3)
    {
      super(paramBundle, localBundle);
    }

    protected boolean zzje()
    {
      if ((zzk.zzc(zzk.this)) && (zzk.zzd(zzk.this) != null));
      for (boolean bool = true; ; bool = false)
      {
        zzx.zza(bool, "PostValidationCallback should not happen when mReportProgress is false ormConnectionProgressReportCallbacks is null");
        zzk.zzd(zzk.this).zzib();
        return true;
      }
    }
  }
}