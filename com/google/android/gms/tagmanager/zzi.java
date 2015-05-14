package com.google.android.gms.tagmanager;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.net.Uri.Builder;
import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class zzi extends zzdc
{
  private static final String ID = zza.zzay.toString();
  private static final String URL = zzb.zzeX.toString();
  private static final String zzaxp = zzb.zzbl.toString();
  private static final String zzaxq = zzb.zzeW.toString();
  static final String zzaxr = "gtm_" + ID + "_unrepeatable";
  private static final Set<String> zzaxs = new HashSet();
  private final Context mContext;
  private final zza zzaxt;

  public zzi(Context paramContext)
  {
    this(paramContext, new zza()
    {
      public zzaq zzsE()
      {
        return zzy.zzak(zzi.this);
      }
    });
  }

  zzi(Context paramContext, zza paramzza)
  {
    super(str, arrayOfString);
    this.zzaxt = paramzza;
    this.mContext = paramContext;
  }

  private boolean zzcI(String paramString)
  {
    boolean bool1 = true;
    while (true)
    {
      try
      {
        boolean bool2 = zzcK(paramString);
        if (bool2)
          return bool1;
        if (zzcJ(paramString))
        {
          zzaxs.add(paramString);
          continue;
        }
      }
      finally
      {
      }
      bool1 = false;
    }
  }

  public void zzJ(Map<String, zzd.zza> paramMap)
  {
    String str1;
    if (paramMap.get(zzaxq) != null)
    {
      str1 = zzde.zzg((zzd.zza)paramMap.get(zzaxq));
      if ((str1 == null) || (!zzcI(str1)))
        break label46;
    }
    label46: 
    do
    {
      return;
      str1 = null;
      break;
      Uri.Builder localBuilder = Uri.parse(zzde.zzg((zzd.zza)paramMap.get(URL))).buildUpon();
      zzd.zza localzza = (zzd.zza)paramMap.get(zzaxp);
      if (localzza != null)
      {
        Object localObject2 = zzde.zzl(localzza);
        if (!(localObject2 instanceof List))
        {
          zzbf.zzZ("ArbitraryPixel: additional params not a list: not sending partial hit: " + localBuilder.build().toString());
          return;
        }
        Iterator localIterator1 = ((List)localObject2).iterator();
        while (localIterator1.hasNext())
        {
          Object localObject3 = localIterator1.next();
          if (!(localObject3 instanceof Map))
          {
            zzbf.zzZ("ArbitraryPixel: additional params contains non-map: not sending partial hit: " + localBuilder.build().toString());
            return;
          }
          Iterator localIterator2 = ((Map)localObject3).entrySet().iterator();
          while (localIterator2.hasNext())
          {
            Map.Entry localEntry = (Map.Entry)localIterator2.next();
            localBuilder.appendQueryParameter(localEntry.getKey().toString(), localEntry.getValue().toString());
          }
        }
      }
      String str2 = localBuilder.build().toString();
      this.zzaxt.zzsE().zzcY(str2);
      zzbf.zzab("ArbitraryPixel: url = " + str2);
    }
    while (str1 == null);
    try
    {
      zzaxs.add(str1);
      zzcu.zza(this.mContext, zzaxr, str1, "true");
      return;
    }
    finally
    {
    }
  }

  boolean zzcJ(String paramString)
  {
    return this.mContext.getSharedPreferences(zzaxr, 0).contains(paramString);
  }

  boolean zzcK(String paramString)
  {
    return zzaxs.contains(paramString);
  }

  public static abstract interface zza
  {
    public abstract zzaq zzsE();
  }
}