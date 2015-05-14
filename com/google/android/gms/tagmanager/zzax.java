package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.io.UnsupportedEncodingException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

class zzax extends zzaj
{
  private static final String ID = zza.zzae.toString();
  private static final String zzayC = zzb.zzbw.toString();
  private static final String zzayU = zzb.zzdi.toString();
  private static final String zzayV = zzb.zzdm.toString();
  private static final String zzayW = zzb.zzcH.toString();

  public zzax()
  {
    super(str, arrayOfString);
  }

  private String zza(String paramString, zza paramzza, Set<Character> paramSet)
  {
    switch (1.zzayX[paramzza.ordinal()])
    {
    default:
      return paramString;
    case 1:
      try
      {
        String str4 = zzdi.zzdv(paramString);
        return str4;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        zzbf.zzb("Joiner: unsupported encoding", localUnsupportedEncodingException);
        return paramString;
      }
    case 2:
    }
    String str1 = paramString.replace("\\", "\\\\");
    Iterator localIterator = paramSet.iterator();
    String str3;
    for (String str2 = str1; localIterator.hasNext(); str2 = str2.replace(str3, "\\" + str3))
      str3 = ((Character)localIterator.next()).toString();
    return str2;
  }

  private void zza(StringBuilder paramStringBuilder, String paramString, zza paramzza, Set<Character> paramSet)
  {
    paramStringBuilder.append(zza(paramString, paramzza, paramSet));
  }

  private void zza(Set<Character> paramSet, String paramString)
  {
    for (int i = 0; i < paramString.length(); i++)
      paramSet.add(Character.valueOf(paramString.charAt(i)));
  }

  public zzd.zza zzH(Map<String, zzd.zza> paramMap)
  {
    zzd.zza localzza1 = (zzd.zza)paramMap.get(zzayC);
    if (localzza1 == null)
      return zzde.zzuf();
    zzd.zza localzza2 = (zzd.zza)paramMap.get(zzayU);
    String str1;
    String str2;
    label70: zza localzza4;
    String str5;
    zza localzza6;
    Object localObject;
    if (localzza2 != null)
    {
      str1 = zzde.zzg(localzza2);
      zzd.zza localzza3 = (zzd.zza)paramMap.get(zzayV);
      if (localzza3 == null)
        break label186;
      str2 = zzde.zzg(localzza3);
      localzza4 = zza.zzayY;
      zzd.zza localzza5 = (zzd.zza)paramMap.get(zzayW);
      if (localzza5 == null)
        break label432;
      str5 = zzde.zzg(localzza5);
      if (!"url".equals(str5))
        break label193;
      localzza6 = zza.zzayZ;
      localObject = null;
    }
    while (true)
    {
      label119: StringBuilder localStringBuilder = new StringBuilder();
      switch (localzza1.type)
      {
      default:
        zza(localStringBuilder, zzde.zzg(localzza1), localzza6, (Set)localObject);
      case 2:
      case 3:
      }
      while (true)
      {
        return zzde.zzx(localStringBuilder.toString());
        str1 = "";
        break;
        label186: str2 = "=";
        break label70;
        label193: if ("backslash".equals(str5))
        {
          localzza6 = zza.zzaza;
          localObject = new HashSet();
          zza((Set)localObject, str1);
          zza((Set)localObject, str2);
          ((Set)localObject).remove(Character.valueOf('\\'));
          break label119;
        }
        zzbf.zzZ("Joiner: unsupported escape type: " + str5);
        return zzde.zzuf();
        int j = 1;
        zzd.zza[] arrayOfzza = localzza1.zzgw;
        int k = arrayOfzza.length;
        int m = 0;
        while (m < k)
        {
          zzd.zza localzza7 = arrayOfzza[m];
          if (j == 0)
            localStringBuilder.append(str1);
          zza(localStringBuilder, zzde.zzg(localzza7), localzza6, (Set)localObject);
          m++;
          j = 0;
        }
        for (int i = 0; i < localzza1.zzgx.length; i++)
        {
          if (i > 0)
            localStringBuilder.append(str1);
          String str3 = zzde.zzg(localzza1.zzgx[i]);
          String str4 = zzde.zzg(localzza1.zzgy[i]);
          zza(localStringBuilder, str3, localzza6, (Set)localObject);
          localStringBuilder.append(str2);
          zza(localStringBuilder, str4, localzza6, (Set)localObject);
        }
      }
      label432: localzza6 = localzza4;
      localObject = null;
    }
  }

  public boolean zzsD()
  {
    return true;
  }

  private static enum zza
  {
    static
    {
      zza[] arrayOfzza = new zza[3];
      arrayOfzza[0] = zzayY;
      arrayOfzza[1] = zzayZ;
      arrayOfzza[2] = zzaza;
    }
  }
}