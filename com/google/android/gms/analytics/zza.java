package com.google.android.gms.analytics;

import android.content.Context;
import android.text.TextUtils;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.ads.identifier.AdvertisingIdClient.Info;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzra;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Locale;

class zza
  implements zzq
{
  private final zzra zzAM;
  private final zzk zzAN;
  private AdvertisingIdClient.Info zzAO;
  private long zzAP;
  private String zzAQ;
  private boolean zzAR = false;
  private Object zzAS = new Object();

  zza(zzra paramzzra, zzk paramzzk)
  {
    zzx.zzl(paramzzra);
    zzx.zzl(paramzzk);
    this.zzAM = paramzzra;
    this.zzAN = paramzzk;
  }

  static String zzB(Context paramContext)
  {
    Object localObject = null;
    try
    {
      localFileInputStream = paramContext.openFileInput("gaClientIdData");
      byte[] arrayOfByte = new byte['\u0080'];
      int i = localFileInputStream.read(arrayOfByte, 0, 128);
      if (localFileInputStream.available() > 0)
      {
        zzae.zzac("Hash file seems corrupted, deleting it.");
        localFileInputStream.close();
        paramContext.deleteFile("gaClientIdData");
        return null;
      }
      if (i <= 0)
      {
        zzae.zzaa("Hash file is empty.");
        localFileInputStream.close();
        return null;
      }
      str = new String(arrayOfByte, 0, i);
    }
    catch (IOException localIOException1)
    {
      try
      {
        FileInputStream localFileInputStream;
        localFileInputStream.close();
        return str;
        localIOException1 = localIOException1;
        zzae.zzac("Error reading Hash file, deleting it.");
        paramContext.deleteFile("gaClientIdData");
        return localObject;
      }
      catch (IOException localIOException2)
      {
        while (true)
          localObject = str;
      }
      catch (FileNotFoundException localFileNotFoundException2)
      {
        String str;
        return str;
      }
    }
    catch (FileNotFoundException localFileNotFoundException1)
    {
    }
    return null;
  }

  private boolean zza(AdvertisingIdClient.Info paramInfo1, AdvertisingIdClient.Info paramInfo2)
  {
    if (paramInfo2 == null);
    for (Object localObject1 = null; TextUtils.isEmpty((CharSequence)localObject1); localObject1 = paramInfo2.getId())
      return true;
    String str1 = this.zzAN.getValue("&cid");
    String str3;
    while (true)
    {
      synchronized (this.zzAS)
      {
        if (!this.zzAR)
        {
          this.zzAQ = zzB(this.zzAM.getContext());
          this.zzAR = true;
          str3 = zzah((String)localObject1 + str1);
          if (!TextUtils.isEmpty(str3))
            break;
          return false;
        }
      }
      if (TextUtils.isEmpty(this.zzAQ))
      {
        String str2 = null;
        if (paramInfo1 == null);
        while (str2 == null)
        {
          boolean bool1 = zzai((String)localObject1 + str1);
          return bool1;
          str2 = paramInfo1.getId();
        }
        this.zzAQ = zzah(str2 + str1);
      }
    }
    if (str3.equals(this.zzAQ))
      return true;
    String str4;
    if (!TextUtils.isEmpty(this.zzAQ))
    {
      zzae.zzab("Resetting the client id because Advertising Id changed.");
      str4 = this.zzAN.zzfw();
      zzae.zzab("New client Id: " + str4);
    }
    while (true)
    {
      boolean bool2 = zzai((String)localObject1 + str4);
      return bool2;
      str4 = str1;
    }
  }

  static String zzah(String paramString)
  {
    MessageDigest localMessageDigest = zzan.zzav("MD5");
    if (localMessageDigest == null)
      return null;
    Locale localLocale = Locale.US;
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = new BigInteger(1, localMessageDigest.digest(paramString.getBytes()));
    return String.format(localLocale, "%032X", arrayOfObject);
  }

  private boolean zzai(String paramString)
  {
    try
    {
      String str = zzah(paramString);
      zzae.zzab("Storing hashed adid.");
      FileOutputStream localFileOutputStream = this.zzAM.getContext().openFileOutput("gaClientIdData", 0);
      localFileOutputStream.write(str.getBytes());
      localFileOutputStream.close();
      this.zzAQ = str;
      return true;
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      zzae.zzZ("Error creating hash file.");
      return false;
    }
    catch (IOException localIOException)
    {
      zzae.zzZ("Error writing to hash file.");
    }
    return false;
  }

  public String getValue(String paramString)
  {
    long l = System.currentTimeMillis();
    AdvertisingIdClient.Info localInfo;
    if (Math.abs(l - this.zzAP) > 1000L)
    {
      localInfo = zzeZ();
      if (!zza(this.zzAO, localInfo))
        break label74;
    }
    label74: for (this.zzAO = localInfo; ; this.zzAO = new AdvertisingIdClient.Info("", false))
    {
      this.zzAP = l;
      if (this.zzAO == null)
        break label116;
      if (!"&adid".equals(paramString))
        break;
      return this.zzAO.getId();
    }
    if ("&ate".equals(paramString))
    {
      if (this.zzAO.isLimitAdTrackingEnabled())
        return "0";
      return "1";
    }
    label116: return null;
  }

  AdvertisingIdClient.Info zzeZ()
  {
    try
    {
      AdvertisingIdClient.Info localInfo = AdvertisingIdClient.getAdvertisingIdInfo(this.zzAM.getContext());
      return localInfo;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      zzae.zzac("IllegalStateException getting Ad Id Info. If you would like to see Audience reports, please ensure that you have added '<meta-data android:name=\"com.google.android.gms.version\" android:value=\"@integer/google_play_services_version\" />' to your application manifest file. See http://goo.gl/naFqQk for details.");
      return null;
    }
    catch (GooglePlayServicesRepairableException localGooglePlayServicesRepairableException)
    {
      zzae.zzac("GooglePlayServicesRepairableException getting Ad Id Info");
      return null;
    }
    catch (IOException localIOException)
    {
      zzae.zzac("IOException getting Ad Id Info");
      return null;
    }
    catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException)
    {
      zzae.zzac("GooglePlayServicesNotAvailableException getting Ad Id Info");
      return null;
    }
    catch (Throwable localThrowable)
    {
      zzae.zzac("Unknown exception. Could not get the ad Id.");
    }
    return null;
  }
}