package com.google.android.gms.fitness.data;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.safeparcel.zzc;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zznz;
import com.google.android.gms.internal.zzxc.zzc;

public class DataSource
  implements SafeParcelable
{
  public static final Parcelable.Creator<DataSource> CREATOR = new zzg();
  public static final String EXTRA_DATA_SOURCE = "vnd.google.fitness.data_source";
  public static final int TYPE_DERIVED = 1;
  public static final int TYPE_RAW;
  private final String mName;
  private final int zzFG;
  private final int zzJp;
  private final Device zzYO;
  private final zza zzYP;
  private final String zzYQ;
  private final String zzYR;
  private final DataType zzYo;

  DataSource(int paramInt1, DataType paramDataType, String paramString1, int paramInt2, Device paramDevice, zza paramzza, String paramString2)
  {
    this.zzFG = paramInt1;
    this.zzYo = paramDataType;
    this.zzJp = paramInt2;
    this.mName = paramString1;
    this.zzYO = paramDevice;
    this.zzYP = paramzza;
    this.zzYQ = paramString2;
    this.zzYR = zzlA();
  }

  private DataSource(Builder paramBuilder)
  {
    this.zzFG = 3;
    this.zzYo = Builder.zza(paramBuilder);
    this.zzJp = Builder.zzb(paramBuilder);
    this.mName = Builder.zzc(paramBuilder);
    this.zzYO = Builder.zzd(paramBuilder);
    this.zzYP = Builder.zze(paramBuilder);
    this.zzYQ = Builder.zzf(paramBuilder);
    this.zzYR = zzlA();
  }

  public static DataSource extract(Intent paramIntent)
  {
    if (paramIntent == null)
      return null;
    return (DataSource)zzc.zza(paramIntent, "vnd.google.fitness.data_source", CREATOR);
  }

  private String getTypeString()
  {
    switch (this.zzJp)
    {
    default:
      throw new IllegalArgumentException("invalid type value");
    case 0:
      return "raw";
    case 1:
    }
    return "derived";
  }

  private boolean zza(DataSource paramDataSource)
  {
    return this.zzYR.equals(paramDataSource.zzYR);
  }

  private String zzlA()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(getTypeString());
    localStringBuilder.append(":").append(this.zzYo.getName());
    if (this.zzYP != null)
      localStringBuilder.append(":").append(this.zzYP.getPackageName());
    if (this.zzYO != null)
      localStringBuilder.append(":").append(this.zzYO.getStreamIdentifier());
    if (this.zzYQ != null)
      localStringBuilder.append(":").append(this.zzYQ);
    return localStringBuilder.toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return (this == paramObject) || (((paramObject instanceof DataSource)) && (zza((DataSource)paramObject)));
  }

  public String getAppPackageName()
  {
    if (this.zzYP == null)
      return null;
    return this.zzYP.getPackageName();
  }

  public DataType getDataType()
  {
    return this.zzYo;
  }

  public Device getDevice()
  {
    return this.zzYO;
  }

  public String getName()
  {
    return this.mName;
  }

  public String getStreamIdentifier()
  {
    return this.zzYR;
  }

  public String getStreamName()
  {
    return this.zzYQ;
  }

  public int getType()
  {
    return this.zzJp;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    return this.zzYR.hashCode();
  }

  public String toDebugString()
  {
    StringBuilder localStringBuilder1 = new StringBuilder();
    String str1;
    String str2;
    label50: String str3;
    label107: StringBuilder localStringBuilder4;
    if (this.zzJp == 0)
    {
      str1 = "r";
      StringBuilder localStringBuilder2 = localStringBuilder1.append(str1).append(":").append(this.zzYo.zzlB());
      if (this.zzYP != null)
        break label164;
      str2 = "";
      StringBuilder localStringBuilder3 = localStringBuilder2.append(str2);
      if (this.zzYO == null)
        break label214;
      str3 = ":" + this.zzYO.getModel() + ":" + this.zzYO.getUid();
      localStringBuilder4 = localStringBuilder3.append(str3);
      if (this.zzYQ == null)
        break label221;
    }
    label164: label214: label221: for (String str4 = ":" + this.zzYQ; ; str4 = "")
    {
      return str4;
      str1 = "d";
      break;
      if (this.zzYP.equals(zza.zzYv))
      {
        str2 = ":gms";
        break label50;
      }
      str2 = ":" + this.zzYP.getPackageName();
      break label50;
      str3 = "";
      break label107;
    }
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("DataSource{");
    localStringBuilder.append(getTypeString());
    if (this.mName != null)
      localStringBuilder.append(":").append(this.mName);
    if (this.zzYP != null)
      localStringBuilder.append(":").append(this.zzYP);
    if (this.zzYO != null)
      localStringBuilder.append(":").append(this.zzYO);
    if (this.zzYQ != null)
      localStringBuilder.append(":").append(this.zzYQ);
    localStringBuilder.append(":").append(this.zzYo);
    return "}";
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzg.zza(zznz.zzc(this), paramParcel, paramInt);
  }

  public zzxc.zzc zzly()
  {
    if (getDataType() == null)
      return null;
    return getDataType().zzlC();
  }

  public zza zzlz()
  {
    return this.zzYP;
  }

  public static final class Builder
  {
    private String mName;
    private int zzJp = -1;
    private Device zzYO;
    private zza zzYP;
    private String zzYQ = "";
    private DataType zzYo;

    public DataSource build()
    {
      boolean bool1 = true;
      boolean bool2;
      if (this.zzYo != null)
      {
        bool2 = bool1;
        zzx.zza(bool2, "Must set data type");
        if (this.zzJp < 0)
          break label45;
      }
      while (true)
      {
        zzx.zza(bool1, "Must set data source type");
        return new DataSource(this, null);
        bool2 = false;
        break;
        label45: bool1 = false;
      }
    }

    public Builder setAppPackageName(Context paramContext)
    {
      return setAppPackageName(paramContext.getPackageName());
    }

    public Builder setAppPackageName(String paramString)
    {
      this.zzYP = zza.zzbI(paramString);
      return this;
    }

    public Builder setDataType(DataType paramDataType)
    {
      this.zzYo = paramDataType;
      return this;
    }

    public Builder setDevice(Device paramDevice)
    {
      this.zzYO = paramDevice;
      return this;
    }

    public Builder setName(String paramString)
    {
      this.mName = paramString;
      return this;
    }

    @Deprecated
    public Builder setObfuscated(boolean paramBoolean)
    {
      return this;
    }

    public Builder setStreamName(String paramString)
    {
      if (paramString != null);
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, "Must specify a valid stream name");
        this.zzYQ = paramString;
        return this;
      }
    }

    public Builder setType(int paramInt)
    {
      this.zzJp = paramInt;
      return this;
    }

    public Builder zzb(zza paramzza)
    {
      this.zzYP = paramzza;
      return this;
    }
  }
}