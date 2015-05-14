package com.google.android.gms.tagmanager;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.google.android.gms.common.api.Status;

class zzn
  implements ContainerHolder
{
  private Status zzHb;
  private final Looper zzMc;
  private boolean zzSW;
  private Container zzaxE;
  private Container zzaxF;
  private zzb zzaxG;
  private zza zzaxH;
  private TagManager zzaxI;

  public zzn(Status paramStatus)
  {
    this.zzHb = paramStatus;
    this.zzMc = null;
  }

  public zzn(TagManager paramTagManager, Looper paramLooper, Container paramContainer, zza paramzza)
  {
    this.zzaxI = paramTagManager;
    if (paramLooper != null);
    while (true)
    {
      this.zzMc = paramLooper;
      this.zzaxE = paramContainer;
      this.zzaxH = paramzza;
      this.zzHb = Status.zzNo;
      paramTagManager.zza(this);
      return;
      paramLooper = Looper.getMainLooper();
    }
  }

  private void zzsL()
  {
    if (this.zzaxG != null)
      this.zzaxG.zzcR(this.zzaxF.zzsI());
  }

  public Container getContainer()
  {
    Container localContainer = null;
    try
    {
      if (this.zzSW)
        zzbf.zzZ("ContainerHolder is released.");
      while (true)
      {
        return localContainer;
        if (this.zzaxF != null)
        {
          this.zzaxE = this.zzaxF;
          this.zzaxF = null;
        }
        localContainer = this.zzaxE;
      }
    }
    finally
    {
    }
  }

  String getContainerId()
  {
    if (this.zzSW)
    {
      zzbf.zzZ("getContainerId called on a released ContainerHolder.");
      return "";
    }
    return this.zzaxE.getContainerId();
  }

  public Status getStatus()
  {
    return this.zzHb;
  }

  public void refresh()
  {
    try
    {
      if (this.zzSW)
        zzbf.zzZ("Refreshing a released ContainerHolder.");
      while (true)
      {
        return;
        this.zzaxH.zzsM();
      }
    }
    finally
    {
    }
  }

  public void release()
  {
    try
    {
      if (this.zzSW)
        zzbf.zzZ("Releasing a released ContainerHolder.");
      while (true)
      {
        return;
        this.zzSW = true;
        this.zzaxI.zzb(this);
        this.zzaxE.release();
        this.zzaxE = null;
        this.zzaxF = null;
        this.zzaxH = null;
        this.zzaxG = null;
      }
    }
    finally
    {
    }
  }

  public void setContainerAvailableListener(ContainerHolder.ContainerAvailableListener paramContainerAvailableListener)
  {
    while (true)
    {
      try
      {
        if (this.zzSW)
        {
          zzbf.zzZ("ContainerHolder is released.");
          return;
        }
        if (paramContainerAvailableListener == null)
        {
          this.zzaxG = null;
          continue;
        }
      }
      finally
      {
      }
      this.zzaxG = new zzb(paramContainerAvailableListener, this.zzMc);
      if (this.zzaxF != null)
        zzsL();
    }
  }

  public void zza(Container paramContainer)
  {
    while (true)
    {
      try
      {
        boolean bool = this.zzSW;
        if (bool)
          return;
        if (paramContainer == null)
        {
          zzbf.zzZ("Unexpected null container.");
          continue;
        }
      }
      finally
      {
      }
      this.zzaxF = paramContainer;
      zzsL();
    }
  }

  public void zzcO(String paramString)
  {
    try
    {
      boolean bool = this.zzSW;
      if (bool);
      while (true)
      {
        return;
        this.zzaxE.zzcO(paramString);
      }
    }
    finally
    {
    }
  }

  void zzcQ(String paramString)
  {
    if (this.zzSW)
    {
      zzbf.zzZ("setCtfeUrlPathAndQuery called on a released ContainerHolder.");
      return;
    }
    this.zzaxH.zzcQ(paramString);
  }

  String zzsK()
  {
    if (this.zzSW)
    {
      zzbf.zzZ("setCtfeUrlPathAndQuery called on a released ContainerHolder.");
      return "";
    }
    return this.zzaxH.zzsK();
  }

  public static abstract interface zza
  {
    public abstract void zzcQ(String paramString);

    public abstract String zzsK();

    public abstract void zzsM();
  }

  private class zzb extends Handler
  {
    private final ContainerHolder.ContainerAvailableListener zzaxJ;

    public zzb(ContainerHolder.ContainerAvailableListener paramLooper, Looper arg3)
    {
      super();
      this.zzaxJ = paramLooper;
    }

    public void handleMessage(Message paramMessage)
    {
      switch (paramMessage.what)
      {
      default:
        zzbf.zzZ("Don't know how to handle this message.");
        return;
      case 1:
      }
      zzcS((String)paramMessage.obj);
    }

    public void zzcR(String paramString)
    {
      sendMessage(obtainMessage(1, paramString));
    }

    protected void zzcS(String paramString)
    {
      this.zzaxJ.onContainerAvailable(zzn.this, paramString);
    }
  }
}