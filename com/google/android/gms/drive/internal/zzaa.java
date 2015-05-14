package com.google.android.gms.drive.internal;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Pair;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.events.ChangeEvent;
import com.google.android.gms.drive.events.ChangeListener;
import com.google.android.gms.drive.events.CompletionEvent;
import com.google.android.gms.drive.events.CompletionListener;
import com.google.android.gms.drive.events.DriveEvent;
import com.google.android.gms.drive.events.zzc;
import com.google.android.gms.drive.events.zzf;
import java.util.ArrayList;
import java.util.List;

public class zzaa extends zzai.zza
{
  private final int zzTe;
  private final zzc zzUp;
  private final zza zzUq;
  private final List<Integer> zzUr = new ArrayList();

  public zzaa(Looper paramLooper, Context paramContext, int paramInt, zzc paramzzc)
  {
    this.zzTe = paramInt;
    this.zzUp = paramzzc;
    this.zzUq = new zza(paramLooper, paramContext, null);
  }

  public void zzbJ(int paramInt)
  {
    this.zzUr.add(Integer.valueOf(paramInt));
  }

  public boolean zzbK(int paramInt)
  {
    return this.zzUr.contains(Integer.valueOf(paramInt));
  }

  public void zzc(OnEventResponse paramOnEventResponse)
    throws RemoteException
  {
    DriveEvent localDriveEvent = paramOnEventResponse.zzkQ();
    if (this.zzTe == localDriveEvent.getType());
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzN(bool);
      zzx.zzN(this.zzUr.contains(Integer.valueOf(localDriveEvent.getType())));
      this.zzUq.zza(this.zzUp, localDriveEvent);
      return;
    }
  }

  private static class zza extends Handler
  {
    private final Context mContext;

    private zza(Looper paramLooper, Context paramContext)
    {
      super();
      this.mContext = paramContext;
    }

    public void handleMessage(Message paramMessage)
    {
      switch (paramMessage.what)
      {
      default:
        zzw.zze(this.mContext, "EventCallback", "Don't know how to handle this event");
        return;
      case 1:
      }
      Pair localPair = (Pair)paramMessage.obj;
      zzc localzzc = (zzc)localPair.first;
      DriveEvent localDriveEvent = (DriveEvent)localPair.second;
      switch (localDriveEvent.getType())
      {
      default:
        zzw.zzr("EventCallback", "Unexpected event: " + localDriveEvent);
        return;
      case 1:
        ((ChangeListener)localzzc).onChange((ChangeEvent)localDriveEvent);
        return;
      case 2:
        ((CompletionListener)localzzc).onCompletion((CompletionEvent)localDriveEvent);
        return;
      case 3:
      }
      ((zzf)localzzc).zzkD();
    }

    public void zza(zzc paramzzc, DriveEvent paramDriveEvent)
    {
      sendMessage(obtainMessage(1, new Pair(paramzzc, paramDriveEvent)));
    }
  }
}