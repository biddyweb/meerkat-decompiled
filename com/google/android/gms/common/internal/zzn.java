package com.google.android.gms.common.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.IBinder;
import android.os.Message;
import android.util.Log;
import com.google.android.gms.internal.zzlo;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

final class zzn extends zzm
  implements Handler.Callback
{
  private final Handler mHandler;
  private final HashMap<zza, zzb> zzQe = new HashMap();
  private final zzlo zzQf;
  private final long zzQg;
  private final Context zznk;

  zzn(Context paramContext)
  {
    this.zznk = paramContext.getApplicationContext();
    this.mHandler = new Handler(paramContext.getMainLooper(), this);
    this.zzQf = zzlo.zzka();
    this.zzQg = 5000L;
  }

  private boolean zza(zza paramzza, ServiceConnection paramServiceConnection, String paramString)
  {
    zzx.zzb(paramServiceConnection, "ServiceConnection must not be null");
    while (true)
    {
      zzb localzzb;
      synchronized (this.zzQe)
      {
        localzzb = (zzb)this.zzQe.get(paramzza);
        if (localzzb == null)
        {
          localzzb = new zzb(paramzza);
          localzzb.zza(paramServiceConnection, paramString);
          localzzb.zzbh(paramString);
          this.zzQe.put(paramzza, localzzb);
          boolean bool = localzzb.isBound();
          return bool;
        }
        this.mHandler.removeMessages(0, localzzb);
        if (localzzb.zza(paramServiceConnection))
          throw new IllegalStateException("Trying to bind a GmsServiceConnection that was already connected before.  config=" + paramzza);
      }
      localzzb.zza(paramServiceConnection, paramString);
      switch (localzzb.getState())
      {
      case 1:
        paramServiceConnection.onServiceConnected(localzzb.getComponentName(), localzzb.getBinder());
        break;
      case 2:
        localzzb.zzbh(paramString);
      }
    }
  }

  private void zzb(zza paramzza, ServiceConnection paramServiceConnection, String paramString)
  {
    zzx.zzb(paramServiceConnection, "ServiceConnection must not be null");
    zzb localzzb;
    synchronized (this.zzQe)
    {
      localzzb = (zzb)this.zzQe.get(paramzza);
      if (localzzb == null)
        throw new IllegalStateException("Nonexistent connection status for service config: " + paramzza);
    }
    if (!localzzb.zza(paramServiceConnection))
    {
      Log.e("GmsClientSupervisor", "Trying to unbind a GmsServiceConnection that was not bound before. config=" + paramzza);
      return;
    }
    localzzb.zzb(paramServiceConnection, paramString);
    if (localzzb.zzjk())
    {
      Message localMessage = this.mHandler.obtainMessage(0, localzzb);
      this.mHandler.sendMessageDelayed(localMessage, this.zzQg);
    }
  }

  public boolean handleMessage(Message paramMessage)
  {
    switch (paramMessage.what)
    {
    default:
      return false;
    case 0:
    }
    zzb localzzb = (zzb)paramMessage.obj;
    synchronized (this.zzQe)
    {
      if (localzzb.zzjk())
      {
        if (localzzb.isBound())
          localzzb.zzbi("GmsClientSupervisor");
        this.zzQe.remove(zzb.zza(localzzb));
      }
      return true;
    }
  }

  public boolean zza(ComponentName paramComponentName, ServiceConnection paramServiceConnection, String paramString)
  {
    return zza(new zza(paramComponentName), paramServiceConnection, paramString);
  }

  public boolean zza(String paramString1, ServiceConnection paramServiceConnection, String paramString2)
  {
    return zza(new zza(paramString1), paramServiceConnection, paramString2);
  }

  public void zzb(ComponentName paramComponentName, ServiceConnection paramServiceConnection, String paramString)
  {
    zzb(new zza(paramComponentName), paramServiceConnection, paramString);
  }

  public void zzb(String paramString1, ServiceConnection paramServiceConnection, String paramString2)
  {
    zzb(new zza(paramString1), paramServiceConnection, paramString2);
  }

  private static final class zza
  {
    private final ComponentName zzQh;
    private final String zzrc;

    public zza(ComponentName paramComponentName)
    {
      this.zzrc = null;
      this.zzQh = ((ComponentName)zzx.zzl(paramComponentName));
    }

    public zza(String paramString)
    {
      this.zzrc = zzx.zzbn(paramString);
      this.zzQh = null;
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      zza localzza;
      do
      {
        return true;
        if (!(paramObject instanceof zza))
          return false;
        localzza = (zza)paramObject;
      }
      while ((zzw.equal(this.zzrc, localzza.zzrc)) && (zzw.equal(this.zzQh, localzza.zzQh)));
      return false;
    }

    public int hashCode()
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = this.zzrc;
      arrayOfObject[1] = this.zzQh;
      return zzw.hashCode(arrayOfObject);
    }

    public String toString()
    {
      if (this.zzrc == null)
        return this.zzQh.flattenToString();
      return this.zzrc;
    }

    public Intent zzjj()
    {
      if (this.zzrc != null)
        return new Intent(this.zzrc).setPackage("com.google.android.gms");
      return new Intent().setComponent(this.zzQh);
    }
  }

  private final class zzb
  {
    private int mState;
    private IBinder zzPp;
    private ComponentName zzQh;
    private final zza zzQi;
    private final Set<ServiceConnection> zzQj;
    private boolean zzQk;
    private final zzn.zza zzQl;

    public zzb(zzn.zza arg2)
    {
      Object localObject;
      this.zzQl = localObject;
      this.zzQi = new zza();
      this.zzQj = new HashSet();
      this.mState = 2;
    }

    public IBinder getBinder()
    {
      return this.zzPp;
    }

    public ComponentName getComponentName()
    {
      return this.zzQh;
    }

    public int getState()
    {
      return this.mState;
    }

    public boolean isBound()
    {
      return this.zzQk;
    }

    public void zza(ServiceConnection paramServiceConnection, String paramString)
    {
      zzn.zzc(zzn.this).zza(zzn.zzb(zzn.this), paramServiceConnection, paramString, this.zzQl.zzjj());
      this.zzQj.add(paramServiceConnection);
    }

    public boolean zza(ServiceConnection paramServiceConnection)
    {
      return this.zzQj.contains(paramServiceConnection);
    }

    public void zzb(ServiceConnection paramServiceConnection, String paramString)
    {
      zzn.zzc(zzn.this).zzb(zzn.zzb(zzn.this), paramServiceConnection);
      this.zzQj.remove(paramServiceConnection);
    }

    public void zzbh(String paramString)
    {
      this.zzQk = zzn.zzc(zzn.this).zza(zzn.zzb(zzn.this), paramString, this.zzQl.zzjj(), this.zzQi, 129);
      if (this.zzQk)
      {
        this.mState = 3;
        return;
      }
      zzn.zzc(zzn.this).zza(zzn.zzb(zzn.this), this.zzQi);
    }

    public void zzbi(String paramString)
    {
      zzn.zzc(zzn.this).zza(zzn.zzb(zzn.this), this.zzQi);
      this.zzQk = false;
      this.mState = 2;
    }

    public boolean zzjk()
    {
      return this.zzQj.isEmpty();
    }

    public class zza
      implements ServiceConnection
    {
      public zza()
      {
      }

      public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
      {
        synchronized (zzn.zza(zzn.this))
        {
          zzn.zzb.zza(zzn.zzb.this, paramIBinder);
          zzn.zzb.zza(zzn.zzb.this, paramComponentName);
          Iterator localIterator = zzn.zzb.zzb(zzn.zzb.this).iterator();
          if (localIterator.hasNext())
            ((ServiceConnection)localIterator.next()).onServiceConnected(paramComponentName, paramIBinder);
        }
        zzn.zzb.zza(zzn.zzb.this, 1);
      }

      public void onServiceDisconnected(ComponentName paramComponentName)
      {
        synchronized (zzn.zza(zzn.this))
        {
          zzn.zzb.zza(zzn.zzb.this, null);
          zzn.zzb.zza(zzn.zzb.this, paramComponentName);
          Iterator localIterator = zzn.zzb.zzb(zzn.zzb.this).iterator();
          if (localIterator.hasNext())
            ((ServiceConnection)localIterator.next()).onServiceDisconnected(paramComponentName);
        }
        zzn.zzb.zza(zzn.zzb.this, 2);
      }
    }
  }
}