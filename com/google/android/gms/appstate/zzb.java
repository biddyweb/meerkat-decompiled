package com.google.android.gms.appstate;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;

public final class zzb extends zzd
  implements AppState
{
  zzb(DataHolder paramDataHolder, int paramInt)
  {
    super(paramDataHolder, paramInt);
  }

  public boolean equals(Object paramObject)
  {
    return zza.zza(this, paramObject);
  }

  public byte[] getConflictData()
  {
    return getByteArray("conflict_data");
  }

  public String getConflictVersion()
  {
    return getString("conflict_version");
  }

  public int getKey()
  {
    return getInteger("key");
  }

  public byte[] getLocalData()
  {
    return getByteArray("local_data");
  }

  public String getLocalVersion()
  {
    return getString("local_version");
  }

  public boolean hasConflict()
  {
    return !zzbc("conflict_version");
  }

  public int hashCode()
  {
    return zza.zza(this);
  }

  public String toString()
  {
    return zza.zzb(this);
  }

  public AppState zzha()
  {
    return new zza(this);
  }
}