package com.google.android.gms.cast;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.internal.zzjv;
import java.util.Locale;

public class LaunchOptions
  implements SafeParcelable
{
  public static final Parcelable.Creator<LaunchOptions> CREATOR = new zzc();
  private final int zzFG;
  private boolean zzIN;
  private String zzIO;

  public LaunchOptions()
  {
    this(1, false, zzjv.zzb(Locale.getDefault()));
  }

  LaunchOptions(int paramInt, boolean paramBoolean, String paramString)
  {
    this.zzFG = paramInt;
    this.zzIN = paramBoolean;
    this.zzIO = paramString;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    LaunchOptions localLaunchOptions;
    do
    {
      return true;
      if (!(paramObject instanceof LaunchOptions))
        return false;
      localLaunchOptions = (LaunchOptions)paramObject;
    }
    while ((this.zzIN == localLaunchOptions.zzIN) && (zzjv.zza(this.zzIO, localLaunchOptions.zzIO)));
    return false;
  }

  public String getLanguage()
  {
    return this.zzIO;
  }

  public boolean getRelaunchIfRunning()
  {
    return this.zzIN;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Boolean.valueOf(this.zzIN);
    arrayOfObject[1] = this.zzIO;
    return zzw.hashCode(arrayOfObject);
  }

  public void setLanguage(String paramString)
  {
    this.zzIO = paramString;
  }

  public void setRelaunchIfRunning(boolean paramBoolean)
  {
    this.zzIN = paramBoolean;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Boolean.valueOf(this.zzIN);
    arrayOfObject[1] = this.zzIO;
    return String.format("LaunchOptions(relaunchIfRunning=%b, language=%s)", arrayOfObject);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }

  public static final class Builder
  {
    private LaunchOptions zzIP = new LaunchOptions();

    public LaunchOptions build()
    {
      return this.zzIP;
    }

    public Builder setLocale(Locale paramLocale)
    {
      this.zzIP.setLanguage(zzjv.zzb(paramLocale));
      return this;
    }

    public Builder setRelaunchIfRunning(boolean paramBoolean)
    {
      this.zzIP.setRelaunchIfRunning(paramBoolean);
      return this;
    }
  }
}