package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Locale;

public class FieldWithSortOrder
  implements SafeParcelable
{
  public static final zzc CREATOR = new zzc();
  final int zzFG;
  final String zzVg;
  final boolean zzWz;

  FieldWithSortOrder(int paramInt, String paramString, boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzVg = paramString;
    this.zzWz = paramBoolean;
  }

  public FieldWithSortOrder(String paramString, boolean paramBoolean)
  {
    this(1, paramString, paramBoolean);
  }

  public int describeContents()
  {
    return 0;
  }

  public String toString()
  {
    Locale localLocale = Locale.US;
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.zzVg;
    if (this.zzWz);
    for (String str = "ASC"; ; str = "DESC")
    {
      arrayOfObject[1] = str;
      return String.format(localLocale, "FieldWithSortOrder[%s %s]", arrayOfObject);
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }
}