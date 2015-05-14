package com.google.android.gms.internal;

import android.content.Context;
import com.google.ads.mediation.admob.AdMobAdapter;
import java.util.List;

@zzgi
public class zzgf extends zzgb
{
  private zzdr zzlD;
  private zzdk zzsf;
  private zzdi zzvW;
  protected zzdo zzvX;

  zzgf(Context paramContext, zzhe.zza paramzza, zzic paramzzic, zzdr paramzzdr, zzgc.zza paramzza1)
  {
    super(paramContext, paramzza, paramzzic, paramzza1);
    this.zzlD = paramzzdr;
    this.zzsf = paramzza.zzyt;
  }

  public void onStop()
  {
    synchronized (this.zzvM)
    {
      super.onStop();
      if (this.zzvW != null)
        this.zzvW.cancel();
      return;
    }
  }

  protected void zzg(long paramLong)
    throws zzgb.zza
  {
    synchronized (this.zzvM)
    {
      this.zzvW = new zzdi(this.mContext, this.zzvN.zzyy, this.zzlD, this.zzsf);
      this.zzvX = this.zzvW.zza(paramLong, 60000L);
      switch (this.zzvX.zzsK)
      {
      default:
        throw new zzgb.zza("Unexpected mediation result: " + this.zzvX.zzsK, 0);
      case 1:
      case 0:
      }
    }
    throw new zzgb.zza("No fill from any mediation ad networks.", 3);
  }

  protected zzhe zzt(int paramInt)
  {
    zzgo localzzgo = this.zzvN.zzyy;
    zzax localzzax = localzzgo.zzwn;
    zzic localzzic = this.zzmu;
    List localList1 = this.zzvO.zzst;
    List localList2 = this.zzvO.zzsu;
    List localList3 = this.zzvO.zzwK;
    int i = this.zzvO.orientation;
    long l = this.zzvO.zzsx;
    String str1 = localzzgo.zzwq;
    boolean bool = this.zzvO.zzwI;
    zzdj localzzdj;
    zzds localzzds;
    label111: String str2;
    label127: zzdk localzzdk;
    if (this.zzvX != null)
    {
      localzzdj = this.zzvX.zzsL;
      if (this.zzvX == null)
        break label245;
      localzzds = this.zzvX.zzsM;
      if (this.zzvX == null)
        break label251;
      str2 = this.zzvX.zzsN;
      localzzdk = this.zzsf;
      if (this.zzvX == null)
        break label261;
    }
    label261: for (zzdm localzzdm = this.zzvX.zzsO; ; localzzdm = null)
    {
      return new zzhe(localzzax, localzzic, localList1, paramInt, localList2, localList3, i, l, str1, bool, localzzdj, localzzds, str2, localzzdk, localzzdm, this.zzvO.zzwJ, this.zzvN.zzlV, this.zzvO.zzwH, this.zzvN.zzyv, this.zzvO.zzwM, this.zzvO.zzwN, this.zzvN.zzys, null, localzzgo.zzwD);
      localzzdj = null;
      break;
      label245: localzzds = null;
      break label111;
      label251: str2 = AdMobAdapter.class.getName();
      break label127;
    }
  }
}