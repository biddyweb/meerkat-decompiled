package com.google.android.gms.internal;

import java.util.Collections;
import java.util.List;
import org.json.JSONObject;

@zzgi
public class zzhe
{
  public final int errorCode;
  public final int orientation;
  public final zzdj zzsL;
  public final zzds zzsM;
  public final String zzsN;
  public final zzdm zzsO;
  public final List<String> zzst;
  public final List<String> zzsu;
  public final long zzsx;
  public final zzic zzuq;
  public final String zzwD;
  public final long zzwH;
  public final boolean zzwI;
  public final long zzwJ;
  public final List<String> zzwK;
  public final String zzwN;
  public final zzax zzwn;
  public final String zzwq;
  public final JSONObject zzys;
  public final zzdk zzyt;
  public final zzba zzyu;
  public final long zzyv;
  public final long zzyw;
  public final zzcn.zza zzyx;

  public zzhe(zzax paramzzax, zzic paramzzic, List<String> paramList1, int paramInt1, List<String> paramList2, List<String> paramList3, int paramInt2, long paramLong1, String paramString1, boolean paramBoolean, zzdj paramzzdj, zzds paramzzds, String paramString2, zzdk paramzzdk, zzdm paramzzdm, long paramLong2, zzba paramzzba, long paramLong3, long paramLong4, long paramLong5, String paramString3, JSONObject paramJSONObject, zzcn.zza paramzza, String paramString4)
  {
    this.zzwn = paramzzax;
    this.zzuq = paramzzic;
    List localList1;
    List localList2;
    if (paramList1 != null)
    {
      localList1 = Collections.unmodifiableList(paramList1);
      this.zzst = localList1;
      this.errorCode = paramInt1;
      if (paramList2 == null)
        break label187;
      localList2 = Collections.unmodifiableList(paramList2);
      label48: this.zzsu = localList2;
      if (paramList3 == null)
        break label193;
    }
    label187: label193: for (List localList3 = Collections.unmodifiableList(paramList3); ; localList3 = null)
    {
      this.zzwK = localList3;
      this.orientation = paramInt2;
      this.zzsx = paramLong1;
      this.zzwq = paramString1;
      this.zzwI = paramBoolean;
      this.zzsL = paramzzdj;
      this.zzsM = paramzzds;
      this.zzsN = paramString2;
      this.zzyt = paramzzdk;
      this.zzsO = paramzzdm;
      this.zzwJ = paramLong2;
      this.zzyu = paramzzba;
      this.zzwH = paramLong3;
      this.zzyv = paramLong4;
      this.zzyw = paramLong5;
      this.zzwN = paramString3;
      this.zzys = paramJSONObject;
      this.zzyx = paramzza;
      this.zzwD = paramString4;
      return;
      localList1 = null;
      break;
      localList2 = null;
      break label48;
    }
  }

  public zzhe(zza paramzza, zzic paramzzic, zzdj paramzzdj, zzds paramzzds, String paramString, zzdm paramzzdm, zzcn.zza paramzza1)
  {
    this(paramzza.zzyy.zzwn, paramzzic, paramzza.zzyz.zzst, paramzza.errorCode, paramzza.zzyz.zzsu, paramzza.zzyz.zzwK, paramzza.zzyz.orientation, paramzza.zzyz.zzsx, paramzza.zzyy.zzwq, paramzza.zzyz.zzwI, paramzzdj, paramzzds, paramString, paramzza.zzyt, paramzzdm, paramzza.zzyz.zzwJ, paramzza.zzlV, paramzza.zzyz.zzwH, paramzza.zzyv, paramzza.zzyw, paramzza.zzyz.zzwN, paramzza.zzys, paramzza1, paramzza.zzyy.zzwD);
  }

  public boolean zzba()
  {
    if ((this.zzuq == null) || (this.zzuq.zzeG() == null))
      return false;
    return this.zzuq.zzeG().zzba();
  }

  @zzgi
  public static final class zza
  {
    public final int errorCode;
    public final zzba zzlV;
    public final JSONObject zzys;
    public final zzdk zzyt;
    public final long zzyv;
    public final long zzyw;
    public final zzgo zzyy;
    public final zzgq zzyz;

    public zza(zzgo paramzzgo, zzgq paramzzgq, zzdk paramzzdk, zzba paramzzba, int paramInt, long paramLong1, long paramLong2, JSONObject paramJSONObject)
    {
      this.zzyy = paramzzgo;
      this.zzyz = paramzzgq;
      this.zzyt = paramzzdk;
      this.zzlV = paramzzba;
      this.errorCode = paramInt;
      this.zzyv = paramLong1;
      this.zzyw = paramLong2;
      this.zzys = paramJSONObject;
    }
  }
}