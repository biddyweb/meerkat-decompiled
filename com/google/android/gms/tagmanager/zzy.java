package com.google.android.gms.tagmanager;

import android.content.Context;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

class zzy
  implements zzaq
{
  private static final Object zzaxj = new Object();
  private static zzy zzayy;
  private zzcc zzaxM;
  private String zzayA;
  private zzar zzayB;
  private String zzayz;

  private zzy(Context paramContext)
  {
    this(zzas.zzam(paramContext), new zzcr());
  }

  zzy(zzar paramzzar, zzcc paramzzcc)
  {
    this.zzayB = paramzzar;
    this.zzaxM = paramzzcc;
  }

  public static zzaq zzak(Context paramContext)
  {
    synchronized (zzaxj)
    {
      if (zzayy == null)
        zzayy = new zzy(paramContext);
      zzy localzzy = zzayy;
      return localzzy;
    }
  }

  public boolean zzcY(String paramString)
  {
    if (!this.zzaxM.zzgv())
    {
      zzbf.zzac("Too many urls sent too quickly with the TagManagerSender, rate limiting invoked.");
      return false;
    }
    if ((this.zzayz != null) && (this.zzayA != null));
    try
    {
      paramString = this.zzayz + "?" + this.zzayA + "=" + URLEncoder.encode(paramString, "UTF-8");
      zzbf.zzab("Sending wrapped url hit: " + paramString);
      this.zzayB.zzdb(paramString);
      return true;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      zzbf.zzd("Error wrapping URL for testing.", localUnsupportedEncodingException);
    }
    return false;
  }
}