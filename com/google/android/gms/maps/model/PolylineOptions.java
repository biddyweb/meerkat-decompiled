package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.zzaa;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public final class PolylineOptions
  implements SafeParcelable
{
  public static final zzo CREATOR = new zzo();
  private int mColor = -16777216;
  private final int zzFG;
  private final List<LatLng> zzarB;
  private boolean zzarD = false;
  private float zzarb = 0.0F;
  private boolean zzarc = true;
  private float zzarg = 10.0F;

  public PolylineOptions()
  {
    this.zzFG = 1;
    this.zzarB = new ArrayList();
  }

  PolylineOptions(int paramInt1, List paramList, float paramFloat1, int paramInt2, float paramFloat2, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.zzFG = paramInt1;
    this.zzarB = paramList;
    this.zzarg = paramFloat1;
    this.mColor = paramInt2;
    this.zzarb = paramFloat2;
    this.zzarc = paramBoolean1;
    this.zzarD = paramBoolean2;
  }

  public PolylineOptions add(LatLng paramLatLng)
  {
    this.zzarB.add(paramLatLng);
    return this;
  }

  public PolylineOptions add(LatLng[] paramArrayOfLatLng)
  {
    this.zzarB.addAll(Arrays.asList(paramArrayOfLatLng));
    return this;
  }

  public PolylineOptions addAll(Iterable<LatLng> paramIterable)
  {
    Iterator localIterator = paramIterable.iterator();
    while (localIterator.hasNext())
    {
      LatLng localLatLng = (LatLng)localIterator.next();
      this.zzarB.add(localLatLng);
    }
    return this;
  }

  public PolylineOptions color(int paramInt)
  {
    this.mColor = paramInt;
    return this;
  }

  public int describeContents()
  {
    return 0;
  }

  public PolylineOptions geodesic(boolean paramBoolean)
  {
    this.zzarD = paramBoolean;
    return this;
  }

  public int getColor()
  {
    return this.mColor;
  }

  public List<LatLng> getPoints()
  {
    return this.zzarB;
  }

  int getVersionCode()
  {
    return this.zzFG;
  }

  public float getWidth()
  {
    return this.zzarg;
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

  public PolylineOptions visible(boolean paramBoolean)
  {
    this.zzarc = paramBoolean;
    return this;
  }

  public PolylineOptions width(float paramFloat)
  {
    this.zzarg = paramFloat;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (zzaa.zzqF())
    {
      zzp.zza(this, paramParcel, paramInt);
      return;
    }
    zzo.zza(this, paramParcel, paramInt);
  }

  public PolylineOptions zIndex(float paramFloat)
  {
    this.zzarb = paramFloat;
    return this;
  }
}