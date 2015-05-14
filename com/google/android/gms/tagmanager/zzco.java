package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzc.zzi;
import com.google.android.gms.internal.zzd.zza;
import com.google.android.gms.internal.zzvl;
import com.google.android.gms.internal.zzvl.zza;
import com.google.android.gms.internal.zzvl.zzc;
import com.google.android.gms.internal.zzvl.zze;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class zzco
{
  private static final zzbv<zzd.zza> zzazW = new zzbv(zzde.zzuf(), true);
  private final Map<String, zzaj> zzaAa;
  private final Map<String, zzaj> zzaAb;
  private final zzk<zzvl.zza, zzbv<zzd.zza>> zzaAc;
  private final zzk<String, zzb> zzaAd;
  private final Set<zzvl.zze> zzaAe;
  private final Map<String, zzc> zzaAf;
  private volatile String zzaAg;
  private int zzaAh;
  private final DataLayer zzaxx;
  private final zzvl.zzc zzazX;
  private final zzag zzazY;
  private final Map<String, zzaj> zzazZ;

  public zzco(Context paramContext, zzvl.zzc paramzzc, DataLayer paramDataLayer, zzs.zza paramzza1, zzs.zza paramzza2, zzag paramzzag)
  {
    if (paramzzc == null)
      throw new NullPointerException("resource cannot be null");
    this.zzazX = paramzzc;
    this.zzaAe = new HashSet(paramzzc.zzuy());
    this.zzaxx = paramDataLayer;
    this.zzazY = paramzzag;
    zzl.zza local1 = new zzl.zza()
    {
      public int zza(zzvl.zza paramAnonymouszza, zzbv<zzd.zza> paramAnonymouszzbv)
      {
        return ((zzd.zza)paramAnonymouszzbv.getObject()).zzvX();
      }
    };
    this.zzaAc = new zzl().zza(1048576, local1);
    zzl.zza local2 = new zzl.zza()
    {
      public int zza(String paramAnonymousString, zzco.zzb paramAnonymouszzb)
      {
        return paramAnonymousString.length() + paramAnonymouszzb.getSize();
      }
    };
    this.zzaAd = new zzl().zza(1048576, local2);
    this.zzazZ = new HashMap();
    zzb(new zzi(paramContext));
    zzb(new zzs(paramzza2));
    zzb(new zzw(paramDataLayer));
    zzb(new zzdf(paramContext, paramDataLayer));
    zzb(new zzda(paramContext, paramDataLayer));
    this.zzaAa = new HashMap();
    zzc(new zzq());
    zzc(new zzad());
    zzc(new zzae());
    zzc(new zzal());
    zzc(new zzam());
    zzc(new zzbb());
    zzc(new zzbc());
    zzc(new zzce());
    zzc(new zzcx());
    this.zzaAb = new HashMap();
    zza(new zzb(paramContext));
    zza(new zzc(paramContext));
    zza(new zze(paramContext));
    zza(new zzf(paramContext));
    zza(new zzg(paramContext));
    zza(new zzh(paramContext));
    zza(new zzm());
    zza(new zzp(this.zzazX.getVersion()));
    zza(new zzs(paramzza1));
    zza(new zzu(paramDataLayer));
    zza(new zzz(paramContext));
    zza(new zzaa());
    zza(new zzac());
    zza(new zzah(this));
    zza(new zzan());
    zza(new zzao());
    zza(new zzav(paramContext));
    zza(new zzax());
    zza(new zzba());
    zza(new zzbh());
    zza(new zzbj(paramContext));
    zza(new zzbw());
    zza(new zzby());
    zza(new zzcb());
    zza(new zzcd());
    zza(new zzcf(paramContext));
    zza(new zzcp());
    zza(new zzcq());
    zza(new zzcz());
    zza(new zzdg());
    this.zzaAf = new HashMap();
    Iterator localIterator1 = this.zzaAe.iterator();
    while (localIterator1.hasNext())
    {
      zzvl.zze localzze = (zzvl.zze)localIterator1.next();
      if (paramzzag.zztg())
      {
        zza(localzze.zzuG(), localzze.zzuH(), "add macro");
        zza(localzze.zzuL(), localzze.zzuI(), "remove macro");
        zza(localzze.zzuE(), localzze.zzuJ(), "add tag");
        zza(localzze.zzuF(), localzze.zzuK(), "remove tag");
      }
      for (int i = 0; i < localzze.zzuG().size(); i++)
      {
        zzvl.zza localzza3 = (zzvl.zza)localzze.zzuG().get(i);
        String str2 = "Unknown";
        if ((paramzzag.zztg()) && (i < localzze.zzuH().size()))
          str2 = (String)localzze.zzuH().get(i);
        zzc localzzc2 = zze(this.zzaAf, zza(localzza3));
        localzzc2.zza(localzze);
        localzzc2.zza(localzze, localzza3);
        localzzc2.zza(localzze, str2);
      }
      for (int j = 0; j < localzze.zzuL().size(); j++)
      {
        zzvl.zza localzza2 = (zzvl.zza)localzze.zzuL().get(j);
        String str1 = "Unknown";
        if ((paramzzag.zztg()) && (j < localzze.zzuI().size()))
          str1 = (String)localzze.zzuI().get(j);
        zzc localzzc1 = zze(this.zzaAf, zza(localzza2));
        localzzc1.zza(localzze);
        localzzc1.zzb(localzze, localzza2);
        localzzc1.zzb(localzze, str1);
      }
    }
    Iterator localIterator2 = this.zzazX.zzuz().entrySet().iterator();
    while (localIterator2.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator2.next();
      Iterator localIterator3 = ((List)localEntry.getValue()).iterator();
      while (localIterator3.hasNext())
      {
        zzvl.zza localzza1 = (zzvl.zza)localIterator3.next();
        if (!zzde.zzk((zzd.zza)localzza1.zzuv().get(com.google.android.gms.internal.zzb.zzdG.toString())).booleanValue())
          zze(this.zzaAf, (String)localEntry.getKey()).zzb(localzza1);
      }
    }
  }

  private zzbv<zzd.zza> zza(zzd.zza paramzza, Set<String> paramSet, zzdh paramzzdh)
  {
    if (!paramzza.zzgF)
      return new zzbv(paramzza, true);
    switch (paramzza.type)
    {
    case 5:
    case 6:
    default:
      zzbf.zzZ("Unknown type: " + paramzza.type);
      return zzazW;
    case 2:
      zzd.zza localzza3 = zzvl.zzo(paramzza);
      localzza3.zzgw = new zzd.zza[paramzza.zzgw.length];
      for (int k = 0; k < paramzza.zzgw.length; k++)
      {
        zzbv localzzbv5 = zza(paramzza.zzgw[k], paramSet, paramzzdh.zzhf(k));
        if (localzzbv5 == zzazW)
          return zzazW;
        localzza3.zzgw[k] = ((zzd.zza)localzzbv5.getObject());
      }
      return new zzbv(localzza3, false);
    case 3:
      zzd.zza localzza2 = zzvl.zzo(paramzza);
      if (paramzza.zzgx.length != paramzza.zzgy.length)
      {
        zzbf.zzZ("Invalid serving value: " + paramzza.toString());
        return zzazW;
      }
      localzza2.zzgx = new zzd.zza[paramzza.zzgx.length];
      localzza2.zzgy = new zzd.zza[paramzza.zzgx.length];
      for (int j = 0; j < paramzza.zzgx.length; j++)
      {
        zzbv localzzbv3 = zza(paramzza.zzgx[j], paramSet, paramzzdh.zzhg(j));
        zzbv localzzbv4 = zza(paramzza.zzgy[j], paramSet, paramzzdh.zzhh(j));
        if ((localzzbv3 == zzazW) || (localzzbv4 == zzazW))
          return zzazW;
        localzza2.zzgx[j] = ((zzd.zza)localzzbv3.getObject());
        localzza2.zzgy[j] = ((zzd.zza)localzzbv4.getObject());
      }
      return new zzbv(localzza2, false);
    case 4:
      if (paramSet.contains(paramzza.zzgz))
      {
        zzbf.zzZ("Macro cycle detected.  Current macro reference: " + paramzza.zzgz + "." + "  Previous macro references: " + paramSet.toString() + ".");
        return zzazW;
      }
      paramSet.add(paramzza.zzgz);
      zzbv localzzbv2 = zzdi.zza(zza(paramzza.zzgz, paramSet, paramzzdh.zztt()), paramzza.zzgE);
      paramSet.remove(paramzza.zzgz);
      return localzzbv2;
    case 7:
    }
    zzd.zza localzza1 = zzvl.zzo(paramzza);
    localzza1.zzgD = new zzd.zza[paramzza.zzgD.length];
    for (int i = 0; i < paramzza.zzgD.length; i++)
    {
      zzbv localzzbv1 = zza(paramzza.zzgD[i], paramSet, paramzzdh.zzhi(i));
      if (localzzbv1 == zzazW)
        return zzazW;
      localzza1.zzgD[i] = ((zzd.zza)localzzbv1.getObject());
    }
    return new zzbv(localzza1, false);
  }

  private zzbv<zzd.zza> zza(String paramString, Set<String> paramSet, zzbi paramzzbi)
  {
    this.zzaAh = (1 + this.zzaAh);
    zzb localzzb = (zzb)this.zzaAd.get(paramString);
    if ((localzzb != null) && (!this.zzazY.zztg()))
    {
      zza(localzzb.zztK(), paramSet);
      this.zzaAh = (-1 + this.zzaAh);
      return localzzb.zztJ();
    }
    zzc localzzc = (zzc)this.zzaAf.get(paramString);
    if (localzzc == null)
    {
      zzbf.zzZ(zztI() + "Invalid macro: " + paramString);
      this.zzaAh = (-1 + this.zzaAh);
      return zzazW;
    }
    zzbv localzzbv1 = zza(paramString, localzzc.zztL(), localzzc.zztM(), localzzc.zztN(), localzzc.zztP(), localzzc.zztO(), paramSet, paramzzbi.zzsX());
    if (((Set)localzzbv1.getObject()).isEmpty());
    for (zzvl.zza localzza = localzzc.zztQ(); localzza == null; localzza = (zzvl.zza)((Set)localzzbv1.getObject()).iterator().next())
    {
      this.zzaAh = (-1 + this.zzaAh);
      return zzazW;
      if (((Set)localzzbv1.getObject()).size() > 1)
        zzbf.zzac(zztI() + "Multiple macros active for macroName " + paramString);
    }
    zzbv localzzbv2 = zza(this.zzaAb, localzza, paramSet, paramzzbi.zztl());
    boolean bool;
    if ((localzzbv1.zztu()) && (localzzbv2.zztu()))
    {
      bool = true;
      if (localzzbv2 != zzazW)
        break label399;
    }
    label399: for (zzbv localzzbv3 = zzazW; ; localzzbv3 = new zzbv(localzzbv2.getObject(), bool))
    {
      zzd.zza localzza1 = localzza.zztK();
      if (localzzbv3.zztu())
        this.zzaAd.zze(paramString, new zzb(localzzbv3, localzza1));
      zza(localzza1, paramSet);
      this.zzaAh = (-1 + this.zzaAh);
      return localzzbv3;
      bool = false;
      break;
    }
  }

  private zzbv<zzd.zza> zza(Map<String, zzaj> paramMap, zzvl.zza paramzza, Set<String> paramSet, zzcg paramzzcg)
  {
    boolean bool1 = true;
    zzd.zza localzza = (zzd.zza)paramzza.zzuv().get(com.google.android.gms.internal.zzb.zzcU.toString());
    zzbv localzzbv1;
    if (localzza == null)
    {
      zzbf.zzZ("No function id in properties");
      localzzbv1 = zzazW;
    }
    String str;
    zzaj localzzaj;
    do
    {
      return localzzbv1;
      str = localzza.zzgA;
      localzzaj = (zzaj)paramMap.get(str);
      if (localzzaj == null)
      {
        zzbf.zzZ(str + " has no backing implementation.");
        return zzazW;
      }
      localzzbv1 = (zzbv)this.zzaAc.get(paramzza);
    }
    while ((localzzbv1 != null) && (!this.zzazY.zztg()));
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramzza.zzuv().entrySet().iterator();
    boolean bool2 = bool1;
    if (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      zzci localzzci = paramzzcg.zzde((String)localEntry.getKey());
      zzbv localzzbv3 = zza((zzd.zza)localEntry.getValue(), paramSet, localzzci.zze((zzd.zza)localEntry.getValue()));
      if (localzzbv3 == zzazW)
        return zzazW;
      if (localzzbv3.zztu())
        paramzza.zza((String)localEntry.getKey(), (zzd.zza)localzzbv3.getObject());
      for (boolean bool3 = bool2; ; bool3 = false)
      {
        localHashMap.put(localEntry.getKey(), localzzbv3.getObject());
        bool2 = bool3;
        break;
      }
    }
    if (!localzzaj.zzb(localHashMap.keySet()))
    {
      zzbf.zzZ("Incorrect keys for function " + str + " required " + localzzaj.zzti() + " had " + localHashMap.keySet());
      return zzazW;
    }
    if ((bool2) && (localzzaj.zzsD()));
    while (true)
    {
      zzbv localzzbv2 = new zzbv(localzzaj.zzH(localHashMap), bool1);
      if (bool1)
        this.zzaAc.zze(paramzza, localzzbv2);
      paramzzcg.zzd((zzd.zza)localzzbv2.getObject());
      return localzzbv2;
      bool1 = false;
    }
  }

  private zzbv<Set<zzvl.zza>> zza(Set<zzvl.zze> paramSet, Set<String> paramSet1, zza paramzza, zzcn paramzzcn)
  {
    HashSet localHashSet1 = new HashSet();
    HashSet localHashSet2 = new HashSet();
    Iterator localIterator = paramSet.iterator();
    boolean bool1 = true;
    if (localIterator.hasNext())
    {
      zzvl.zze localzze = (zzvl.zze)localIterator.next();
      zzcj localzzcj = paramzzcn.zzts();
      zzbv localzzbv = zza(localzze, paramSet1, localzzcj);
      if (((Boolean)localzzbv.getObject()).booleanValue())
        paramzza.zza(localzze, localHashSet1, localHashSet2, localzzcj);
      if ((bool1) && (localzzbv.zztu()));
      for (boolean bool2 = true; ; bool2 = false)
      {
        bool1 = bool2;
        break;
      }
    }
    localHashSet1.removeAll(localHashSet2);
    paramzzcn.zzc(localHashSet1);
    return new zzbv(localHashSet1, bool1);
  }

  private static String zza(zzvl.zza paramzza)
  {
    return zzde.zzg((zzd.zza)paramzza.zzuv().get(com.google.android.gms.internal.zzb.zzdf.toString()));
  }

  private void zza(zzd.zza paramzza, Set<String> paramSet)
  {
    if (paramzza == null);
    while (true)
    {
      return;
      zzbv localzzbv = zza(paramzza, paramSet, new zzbt());
      if (localzzbv != zzazW)
      {
        Object localObject1 = zzde.zzl((zzd.zza)localzzbv.getObject());
        if ((localObject1 instanceof Map))
        {
          Map localMap2 = (Map)localObject1;
          this.zzaxx.push(localMap2);
          return;
        }
        if (!(localObject1 instanceof List))
          break;
        Iterator localIterator = ((List)localObject1).iterator();
        while (localIterator.hasNext())
        {
          Object localObject2 = localIterator.next();
          if ((localObject2 instanceof Map))
          {
            Map localMap1 = (Map)localObject2;
            this.zzaxx.push(localMap1);
          }
          else
          {
            zzbf.zzac("pushAfterEvaluate: value not a Map");
          }
        }
      }
    }
    zzbf.zzac("pushAfterEvaluate: value not a Map or List");
  }

  private static void zza(List<zzvl.zza> paramList, List<String> paramList1, String paramString)
  {
    if (paramList.size() != paramList1.size())
      zzbf.zzaa("Invalid resource: imbalance of rule names of functions for " + paramString + " operation. Using default rule name instead");
  }

  private static void zza(Map<String, zzaj> paramMap, zzaj paramzzaj)
  {
    if (paramMap.containsKey(paramzzaj.zzth()))
      throw new IllegalArgumentException("Duplicate function type name: " + paramzzaj.zzth());
    paramMap.put(paramzzaj.zzth(), paramzzaj);
  }

  private static zzc zze(Map<String, zzc> paramMap, String paramString)
  {
    zzc localzzc = (zzc)paramMap.get(paramString);
    if (localzzc == null)
    {
      localzzc = new zzc();
      paramMap.put(paramString, localzzc);
    }
    return localzzc;
  }

  private String zztI()
  {
    if (this.zzaAh <= 1)
      return "";
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(Integer.toString(this.zzaAh));
    for (int i = 2; i < this.zzaAh; i++)
      localStringBuilder.append(' ');
    localStringBuilder.append(": ");
    return localStringBuilder.toString();
  }

  zzbv<Boolean> zza(zzvl.zza paramzza, Set<String> paramSet, zzcg paramzzcg)
  {
    zzbv localzzbv = zza(this.zzaAa, paramzza, paramSet, paramzzcg);
    Boolean localBoolean = zzde.zzk((zzd.zza)localzzbv.getObject());
    paramzzcg.zzd(zzde.zzx(localBoolean));
    return new zzbv(localBoolean, localzzbv.zztu());
  }

  zzbv<Boolean> zza(zzvl.zze paramzze, Set<String> paramSet, zzcj paramzzcj)
  {
    Iterator localIterator1 = paramzze.zzuD().iterator();
    boolean bool1 = true;
    if (localIterator1.hasNext())
    {
      zzbv localzzbv2 = zza((zzvl.zza)localIterator1.next(), paramSet, paramzzcj.zztm());
      if (((Boolean)localzzbv2.getObject()).booleanValue())
      {
        paramzzcj.zzf(zzde.zzx(Boolean.valueOf(false)));
        return new zzbv(Boolean.valueOf(false), localzzbv2.zztu());
      }
      if ((bool1) && (localzzbv2.zztu()));
      for (boolean bool2 = true; ; bool2 = false)
      {
        bool1 = bool2;
        break;
      }
    }
    Iterator localIterator2 = paramzze.zzuC().iterator();
    while (localIterator2.hasNext())
    {
      zzbv localzzbv1 = zza((zzvl.zza)localIterator2.next(), paramSet, paramzzcj.zztn());
      if (!((Boolean)localzzbv1.getObject()).booleanValue())
      {
        paramzzcj.zzf(zzde.zzx(Boolean.valueOf(false)));
        return new zzbv(Boolean.valueOf(false), localzzbv1.zztu());
      }
      if ((bool1) && (localzzbv1.zztu()))
        bool1 = true;
      else
        bool1 = false;
    }
    paramzzcj.zzf(zzde.zzx(Boolean.valueOf(true)));
    return new zzbv(Boolean.valueOf(true), bool1);
  }

  zzbv<Set<zzvl.zza>> zza(String paramString, Set<zzvl.zze> paramSet, final Map<zzvl.zze, List<zzvl.zza>> paramMap1, final Map<zzvl.zze, List<String>> paramMap2, final Map<zzvl.zze, List<zzvl.zza>> paramMap3, final Map<zzvl.zze, List<String>> paramMap4, Set<String> paramSet1, zzcn paramzzcn)
  {
    return zza(paramSet, paramSet1, new zza()
    {
      public void zza(zzvl.zze paramAnonymouszze, Set<zzvl.zza> paramAnonymousSet1, Set<zzvl.zza> paramAnonymousSet2, zzcj paramAnonymouszzcj)
      {
        List localList1 = (List)paramMap1.get(paramAnonymouszze);
        List localList2 = (List)paramMap2.get(paramAnonymouszze);
        if (localList1 != null)
        {
          paramAnonymousSet1.addAll(localList1);
          paramAnonymouszzcj.zzto().zzc(localList1, localList2);
        }
        List localList3 = (List)paramMap3.get(paramAnonymouszze);
        List localList4 = (List)paramMap4.get(paramAnonymouszze);
        if (localList3 != null)
        {
          paramAnonymousSet2.addAll(localList3);
          paramAnonymouszzcj.zztp().zzc(localList3, localList4);
        }
      }
    }
    , paramzzcn);
  }

  zzbv<Set<zzvl.zza>> zza(Set<zzvl.zze> paramSet, zzcn paramzzcn)
  {
    return zza(paramSet, new HashSet(), new zza()
    {
      public void zza(zzvl.zze paramAnonymouszze, Set<zzvl.zza> paramAnonymousSet1, Set<zzvl.zza> paramAnonymousSet2, zzcj paramAnonymouszzcj)
      {
        paramAnonymousSet1.addAll(paramAnonymouszze.zzuE());
        paramAnonymousSet2.addAll(paramAnonymouszze.zzuF());
        paramAnonymouszzcj.zztq().zzc(paramAnonymouszze.zzuE(), paramAnonymouszze.zzuJ());
        paramAnonymouszzcj.zztr().zzc(paramAnonymouszze.zzuF(), paramAnonymouszze.zzuK());
      }
    }
    , paramzzcn);
  }

  void zza(zzaj paramzzaj)
  {
    zza(this.zzaAb, paramzzaj);
  }

  void zzb(zzaj paramzzaj)
  {
    zza(this.zzazZ, paramzzaj);
  }

  void zzc(zzaj paramzzaj)
  {
    zza(this.zzaAa, paramzzaj);
  }

  public void zzcO(String paramString)
  {
    zzaf localzzaf;
    try
    {
      zzdj(paramString);
      localzzaf = this.zzazY.zzda(paramString);
      zzt localzzt = localzzaf.zzte();
      Iterator localIterator = ((Set)zza(this.zzaAe, localzzt.zzsX()).getObject()).iterator();
      while (localIterator.hasNext())
      {
        zzvl.zza localzza = (zzvl.zza)localIterator.next();
        zza(this.zzazZ, localzza, new HashSet(), localzzt.zzsW());
      }
    }
    finally
    {
    }
    localzzaf.zztf();
    zzdj(null);
  }

  public zzbv<zzd.zza> zzdi(String paramString)
  {
    this.zzaAh = 0;
    zzaf localzzaf = this.zzazY.zzcZ(paramString);
    zzbv localzzbv = zza(paramString, new HashSet(), localzzaf.zztd());
    localzzaf.zztf();
    return localzzbv;
  }

  void zzdj(String paramString)
  {
    try
    {
      this.zzaAg = paramString;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  String zztH()
  {
    try
    {
      String str = this.zzaAg;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void zzu(List<zzc.zzi> paramList)
  {
    while (true)
    {
      zzc.zzi localzzi;
      try
      {
        Iterator localIterator = paramList.iterator();
        if (!localIterator.hasNext())
          break;
        localzzi = (zzc.zzi)localIterator.next();
        if ((localzzi.name == null) || (!localzzi.name.startsWith("gaExperiment:")))
        {
          zzbf.zzab("Ignored supplemental: " + localzzi);
          continue;
        }
      }
      finally
      {
      }
      zzai.zza(this.zzaxx, localzzi);
    }
  }

  static abstract interface zza
  {
    public abstract void zza(zzvl.zze paramzze, Set<zzvl.zza> paramSet1, Set<zzvl.zza> paramSet2, zzcj paramzzcj);
  }

  private static class zzb
  {
    private zzbv<zzd.zza> zzaAn;
    private zzd.zza zzaAo;

    public zzb(zzbv<zzd.zza> paramzzbv, zzd.zza paramzza)
    {
      this.zzaAn = paramzzbv;
      this.zzaAo = paramzza;
    }

    public int getSize()
    {
      int i = ((zzd.zza)this.zzaAn.getObject()).zzvX();
      if (this.zzaAo == null);
      for (int j = 0; ; j = this.zzaAo.zzvX())
        return j + i;
    }

    public zzbv<zzd.zza> zztJ()
    {
      return this.zzaAn;
    }

    public zzd.zza zztK()
    {
      return this.zzaAo;
    }
  }

  private static class zzc
  {
    private final Set<zzvl.zze> zzaAe = new HashSet();
    private final Map<zzvl.zze, List<zzvl.zza>> zzaAp = new HashMap();
    private final Map<zzvl.zze, List<zzvl.zza>> zzaAq = new HashMap();
    private final Map<zzvl.zze, List<String>> zzaAr = new HashMap();
    private final Map<zzvl.zze, List<String>> zzaAs = new HashMap();
    private zzvl.zza zzaAt;

    public void zza(zzvl.zze paramzze)
    {
      this.zzaAe.add(paramzze);
    }

    public void zza(zzvl.zze paramzze, zzvl.zza paramzza)
    {
      Object localObject = (List)this.zzaAp.get(paramzze);
      if (localObject == null)
      {
        localObject = new ArrayList();
        this.zzaAp.put(paramzze, localObject);
      }
      ((List)localObject).add(paramzza);
    }

    public void zza(zzvl.zze paramzze, String paramString)
    {
      Object localObject = (List)this.zzaAr.get(paramzze);
      if (localObject == null)
      {
        localObject = new ArrayList();
        this.zzaAr.put(paramzze, localObject);
      }
      ((List)localObject).add(paramString);
    }

    public void zzb(zzvl.zza paramzza)
    {
      this.zzaAt = paramzza;
    }

    public void zzb(zzvl.zze paramzze, zzvl.zza paramzza)
    {
      Object localObject = (List)this.zzaAq.get(paramzze);
      if (localObject == null)
      {
        localObject = new ArrayList();
        this.zzaAq.put(paramzze, localObject);
      }
      ((List)localObject).add(paramzza);
    }

    public void zzb(zzvl.zze paramzze, String paramString)
    {
      Object localObject = (List)this.zzaAs.get(paramzze);
      if (localObject == null)
      {
        localObject = new ArrayList();
        this.zzaAs.put(paramzze, localObject);
      }
      ((List)localObject).add(paramString);
    }

    public Set<zzvl.zze> zztL()
    {
      return this.zzaAe;
    }

    public Map<zzvl.zze, List<zzvl.zza>> zztM()
    {
      return this.zzaAp;
    }

    public Map<zzvl.zze, List<String>> zztN()
    {
      return this.zzaAr;
    }

    public Map<zzvl.zze, List<String>> zztO()
    {
      return this.zzaAs;
    }

    public Map<zzvl.zze, List<zzvl.zza>> zztP()
    {
      return this.zzaAq;
    }

    public zzvl.zza zztQ()
    {
      return this.zzaAt;
    }
  }
}