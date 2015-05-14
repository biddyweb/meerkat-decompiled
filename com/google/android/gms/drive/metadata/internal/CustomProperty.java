package com.google.android.gms.drive.metadata.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.metadata.CustomPropertyKey;

public class CustomProperty
  implements SafeParcelable
{
  public static final Parcelable.Creator<CustomProperty> CREATOR = new zzc();
  final String mValue;
  final int zzFG;
  final CustomPropertyKey zzVo;

  CustomProperty(int paramInt, CustomPropertyKey paramCustomPropertyKey, String paramString)
  {
    this.zzFG = paramInt;
    zzx.zzb(paramCustomPropertyKey, "key");
    this.zzVo = paramCustomPropertyKey;
    this.mValue = paramString;
  }

  public CustomProperty(CustomPropertyKey paramCustomPropertyKey, String paramString)
  {
    this(1, paramCustomPropertyKey, paramString);
  }

  public int describeContents()
  {
    return 0;
  }

  public String getValue()
  {
    return this.mValue;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }

  public CustomPropertyKey zzkX()
  {
    return this.zzVo;
  }
}