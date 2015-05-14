package com.google.android.gms.wearable;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.util.Log;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.wearable.internal.zzah.zza;
import com.google.android.gms.wearable.internal.zzal;
import com.google.android.gms.wearable.internal.zzao;
import com.google.android.gms.wearable.internal.zze;

public abstract class WearableListenerService extends Service
  implements DataApi.DataListener, MessageApi.MessageListener, NodeApi.NodeListener
{
  public static final String BIND_LISTENER_INTENT_ACTION = "com.google.android.gms.wearable.BIND_LISTENER";
  private String zzFO;
  private volatile int zzPm = -1;
  private IBinder zzPp;
  private Handler zzaFF;
  private Object zzaFG = new Object();
  private boolean zzaFH;

  private void zzuZ()
    throws SecurityException
  {
    int i = Binder.getCallingUid();
    if (i == this.zzPm)
      return;
    if (GooglePlayServicesUtil.zzd(this, i))
    {
      this.zzPm = i;
      return;
    }
    throw new SecurityException("Caller is not GooglePlayServices");
  }

  public final IBinder onBind(Intent paramIntent)
  {
    if ("com.google.android.gms.wearable.BIND_LISTENER".equals(paramIntent.getAction()))
      return this.zzPp;
    return null;
  }

  public void onCreate()
  {
    super.onCreate();
    if (Log.isLoggable("WearableLS", 3))
      Log.d("WearableLS", "onCreate: " + getPackageName());
    this.zzFO = getPackageName();
    HandlerThread localHandlerThread = new HandlerThread("WearableListenerService");
    localHandlerThread.start();
    this.zzaFF = new Handler(localHandlerThread.getLooper());
    this.zzPp = new zza(null);
  }

  public void onDataChanged(DataEventBuffer paramDataEventBuffer)
  {
  }

  public void onDestroy()
  {
    synchronized (this.zzaFG)
    {
      this.zzaFH = true;
      this.zzaFF.getLooper().quit();
      super.onDestroy();
      return;
    }
  }

  public void onMessageReceived(MessageEvent paramMessageEvent)
  {
  }

  public void onPeerConnected(Node paramNode)
  {
  }

  public void onPeerDisconnected(Node paramNode)
  {
  }

  private class zza extends zzah.zza
  {
    private zza()
    {
    }

    public void zza(final zzal paramzzal)
    {
      if (Log.isLoggable("WearableLS", 3))
        Log.d("WearableLS", "onMessageReceived: " + paramzzal);
      WearableListenerService.zzb(WearableListenerService.this);
      synchronized (WearableListenerService.zzc(WearableListenerService.this))
      {
        if (WearableListenerService.zzd(WearableListenerService.this))
          return;
        WearableListenerService.zze(WearableListenerService.this).post(new Runnable()
        {
          public void run()
          {
            WearableListenerService.this.onMessageReceived(paramzzal);
          }
        });
        return;
      }
    }

    public void zza(final zzao paramzzao)
    {
      if (Log.isLoggable("WearableLS", 3))
        Log.d("WearableLS", "onPeerConnected: " + WearableListenerService.zza(WearableListenerService.this) + ": " + paramzzao);
      WearableListenerService.zzb(WearableListenerService.this);
      synchronized (WearableListenerService.zzc(WearableListenerService.this))
      {
        if (WearableListenerService.zzd(WearableListenerService.this))
          return;
        WearableListenerService.zze(WearableListenerService.this).post(new Runnable()
        {
          public void run()
          {
            WearableListenerService.this.onPeerConnected(paramzzao);
          }
        });
        return;
      }
    }

    public void zza(zze paramzze)
    {
      if (Log.isLoggable("WearableLS", 3))
        Log.d("WearableLS", "onNotificationReceived: " + paramzze);
    }

    public void zzab(final DataHolder paramDataHolder)
    {
      if (Log.isLoggable("WearableLS", 3))
        Log.d("WearableLS", "onDataItemChanged: " + WearableListenerService.zza(WearableListenerService.this) + ": " + paramDataHolder);
      WearableListenerService.zzb(WearableListenerService.this);
      synchronized (WearableListenerService.zzc(WearableListenerService.this))
      {
        if (WearableListenerService.zzd(WearableListenerService.this))
        {
          paramDataHolder.close();
          return;
        }
        WearableListenerService.zze(WearableListenerService.this).post(new Runnable()
        {
          public void run()
          {
            DataEventBuffer localDataEventBuffer = new DataEventBuffer(paramDataHolder);
            try
            {
              WearableListenerService.this.onDataChanged(localDataEventBuffer);
              return;
            }
            finally
            {
              localDataEventBuffer.release();
            }
          }
        });
        return;
      }
    }

    public void zzb(final zzao paramzzao)
    {
      if (Log.isLoggable("WearableLS", 3))
        Log.d("WearableLS", "onPeerDisconnected: " + WearableListenerService.zza(WearableListenerService.this) + ": " + paramzzao);
      WearableListenerService.zzb(WearableListenerService.this);
      synchronized (WearableListenerService.zzc(WearableListenerService.this))
      {
        if (WearableListenerService.zzd(WearableListenerService.this))
          return;
        WearableListenerService.zze(WearableListenerService.this).post(new Runnable()
        {
          public void run()
          {
            WearableListenerService.this.onPeerDisconnected(paramzzao);
          }
        });
        return;
      }
    }
  }
}