package com.google.android.gms.internal;

import com.google.android.gms.tagmanager.zzbf;
import com.google.android.gms.tagmanager.zzde;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class zzvl
{
  private static zzd.zza zza(int paramInt, zzc.zzf paramzzf, zzd.zza[] paramArrayOfzza, Set<Integer> paramSet)
    throws zzvl.zzg
  {
    int i = 0;
    if (paramSet.contains(Integer.valueOf(paramInt)))
      zzdw("Value cycle detected.  Current value reference: " + paramInt + "." + "  Previous value references: " + paramSet + ".");
    zzd.zza localzza1 = (zzd.zza)zza(paramzzf.zzfG, paramInt, "values");
    if (paramArrayOfzza[paramInt] != null)
      return paramArrayOfzza[paramInt];
    paramSet.add(Integer.valueOf(paramInt));
    int j = localzza1.type;
    zzd.zza localzza2 = null;
    switch (j)
    {
    default:
    case 2:
    case 3:
    case 4:
    case 7:
    case 1:
    case 5:
    case 6:
    case 8:
    }
    while (true)
    {
      if (localzza2 == null)
        zzdw("Invalid value: " + localzza1);
      paramArrayOfzza[paramInt] = localzza2;
      paramSet.remove(Integer.valueOf(paramInt));
      return localzza2;
      zzc.zzh localzzh3 = zzp(localzza1);
      localzza2 = zzo(localzza1);
      localzza2.zzgw = new zzd.zza[localzzh3.zzgh.length];
      int[] arrayOfInt4 = localzzh3.zzgh;
      int i11 = arrayOfInt4.length;
      int i14;
      for (int i12 = 0; i < i11; i12 = i14)
      {
        int i13 = arrayOfInt4[i];
        zzd.zza[] arrayOfzza4 = localzza2.zzgw;
        i14 = i12 + 1;
        arrayOfzza4[i12] = zza(i13, paramzzf, paramArrayOfzza, paramSet);
        i++;
      }
      localzza2 = zzo(localzza1);
      zzc.zzh localzzh2 = zzp(localzza1);
      if (localzzh2.zzgi.length != localzzh2.zzgj.length)
        zzdw("Uneven map keys (" + localzzh2.zzgi.length + ") and map values (" + localzzh2.zzgj.length + ")");
      localzza2.zzgx = new zzd.zza[localzzh2.zzgi.length];
      localzza2.zzgy = new zzd.zza[localzzh2.zzgi.length];
      int[] arrayOfInt2 = localzzh2.zzgi;
      int i2 = arrayOfInt2.length;
      int i3 = 0;
      int i10;
      for (int i4 = 0; i3 < i2; i4 = i10)
      {
        int i9 = arrayOfInt2[i3];
        zzd.zza[] arrayOfzza3 = localzza2.zzgx;
        i10 = i4 + 1;
        arrayOfzza3[i4] = zza(i9, paramzzf, paramArrayOfzza, paramSet);
        i3++;
      }
      int[] arrayOfInt3 = localzzh2.zzgj;
      int i5 = arrayOfInt3.length;
      int i8;
      for (int i6 = 0; i < i5; i6 = i8)
      {
        int i7 = arrayOfInt3[i];
        zzd.zza[] arrayOfzza2 = localzza2.zzgy;
        i8 = i6 + 1;
        arrayOfzza2[i6] = zza(i7, paramzzf, paramArrayOfzza, paramSet);
        i++;
      }
      localzza2 = zzo(localzza1);
      localzza2.zzgz = zzde.zzg(zza(zzp(localzza1).zzgm, paramzzf, paramArrayOfzza, paramSet));
      continue;
      localzza2 = zzo(localzza1);
      zzc.zzh localzzh1 = zzp(localzza1);
      localzza2.zzgD = new zzd.zza[localzzh1.zzgl.length];
      int[] arrayOfInt1 = localzzh1.zzgl;
      int k = arrayOfInt1.length;
      int i1;
      for (int m = 0; i < k; m = i1)
      {
        int n = arrayOfInt1[i];
        zzd.zza[] arrayOfzza1 = localzza2.zzgD;
        i1 = m + 1;
        arrayOfzza1[m] = zza(n, paramzzf, paramArrayOfzza, paramSet);
        i++;
      }
      localzza2 = localzza1;
    }
  }

  private static zza zza(zzc.zzb paramzzb, zzc.zzf paramzzf, zzd.zza[] paramArrayOfzza, int paramInt)
    throws zzvl.zzg
  {
    zzb localzzb = zza.zzuu();
    int[] arrayOfInt = paramzzb.zzfq;
    int i = arrayOfInt.length;
    int j = 0;
    if (j < i)
    {
      Integer localInteger = Integer.valueOf(arrayOfInt[j]);
      zzc.zze localzze = (zzc.zze)zza(paramzzf.zzfH, localInteger.intValue(), "properties");
      String str = (String)zza(paramzzf.zzfF, localzze.key, "keys");
      zzd.zza localzza = (zzd.zza)zza(paramArrayOfzza, localzze.value, "values");
      if (zzb.zzec.toString().equals(str))
        localzzb.zzq(localzza);
      while (true)
      {
        j++;
        break;
        localzzb.zzb(str, localzza);
      }
    }
    return localzzb.zzuw();
  }

  private static zze zza(zzc.zzg paramzzg, List<zza> paramList1, List<zza> paramList2, List<zza> paramList3, zzc.zzf paramzzf)
  {
    zzf localzzf = zze.zzuB();
    int[] arrayOfInt1 = paramzzg.zzfV;
    int i = arrayOfInt1.length;
    for (int j = 0; j < i; j++)
      localzzf.zzd((zza)paramList3.get(Integer.valueOf(arrayOfInt1[j]).intValue()));
    int[] arrayOfInt2 = paramzzg.zzfW;
    int k = arrayOfInt2.length;
    for (int m = 0; m < k; m++)
      localzzf.zze((zza)paramList3.get(Integer.valueOf(arrayOfInt2[m]).intValue()));
    int[] arrayOfInt3 = paramzzg.zzfX;
    int n = arrayOfInt3.length;
    for (int i1 = 0; i1 < n; i1++)
      localzzf.zzf((zza)paramList1.get(Integer.valueOf(arrayOfInt3[i1]).intValue()));
    int[] arrayOfInt4 = paramzzg.zzfZ;
    int i2 = arrayOfInt4.length;
    for (int i3 = 0; i3 < i2; i3++)
    {
      Integer localInteger4 = Integer.valueOf(arrayOfInt4[i3]);
      localzzf.zzdz(paramzzf.zzfG[localInteger4.intValue()].zzgv);
    }
    int[] arrayOfInt5 = paramzzg.zzfY;
    int i4 = arrayOfInt5.length;
    for (int i5 = 0; i5 < i4; i5++)
      localzzf.zzg((zza)paramList1.get(Integer.valueOf(arrayOfInt5[i5]).intValue()));
    int[] arrayOfInt6 = paramzzg.zzga;
    int i6 = arrayOfInt6.length;
    for (int i7 = 0; i7 < i6; i7++)
    {
      Integer localInteger3 = Integer.valueOf(arrayOfInt6[i7]);
      localzzf.zzdA(paramzzf.zzfG[localInteger3.intValue()].zzgv);
    }
    int[] arrayOfInt7 = paramzzg.zzgb;
    int i8 = arrayOfInt7.length;
    for (int i9 = 0; i9 < i8; i9++)
      localzzf.zzh((zza)paramList2.get(Integer.valueOf(arrayOfInt7[i9]).intValue()));
    int[] arrayOfInt8 = paramzzg.zzgd;
    int i10 = arrayOfInt8.length;
    for (int i11 = 0; i11 < i10; i11++)
    {
      Integer localInteger2 = Integer.valueOf(arrayOfInt8[i11]);
      localzzf.zzdB(paramzzf.zzfG[localInteger2.intValue()].zzgv);
    }
    int[] arrayOfInt9 = paramzzg.zzgc;
    int i12 = arrayOfInt9.length;
    for (int i13 = 0; i13 < i12; i13++)
      localzzf.zzi((zza)paramList2.get(Integer.valueOf(arrayOfInt9[i13]).intValue()));
    int[] arrayOfInt10 = paramzzg.zzge;
    int i14 = arrayOfInt10.length;
    for (int i15 = 0; i15 < i14; i15++)
    {
      Integer localInteger1 = Integer.valueOf(arrayOfInt10[i15]);
      localzzf.zzdC(paramzzf.zzfG[localInteger1.intValue()].zzgv);
    }
    return localzzf.zzuM();
  }

  private static <T> T zza(T[] paramArrayOfT, int paramInt, String paramString)
    throws zzvl.zzg
  {
    if ((paramInt < 0) || (paramInt >= paramArrayOfT.length))
      zzdw("Index out of bounds detected: " + paramInt + " in " + paramString);
    return paramArrayOfT[paramInt];
  }

  public static zzc zzb(zzc.zzf paramzzf)
    throws zzvl.zzg
  {
    int i = 0;
    zzd.zza[] arrayOfzza = new zzd.zza[paramzzf.zzfG.length];
    for (int j = 0; j < paramzzf.zzfG.length; j++)
      zza(j, paramzzf, arrayOfzza, new HashSet(0));
    zzd localzzd = zzc.zzux();
    ArrayList localArrayList1 = new ArrayList();
    for (int k = 0; k < paramzzf.zzfJ.length; k++)
      localArrayList1.add(zza(paramzzf.zzfJ[k], paramzzf, arrayOfzza, k));
    ArrayList localArrayList2 = new ArrayList();
    for (int m = 0; m < paramzzf.zzfK.length; m++)
      localArrayList2.add(zza(paramzzf.zzfK[m], paramzzf, arrayOfzza, m));
    ArrayList localArrayList3 = new ArrayList();
    for (int n = 0; n < paramzzf.zzfI.length; n++)
    {
      zza localzza = zza(paramzzf.zzfI[n], paramzzf, arrayOfzza, n);
      localzzd.zzc(localzza);
      localArrayList3.add(localzza);
    }
    zzc.zzg[] arrayOfzzg = paramzzf.zzfL;
    int i1 = arrayOfzzg.length;
    while (i < i1)
    {
      localzzd.zzb(zza(arrayOfzzg[i], localArrayList1, localArrayList3, localArrayList2, paramzzf));
      i++;
    }
    localzzd.zzdy(paramzzf.version);
    localzzd.zzhk(paramzzf.zzfT);
    return localzzd.zzuA();
  }

  public static void zzc(InputStream paramInputStream, OutputStream paramOutputStream)
    throws IOException
  {
    byte[] arrayOfByte = new byte[1024];
    while (true)
    {
      int i = paramInputStream.read(arrayOfByte);
      if (i == -1)
        return;
      paramOutputStream.write(arrayOfByte, 0, i);
    }
  }

  private static void zzdw(String paramString)
    throws zzvl.zzg
  {
    zzbf.zzZ(paramString);
    throw new zzg(paramString);
  }

  public static zzd.zza zzo(zzd.zza paramzza)
  {
    zzd.zza localzza = new zzd.zza();
    localzza.type = paramzza.type;
    localzza.zzgE = ((int[])paramzza.zzgE.clone());
    if (paramzza.zzgF)
      localzza.zzgF = paramzza.zzgF;
    return localzza;
  }

  private static zzc.zzh zzp(zzd.zza paramzza)
    throws zzvl.zzg
  {
    if ((zzc.zzh)paramzza.zza(zzc.zzh.zzgf) == null)
      zzdw("Expected a ServingValue and didn't get one. Value is: " + paramzza);
    return (zzc.zzh)paramzza.zza(zzc.zzh.zzgf);
  }

  public static class zza
  {
    private final zzd.zza zzaAo;
    private final Map<String, zzd.zza> zzaCj;

    private zza(Map<String, zzd.zza> paramMap, zzd.zza paramzza)
    {
      this.zzaCj = paramMap;
      this.zzaAo = paramzza;
    }

    public static zzvl.zzb zzuu()
    {
      return new zzvl.zzb(null);
    }

    public String toString()
    {
      return "Properties: " + zzuv() + " pushAfterEvaluate: " + this.zzaAo;
    }

    public void zza(String paramString, zzd.zza paramzza)
    {
      this.zzaCj.put(paramString, paramzza);
    }

    public zzd.zza zztK()
    {
      return this.zzaAo;
    }

    public Map<String, zzd.zza> zzuv()
    {
      return Collections.unmodifiableMap(this.zzaCj);
    }
  }

  public static class zzb
  {
    private zzd.zza zzaAo;
    private final Map<String, zzd.zza> zzaCj = new HashMap();

    public zzb zzb(String paramString, zzd.zza paramzza)
    {
      this.zzaCj.put(paramString, paramzza);
      return this;
    }

    public zzb zzq(zzd.zza paramzza)
    {
      this.zzaAo = paramzza;
      return this;
    }

    public zzvl.zza zzuw()
    {
      return new zzvl.zza(this.zzaCj, this.zzaAo, null);
    }
  }

  public static class zzc
  {
    private final String zzYw;
    private final List<zzvl.zze> zzaCk;
    private final Map<String, List<zzvl.zza>> zzaCl;
    private final int zzaCm;

    private zzc(List<zzvl.zze> paramList, Map<String, List<zzvl.zza>> paramMap, String paramString, int paramInt)
    {
      this.zzaCk = Collections.unmodifiableList(paramList);
      this.zzaCl = Collections.unmodifiableMap(paramMap);
      this.zzYw = paramString;
      this.zzaCm = paramInt;
    }

    public static zzvl.zzd zzux()
    {
      return new zzvl.zzd(null);
    }

    public String getVersion()
    {
      return this.zzYw;
    }

    public String toString()
    {
      return "Rules: " + zzuy() + "  Macros: " + this.zzaCl;
    }

    public List<zzvl.zze> zzuy()
    {
      return this.zzaCk;
    }

    public Map<String, List<zzvl.zza>> zzuz()
    {
      return this.zzaCl;
    }
  }

  public static class zzd
  {
    private String zzYw = "";
    private final List<zzvl.zze> zzaCk = new ArrayList();
    private final Map<String, List<zzvl.zza>> zzaCl = new HashMap();
    private int zzaCm = 0;

    public zzd zzb(zzvl.zze paramzze)
    {
      this.zzaCk.add(paramzze);
      return this;
    }

    public zzd zzc(zzvl.zza paramzza)
    {
      String str = zzde.zzg((zzd.zza)paramzza.zzuv().get(zzb.zzdf.toString()));
      Object localObject = (List)this.zzaCl.get(str);
      if (localObject == null)
      {
        localObject = new ArrayList();
        this.zzaCl.put(str, localObject);
      }
      ((List)localObject).add(paramzza);
      return this;
    }

    public zzd zzdy(String paramString)
    {
      this.zzYw = paramString;
      return this;
    }

    public zzd zzhk(int paramInt)
    {
      this.zzaCm = paramInt;
      return this;
    }

    public zzvl.zzc zzuA()
    {
      return new zzvl.zzc(this.zzaCk, this.zzaCl, this.zzYw, this.zzaCm, null);
    }
  }

  public static class zze
  {
    private final List<zzvl.zza> zzaCn;
    private final List<zzvl.zza> zzaCo;
    private final List<zzvl.zza> zzaCp;
    private final List<zzvl.zza> zzaCq;
    private final List<zzvl.zza> zzaCr;
    private final List<zzvl.zza> zzaCs;
    private final List<String> zzaCt;
    private final List<String> zzaCu;
    private final List<String> zzaCv;
    private final List<String> zzaCw;

    private zze(List<zzvl.zza> paramList1, List<zzvl.zza> paramList2, List<zzvl.zza> paramList3, List<zzvl.zza> paramList4, List<zzvl.zza> paramList5, List<zzvl.zza> paramList6, List<String> paramList7, List<String> paramList8, List<String> paramList9, List<String> paramList10)
    {
      this.zzaCn = Collections.unmodifiableList(paramList1);
      this.zzaCo = Collections.unmodifiableList(paramList2);
      this.zzaCp = Collections.unmodifiableList(paramList3);
      this.zzaCq = Collections.unmodifiableList(paramList4);
      this.zzaCr = Collections.unmodifiableList(paramList5);
      this.zzaCs = Collections.unmodifiableList(paramList6);
      this.zzaCt = Collections.unmodifiableList(paramList7);
      this.zzaCu = Collections.unmodifiableList(paramList8);
      this.zzaCv = Collections.unmodifiableList(paramList9);
      this.zzaCw = Collections.unmodifiableList(paramList10);
    }

    public static zzvl.zzf zzuB()
    {
      return new zzvl.zzf(null);
    }

    public String toString()
    {
      return "Positive predicates: " + zzuC() + "  Negative predicates: " + zzuD() + "  Add tags: " + zzuE() + "  Remove tags: " + zzuF() + "  Add macros: " + zzuG() + "  Remove macros: " + zzuL();
    }

    public List<zzvl.zza> zzuC()
    {
      return this.zzaCn;
    }

    public List<zzvl.zza> zzuD()
    {
      return this.zzaCo;
    }

    public List<zzvl.zza> zzuE()
    {
      return this.zzaCp;
    }

    public List<zzvl.zza> zzuF()
    {
      return this.zzaCq;
    }

    public List<zzvl.zza> zzuG()
    {
      return this.zzaCr;
    }

    public List<String> zzuH()
    {
      return this.zzaCt;
    }

    public List<String> zzuI()
    {
      return this.zzaCu;
    }

    public List<String> zzuJ()
    {
      return this.zzaCv;
    }

    public List<String> zzuK()
    {
      return this.zzaCw;
    }

    public List<zzvl.zza> zzuL()
    {
      return this.zzaCs;
    }
  }

  public static class zzf
  {
    private final List<zzvl.zza> zzaCn = new ArrayList();
    private final List<zzvl.zza> zzaCo = new ArrayList();
    private final List<zzvl.zza> zzaCp = new ArrayList();
    private final List<zzvl.zza> zzaCq = new ArrayList();
    private final List<zzvl.zza> zzaCr = new ArrayList();
    private final List<zzvl.zza> zzaCs = new ArrayList();
    private final List<String> zzaCt = new ArrayList();
    private final List<String> zzaCu = new ArrayList();
    private final List<String> zzaCv = new ArrayList();
    private final List<String> zzaCw = new ArrayList();

    public zzf zzd(zzvl.zza paramzza)
    {
      this.zzaCn.add(paramzza);
      return this;
    }

    public zzf zzdA(String paramString)
    {
      this.zzaCw.add(paramString);
      return this;
    }

    public zzf zzdB(String paramString)
    {
      this.zzaCt.add(paramString);
      return this;
    }

    public zzf zzdC(String paramString)
    {
      this.zzaCu.add(paramString);
      return this;
    }

    public zzf zzdz(String paramString)
    {
      this.zzaCv.add(paramString);
      return this;
    }

    public zzf zze(zzvl.zza paramzza)
    {
      this.zzaCo.add(paramzza);
      return this;
    }

    public zzf zzf(zzvl.zza paramzza)
    {
      this.zzaCp.add(paramzza);
      return this;
    }

    public zzf zzg(zzvl.zza paramzza)
    {
      this.zzaCq.add(paramzza);
      return this;
    }

    public zzf zzh(zzvl.zza paramzza)
    {
      this.zzaCr.add(paramzza);
      return this;
    }

    public zzf zzi(zzvl.zza paramzza)
    {
      this.zzaCs.add(paramzza);
      return this;
    }

    public zzvl.zze zzuM()
    {
      return new zzvl.zze(this.zzaCn, this.zzaCo, this.zzaCp, this.zzaCq, this.zzaCr, this.zzaCs, this.zzaCt, this.zzaCu, this.zzaCv, this.zzaCw, null);
    }
  }

  public static class zzg extends Exception
  {
    public zzg(String paramString)
    {
      super();
    }
  }
}