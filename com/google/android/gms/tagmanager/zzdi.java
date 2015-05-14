package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzd.zza;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

class zzdi
{
  private static zzbv<zzd.zza> zza(zzbv<zzd.zza> paramzzbv)
  {
    try
    {
      zzbv localzzbv = new zzbv(zzde.zzx(zzdv(zzde.zzg((zzd.zza)paramzzbv.getObject()))), paramzzbv.zztu());
      return localzzbv;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      zzbf.zzb("Escape URI: unsupported encoding", localUnsupportedEncodingException);
    }
    return paramzzbv;
  }

  private static zzbv<zzd.zza> zza(zzbv<zzd.zza> paramzzbv, int paramInt)
  {
    if (!zzn((zzd.zza)paramzzbv.getObject()))
    {
      zzbf.zzZ("Escaping can only be applied to strings.");
      return paramzzbv;
    }
    switch (paramInt)
    {
    default:
      zzbf.zzZ("Unsupported Value Escaping: " + paramInt);
      return paramzzbv;
    case 12:
    }
    return zza(paramzzbv);
  }

  static zzbv<zzd.zza> zza(zzbv<zzd.zza> paramzzbv, int[] paramArrayOfInt)
  {
    int i = paramArrayOfInt.length;
    for (int j = 0; j < i; j++)
      paramzzbv = zza(paramzzbv, paramArrayOfInt[j]);
    return paramzzbv;
  }

  static String zzdv(String paramString)
    throws UnsupportedEncodingException
  {
    return URLEncoder.encode(paramString, "UTF-8").replaceAll("\\+", "%20");
  }

  private static boolean zzn(zzd.zza paramzza)
  {
    return zzde.zzl(paramzza) instanceof String;
  }
}