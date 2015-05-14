package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.appindexing.AppIndexApi.AppIndexingLink;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.zip.CRC32;

public class zzjb
  implements SafeParcelable
{
  public static final zzjc CREATOR = new zzjc();
  final int zzFG;
  final boolean zzGA;
  int zzGB;
  final zzip zzGw;
  final long zzGx;
  final int zzGy;
  final zzin zzGz;
  public final String zzpZ;

  zzjb(int paramInt1, zzip paramzzip, long paramLong, int paramInt2, String paramString, zzin paramzzin, boolean paramBoolean, int paramInt3)
  {
    this.zzFG = paramInt1;
    this.zzGw = paramzzip;
    this.zzGx = paramLong;
    this.zzGy = paramInt2;
    this.zzpZ = paramString;
    this.zzGz = paramzzin;
    this.zzGA = paramBoolean;
    this.zzGB = paramInt3;
  }

  public zzjb(zzip paramzzip, long paramLong, int paramInt)
  {
    this(1, paramzzip, paramLong, paramInt, null, null, false, -1);
  }

  public zzjb(zzip paramzzip, long paramLong, int paramInt1, String paramString, zzin paramzzin, boolean paramBoolean, int paramInt2)
  {
    this(1, paramzzip, paramLong, paramInt1, paramString, paramzzin, paramBoolean, paramInt2);
  }

  public zzjb(String paramString1, Intent paramIntent, String paramString2, Uri paramUri, String paramString3, List<AppIndexApi.AppIndexingLink> paramList)
  {
    this(1, zza(paramString1, paramIntent), System.currentTimeMillis(), 0, null, zza(paramIntent, paramString2, paramUri, paramString3, paramList).zzgU(), false, -1);
  }

  public static zzin.zza zza(Intent paramIntent, String paramString1, Uri paramUri, String paramString2, List<AppIndexApi.AppIndexingLink> paramList)
  {
    zzin.zza localzza = new zzin.zza();
    localzza.zza(zzaB(paramString1));
    if (paramUri != null)
      localzza.zza(zzh(paramUri));
    if (paramList != null)
      localzza.zza(zzd(paramList));
    String str1 = paramIntent.getAction();
    if (str1 != null)
      localzza.zza(zzm("intent_action", str1));
    String str2 = paramIntent.getDataString();
    if (str2 != null)
      localzza.zza(zzm("intent_data", str2));
    ComponentName localComponentName = paramIntent.getComponent();
    if (localComponentName != null)
      localzza.zza(zzm("intent_activity", localComponentName.getClassName()));
    Bundle localBundle = paramIntent.getExtras();
    if (localBundle != null)
    {
      String str3 = localBundle.getString("intent_extra_data_key");
      if (str3 != null)
        localzza.zza(zzm("intent_extra_data", str3));
    }
    return localzza.zzax(paramString2).zzH(true);
  }

  public static zzip zza(String paramString, Intent paramIntent)
  {
    return zzl(paramString, zzg(paramIntent));
  }

  private static zzir zzaB(String paramString)
  {
    return new zzir(paramString, new zziz.zza("title").zzW(1).zzJ(true).zzaA("name").zzgX(), "text1");
  }

  private static zzir zzd(List<AppIndexApi.AppIndexingLink> paramList)
  {
    zzop.zza localzza = new zzop.zza();
    zzop.zza.zza[] arrayOfzza = new zzop.zza.zza[paramList.size()];
    for (int i = 0; i < arrayOfzza.length; i++)
    {
      arrayOfzza[i] = new zzop.zza.zza();
      AppIndexApi.AppIndexingLink localAppIndexingLink = (AppIndexApi.AppIndexingLink)paramList.get(i);
      arrayOfzza[i].zzalg = localAppIndexingLink.appIndexingUrl.toString();
      arrayOfzza[i].viewId = localAppIndexingLink.viewId;
      if (localAppIndexingLink.webUrl != null)
        arrayOfzza[i].zzalh = localAppIndexingLink.webUrl.toString();
    }
    localzza.zzale = arrayOfzza;
    return new zzir(zzwy.zzf(localzza), new zziz.zza("outlinks").zzI(true).zzaA(".private:outLinks").zzaz("blob").zzgX());
  }

  private static String zzg(Intent paramIntent)
  {
    String str = paramIntent.toUri(1);
    CRC32 localCRC32 = new CRC32();
    try
    {
      localCRC32.update(str.getBytes("UTF-8"));
      return Long.toHexString(localCRC32.getValue());
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new IllegalStateException(localUnsupportedEncodingException);
    }
  }

  private static zzir zzh(Uri paramUri)
  {
    return new zzir(paramUri.toString(), new zziz.zza("web_url").zzW(4).zzI(true).zzaA("url").zzgX());
  }

  private static zzip zzl(String paramString1, String paramString2)
  {
    return new zzip(paramString1, "", paramString2);
  }

  private static zzir zzm(String paramString1, String paramString2)
  {
    return new zzir(paramString2, new zziz.zza(paramString1).zzI(true).zzgX(), paramString1);
  }

  public int describeContents()
  {
    return 0;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.zzGw;
    arrayOfObject[1] = Long.valueOf(this.zzGx);
    arrayOfObject[2] = Integer.valueOf(this.zzGy);
    return String.format("UsageInfo[documentId=%s, timestamp=%d, usageType=%d]", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzjc.zza(this, paramParcel, paramInt);
  }
}