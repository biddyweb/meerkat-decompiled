package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.location.places.AutocompletePrediction;
import com.google.android.gms.location.places.AutocompletePrediction.Substring;
import java.util.List;

public class zzpo
  implements SafeParcelable, AutocompletePrediction
{
  public static final Parcelable.Creator<zzpo> CREATOR = new zzpp();
  final int zzFG;
  final String zzZO;
  final String zzanM;
  final List<Integer> zzanu;
  final List<zza> zzaoi;
  final int zzaoj;

  zzpo(int paramInt1, String paramString1, String paramString2, List<Integer> paramList, List<zza> paramList1, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzZO = paramString1;
    this.zzanM = paramString2;
    this.zzanu = paramList;
    this.zzaoi = paramList1;
    this.zzaoj = paramInt2;
  }

  public static zzpo zza(String paramString1, String paramString2, List<Integer> paramList, List<zza> paramList1, int paramInt)
  {
    return new zzpo(0, (String)zzx.zzl(paramString1), paramString2, paramList, paramList1, paramInt);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    zzpo localzzpo;
    do
    {
      return true;
      if (!(paramObject instanceof zzpo))
        return false;
      localzzpo = (zzpo)paramObject;
    }
    while ((zzw.equal(this.zzZO, localzzpo.zzZO)) && (zzw.equal(this.zzanM, localzzpo.zzanM)) && (zzw.equal(this.zzanu, localzzpo.zzanu)) && (zzw.equal(this.zzaoi, localzzpo.zzaoi)) && (zzw.equal(Integer.valueOf(this.zzaoj), Integer.valueOf(localzzpo.zzaoj))));
    return false;
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public List<? extends AutocompletePrediction.Substring> getMatchedSubstrings()
  {
    return this.zzaoi;
  }

  public String getPlaceId()
  {
    return this.zzanM;
  }

  public List<Integer> getPlaceTypes()
  {
    return this.zzanu;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[5];
    arrayOfObject[0] = this.zzZO;
    arrayOfObject[1] = this.zzanM;
    arrayOfObject[2] = this.zzanu;
    arrayOfObject[3] = this.zzaoi;
    arrayOfObject[4] = Integer.valueOf(this.zzaoj);
    return zzw.hashCode(arrayOfObject);
  }

  public boolean isDataValid()
  {
    return true;
  }

  public String toString()
  {
    return zzw.zzk(this).zza("description", this.zzZO).zza("placeId", this.zzanM).zza("placeTypes", this.zzanu).zza("substrings", this.zzaoi).toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzpp.zza(this, paramParcel, paramInt);
  }

  public AutocompletePrediction zzpL()
  {
    return this;
  }

  public static class zza
    implements SafeParcelable, AutocompletePrediction.Substring
  {
    public static final Parcelable.Creator<zza> CREATOR = new zzqk();
    final int mLength;
    final int mOffset;
    final int zzFG;

    public zza(int paramInt1, int paramInt2, int paramInt3)
    {
      this.zzFG = paramInt1;
      this.mOffset = paramInt2;
      this.mLength = paramInt3;
    }

    public int describeContents()
    {
      return 0;
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      zza localzza;
      do
      {
        return true;
        if (!(paramObject instanceof zza))
          return false;
        localzza = (zza)paramObject;
      }
      while ((zzw.equal(Integer.valueOf(this.mOffset), Integer.valueOf(localzza.mOffset))) && (zzw.equal(Integer.valueOf(this.mLength), Integer.valueOf(localzza.mLength))));
      return false;
    }

    public int getLength()
    {
      return this.mLength;
    }

    public int getOffset()
    {
      return this.mOffset;
    }

    public int hashCode()
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Integer.valueOf(this.mOffset);
      arrayOfObject[1] = Integer.valueOf(this.mLength);
      return zzw.hashCode(arrayOfObject);
    }

    public String toString()
    {
      return zzw.zzk(this).zza("offset", Integer.valueOf(this.mOffset)).zza("length", Integer.valueOf(this.mLength)).toString();
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzqk.zza(this, paramParcel, paramInt);
    }
  }
}