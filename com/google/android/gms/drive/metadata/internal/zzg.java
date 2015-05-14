package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.metadata.zza;

public class zzg extends zza<Long>
{
  public zzg(String paramString, int paramInt)
  {
    super(paramString, paramInt);
  }

  protected void zza(Bundle paramBundle, Long paramLong)
  {
    paramBundle.putLong(getName(), paramLong.longValue());
  }

  protected Long zzh(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    return Long.valueOf(paramDataHolder.zza(getName(), paramInt1, paramInt2));
  }

  protected Long zzp(Bundle paramBundle)
  {
    return Long.valueOf(paramBundle.getLong(getName()));
  }
}