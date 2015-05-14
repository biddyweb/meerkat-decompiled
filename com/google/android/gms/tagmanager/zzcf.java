package com.google.android.gms.tagmanager;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.WindowManager;
import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzcf extends zzaj
{
  private static final String ID = zza.zzS.toString();
  private final Context mContext;

  public zzcf(Context paramContext)
  {
    super(ID, new String[0]);
    this.mContext = paramContext;
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    DisplayMetrics localDisplayMetrics = new DisplayMetrics();
    ((WindowManager)this.mContext.getSystemService("window")).getDefaultDisplay().getMetrics(localDisplayMetrics);
    int i = localDisplayMetrics.widthPixels;
    int j = localDisplayMetrics.heightPixels;
    return zzde.zzx(i + "x" + j);
  }

  public boolean zzsD()
  {
    return true;
  }
}