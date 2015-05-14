package com.google.android.gms.drive.metadata.internal;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.UserMetadata;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;

public class zzo extends zzj<UserMetadata>
{
  public zzo(String paramString, int paramInt)
  {
    super(paramString, zzbB(paramString), Collections.emptyList(), paramInt);
  }

  private String zzbA(String paramString)
  {
    return zzt(getName(), paramString);
  }

  private static Collection<String> zzbB(String paramString)
  {
    String[] arrayOfString = new String[5];
    arrayOfString[0] = zzt(paramString, "permissionId");
    arrayOfString[1] = zzt(paramString, "displayName");
    arrayOfString[2] = zzt(paramString, "picture");
    arrayOfString[3] = zzt(paramString, "isAuthenticatedUser");
    arrayOfString[4] = zzt(paramString, "emailAddress");
    return Arrays.asList(arrayOfString);
  }

  private static String zzt(String paramString1, String paramString2)
  {
    return paramString1 + "." + paramString2;
  }

  protected boolean zzb(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    return (paramDataHolder.zzba(zzbA("permissionId"))) && (!paramDataHolder.zzh(zzbA("permissionId"), paramInt1, paramInt2));
  }

  protected UserMetadata zzj(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    String str1 = paramDataHolder.zzc(zzbA("permissionId"), paramInt1, paramInt2);
    if (str1 != null)
    {
      String str2 = paramDataHolder.zzc(zzbA("displayName"), paramInt1, paramInt2);
      String str3 = paramDataHolder.zzc(zzbA("picture"), paramInt1, paramInt2);
      Boolean localBoolean = Boolean.valueOf(paramDataHolder.zzd(zzbA("isAuthenticatedUser"), paramInt1, paramInt2));
      String str4 = paramDataHolder.zzc(zzbA("emailAddress"), paramInt1, paramInt2);
      return new UserMetadata(str1, str2, str3, localBoolean.booleanValue(), str4);
    }
    return null;
  }
}