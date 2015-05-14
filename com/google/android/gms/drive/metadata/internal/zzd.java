package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
import java.util.Date;

public class zzd extends com.google.android.gms.drive.metadata.zzd<Date>
{
  public zzd(String paramString, int paramInt)
  {
    super(paramString, paramInt);
  }

  protected void zza(Bundle paramBundle, Date paramDate)
  {
    paramBundle.putLong(getName(), paramDate.getTime());
  }

  protected Date zzf(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    return new Date(paramDataHolder.zza(getName(), paramInt1, paramInt2));
  }

  protected Date zzn(Bundle paramBundle)
  {
    return new Date(paramBundle.getLong(getName()));
  }
}