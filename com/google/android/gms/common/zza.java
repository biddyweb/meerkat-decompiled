package com.google.android.gms.common;

import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.Looper;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class zza
  implements ServiceConnection
{
  boolean zzLp = false;
  private final BlockingQueue<IBinder> zzLq = new LinkedBlockingQueue();

  public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
  {
    this.zzLq.add(paramIBinder);
  }

  public void onServiceDisconnected(ComponentName paramComponentName)
  {
  }

  public IBinder zzhJ()
    throws InterruptedException
  {
    if (Looper.myLooper() == Looper.getMainLooper())
      throw new IllegalStateException("BlockingServiceConnection.getService() called on main thread");
    if (this.zzLp)
      throw new IllegalStateException();
    this.zzLp = true;
    return (IBinder)this.zzLq.take();
  }
}