package com.google.android.gms.internal;

import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataSource.Builder;
import com.google.android.gms.fitness.data.Device;

public class zznz
{
  private static final ThreadLocal<String> zzZY = new ThreadLocal();

  private static Device zzb(Device paramDevice)
  {
    return new Device(zzbM(paramDevice.getManufacturer()), zzbM(paramDevice.getModel()), zzbM(paramDevice.getVersion()), paramDevice.getUid(), paramDevice.getType());
  }

  public static String zzbM(String paramString)
  {
    return zzu(paramString, (String)zzZY.get());
  }

  public static DataSource zzc(DataSource paramDataSource)
  {
    String str = (String)zzZY.get();
    if ((zzlM()) || (str.equals(paramDataSource.getAppPackageName())))
      return paramDataSource;
    return zzd(paramDataSource);
  }

  private static DataSource zzd(DataSource paramDataSource)
  {
    if (paramDataSource.getDevice() == null);
    for (Device localDevice = null; ; localDevice = zzb(paramDataSource.getDevice()))
      return new DataSource.Builder().setDataType(paramDataSource.getDataType()).setName(paramDataSource.getName()).setType(paramDataSource.getType()).setDevice(localDevice).zzb(paramDataSource.zzlz()).setStreamName(paramDataSource.getStreamName()).build();
  }

  public static boolean zzlM()
  {
    String str = (String)zzZY.get();
    return (str == null) || (str.startsWith("com.google"));
  }

  private static String zzu(String paramString1, String paramString2)
  {
    if ((paramString1 == null) || (paramString2 == null))
      return paramString1;
    byte[] arrayOfByte = new byte[paramString1.length() + paramString2.length()];
    System.arraycopy(paramString1.getBytes(), 0, arrayOfByte, 0, paramString1.length());
    System.arraycopy(paramString2.getBytes(), 0, arrayOfByte, paramString1.length(), paramString2.length());
    return Integer.toHexString(zzmc.zza(arrayOfByte, 0, arrayOfByte.length, 0));
  }
}