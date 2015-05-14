package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.ads.identifier.AdvertisingIdClient.Info;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import java.io.IOException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class zzj extends zzi
{
  private static AdvertisingIdClient zzkN = null;
  private static CountDownLatch zzkO = new CountDownLatch(1);
  private static boolean zzkP;

  protected zzj(Context paramContext, zzm paramzzm, zzn paramzzn)
  {
    super(paramContext, paramzzm, paramzzn);
  }

  public static zzj zza(String paramString, Context paramContext)
  {
    zze localzze = new zze();
    zza(paramString, paramContext, localzze);
    try
    {
      if (zzkN == null)
        new Thread(new zzb(paramContext)).start();
      return new zzj(paramContext, localzze, new zzp(239));
    }
    finally
    {
    }
  }

  protected void zzb(Context paramContext)
  {
    super.zzb(paramContext);
    try
    {
      if (zzkP)
      {
        zza(24, zzd(paramContext));
        return;
      }
      zza localzza1 = zzz();
      if (localzza1.isLimitAdTrackingEnabled())
      {
        l = 1L;
        zza(28, l);
        String str = localzza1.getId();
        if (str == null)
          return;
        zza(26, 5L);
        zza(24, str);
      }
    }
    catch (IOException localIOException)
    {
      while (true)
      {
        return;
        long l = 0L;
      }
    }
    catch (zzi.zza localzza)
    {
    }
  }

  zza zzz()
    throws IOException
  {
    int i = 0;
    try
    {
      if (!zzkO.await(2L, TimeUnit.SECONDS))
      {
        zza localzza2 = new zza(null, false);
        return localzza2;
      }
    }
    catch (InterruptedException localInterruptedException)
    {
      zza localzza1 = new zza(null, false);
      return localzza1;
    }
    finally
    {
    }
    if (zzkN == null)
    {
      zza localzza3 = new zza(null, false);
      return localzza3;
    }
    AdvertisingIdClient.Info localInfo = zzkN.getInfo();
    String str1 = localInfo.getId();
    byte[] arrayOfByte;
    if ((str1 != null) && (str1.matches("^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}$")))
    {
      arrayOfByte = new byte[16];
      int j = 0;
      while (i < str1.length())
      {
        if ((i == 8) || (i == 13) || (i == 18) || (i == 23))
          i++;
        arrayOfByte[j] = ((byte)((Character.digit(str1.charAt(i), 16) << 4) + Character.digit(str1.charAt(i + 1), 16)));
        j++;
        i += 2;
      }
    }
    for (String str2 = this.zzkx.zza(arrayOfByte, true); ; str2 = str1)
      return new zza(str2, localInfo.isLimitAdTrackingEnabled());
  }

  class zza
  {
    private String zzkQ;
    private boolean zzkR;

    public zza(String paramBoolean, boolean arg3)
    {
      this.zzkQ = paramBoolean;
      boolean bool;
      this.zzkR = bool;
    }

    public String getId()
    {
      return this.zzkQ;
    }

    public boolean isLimitAdTrackingEnabled()
    {
      return this.zzkR;
    }
  }

  private static final class zzb
    implements Runnable
  {
    private Context zzkT;

    public zzb(Context paramContext)
    {
      this.zzkT = paramContext.getApplicationContext();
      if (this.zzkT == null)
        this.zzkT = paramContext;
    }

    public void run()
    {
      try
      {
        AdvertisingIdClient localAdvertisingIdClient = new AdvertisingIdClient(this.zzkT);
        localAdvertisingIdClient.start();
        try
        {
          if (zzj.zzA() == null)
            zzj.zza(localAdvertisingIdClient);
          while (true)
          {
            label33: zzj.zzB().countDown();
            return;
            localAdvertisingIdClient.finish();
          }
        }
        finally
        {
        }
      }
      catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException)
      {
        while (true)
          zzj.zza(true);
      }
      catch (GooglePlayServicesRepairableException localGooglePlayServicesRepairableException)
      {
        break label33;
      }
      catch (IOException localIOException)
      {
        break label33;
      }
    }
  }
}