package com.google.android.gms.drive.metadata;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public abstract class zza<T>
  implements MetadataField<T>
{
  private final String zzVg;
  private final Set<String> zzVh;
  private final Set<String> zzVi;
  private final int zzVj;

  protected zza(String paramString, int paramInt)
  {
    this.zzVg = ((String)zzx.zzb(paramString, "fieldName"));
    this.zzVh = Collections.singleton(paramString);
    this.zzVi = Collections.emptySet();
    this.zzVj = paramInt;
  }

  protected zza(String paramString, Collection<String> paramCollection1, Collection<String> paramCollection2, int paramInt)
  {
    this.zzVg = ((String)zzx.zzb(paramString, "fieldName"));
    this.zzVh = Collections.unmodifiableSet(new HashSet(paramCollection1));
    this.zzVi = Collections.unmodifiableSet(new HashSet(paramCollection2));
    this.zzVj = paramInt;
  }

  public final String getName()
  {
    return this.zzVg;
  }

  public String toString()
  {
    return this.zzVg;
  }

  public final T zza(Bundle paramBundle)
  {
    zzx.zzb(paramBundle, "bundle");
    if (paramBundle.get(getName()) != null)
      return zzl(paramBundle);
    return null;
  }

  public final T zza(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    if (zzb(paramDataHolder, paramInt1, paramInt2))
      return zzc(paramDataHolder, paramInt1, paramInt2);
    return null;
  }

  protected abstract void zza(Bundle paramBundle, T paramT);

  public final void zza(DataHolder paramDataHolder, MetadataBundle paramMetadataBundle, int paramInt1, int paramInt2)
  {
    zzx.zzb(paramDataHolder, "dataHolder");
    zzx.zzb(paramMetadataBundle, "bundle");
    if (zzb(paramDataHolder, paramInt1, paramInt2))
      paramMetadataBundle.zzb(this, zzc(paramDataHolder, paramInt1, paramInt2));
  }

  public final void zza(T paramT, Bundle paramBundle)
  {
    zzx.zzb(paramBundle, "bundle");
    if (paramT == null)
    {
      paramBundle.putString(getName(), null);
      return;
    }
    zza(paramBundle, paramT);
  }

  protected boolean zzb(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    Iterator localIterator = this.zzVh.iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      if ((!paramDataHolder.zzba(str)) || (paramDataHolder.zzh(str, paramInt1, paramInt2)))
        return false;
    }
    return true;
  }

  protected abstract T zzc(DataHolder paramDataHolder, int paramInt1, int paramInt2);

  protected abstract T zzl(Bundle paramBundle);
}