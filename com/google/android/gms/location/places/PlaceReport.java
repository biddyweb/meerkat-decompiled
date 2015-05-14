package com.google.android.gms.location.places;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.common.internal.zzx;

public class PlaceReport
  implements SafeParcelable
{
  public static final PlaceReportCreator CREATOR = new PlaceReportCreator();
  private final String mTag;
  final int zzFG;
  private final String zzanM;
  private final String zzanN;

  PlaceReport(int paramInt, String paramString1, String paramString2, String paramString3)
  {
    this.zzFG = paramInt;
    this.zzanM = paramString1;
    this.mTag = paramString2;
    this.zzanN = paramString3;
  }

  public static PlaceReport create(String paramString1, String paramString2)
  {
    return zzf(paramString1, paramString2, "unknown");
  }

  private static boolean zzcm(String paramString)
  {
    int i = 1;
    int j = -1;
    switch (paramString.hashCode())
    {
    default:
    case -284840886:
    case -1194968642:
    case -1436706272:
    case 1287171955:
    case -262743844:
    }
    while (true)
    {
      switch (j)
      {
      default:
        i = 0;
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      }
      return i;
      if (paramString.equals("unknown"))
      {
        j = 0;
        continue;
        if (paramString.equals("userReported"))
        {
          j = i;
          continue;
          if (paramString.equals("inferredGeofencing"))
          {
            j = 2;
            continue;
            if (paramString.equals("inferredRadioSignals"))
            {
              j = 3;
              continue;
              if (paramString.equals("inferredReverseGeocoding"))
                j = 4;
            }
          }
        }
      }
    }
  }

  public static PlaceReport zzf(String paramString1, String paramString2, String paramString3)
  {
    zzx.zzbn(paramString1);
    zzx.zzbn(paramString2);
    zzx.zzbn(paramString3);
    zzx.zzb(zzcm(paramString3), "Invalid source");
    return new PlaceReport(1, paramString1, paramString2, paramString3);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof PlaceReport));
    PlaceReport localPlaceReport;
    do
    {
      return false;
      localPlaceReport = (PlaceReport)paramObject;
    }
    while ((!zzw.equal(this.zzanM, localPlaceReport.zzanM)) || (!zzw.equal(this.mTag, localPlaceReport.mTag)) || (!zzw.equal(this.zzanN, localPlaceReport.zzanN)));
    return true;
  }

  public String getPlaceId()
  {
    return this.zzanM;
  }

  public String getSource()
  {
    return this.zzanN;
  }

  public String getTag()
  {
    return this.mTag;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.zzanM;
    arrayOfObject[1] = this.mTag;
    arrayOfObject[2] = this.zzanN;
    return zzw.hashCode(arrayOfObject);
  }

  public String toString()
  {
    zzw.zza localzza = zzw.zzk(this);
    localzza.zza("placeId", this.zzanM);
    localzza.zza("tag", this.mTag);
    if (!"unknown".equals(this.zzanN))
      localzza.zza("source", this.zzanN);
    return localzza.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    PlaceReportCreator.zza(this, paramParcel, paramInt);
  }
}