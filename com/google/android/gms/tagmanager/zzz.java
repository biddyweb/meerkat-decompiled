package com.google.android.gms.tagmanager;

import android.content.Context;
import android.provider.Settings.Secure;
import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzz extends zzaj
{
  private static final String ID = zza.zzZ.toString();
  private final Context mContext;

  public zzz(Context paramContext)
  {
    super(ID, new String[0]);
    this.mContext = paramContext;
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    String str = zzal(this.mContext);
    if (str == null)
      return zzde.zzuf();
    return zzde.zzx(str);
  }

  protected String zzal(Context paramContext)
  {
    return Settings.Secure.getString(paramContext.getContentResolver(), "android_id");
  }

  public boolean zzsD()
  {
    return true;
  }
}