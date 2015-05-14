package com.google.android.gms.appstate;

import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;

public final class zza
  implements AppState
{
  private final int zzGL;
  private final String zzGM;
  private final byte[] zzGN;
  private final boolean zzGO;
  private final String zzGP;
  private final byte[] zzGQ;

  public zza(AppState paramAppState)
  {
    this.zzGL = paramAppState.getKey();
    this.zzGM = paramAppState.getLocalVersion();
    this.zzGN = paramAppState.getLocalData();
    this.zzGO = paramAppState.hasConflict();
    this.zzGP = paramAppState.getConflictVersion();
    this.zzGQ = paramAppState.getConflictData();
  }

  static int zza(AppState paramAppState)
  {
    Object[] arrayOfObject = new Object[6];
    arrayOfObject[0] = Integer.valueOf(paramAppState.getKey());
    arrayOfObject[1] = paramAppState.getLocalVersion();
    arrayOfObject[2] = paramAppState.getLocalData();
    arrayOfObject[3] = Boolean.valueOf(paramAppState.hasConflict());
    arrayOfObject[4] = paramAppState.getConflictVersion();
    arrayOfObject[5] = paramAppState.getConflictData();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(AppState paramAppState, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof AppState))
      bool = false;
    AppState localAppState;
    do
    {
      do
        return bool;
      while (paramAppState == paramObject);
      localAppState = (AppState)paramObject;
    }
    while ((zzw.equal(Integer.valueOf(localAppState.getKey()), Integer.valueOf(paramAppState.getKey()))) && (zzw.equal(localAppState.getLocalVersion(), paramAppState.getLocalVersion())) && (zzw.equal(localAppState.getLocalData(), paramAppState.getLocalData())) && (zzw.equal(Boolean.valueOf(localAppState.hasConflict()), Boolean.valueOf(paramAppState.hasConflict()))) && (zzw.equal(localAppState.getConflictVersion(), paramAppState.getConflictVersion())) && (zzw.equal(localAppState.getConflictData(), paramAppState.getConflictData())));
    return false;
  }

  static String zzb(AppState paramAppState)
  {
    return zzw.zzk(paramAppState).zza("Key", Integer.valueOf(paramAppState.getKey())).zza("LocalVersion", paramAppState.getLocalVersion()).zza("LocalData", paramAppState.getLocalData()).zza("HasConflict", Boolean.valueOf(paramAppState.hasConflict())).zza("ConflictVersion", paramAppState.getConflictVersion()).zza("ConflictData", paramAppState.getConflictData()).toString();
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public byte[] getConflictData()
  {
    return this.zzGQ;
  }

  public String getConflictVersion()
  {
    return this.zzGP;
  }

  public int getKey()
  {
    return this.zzGL;
  }

  public byte[] getLocalData()
  {
    return this.zzGN;
  }

  public String getLocalVersion()
  {
    return this.zzGM;
  }

  public boolean hasConflict()
  {
    return this.zzGO;
  }

  public int hashCode()
  {
    return zza(this);
  }

  public boolean isDataValid()
  {
    return true;
  }

  public String toString()
  {
    return zzb(this);
  }

  public AppState zzha()
  {
    return this;
  }
}