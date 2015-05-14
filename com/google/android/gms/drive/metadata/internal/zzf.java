package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.metadata.zza;

public class zzf extends zza<Integer>
{
  public zzf(String paramString, int paramInt)
  {
    super(paramString, paramInt);
  }

  protected void zza(Bundle paramBundle, Integer paramInteger)
  {
    paramBundle.putInt(getName(), paramInteger.intValue());
  }

  protected Integer zzg(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    return Integer.valueOf(paramDataHolder.zzb(getName(), paramInt1, paramInt2));
  }

  protected Integer zzo(Bundle paramBundle)
  {
    return Integer.valueOf(paramBundle.getInt(getName()));
  }
}