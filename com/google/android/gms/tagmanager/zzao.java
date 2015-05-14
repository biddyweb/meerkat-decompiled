package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

class zzao extends zzaj
{
  private static final String ID = zza.zzac.toString();
  private static final String zzayC = zzb.zzbw.toString();
  private static final String zzayE = zzb.zzde.toString();
  private static final String zzayI = zzb.zzbn.toString();

  public zzao()
  {
    super(str, arrayOfString);
  }

  private byte[] zze(String paramString, byte[] paramArrayOfByte)
    throws NoSuchAlgorithmException
  {
    MessageDigest localMessageDigest = MessageDigest.getInstance(paramString);
    localMessageDigest.update(paramArrayOfByte);
    return localMessageDigest.digest();
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    zzd.zza localzza1 = (zzd.zza)paramMap.get(zzayC);
    if ((localzza1 == null) || (localzza1 == zzde.zzuf()))
      return zzde.zzuf();
    String str1 = zzde.zzg(localzza1);
    zzd.zza localzza2 = (zzd.zza)paramMap.get(zzayI);
    String str2;
    if (localzza2 == null)
      str2 = "MD5";
    while (true)
    {
      zzd.zza localzza3 = (zzd.zza)paramMap.get(zzayE);
      String str3;
      label79: byte[] arrayOfByte;
      if (localzza3 == null)
      {
        str3 = "text";
        if (!"text".equals(str3))
          break label134;
        arrayOfByte = str1.getBytes();
      }
      try
      {
        while (true)
        {
          zzd.zza localzza4 = zzde.zzx(zzj.zze(zze(str2, arrayOfByte)));
          return localzza4;
          str2 = zzde.zzg(localzza2);
          break;
          str3 = zzde.zzg(localzza3);
          break label79;
          label134: if (!"base16".equals(str3))
            break label153;
          arrayOfByte = zzj.zzcL(str1);
        }
        label153: zzbf.zzZ("Hash: unknown input format: " + str3);
        return zzde.zzuf();
      }
      catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
      {
        zzbf.zzZ("Hash: unknown algorithm: " + str2);
      }
    }
    return zzde.zzuf();
  }

  public boolean zzsD()
  {
    return true;
  }
}