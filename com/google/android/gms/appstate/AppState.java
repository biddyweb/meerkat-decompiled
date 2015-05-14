package com.google.android.gms.appstate;

import com.google.android.gms.common.data.Freezable;

@Deprecated
public abstract interface AppState extends Freezable<AppState>
{
  public abstract byte[] getConflictData();

  public abstract String getConflictVersion();

  public abstract int getKey();

  public abstract byte[] getLocalData();

  public abstract String getLocalVersion();

  public abstract boolean hasConflict();
}