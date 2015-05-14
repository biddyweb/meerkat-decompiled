package com.google.android.gms.drive.query.internal;

import com.google.android.gms.drive.query.Filter;
import com.google.android.gms.drive.query.zzc;

public abstract class AbstractFilter
  implements Filter
{
  public String toString()
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = zza(new zzc());
    return String.format("Filter[%s]", arrayOfObject);
  }
}