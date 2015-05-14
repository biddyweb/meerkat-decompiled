package com.google.android.gms.location.places;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class PlaceFilter
  implements SafeParcelable
{
  public static final zze CREATOR = new zze();
  final int zzFG;
  final boolean zzanC;
  final List<zzj> zzanD;
  final List<String> zzanE;
  private final Set<zzj> zzanF;
  private final Set<String> zzanG;
  final List<Integer> zzany;
  private final Set<Integer> zzanz;

  public PlaceFilter()
  {
    this(false, null);
  }

  PlaceFilter(int paramInt, List<Integer> paramList, boolean paramBoolean, List<String> paramList1, List<zzj> paramList2)
  {
    this.zzFG = paramInt;
    List localList1;
    List localList2;
    if (paramList == null)
    {
      localList1 = Collections.emptyList();
      this.zzany = localList1;
      this.zzanC = paramBoolean;
      if (paramList2 != null)
        break label104;
      localList2 = Collections.emptyList();
      label39: this.zzanD = localList2;
      if (paramList1 != null)
        break label114;
    }
    label104: label114: for (List localList3 = Collections.emptyList(); ; localList3 = Collections.unmodifiableList(paramList1))
    {
      this.zzanE = localList3;
      this.zzanz = zzn(this.zzany);
      this.zzanF = zzn(this.zzanD);
      this.zzanG = zzn(this.zzanE);
      return;
      localList1 = Collections.unmodifiableList(paramList);
      break;
      localList2 = Collections.unmodifiableList(paramList2);
      break label39;
    }
  }

  public PlaceFilter(Collection<Integer> paramCollection, boolean paramBoolean, Collection<String> paramCollection1, Collection<zzj> paramCollection2)
  {
    this(0, zzc(paramCollection), paramBoolean, zzc(paramCollection1), zzc(paramCollection2));
  }

  public PlaceFilter(boolean paramBoolean, Collection<String> paramCollection)
  {
    this(null, paramBoolean, paramCollection, null);
  }

  private static <E> List<E> zzc(Collection<E> paramCollection)
  {
    if ((paramCollection == null) || (paramCollection.isEmpty()))
      return Collections.emptyList();
    return new ArrayList(paramCollection);
  }

  private static <E> Set<E> zzn(List<E> paramList)
  {
    if ((paramList == null) || (paramList.isEmpty()))
      return Collections.emptySet();
    return Collections.unmodifiableSet(new HashSet(paramList));
  }

  @Deprecated
  public static PlaceFilter zzpJ()
  {
    return new zza(null).zzpK();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    PlaceFilter localPlaceFilter;
    do
    {
      return true;
      if (!(paramObject instanceof PlaceFilter))
        return false;
      localPlaceFilter = (PlaceFilter)paramObject;
    }
    while ((this.zzanz.equals(localPlaceFilter.zzanz)) && (this.zzanC == localPlaceFilter.zzanC) && (this.zzanF.equals(localPlaceFilter.zzanF)) && (this.zzanG.equals(localPlaceFilter.zzanG)));
    return false;
  }

  public Set<String> getPlaceIds()
  {
    return this.zzanG;
  }

  public Set<Integer> getPlaceTypes()
  {
    return this.zzanz;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = this.zzanz;
    arrayOfObject[1] = Boolean.valueOf(this.zzanC);
    arrayOfObject[2] = this.zzanF;
    arrayOfObject[3] = this.zzanG;
    return zzw.hashCode(arrayOfObject);
  }

  public boolean isRestrictedToPlacesOpenNow()
  {
    return this.zzanC;
  }

  public boolean matches(Place paramPlace)
  {
    if ((isRestrictedToPlacesOpenNow()) && (paramPlace.zzpI()))
      return false;
    Set localSet1 = getPlaceTypes();
    int i;
    if (localSet1.isEmpty())
      i = 1;
    while (true)
      if (i == 0)
      {
        return false;
        Iterator localIterator = paramPlace.getPlaceTypes().iterator();
        do
          if (!localIterator.hasNext())
            break;
        while (!localSet1.contains((Integer)localIterator.next()));
        i = 1;
      }
      else
      {
        Set localSet2 = getPlaceIds();
        if ((localSet2.isEmpty()) || (localSet2.contains(paramPlace.getId())));
        for (int j = 1; j == 0; j = 0)
          return false;
        return true;
        i = 0;
      }
  }

  public String toString()
  {
    zzw.zza localzza = zzw.zzk(this);
    if (!this.zzanz.isEmpty())
      localzza.zza("types", this.zzanz);
    localzza.zza("requireOpenNow", Boolean.valueOf(this.zzanC));
    if (!this.zzanG.isEmpty())
      localzza.zza("placeIds", this.zzanG);
    if (!this.zzanF.isEmpty())
      localzza.zza("requestedUserDataTypes", this.zzanF);
    return localzza.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zze.zza(this, paramParcel, paramInt);
  }

  @Deprecated
  public static final class zza
  {
    private boolean zzanC = false;
    private Collection<Integer> zzanH = null;
    private Collection<zzj> zzanI = null;
    private String[] zzanJ = null;

    public PlaceFilter zzpK()
    {
      ArrayList localArrayList1;
      if (this.zzanH != null)
      {
        localArrayList1 = new ArrayList(this.zzanH);
        if (this.zzanI == null)
          break label80;
      }
      label80: for (ArrayList localArrayList2 = new ArrayList(this.zzanI); ; localArrayList2 = null)
      {
        String[] arrayOfString = this.zzanJ;
        List localList = null;
        if (arrayOfString != null)
          localList = Arrays.asList(this.zzanJ);
        return new PlaceFilter(localArrayList1, this.zzanC, localList, localArrayList2);
        localArrayList1 = null;
        break;
      }
    }
  }
}