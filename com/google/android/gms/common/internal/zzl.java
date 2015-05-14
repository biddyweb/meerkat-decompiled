package com.google.android.gms.common.internal;

import android.os.Bundle;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import java.util.ArrayList;
import java.util.Iterator;

public final class zzl
  implements Handler.Callback
{
  private final Handler mHandler;
  private final zza zzPX;
  private final ArrayList<GoogleApiClient.ConnectionCallbacks> zzPY = new ArrayList();
  final ArrayList<GoogleApiClient.ConnectionCallbacks> zzPZ = new ArrayList();
  private boolean zzQa = false;
  private final ArrayList<GoogleApiClient.OnConnectionFailedListener> zzQb = new ArrayList();

  public zzl(Looper paramLooper, zza paramzza)
  {
    this.zzPX = paramzza;
    this.mHandler = new Handler(paramLooper, this);
  }

  public boolean handleMessage(Message paramMessage)
  {
    if (paramMessage.what == 1)
    {
      GoogleApiClient.ConnectionCallbacks localConnectionCallbacks = (GoogleApiClient.ConnectionCallbacks)paramMessage.obj;
      synchronized (this.zzPY)
      {
        if ((this.zzPX.zzin()) && (this.zzPX.isConnected()) && (this.zzPY.contains(localConnectionCallbacks)))
          localConnectionCallbacks.onConnected(this.zzPX.zzhp());
        return true;
      }
    }
    Log.wtf("GmsClientEvents", "Don't know how to handle this message.");
    return false;
  }

  public boolean isConnectionCallbacksRegistered(GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    zzx.zzl(paramConnectionCallbacks);
    synchronized (this.zzPY)
    {
      boolean bool = this.zzPY.contains(paramConnectionCallbacks);
      return bool;
    }
  }

  public boolean isConnectionFailedListenerRegistered(GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    zzx.zzl(paramOnConnectionFailedListener);
    synchronized (this.zzQb)
    {
      boolean bool = this.zzQb.contains(paramOnConnectionFailedListener);
      return bool;
    }
  }

  public void registerConnectionCallbacks(GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    zzx.zzl(paramConnectionCallbacks);
    synchronized (this.zzPY)
    {
      if (this.zzPY.contains(paramConnectionCallbacks))
      {
        Log.w("GmsClientEvents", "registerConnectionCallbacks(): listener " + paramConnectionCallbacks + " is already registered");
        if (this.zzPX.isConnected())
          this.mHandler.sendMessage(this.mHandler.obtainMessage(1, paramConnectionCallbacks));
        return;
      }
      this.zzPY.add(paramConnectionCallbacks);
    }
  }

  public void registerConnectionFailedListener(GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    zzx.zzl(paramOnConnectionFailedListener);
    synchronized (this.zzQb)
    {
      if (this.zzQb.contains(paramOnConnectionFailedListener))
      {
        Log.w("GmsClientEvents", "registerConnectionFailedListener(): listener " + paramOnConnectionFailedListener + " is already registered");
        return;
      }
      this.zzQb.add(paramOnConnectionFailedListener);
    }
  }

  public void unregisterConnectionCallbacks(GoogleApiClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    zzx.zzl(paramConnectionCallbacks);
    synchronized (this.zzPY)
    {
      if (!this.zzPY.remove(paramConnectionCallbacks))
        Log.w("GmsClientEvents", "unregisterConnectionCallbacks(): listener " + paramConnectionCallbacks + " not found");
      while (!this.zzQa)
        return;
      this.zzPZ.add(paramConnectionCallbacks);
    }
  }

  public void unregisterConnectionFailedListener(GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    zzx.zzl(paramOnConnectionFailedListener);
    synchronized (this.zzQb)
    {
      if (!this.zzQb.remove(paramOnConnectionFailedListener))
        Log.w("GmsClientEvents", "unregisterConnectionFailedListener(): listener " + paramOnConnectionFailedListener + " not found");
      return;
    }
  }

  public void zzaJ(int paramInt)
  {
    this.mHandler.removeMessages(1);
    synchronized (this.zzPY)
    {
      this.zzQa = true;
      Iterator localIterator = new ArrayList(this.zzPY).iterator();
      GoogleApiClient.ConnectionCallbacks localConnectionCallbacks;
      do
        if (localIterator.hasNext())
        {
          localConnectionCallbacks = (GoogleApiClient.ConnectionCallbacks)localIterator.next();
          if (this.zzPX.zzin());
        }
        else
        {
          this.zzPZ.clear();
          this.zzQa = false;
          return;
        }
      while (!this.zzPY.contains(localConnectionCallbacks));
      localConnectionCallbacks.onConnectionSuspended(paramInt);
    }
  }

  protected void zzfe()
  {
    synchronized (this.zzPY)
    {
      zzj(this.zzPX.zzhp());
      return;
    }
  }

  public void zzg(ConnectionResult paramConnectionResult)
  {
    this.mHandler.removeMessages(1);
    synchronized (this.zzQb)
    {
      Iterator localIterator = new ArrayList(this.zzQb).iterator();
      while (localIterator.hasNext())
      {
        GoogleApiClient.OnConnectionFailedListener localOnConnectionFailedListener = (GoogleApiClient.OnConnectionFailedListener)localIterator.next();
        if (!this.zzPX.zzin())
          return;
        if (this.zzQb.contains(localOnConnectionFailedListener))
          localOnConnectionFailedListener.onConnectionFailed(paramConnectionResult);
      }
    }
  }

  public void zzj(Bundle paramBundle)
  {
    boolean bool1 = true;
    while (true)
    {
      synchronized (this.zzPY)
      {
        if (!this.zzQa)
        {
          bool2 = bool1;
          zzx.zzN(bool2);
          this.mHandler.removeMessages(1);
          this.zzQa = true;
          if (this.zzPZ.size() != 0)
            break label164;
          zzx.zzN(bool1);
          Iterator localIterator = new ArrayList(this.zzPY).iterator();
          GoogleApiClient.ConnectionCallbacks localConnectionCallbacks;
          if (localIterator.hasNext())
          {
            localConnectionCallbacks = (GoogleApiClient.ConnectionCallbacks)localIterator.next();
            if ((this.zzPX.zzin()) && (this.zzPX.isConnected()));
          }
          else
          {
            this.zzPZ.clear();
            this.zzQa = false;
            return;
          }
          if (this.zzPZ.contains(localConnectionCallbacks))
            continue;
          localConnectionCallbacks.onConnected(paramBundle);
        }
      }
      boolean bool2 = false;
      continue;
      label164: bool1 = false;
    }
  }

  public static abstract interface zza
  {
    public abstract boolean isConnected();

    public abstract Bundle zzhp();

    public abstract boolean zzin();
  }
}