package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import android.os.Parcelable;
import com.google.android.gms.drive.metadata.zza;
import java.util.Collection;

public abstract class zzj<T extends Parcelable> extends zza<T>
{
  public zzj(String paramString, Collection<String> paramCollection1, Collection<String> paramCollection2, int paramInt)
  {
    super(paramString, paramCollection1, paramCollection2, paramInt);
  }

  protected void zza(Bundle paramBundle, T paramT)
  {
    paramBundle.putParcelable(getName(), paramT);
  }

  protected T zzr(Bundle paramBundle)
  {
    return paramBundle.getParcelable(getName());
  }
}