package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.zzaa;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public final class PolygonOptions
  implements SafeParcelable
{
  public static final zzm CREATOR = new zzm();
  private final int zzFG;
  private float zzaqY = 10.0F;
  private int zzaqZ = -16777216;
  private final List<LatLng> zzarB;
  private final List<List<LatLng>> zzarC;
  private boolean zzarD = false;
  private int zzara = 0;
  private float zzarb = 0.0F;
  private boolean zzarc = true;

  public PolygonOptions()
  {
    this.zzFG = 1;
    this.zzarB = new ArrayList();
    this.zzarC = new ArrayList();
  }

  PolygonOptions(int paramInt1, List<LatLng> paramList, List paramList1, float paramFloat1, int paramInt2, int paramInt3, float paramFloat2, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.zzFG = paramInt1;
    this.zzarB = paramList;
    this.zzarC = paramList1;
    this.zzaqY = paramFloat1;
    this.zzaqZ = paramInt2;
    this.zzara = paramInt3;
    this.zzarb = paramFloat2;
    this.zzarc = paramBoolean1;
    this.zzarD = paramBoolean2;
  }

  public PolygonOptions add(LatLng paramLatLng)
  {
    this.zzarB.add(paramLatLng);
    return this;
  }

  public PolygonOptions add(LatLng[] paramArrayOfLatLng)
  {
    this.zzarB.addAll(Arrays.asList(paramArrayOfLatLng));
    return this;
  }

  public PolygonOptions addAll(Iterable<LatLng> paramIterable)
  {
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
    {
      LatLng localLatLng = (LatLng)localIterator.next();
      this.zzarB.add(localLatLng);
    }
    return this;
  }

  public PolygonOptions addHole(Iterable<LatLng> paramIterable)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
      localArrayList.add((LatLng)localIterator.next());
    this.zzarC.add(localArrayList);
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  public PolygonOptions fillColor(int paramInt)
  {
    this.zzara = paramInt;
    return this;
  }

  public PolygonOptions geodesic(boolean paramBoolean)
  {
    this.zzarD = paramBoolean;
    return this;
  }

  public int getFillColor()
  {
    return this.zzara;
  }

  public List<List<LatLng>> getHoles()
  {
    return this.zzarC;
  }

  public List<LatLng> getPoints()
  {
    return this.zzarB;
  }

  public int getStrokeColor()
  {
    return this.zzaqZ;
  }

  public float getStrokeWidth()
  {
    return this.zzaqY;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public float getZIndex()
  {
    return this.zzarb;
  }

  public boolean isGeodesic()
  {
    return this.zzarD;
  }

  public boolean isVisible()
  {
    return this.zzarc;
  }

  public PolygonOptions strokeColor(int paramInt)
  {
    this.zzaqZ = paramInt;
    return this;
  }

  public PolygonOptions strokeWidth(float paramFloat)
  {
    this.zzaqY = paramFloat;
    return this;
  }

  public PolygonOptions visible(boolean paramBoolean)
  {
    this.zzarc = paramBoolean;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (zzaa.zzqF())
    {
      zzn.zza(this, paramParcel, paramInt);
      return;
    }
    zzm.zza(this, paramParcel, paramInt);
  }

  public PolygonOptions zIndex(float paramFloat)
  {
    this.zzarb = paramFloat;
    return this;
  }

  List zzqJ()
  {
    return this.zzarC;
  }
}