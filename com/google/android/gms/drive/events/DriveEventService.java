package com.google.android.gms.drive.events;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.drive.internal.OnEventResponse;
import com.google.android.gms.drive.internal.zzai.zza;
import com.google.android.gms.drive.internal.zzw;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public abstract class DriveEventService extends Service
  implements ChangeListener, CompletionListener
{
  public static final String ACTION_HANDLE_EVENT = "com.google.android.gms.drive.events.HANDLE_EVENT";
  private final String mName;
  int zzPm = -1;
  private CountDownLatch zzSX;
  zza zzSY;
  boolean zzSZ = false;

  protected DriveEventService()
  {
    this("DriveEventService");
  }

  protected DriveEventService(String paramString)
  {
    this.mName = paramString;
  }

  private void zza(OnEventResponse paramOnEventResponse)
  {
    DriveEvent localDriveEvent = paramOnEventResponse.zzkQ();
    zzw.zzq("DriveEventService", "handleEventMessage: " + localDriveEvent);
    try
    {
      switch (localDriveEvent.getType())
      {
      default:
        zzw.zzr(this.mName, "Unhandled event: " + localDriveEvent);
        return;
      case 1:
        onChange((ChangeEvent)localDriveEvent);
        return;
      case 2:
      }
    }
    catch (Exception localException)
    {
      zzw.zza(this.mName, localException, "Error handling event: " + localDriveEvent);
      return;
    }
    onCompletion((CompletionEvent)localDriveEvent);
  }

  private void zzkB()
    throws SecurityException
  {
    int i = getCallingUid();
    if (i == this.zzPm)
      return;
    if (GooglePlayServicesUtil.zzd(this, i))
    {
      this.zzPm = i;
      return;
    }
    throw new SecurityException("Caller is not GooglePlayServices");
  }

  protected int getCallingUid()
  {
    return Binder.getCallingUid();
  }

  public final IBinder onBind(Intent paramIntent)
  {
    while (true)
    {
      try
      {
        if ("com.google.android.gms.drive.events.HANDLE_EVENT".equals(paramIntent.getAction()))
        {
          final CountDownLatch localCountDownLatch;
          if ((this.zzSY == null) && (!this.zzSZ))
          {
            this.zzSZ = true;
            localCountDownLatch = new CountDownLatch(1);
            this.zzSX = new CountDownLatch(1);
            new Thread()
            {
              public void run()
              {
                try
                {
                  Looper.prepare();
                  DriveEventService.this.zzSY = new DriveEventService.zza(DriveEventService.this);
                  DriveEventService.this.zzSZ = false;
                  localCountDownLatch.countDown();
                  zzw.zzq("DriveEventService", "Bound and starting loop");
                  Looper.loop();
                  zzw.zzq("DriveEventService", "Finished loop");
                  return;
                }
                finally
                {
                  if (DriveEventService.zzb(DriveEventService.this) != null)
                    DriveEventService.zzb(DriveEventService.this).countDown();
                }
              }
            }
            .start();
          }
          try
          {
            if (!localCountDownLatch.await(5000L, TimeUnit.MILLISECONDS))
              zzw.zzs("DriveEventService", "Failed to synchronously initialize event handler.");
            IBinder localIBinder2 = new zzb().asBinder();
            localIBinder1 = localIBinder2;
            return localIBinder1;
          }
          catch (InterruptedException localInterruptedException)
          {
            throw new RuntimeException("Unable to start event handler", localInterruptedException);
          }
        }
      }
      finally
      {
      }
      IBinder localIBinder1 = null;
    }
  }

  public void onChange(ChangeEvent paramChangeEvent)
  {
    zzw.zzr(this.mName, "Unhandled change event: " + paramChangeEvent);
  }

  public void onCompletion(CompletionEvent paramCompletionEvent)
  {
    zzw.zzr(this.mName, "Unhandled completion event: " + paramCompletionEvent);
  }

  // ERROR //
  public void onDestroy()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: ldc 25
    //   4: ldc 192
    //   6: invokestatic 77\011com/google/android/gms/drive/internal/zzw:zzq\011(Ljava/lang/String;Ljava/lang/String;)V
    //   9: aload_0
    //   10: getfield 141\011com/google/android/gms/drive/events/DriveEventService:zzSY\011Lcom/google/android/gms/drive/events/DriveEventService$zza;
    //   13: ifnull +53 -> 66
    //   16: aload_0
    //   17: getfield 141\011com/google/android/gms/drive/events/DriveEventService:zzSY\011Lcom/google/android/gms/drive/events/DriveEventService$zza;
    //   20: invokestatic 197\011com/google/android/gms/drive/events/DriveEventService$zza:zza\011(Lcom/google/android/gms/drive/events/DriveEventService$zza;)Landroid/os/Message;
    //   23: astore_2
    //   24: aload_0
    //   25: getfield 141\011com/google/android/gms/drive/events/DriveEventService:zzSY\011Lcom/google/android/gms/drive/events/DriveEventService$zza;
    //   28: aload_2
    //   29: invokevirtual 201\011com/google/android/gms/drive/events/DriveEventService$zza:sendMessage\011(Landroid/os/Message;)Z
    //   32: pop
    //   33: aload_0
    //   34: aconst_null
    //   35: putfield 141\011com/google/android/gms/drive/events/DriveEventService:zzSY\011Lcom/google/android/gms/drive/events/DriveEventService$zza;
    //   38: aload_0
    //   39: getfield 109\011com/google/android/gms/drive/events/DriveEventService:zzSX\011Ljava/util/concurrent/CountDownLatch;
    //   42: ldc2_w 155
    //   45: getstatic 162\011java/util/concurrent/TimeUnit:MILLISECONDS\011Ljava/util/concurrent/TimeUnit;
    //   48: invokevirtual 166\011java/util/concurrent/CountDownLatch:await\011(JLjava/util/concurrent/TimeUnit;)Z
    //   51: ifne +10 -> 61
    //   54: ldc 25
    //   56: ldc 203
    //   58: invokestatic 88\011com/google/android/gms/drive/internal/zzw:zzr\011(Ljava/lang/String;Ljava/lang/String;)V
    //   61: aload_0
    //   62: aconst_null
    //   63: putfield 109\011com/google/android/gms/drive/events/DriveEventService:zzSX\011Ljava/util/concurrent/CountDownLatch;
    //   66: aload_0
    //   67: invokespecial 205\011android/app/Service:onDestroy\011()V
    //   70: aload_0
    //   71: monitorexit
    //   72: return
    //   73: astore_1
    //   74: aload_0
    //   75: monitorexit
    //   76: aload_1
    //   77: athrow
    //   78: astore 4
    //   80: goto -19 -> 61
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01138\01173\011finally
    //   38\01161\01173\011finally
    //   61\01166\01173\011finally
    //   66\01170\01173\011finally
    //   38\01161\01178\011java/lang/InterruptedException
  }

  public boolean onUnbind(Intent paramIntent)
  {
    return true;
  }

  final class zza extends Handler
  {
    zza()
    {
    }

    private Message zzb(OnEventResponse paramOnEventResponse)
    {
      return obtainMessage(1, paramOnEventResponse);
    }

    private Message zzkC()
    {
      return obtainMessage(2);
    }

    public void handleMessage(Message paramMessage)
    {
      zzw.zzq("DriveEventService", "handleMessage message type:" + paramMessage.what);
      switch (paramMessage.what)
      {
      default:
        zzw.zzr("DriveEventService", "Unexpected message type:" + paramMessage.what);
        return;
      case 1:
        DriveEventService.zza(DriveEventService.this, (OnEventResponse)paramMessage.obj);
        return;
      case 2:
      }
      getLooper().quit();
    }
  }

  final class zzb extends zzai.zza
  {
    zzb()
    {
    }

    public void zzc(OnEventResponse paramOnEventResponse)
      throws RemoteException
    {
      synchronized (DriveEventService.this)
      {
        zzw.zzq("DriveEventService", "onEvent: " + paramOnEventResponse);
        DriveEventService.zza(DriveEventService.this);
        if (DriveEventService.this.zzSY != null)
        {
          Message localMessage = DriveEventService.zza.zza(DriveEventService.this.zzSY, paramOnEventResponse);
          DriveEventService.this.zzSY.sendMessage(localMessage);
          return;
        }
        zzw.zzs("DriveEventService", "Receiving event before initialize is completed.");
      }
    }
  }
}