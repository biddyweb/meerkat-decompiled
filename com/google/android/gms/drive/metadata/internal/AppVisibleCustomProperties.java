package com.google.android.gms.drive.metadata.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.metadata.CustomPropertyKey;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public final class AppVisibleCustomProperties
  implements SafeParcelable, Iterable<CustomProperty>
{
  public static final Parcelable.Creator<AppVisibleCustomProperties> CREATOR = new zza();
  public static final AppVisibleCustomProperties zzVl = new zza().zzkW();
  final int zzFG;
  final List<CustomProperty> zzVm;

  AppVisibleCustomProperties(int paramInt, Collection<CustomProperty> paramCollection)
  {
    this.zzFG = paramInt;
    zzx.zzl(paramCollection);
    this.zzVm = new ArrayList(paramCollection);
  }

  private AppVisibleCustomProperties(Collection<CustomProperty> paramCollection)
  {
    this(1, paramCollection);
  }

  public int describeContents()
  {
    return 0;
  }

  public Iterator<CustomProperty> iterator()
  {
    return this.zzVm.iterator();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }

  public Map<CustomPropertyKey, String> zzkV()
  {
    HashMap localHashMap = new HashMap(this.zzVm.size());
    Iterator localIterator = this.zzVm.iterator();
    while (localIterator.hasNext())
    {
      CustomProperty localCustomProperty = (CustomProperty)localIterator.next();
      localHashMap.put(localCustomProperty.zzkX(), localCustomProperty.getValue());
    }
    return Collections.unmodifiableMap(localHashMap);
  }

  public static class zza
  {
    private final Map<CustomPropertyKey, CustomProperty> zzVn = new HashMap();

    public zza zza(CustomPropertyKey paramCustomPropertyKey, String paramString)
    {
      zzx.zzb(paramCustomPropertyKey, "key");
      this.zzVn.put(paramCustomPropertyKey, new CustomProperty(paramCustomPropertyKey, paramString));
      return this;
    }

    public AppVisibleCustomProperties zzkW()
    {
      return new AppVisibleCustomProperties(this.zzVn.values(), null);
    }
  }
}