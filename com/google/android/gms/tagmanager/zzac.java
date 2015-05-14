package com.google.android.gms.tagmanager;

import android.util.Base64;
import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.util.Map;

class zzac extends zzaj
{
  private static final String ID = zza.zzaa.toString();
  private static final String zzayC = zzb.zzbw.toString();
  private static final String zzayD = zzb.zzdH.toString();
  private static final String zzayE = zzb.zzde.toString();
  private static final String zzayF = zzb.zzdP.toString();

  public zzac()
  {
    super(str, arrayOfString);
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    zzd.zza localzza1 = (zzd.zza)paramMap.get(zzayC);
    if ((localzza1 == null) || (localzza1 == zzde.zzuf()))
      return zzde.zzuf();
    String str1 = zzde.zzg(localzza1);
    zzd.zza localzza2 = (zzd.zza)paramMap.get(zzayE);
    String str2;
    zzd.zza localzza3;
    String str3;
    if (localzza2 == null)
    {
      str2 = "text";
      localzza3 = (zzd.zza)paramMap.get(zzayF);
      if (localzza3 != null)
        break label165;
      str3 = "base16";
      label79: zzd.zza localzza4 = (zzd.zza)paramMap.get(zzayD);
      if ((localzza4 == null) || (!zzde.zzk(localzza4).booleanValue()))
        break label355;
    }
    label165: label328: label355: for (int i = 3; ; i = 2)
    {
      while (true)
      {
        byte[] arrayOfByte1;
        String str4;
        try
        {
          if ("text".equals(str2))
          {
            byte[] arrayOfByte2 = str1.getBytes();
            arrayOfByte1 = arrayOfByte2;
            if (!"base16".equals(str3))
              break label281;
            str4 = zzj.zze(arrayOfByte1);
            return zzde.zzx(str4);
            str2 = zzde.zzg(localzza2);
            break;
            str3 = zzde.zzg(localzza3);
            break label79;
          }
          if ("base16".equals(str2))
          {
            arrayOfByte1 = zzj.zzcL(str1);
            continue;
          }
          if ("base64".equals(str2))
          {
            arrayOfByte1 = Base64.decode(str1, i);
            continue;
          }
          if ("base64url".equals(str2))
          {
            arrayOfByte1 = Base64.decode(str1, i | 0x8);
            continue;
          }
          zzbf.zzZ("Encode: unknown input format: " + str2);
          zzd.zza localzza5 = zzde.zzuf();
          return localzza5;
        }
        catch (IllegalArgumentException localIllegalArgumentException)
        {
          zzbf.zzZ("Encode: invalid input:");
          return zzde.zzuf();
        }
        if ("base64".equals(str3))
        {
          str4 = Base64.encodeToString(arrayOfByte1, i);
        }
        else
        {
          if (!"base64url".equals(str3))
            break label328;
          str4 = Base64.encodeToString(arrayOfByte1, i | 0x8);
        }
      }
      zzbf.zzZ("Encode: unknown output format: " + str3);
      return zzde.zzuf();
    }
  }

  public boolean zzsD()
  {
    return true;
  }
}