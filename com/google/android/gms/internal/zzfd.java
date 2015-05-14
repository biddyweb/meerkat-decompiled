package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

@zzgi
public class zzfd extends zzhl
  implements ServiceConnection
{
  private Context mContext;
  private final Object zznh = new Object();
  private boolean zzuW = false;
  private zzfs zzuX;
  private zzfc zzuY;
  private zzfi zzuZ;
  private List<zzfg> zzva = null;
  private zzfl zzvb;

  public zzfd(Context paramContext, zzfs paramzzfs, zzfl paramzzfl)
  {
    this(paramContext, paramzzfs, paramzzfl, new zzfc(paramContext), zzfi.zzm(paramContext.getApplicationContext()));
  }

  zzfd(Context paramContext, zzfs paramzzfs, zzfl paramzzfl, zzfc paramzzfc, zzfi paramzzfi)
  {
    this.mContext = paramContext;
    this.zzuX = paramzzfs;
    this.zzvb = paramzzfl;
    this.zzuY = paramzzfc;
    this.zzuZ = paramzzfi;
    this.zzva = this.zzuZ.zze(10L);
  }

  private void zzc(long paramLong)
  {
    do
      if (!zzd(paramLong))
        zzhx.zzab("Timeout waiting for pending transaction to be processed.");
    while (!this.zzuW);
  }

  private boolean zzd(long paramLong)
  {
    long l = 60000L - (SystemClock.elapsedRealtime() - paramLong);
    if (l <= 0L)
      return false;
    try
    {
      this.zznh.wait(l);
      return true;
    }
    catch (InterruptedException localInterruptedException)
    {
      while (true)
        zzhx.zzac("waitWithTimeout_lock interrupted");
    }
  }

  public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
  {
    synchronized (this.zznh)
    {
      this.zzuY.zzx(paramIBinder);
      zzdx();
      this.zzuW = true;
      this.zznh.notify();
      return;
    }
  }

  public void onServiceDisconnected(ComponentName paramComponentName)
  {
    zzhx.zzaa("In-app billing service disconnected.");
    this.zzuY.destroy();
  }

  public void onStop()
  {
    synchronized (this.zznh)
    {
      zzlo.zzka().zza(this.mContext, this);
      this.zzuY.destroy();
      return;
    }
  }

  protected void zza(zzfg paramzzfg, String paramString1, String paramString2)
  {
    Intent localIntent = new Intent();
    zzab.zzaU();
    localIntent.putExtra("RESPONSE_CODE", 0);
    zzab.zzaU();
    localIntent.putExtra("INAPP_PURCHASE_DATA", paramString1);
    zzab.zzaU();
    localIntent.putExtra("INAPP_DATA_SIGNATURE", paramString2);
    zzhw.zzzG.post(new zzfd.1(this, paramzzfg, localIntent));
  }

  public void zzdw()
  {
    synchronized (this.zznh)
    {
      Intent localIntent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
      localIntent.setPackage("com.android.vending");
      zzlo.zzka().zza(this.mContext, localIntent, this, 1);
      zzc(SystemClock.elapsedRealtime());
      zzlo.zzka().zza(this.mContext, this);
      this.zzuY.destroy();
      return;
    }
  }

  protected void zzdx()
  {
    if (this.zzva.isEmpty())
      return;
    HashMap localHashMap = new HashMap();
    Iterator localIterator1 = this.zzva.iterator();
    while (localIterator1.hasNext())
    {
      zzfg localzzfg2 = (zzfg)localIterator1.next();
      localHashMap.put(localzzfg2.zzvo, localzzfg2);
    }
    String str1;
    for (Object localObject = null; ; localObject = str1)
    {
      Bundle localBundle = this.zzuY.zzh(this.mContext.getPackageName(), (String)localObject);
      if (localBundle == null);
      do
      {
        do
        {
          Iterator localIterator2 = localHashMap.keySet().iterator();
          while (localIterator2.hasNext())
          {
            String str2 = (String)localIterator2.next();
            this.zzuZ.zza((zzfg)localHashMap.get(str2));
          }
          break;
        }
        while (zzab.zzaU().zzf(localBundle) != 0);
        ArrayList localArrayList1 = localBundle.getStringArrayList("INAPP_PURCHASE_ITEM_LIST");
        ArrayList localArrayList2 = localBundle.getStringArrayList("INAPP_PURCHASE_DATA_LIST");
        ArrayList localArrayList3 = localBundle.getStringArrayList("INAPP_DATA_SIGNATURE_LIST");
        str1 = localBundle.getString("INAPP_CONTINUATION_TOKEN");
        for (int i = 0; i < localArrayList1.size(); i++)
          if (localHashMap.containsKey(localArrayList1.get(i)))
          {
            String str3 = (String)localArrayList1.get(i);
            String str4 = (String)localArrayList2.get(i);
            String str5 = (String)localArrayList3.get(i);
            zzfg localzzfg1 = (zzfg)localHashMap.get(str3);
            String str6 = zzab.zzaU().zzL(str4);
            if (localzzfg1.zzvn.equals(str6))
            {
              zza(localzzfg1, str4, str5);
              localHashMap.remove(str3);
            }
          }
      }
      while ((str1 == null) || (localHashMap.isEmpty()));
    }
  }
}