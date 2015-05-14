package com.google.android.gms.internal;

import android.os.DeadObjectException;
import android.os.IInterface;

public abstract interface zzpm<T extends IInterface>
{
  public abstract void zzfc();

  public abstract T zzjb()
    throws DeadObjectException;
}