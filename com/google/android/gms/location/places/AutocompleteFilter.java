package com.google.android.gms.location.places;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class AutocompleteFilter
  implements SafeParcelable
{
  public static final zzb CREATOR = new zzb();
  final int zzFG;
  final boolean zzanx;
  final List<Integer> zzany;
  private final Set<Integer> zzanz;

  AutocompleteFilter(int paramInt, boolean paramBoolean, Collection<Integer> paramCollection)
  {
    this.zzFG = paramInt;
    this.zzanx = paramBoolean;
    if (paramCollection == null);
    for (Object localObject = Collections.emptyList(); ; localObject = new ArrayList(paramCollection))
    {
      this.zzany = ((List)localObject);
      if (!this.zzany.isEmpty())
        break;
      this.zzanz = Collections.emptySet();
      return;
    }
    this.zzanz = Collections.unmodifiableSet(new HashSet(this.zzany));
  }

  public static AutocompleteFilter create(Collection<Integer> paramCollection)
  {
    return zza(true, paramCollection);
  }

  public static AutocompleteFilter zza(boolean paramBoolean, Collection<Integer> paramCollection)
  {
    return new AutocompleteFilter(0, paramBoolean, paramCollection);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    AutocompleteFilter localAutocompleteFilter;
    do
    {
      return true;
      if (!(paramObject instanceof AutocompleteFilter))
        return false;
      localAutocompleteFilter = (AutocompleteFilter)paramObject;
    }
    while ((this.zzanz.equals(localAutocompleteFilter.zzanz)) && (this.zzanx == localAutocompleteFilter.zzanx));
    return false;
  }

  public Set<Integer> getPlaceTypes()
  {
    return this.zzanz;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Boolean.valueOf(this.zzanx);
    arrayOfObject[1] = this.zzanz;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    zzw.zza localzza = zzw.zzk(this);
    if (!this.zzanx)
      localzza.zza("restrictedToPlaces", Boolean.valueOf(this.zzanx));
    localzza.zza("placeTypes", this.zzanz);
    return localzza.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }

  public boolean zzpF()
  {
    return this.zzanx;
  }
}