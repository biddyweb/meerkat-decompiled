package com.google.android.gms.internal;

import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.fitness.data.Session;
import com.google.android.gms.fitness.data.Session.Builder;
import java.util.concurrent.TimeUnit;

public class zzmw
{
  public static final zzmw zzZW = new zzmw();

  public Session zza(zzxe.zza paramzza)
  {
    if (paramzza.zzaIe == null);
    for (String str = "unknown"; ; str = paramzza.zzaIe.packageName)
    {
      Session.Builder localBuilder = new Session.Builder();
      if (paramzza.zzfl != null)
        localBuilder.setIdentifier(paramzza.zzfl);
      if (paramzza.name != null)
        localBuilder.setName(paramzza.name);
      if (paramzza.description != null)
        localBuilder.setDescription(paramzza.description);
      if (paramzza.zzaIL != null)
        localBuilder.setStartTime(paramzza.zzaIL.longValue(), TimeUnit.MILLISECONDS);
      if (paramzza.zzaIM != null)
        localBuilder.setEndTime(paramzza.zzaIM.longValue(), TimeUnit.MILLISECONDS);
      if (paramzza.zzaIO != null)
        localBuilder.zzds(paramzza.zzaIO.intValue());
      localBuilder.zzbL(str);
      return localBuilder.build();
    }
  }

  public zzxe.zza zzb(Session paramSession)
  {
    zzxe.zza localzza = new zzxe.zza();
    zzx.zzb(paramSession.getIdentifier(), "session require identifier: " + paramSession);
    localzza.zzfl = paramSession.getIdentifier();
    if (paramSession.getName() != null)
      localzza.name = paramSession.getName();
    if (paramSession.getDescription() != null)
      localzza.description = paramSession.getDescription();
    localzza.zzaIL = Long.valueOf(paramSession.getStartTime(TimeUnit.MILLISECONDS));
    localzza.zzaIM = Long.valueOf(paramSession.getEndTime(TimeUnit.MILLISECONDS));
    localzza.zzaIO = Integer.valueOf(paramSession.zzln());
    if (paramSession.getAppPackageName() != null)
    {
      localzza.zzaIe = new zzxc.zza();
      localzza.zzaIe.packageName = paramSession.getAppPackageName();
    }
    return localzza;
  }
}