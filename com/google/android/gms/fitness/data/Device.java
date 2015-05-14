package com.google.android.gms.fitness.data;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.provider.Settings.Secure;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zznz;

public final class Device
  implements SafeParcelable
{
  public static final Parcelable.Creator<Device> CREATOR = new zzi();
  public static final int TYPE_CHEST_STRAP = 4;
  public static final int TYPE_PHONE = 1;
  public static final int TYPE_SCALE = 5;
  public static final int TYPE_TABLET = 2;
  public static final int TYPE_UNKNOWN = 0;
  public static final int TYPE_WATCH = 3;
  private final int zzFG;
  private final int zzJp;
  private final String zzYw;
  private final String zzZe;
  private final String zzZf;
  private final String zzZg;
  private final int zzZh;

  Device(int paramInt1, String paramString1, String paramString2, String paramString3, String paramString4, int paramInt2, int paramInt3)
  {
    this.zzFG = paramInt1;
    this.zzZe = ((String)zzx.zzl(paramString1));
    this.zzZf = ((String)zzx.zzl(paramString2));
    this.zzYw = "";
    this.zzZg = ((String)zzx.zzl(paramString4));
    this.zzJp = paramInt2;
    this.zzZh = paramInt3;
  }

  public Device(String paramString1, String paramString2, String paramString3, int paramInt)
  {
    this(paramString1, paramString2, "", paramString3, paramInt, 0);
  }

  public Device(String paramString1, String paramString2, String paramString3, String paramString4, int paramInt)
  {
    this(paramString1, paramString2, paramString4, paramInt);
  }

  public Device(String paramString1, String paramString2, String paramString3, String paramString4, int paramInt1, int paramInt2)
  {
    this(1, paramString1, paramString2, "", paramString4, paramInt1, paramInt2);
  }

  public static Device getLocalDevice(Context paramContext)
  {
    int i = zzU(paramContext);
    String str = zzT(paramContext);
    return new Device(Build.MANUFACTURER, Build.MODEL, Build.VERSION.RELEASE, str, i, 2);
  }

  private static String zzT(Context paramContext)
  {
    return Settings.Secure.getString(paramContext.getContentResolver(), "android_id");
  }

  private static int zzU(Context paramContext)
  {
    int i = zzW(paramContext);
    int j = 0;
    switch (i)
    {
    default:
      if (zzY(paramContext))
        j = 1;
      break;
    case 8:
    case 9:
    case 10:
      boolean bool;
      do
      {
        return j;
        bool = zzV(paramContext);
        j = 0;
      }
      while (!bool);
      return 3;
    }
    return 2;
  }

  public static boolean zzV(Context paramContext)
  {
    return (0xF & paramContext.getResources().getConfiguration().uiMode) == 6;
  }

  private static int zzW(Context paramContext)
  {
    return 5 + zzX(paramContext) % 1000 / 100;
  }

  private static int zzX(Context paramContext)
  {
    try
    {
      int i = paramContext.getPackageManager().getPackageInfo("com.google.android.gms", 0).versionCode;
      return i;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      Log.w("Fitness", "Could not find package info for Google Play Services");
    }
    return -1;
  }

  private static boolean zzY(Context paramContext)
  {
    return ((TelephonyManager)paramContext.getSystemService("phone")).getPhoneType() != 0;
  }

  private boolean zza(Device paramDevice)
  {
    return (zzw.equal(this.zzZe, paramDevice.zzZe)) && (zzw.equal(this.zzZf, paramDevice.zzZf)) && (zzw.equal(this.zzYw, paramDevice.zzYw)) && (zzw.equal(this.zzZg, paramDevice.zzZg)) && (this.zzJp == paramDevice.zzJp) && (this.zzZh == paramDevice.zzZh);
  }

  private boolean zzlE()
  {
    return zzlD() == 1;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof Device)) && (zza((Device)paramObject)));
  }

  public String getManufacturer()
  {
    return this.zzZe;
  }

  public String getModel()
  {
    return this.zzZf;
  }

  String getStreamIdentifier()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.zzZe;
    arrayOfObject[1] = this.zzZf;
    arrayOfObject[2] = this.zzZg;
    return String.format("%s:%s:%s", arrayOfObject);
  }

  public int getType()
  {
    return this.zzJp;
  }

  public String getUid()
  {
    return this.zzZg;
  }

  public String getVersion()
  {
    return this.zzYw;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = this.zzZe;
    arrayOfObject[1] = this.zzZf;
    arrayOfObject[2] = this.zzYw;
    arrayOfObject[3] = this.zzZg;
    arrayOfObject[4] = Integer.valueOf(this.zzJp);
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = getStreamIdentifier();
    arrayOfObject[1] = this.zzYw;
    arrayOfObject[2] = Integer.valueOf(this.zzJp);
    arrayOfObject[3] = Integer.valueOf(this.zzZh);
    return String.format("Device{%s:%s:%s:%s}", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzi.zza(this, paramParcel, paramInt);
  }

  public int zzlD()
  {
    return this.zzZh;
  }

  public String zzlF()
  {
    if ((zznz.zzlM()) || (zzlE()))
      return this.zzZg;
    return zznz.zzbM(this.zzZg);
  }
}