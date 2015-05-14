package com.google.android.gms.tagmanager;

import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Looper;
import com.google.android.gms.common.api.PendingResult;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

public class TagManager
{
  private static TagManager zzaAS;
  private final Context mContext;
  private final zza zzaAP;
  private final zzcs zzaAQ;
  private final ConcurrentMap<zzn, Boolean> zzaAR;
  private final DataLayer zzaxx;
  private final zzr zzazO;

  TagManager(Context paramContext, zza paramzza, DataLayer paramDataLayer, zzcs paramzzcs)
  {
    if (paramContext == null)
      throw new NullPointerException("context cannot be null");
    this.mContext = paramContext.getApplicationContext();
    this.zzaAQ = paramzzcs;
    this.zzaAP = paramzza;
    this.zzaAR = new ConcurrentHashMap();
    this.zzaxx = paramDataLayer;
    this.zzaxx.zza(new DataLayer.zzb()
    {
      public void zzI(Map<String, Object> paramAnonymousMap)
      {
        Object localObject = paramAnonymousMap.get("event");
        if (localObject != null)
          TagManager.zza(TagManager.this, localObject.toString());
      }
    });
    this.zzaxx.zza(new zzd(this.mContext));
    this.zzazO = new zzr();
    zztT();
  }

  public static TagManager getInstance(Context paramContext)
  {
    try
    {
      if (zzaAS != null)
        break label68;
      if (paramContext == null)
      {
        zzbf.zzZ("TagManager.getInstance requires non-null context.");
        throw new NullPointerException();
      }
    }
    finally
    {
    }
    zzaAS = new TagManager(paramContext, new zza()
    {
      public zzo zza(Context paramAnonymousContext, TagManager paramAnonymousTagManager, Looper paramAnonymousLooper, String paramAnonymousString, int paramAnonymousInt, zzr paramAnonymouszzr)
      {
        return new zzo(paramAnonymousContext, paramAnonymousTagManager, paramAnonymousLooper, paramAnonymousString, paramAnonymousInt, paramAnonymouszzr);
      }
    }
    , new DataLayer(new zzv(paramContext)), zzct.zztR());
    label68: TagManager localTagManager = zzaAS;
    return localTagManager;
  }

  private void zzdk(String paramString)
  {
    Iterator localIterator = this.zzaAR.keySet().iterator();
    while (localIterator.hasNext())
      ((zzn)localIterator.next()).zzcO(paramString);
  }

  private void zztT()
  {
    if (Build.VERSION.SDK_INT >= 14)
      this.mContext.registerComponentCallbacks(new ComponentCallbacks2()
      {
        public void onConfigurationChanged(Configuration paramAnonymousConfiguration)
        {
        }

        public void onLowMemory()
        {
        }

        public void onTrimMemory(int paramAnonymousInt)
        {
          if (paramAnonymousInt == 20)
            TagManager.this.dispatch();
        }
      });
  }

  public void dispatch()
  {
    this.zzaAQ.dispatch();
  }

  public DataLayer getDataLayer()
  {
    return this.zzaxx;
  }

  public PendingResult<ContainerHolder> loadContainerDefaultOnly(String paramString, int paramInt)
  {
    zzo localzzo = this.zzaAP.zza(this.mContext, this, null, paramString, paramInt, this.zzazO);
    localzzo.zzsN();
    return localzzo;
  }

  public PendingResult<ContainerHolder> loadContainerDefaultOnly(String paramString, int paramInt, Handler paramHandler)
  {
    zzo localzzo = this.zzaAP.zza(this.mContext, this, paramHandler.getLooper(), paramString, paramInt, this.zzazO);
    localzzo.zzsN();
    return localzzo;
  }

  public PendingResult<ContainerHolder> loadContainerPreferFresh(String paramString, int paramInt)
  {
    zzo localzzo = this.zzaAP.zza(this.mContext, this, null, paramString, paramInt, this.zzazO);
    localzzo.zzsP();
    return localzzo;
  }

  public PendingResult<ContainerHolder> loadContainerPreferFresh(String paramString, int paramInt, Handler paramHandler)
  {
    zzo localzzo = this.zzaAP.zza(this.mContext, this, paramHandler.getLooper(), paramString, paramInt, this.zzazO);
    localzzo.zzsP();
    return localzzo;
  }

  public PendingResult<ContainerHolder> loadContainerPreferNonDefault(String paramString, int paramInt)
  {
    zzo localzzo = this.zzaAP.zza(this.mContext, this, null, paramString, paramInt, this.zzazO);
    localzzo.zzsO();
    return localzzo;
  }

  public PendingResult<ContainerHolder> loadContainerPreferNonDefault(String paramString, int paramInt, Handler paramHandler)
  {
    zzo localzzo = this.zzaAP.zza(this.mContext, this, paramHandler.getLooper(), paramString, paramInt, this.zzazO);
    localzzo.zzsO();
    return localzzo;
  }

  public void setVerboseLoggingEnabled(boolean paramBoolean)
  {
    if (paramBoolean);
    for (int i = 2; ; i = 5)
    {
      zzbf.setLogLevel(i);
      return;
    }
  }

  void zza(zzn paramzzn)
  {
    this.zzaAR.put(paramzzn, Boolean.valueOf(true));
  }

  boolean zzb(zzn paramzzn)
  {
    return this.zzaAR.remove(paramzzn) != null;
  }

  public PendingResult<ContainerHolder> zzc(String paramString1, int paramInt, String paramString2)
  {
    zzo localzzo = this.zzaAP.zza(this.mContext, this, null, paramString1, paramInt, this.zzazO);
    localzzo.load(paramString2);
    return localzzo;
  }

  boolean zzl(Uri paramUri)
  {
    while (true)
    {
      zzca localzzca;
      String str;
      try
      {
        localzzca = zzca.zztx();
        if (!localzzca.zzl(paramUri))
          break label228;
        str = localzzca.getContainerId();
        int i = 4.zzaAU[localzzca.zzty().ordinal()];
        switch (i)
        {
        default:
          bool = true;
          return bool;
        case 1:
          Iterator localIterator2 = this.zzaAR.keySet().iterator();
          if (!localIterator2.hasNext())
            continue;
          zzn localzzn2 = (zzn)localIterator2.next();
          if (!localzzn2.getContainerId().equals(str))
            continue;
          localzzn2.zzcQ(null);
          localzzn2.refresh();
          continue;
        case 2:
        case 3:
        }
      }
      finally
      {
      }
      Iterator localIterator1 = this.zzaAR.keySet().iterator();
      while (localIterator1.hasNext())
      {
        zzn localzzn1 = (zzn)localIterator1.next();
        if (localzzn1.getContainerId().equals(str))
        {
          localzzn1.zzcQ(localzzca.zztz());
          localzzn1.refresh();
        }
        else if (localzzn1.zzsK() != null)
        {
          localzzn1.zzcQ(null);
          localzzn1.refresh();
        }
      }
      continue;
      label228: boolean bool = false;
    }
  }

  public static abstract interface zza
  {
    public abstract zzo zza(Context paramContext, TagManager paramTagManager, Looper paramLooper, String paramString, int paramInt, zzr paramzzr);
  }
}