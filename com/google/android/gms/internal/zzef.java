package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;

@zzgi
public class zzef extends zzeg
{
  private final Context mContext;
  private final zzic zzmu;
  private final WindowManager zznu;
  private final zzbu zztF;
  DisplayMetrics zztG;
  private float zztH;
  int zztI = -1;
  int zztJ = -1;
  private int zztK;
  int zztL = -1;
  int zztM = -1;
  int zztN = -1;
  int zztO = -1;

  public zzef(zzic paramzzic, Context paramContext, zzbu paramzzbu)
  {
    super(paramzzic);
    this.zzmu = paramzzic;
    this.mContext = paramContext;
    this.zztF = paramzzbu;
    this.zznu = ((WindowManager)paramContext.getSystemService("window"));
  }

  private void zzcS()
  {
    this.zztG = new DisplayMetrics();
    Display localDisplay = this.zznu.getDefaultDisplay();
    localDisplay.getMetrics(this.zztG);
    this.zztH = this.zztG.density;
    this.zztK = localDisplay.getRotation();
  }

  private void zzcX()
  {
    int[] arrayOfInt = new int[2];
    this.zzmu.getLocationOnScreen(arrayOfInt);
    zzf(zzbe.zzbD().zzc(this.mContext, arrayOfInt[0]), zzbe.zzbD().zzc(this.mContext, arrayOfInt[1]));
  }

  private zzee zzda()
  {
    return new zzee.zza().zzo(this.zztF.zzbP()).zzn(this.zztF.zzbQ()).zzp(this.zztF.zzbU()).zzq(this.zztF.zzbR()).zzr(this.zztF.zzbS()).zzcR();
  }

  void zzcT()
  {
    this.zztI = zzbe.zzbD().zzb(this.zztG, this.zztG.widthPixels);
    this.zztJ = zzbe.zzbD().zzb(this.zztG, this.zztG.heightPixels);
    Activity localActivity = this.zzmu.zzeD();
    if ((localActivity == null) || (localActivity.getWindow() == null))
    {
      this.zztL = this.zztI;
      this.zztM = this.zztJ;
      return;
    }
    int[] arrayOfInt = zzab.zzaM().zzg(localActivity);
    this.zztL = zzbe.zzbD().zzb(this.zztG, arrayOfInt[0]);
    this.zztM = zzbe.zzbD().zzb(this.zztG, arrayOfInt[1]);
  }

  void zzcU()
  {
    if (this.zzmu.zzad().zzpb)
    {
      this.zztN = this.zztI;
      this.zztO = this.zztJ;
      return;
    }
    this.zzmu.measure(0, 0);
    this.zztN = zzbe.zzbD().zzc(this.mContext, this.zzmu.getMeasuredWidth());
    this.zztO = zzbe.zzbD().zzc(this.mContext, this.zzmu.getMeasuredHeight());
  }

  public void zzcV()
  {
    zzcS();
    zzcT();
    zzcU();
    zzcY();
    zzcZ();
    zzcX();
    zzcW();
  }

  void zzcW()
  {
    if (zzhx.zzA(2))
      zzhx.zzaa("Dispatching Ready Event.");
    zzI(this.zzmu.zzeJ().zzzH);
  }

  void zzcY()
  {
    zza(this.zztI, this.zztJ, this.zztL, this.zztM, this.zztH, this.zztK);
  }

  void zzcZ()
  {
    zzee localzzee = zzda();
    this.zzmu.zzb("onDeviceFeaturesReceived", localzzee.toJson());
  }

  public void zzf(int paramInt1, int paramInt2)
  {
    if ((this.mContext instanceof Activity));
    for (int i = zzab.zzaM().zzj((Activity)this.mContext)[0]; ; i = 0)
    {
      zzc(paramInt1, paramInt2 - i, this.zztN, this.zztO);
      this.zzmu.zzeG().zze(paramInt1, paramInt2);
      return;
    }
  }
}