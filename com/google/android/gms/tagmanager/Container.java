package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzc.zzf;
import com.google.android.gms.internal.zzc.zzi;
import com.google.android.gms.internal.zzc.zzj;
import com.google.android.gms.internal.zzd.zza;
import com.google.android.gms.internal.zzvl;
import com.google.android.gms.internal.zzvl.zzc;
import com.google.android.gms.internal.zzvl.zzg;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Container
{
  private final Context mContext;
  private Map<String, FunctionCallTagCallback> zzaxA = new HashMap();
  private volatile long zzaxB;
  private volatile String zzaxC = "";
  private final String zzaxw;
  private final DataLayer zzaxx;
  private zzco zzaxy;
  private Map<String, FunctionCallMacroCallback> zzaxz = new HashMap();

  Container(Context paramContext, DataLayer paramDataLayer, String paramString, long paramLong, zzc.zzj paramzzj)
  {
    this.mContext = paramContext;
    this.zzaxx = paramDataLayer;
    this.zzaxw = paramString;
    this.zzaxB = paramLong;
    zza(paramzzj.zzgs);
    if (paramzzj.zzgr != null)
      zza(paramzzj.zzgr);
  }

  Container(Context paramContext, DataLayer paramDataLayer, String paramString, long paramLong, zzvl.zzc paramzzc)
  {
    this.mContext = paramContext;
    this.zzaxx = paramDataLayer;
    this.zzaxw = paramString;
    this.zzaxB = paramLong;
    zza(paramzzc);
  }

  private void zza(zzc.zzf paramzzf)
  {
    if (paramzzf == null)
      throw new NullPointerException();
    try
    {
      zzvl.zzc localzzc = zzvl.zzb(paramzzf);
      zza(localzzc);
      return;
    }
    catch (zzvl.zzg localzzg)
    {
      zzbf.zzZ("Not loading resource: " + paramzzf + " because it is invalid: " + localzzg.toString());
    }
  }

  private void zza(zzvl.zzc paramzzc)
  {
    this.zzaxC = paramzzc.getVersion();
    zzag localzzag = zzcP(this.zzaxC);
    zza(new zzco(this.mContext, paramzzc, this.zzaxx, new zza(null), new zzb(null), localzzag));
  }

  private void zza(zzco paramzzco)
  {
    try
    {
      this.zzaxy = paramzzco;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private void zza(zzc.zzi[] paramArrayOfzzi)
  {
    ArrayList localArrayList = new ArrayList();
    int i = paramArrayOfzzi.length;
    for (int j = 0; j < i; j++)
      localArrayList.add(paramArrayOfzzi[j]);
    zzsJ().zzu(localArrayList);
  }

  private zzco zzsJ()
  {
    try
    {
      zzco localzzco = this.zzaxy;
      return localzzco;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public boolean getBoolean(String paramString)
  {
    zzco localzzco = zzsJ();
    if (localzzco == null)
    {
      zzbf.zzZ("getBoolean called for closed container.");
      return zzde.zzuc().booleanValue();
    }
    try
    {
      boolean bool = zzde.zzk((zzd.zza)localzzco.zzdi(paramString).getObject()).booleanValue();
      return bool;
    }
    catch (Exception localException)
    {
      zzbf.zzZ("Calling getBoolean() threw an exception: " + localException.getMessage() + " Returning default value.");
    }
    return zzde.zzuc().booleanValue();
  }

  public String getContainerId()
  {
    return this.zzaxw;
  }

  public double getDouble(String paramString)
  {
    zzco localzzco = zzsJ();
    if (localzzco == null)
    {
      zzbf.zzZ("getDouble called for closed container.");
      return zzde.zzub().doubleValue();
    }
    try
    {
      double d = zzde.zzj((zzd.zza)localzzco.zzdi(paramString).getObject()).doubleValue();
      return d;
    }
    catch (Exception localException)
    {
      zzbf.zzZ("Calling getDouble() threw an exception: " + localException.getMessage() + " Returning default value.");
    }
    return zzde.zzub().doubleValue();
  }

  public long getLastRefreshTime()
  {
    return this.zzaxB;
  }

  public long getLong(String paramString)
  {
    zzco localzzco = zzsJ();
    if (localzzco == null)
    {
      zzbf.zzZ("getLong called for closed container.");
      return zzde.zzua().longValue();
    }
    try
    {
      long l = zzde.zzi((zzd.zza)localzzco.zzdi(paramString).getObject()).longValue();
      return l;
    }
    catch (Exception localException)
    {
      zzbf.zzZ("Calling getLong() threw an exception: " + localException.getMessage() + " Returning default value.");
    }
    return zzde.zzua().longValue();
  }

  public String getString(String paramString)
  {
    zzco localzzco = zzsJ();
    if (localzzco == null)
    {
      zzbf.zzZ("getString called for closed container.");
      return zzde.zzue();
    }
    try
    {
      String str = zzde.zzg((zzd.zza)localzzco.zzdi(paramString).getObject());
      return str;
    }
    catch (Exception localException)
    {
      zzbf.zzZ("Calling getString() threw an exception: " + localException.getMessage() + " Returning default value.");
    }
    return zzde.zzue();
  }

  public boolean isDefault()
  {
    return getLastRefreshTime() == 0L;
  }

  public void registerFunctionCallMacroCallback(String paramString, FunctionCallMacroCallback paramFunctionCallMacroCallback)
  {
    if (paramFunctionCallMacroCallback == null)
      throw new NullPointerException("Macro handler must be non-null");
    synchronized (this.zzaxz)
    {
      this.zzaxz.put(paramString, paramFunctionCallMacroCallback);
      return;
    }
  }

  public void registerFunctionCallTagCallback(String paramString, FunctionCallTagCallback paramFunctionCallTagCallback)
  {
    if (paramFunctionCallTagCallback == null)
      throw new NullPointerException("Tag callback must be non-null");
    synchronized (this.zzaxA)
    {
      this.zzaxA.put(paramString, paramFunctionCallTagCallback);
      return;
    }
  }

  void release()
  {
    this.zzaxy = null;
  }

  public void unregisterFunctionCallMacroCallback(String paramString)
  {
    synchronized (this.zzaxz)
    {
      this.zzaxz.remove(paramString);
      return;
    }
  }

  public void unregisterFunctionCallTagCallback(String paramString)
  {
    synchronized (this.zzaxA)
    {
      this.zzaxA.remove(paramString);
      return;
    }
  }

  FunctionCallMacroCallback zzcM(String paramString)
  {
    synchronized (this.zzaxz)
    {
      FunctionCallMacroCallback localFunctionCallMacroCallback = (FunctionCallMacroCallback)this.zzaxz.get(paramString);
      return localFunctionCallMacroCallback;
    }
  }

  FunctionCallTagCallback zzcN(String paramString)
  {
    synchronized (this.zzaxA)
    {
      FunctionCallTagCallback localFunctionCallTagCallback = (FunctionCallTagCallback)this.zzaxA.get(paramString);
      return localFunctionCallTagCallback;
    }
  }

  void zzcO(String paramString)
  {
    zzsJ().zzcO(paramString);
  }

  zzag zzcP(String paramString)
  {
    if (zzca.zztx().zzty().equals(zzca.zza.zzazD));
    return new zzbn();
  }

  String zzsI()
  {
    return this.zzaxC;
  }

  public static abstract interface FunctionCallMacroCallback
  {
    public abstract Object getValue(String paramString, Map<String, Object> paramMap);
  }

  public static abstract interface FunctionCallTagCallback
  {
    public abstract void execute(String paramString, Map<String, Object> paramMap);
  }

  private class zza
    implements zzs.zza
  {
    private zza()
    {
    }

    public Object zzc(String paramString, Map<String, Object> paramMap)
    {
      Container.FunctionCallMacroCallback localFunctionCallMacroCallback = Container.this.zzcM(paramString);
      if (localFunctionCallMacroCallback == null)
        return null;
      return localFunctionCallMacroCallback.getValue(paramString, paramMap);
    }
  }

  private class zzb
    implements zzs.zza
  {
    private zzb()
    {
    }

    public Object zzc(String paramString, Map<String, Object> paramMap)
    {
      Container.FunctionCallTagCallback localFunctionCallTagCallback = Container.this.zzcN(paramString);
      if (localFunctionCallTagCallback != null)
        localFunctionCallTagCallback.execute(paramString, paramMap);
      return zzde.zzue();
    }
  }
}