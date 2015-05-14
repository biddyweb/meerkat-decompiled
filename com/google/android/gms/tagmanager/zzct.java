package com.google.android.gms.tagmanager;

import android.content.Context;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;

class zzct extends zzcs
{
  private static final Object zzBQ = new Object();
  private static zzct zzaAF;
  private boolean connected = true;
  private Handler handler;
  private boolean zzaAA = false;
  private boolean zzaAB = true;
  private zzau zzaAC = new zzau()
  {
    public void zzD(boolean paramAnonymousBoolean)
    {
      zzct.this.zzb(paramAnonymousBoolean, zzct.zza(zzct.this));
    }
  };
  private zzbk zzaAD;
  private boolean zzaAE = false;
  private Context zzaAv;
  private zzat zzaAw;
  private volatile zzar zzaAx;
  private int zzaAy = 1800000;
  private boolean zzaAz = true;

  private void zzfF()
  {
    this.zzaAD = new zzbk(this);
    this.zzaAD.zzD(this.zzaAv);
  }

  private void zzfI()
  {
    this.handler = new Handler(this.zzaAv.getMainLooper(), new Handler.Callback()
    {
      public boolean handleMessage(Message paramAnonymousMessage)
      {
        if ((1 == paramAnonymousMessage.what) && (zzct.zzfK().equals(paramAnonymousMessage.obj)))
        {
          zzct.this.dispatch();
          if ((zzct.zzb(zzct.this) > 0) && (!zzct.zzc(zzct.this)))
            zzct.zzd(zzct.this).sendMessageDelayed(zzct.zzd(zzct.this).obtainMessage(1, zzct.zzfK()), zzct.zzb(zzct.this));
        }
        return true;
      }
    });
    if (this.zzaAy > 0)
      this.handler.sendMessageDelayed(this.handler.obtainMessage(1, zzBQ), this.zzaAy);
  }

  public static zzct zztR()
  {
    if (zzaAF == null)
      zzaAF = new zzct();
    return zzaAF;
  }

  public void dispatch()
  {
    try
    {
      if (!this.zzaAA)
      {
        zzbf.zzab("Dispatch call queued. Dispatch will run once initialization is complete.");
        this.zzaAz = true;
      }
      while (true)
      {
        return;
        this.zzaAx.zzc(new Runnable()
        {
          public void run()
          {
            zzct.zze(zzct.this).dispatch();
          }
        });
      }
    }
    finally
    {
    }
  }

  void zzE(boolean paramBoolean)
  {
    try
    {
      zzb(this.zzaAE, paramBoolean);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void zza(Context paramContext, zzar paramzzar)
  {
    try
    {
      Context localContext = this.zzaAv;
      if (localContext != null);
      while (true)
      {
        return;
        this.zzaAv = paramContext.getApplicationContext();
        if (this.zzaAx == null)
          this.zzaAx = paramzzar;
      }
    }
    finally
    {
    }
  }

  void zzb(boolean paramBoolean1, boolean paramBoolean2)
  {
    while (true)
    {
      try
      {
        if (this.zzaAE == paramBoolean1)
        {
          boolean bool = this.connected;
          if (bool == paramBoolean2)
            return;
        }
        if (((paramBoolean1) || (!paramBoolean2)) && (this.zzaAy > 0))
          this.handler.removeMessages(1, zzBQ);
        if ((!paramBoolean1) && (paramBoolean2) && (this.zzaAy > 0))
          this.handler.sendMessageDelayed(this.handler.obtainMessage(1, zzBQ), this.zzaAy);
        StringBuilder localStringBuilder = new StringBuilder().append("PowerSaveMode ");
        if (paramBoolean1)
          break label153;
        if (!paramBoolean2)
        {
          break label153;
          zzbf.zzab(str);
          this.zzaAE = paramBoolean1;
          this.connected = paramBoolean2;
          continue;
        }
      }
      finally
      {
      }
      String str = "terminated.";
      continue;
      label153: str = "initiated.";
    }
  }

  void zzfJ()
  {
    try
    {
      if ((!this.zzaAE) && (this.connected) && (this.zzaAy > 0))
      {
        this.handler.removeMessages(1, zzBQ);
        this.handler.sendMessage(this.handler.obtainMessage(1, zzBQ));
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  zzat zztS()
  {
    try
    {
      if (this.zzaAw != null)
        break label50;
      if (this.zzaAv == null)
        throw new IllegalStateException("Cant get a store unless we have a context");
    }
    finally
    {
    }
    this.zzaAw = new zzbx(this.zzaAC, this.zzaAv);
    label50: if (this.handler == null)
      zzfI();
    this.zzaAA = true;
    if (this.zzaAz)
    {
      dispatch();
      this.zzaAz = false;
    }
    if ((this.zzaAD == null) && (this.zzaAB))
      zzfF();
    zzat localzzat = this.zzaAw;
    return localzzat;
  }
}