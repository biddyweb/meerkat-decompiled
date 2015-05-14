package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.ServiceInfo;
import android.os.Process;
import android.util.Log;
import com.google.android.gms.common.internal.zze;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class zzlo
{
  private static final Object zzQc = new Object();
  private static zzlo zzRr;
  private static final ComponentName zzRw = new ComponentName("com.google.android.gms", "com.google.android.gms.common.stats.GmsCoreStatsService");
  private final List<String> zzRs;
  private final List<String> zzRt;
  private final List<String> zzRu;
  private final List<String> zzRv;
  private zzlr zzRx;

  private zzlo()
  {
    if (getLogLevel() == zzlq.zzRF)
    {
      this.zzRs = Collections.EMPTY_LIST;
      this.zzRt = Collections.EMPTY_LIST;
      this.zzRu = Collections.EMPTY_LIST;
      this.zzRv = Collections.EMPTY_LIST;
      return;
    }
    String str1 = (String)zzlp.zza.zzRA.get();
    List localList1;
    String str2;
    List localList2;
    label85: String str3;
    List localList3;
    label112: String str4;
    if (str1 == null)
    {
      localList1 = Collections.EMPTY_LIST;
      this.zzRs = localList1;
      str2 = (String)zzlp.zza.zzRB.get();
      if (str2 != null)
        break label185;
      localList2 = Collections.EMPTY_LIST;
      this.zzRt = localList2;
      str3 = (String)zzlp.zza.zzRC.get();
      if (str3 != null)
        break label199;
      localList3 = Collections.EMPTY_LIST;
      this.zzRu = localList3;
      str4 = (String)zzlp.zza.zzRD.get();
      if (str4 != null)
        break label214;
    }
    label185: label199: label214: for (List localList4 = Collections.EMPTY_LIST; ; localList4 = Arrays.asList(str4.split(",")))
    {
      this.zzRv = localList4;
      this.zzRx = new zzlr(1024, ((Long)zzlp.zza.zzRE.get()).longValue());
      return;
      localList1 = Arrays.asList(str1.split(","));
      break;
      localList2 = Arrays.asList(str2.split(","));
      break label85;
      localList3 = Arrays.asList(str3.split(","));
      break label112;
    }
  }

  private int getLogLevel()
  {
    try
    {
      if ((zze.zzPq) && (zzki.isInitialized()) && (zzki.zzis() == Process.myUid()))
        return ((Integer)zzlp.zza.zzRz.get()).intValue();
      int i = zzlq.zzRF;
      return i;
    }
    catch (SecurityException localSecurityException)
    {
    }
    return zzlq.zzRF;
  }

  private void zza(Context paramContext, ServiceConnection paramServiceConnection, String paramString1, Intent paramIntent, String paramString2)
  {
    if (!zze.zzPq);
    long l1;
    do
    {
      return;
      l1 = zzb(paramServiceConnection);
    }
    while (!zza(paramContext, paramString1, paramIntent, l1, paramString2));
    long l2 = System.currentTimeMillis();
    String str = zzmf.zzl(3, 5);
    if ((paramString2.equals("UNBIND")) || (paramString2.equals("DISCONNECT")));
    ServiceInfo localServiceInfo;
    for (zzlm localzzlm = new zzlm(l2, paramString2, null, null, null, null, str, l1); ; localzzlm = new zzlm(l2, paramString2, zzmf.zzR(paramContext), paramString1, localServiceInfo.processName, localServiceInfo.name, str, l1))
    {
      paramContext.startService(new Intent().setComponent(zzRw).putExtra("com.google.android.gms.common.stats.EXTRA_LOG_EVENT", localzzlm));
      return;
      localServiceInfo = zzb(paramContext, paramIntent);
    }
  }

  private boolean zza(Context paramContext, String paramString1, Intent paramIntent, long paramLong, String paramString2)
  {
    int i = getLogLevel();
    if ((i == zzlq.zzRF) || (this.zzRx == null));
    String str1;
    String str2;
    String str3;
    do
    {
      ServiceInfo localServiceInfo;
      do
      {
        do
        {
          return false;
          if ((paramString2 != "DISCONNECT") && (paramString2 != "UNBIND"))
            break;
        }
        while (!this.zzRx.zzr(paramLong));
        return true;
        localServiceInfo = zzb(paramContext, paramIntent);
      }
      while (localServiceInfo == null);
      str1 = zzmf.zzR(paramContext);
      str2 = localServiceInfo.processName;
      str3 = localServiceInfo.name;
    }
    while ((this.zzRs.contains(str1)) || (this.zzRt.contains(paramString1)) || (this.zzRu.contains(str2)) || (this.zzRv.contains(str3)) || ((str2.equals(str1)) && ((i & zzlq.zzRJ) != 0)));
    this.zzRx.zza(Long.valueOf(paramLong));
    return true;
  }

  private long zzb(ServiceConnection paramServiceConnection)
  {
    return Process.myPid() << 32 | System.identityHashCode(paramServiceConnection);
  }

  private static ServiceInfo zzb(Context paramContext, Intent paramIntent)
  {
    List localList = paramContext.getPackageManager().queryIntentServices(paramIntent, 128);
    if ((localList == null) || (localList.size() == 0))
    {
      Log.w("ConnectionTracker", "There are no handler of this intent: " + paramIntent.toUri(0));
      return null;
    }
    if (localList.size() > 1)
    {
      Log.w("ConnectionTracker", "There are multiple handlers for this intent: " + paramIntent.toUri(0));
      Iterator localIterator = localList.iterator();
      if (localIterator.hasNext())
      {
        Log.w("ConnectionTracker", ((ResolveInfo)localIterator.next()).serviceInfo.name);
        return null;
      }
    }
    return ((ResolveInfo)localList.get(0)).serviceInfo;
  }

  public static zzlo zzka()
  {
    synchronized (zzQc)
    {
      if (zzRr == null)
        zzRr = new zzlo();
      return zzRr;
    }
  }

  public void zza(Context paramContext, ServiceConnection paramServiceConnection)
  {
    zza(paramContext, paramServiceConnection, null, null, "UNBIND");
    paramContext.unbindService(paramServiceConnection);
  }

  public void zza(Context paramContext, ServiceConnection paramServiceConnection, String paramString, Intent paramIntent)
  {
    zza(paramContext, paramServiceConnection, paramString, paramIntent, "CONNECT");
  }

  public boolean zza(Context paramContext, Intent paramIntent, ServiceConnection paramServiceConnection, int paramInt)
  {
    return zza(paramContext, paramContext.getClass().getName(), paramIntent, paramServiceConnection, paramInt);
  }

  public boolean zza(Context paramContext, String paramString, Intent paramIntent, ServiceConnection paramServiceConnection, int paramInt)
  {
    zza(paramContext, paramServiceConnection, paramString, paramIntent, "BIND");
    return paramContext.bindService(paramIntent, paramServiceConnection, paramInt);
  }

  public void zzb(Context paramContext, ServiceConnection paramServiceConnection)
  {
    zza(paramContext, paramServiceConnection, null, null, "DISCONNECT");
  }
}