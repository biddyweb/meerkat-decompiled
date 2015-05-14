package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class ActivityRecognitionResultCreator
  implements Parcelable.Creator<ActivityRecognitionResult>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(ActivityRecognitionResult paramActivityRecognitionResult, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramActivityRecognitionResult.zzalH, false);
    zzb.zzc(paramParcel, 1000, paramActivityRecognitionResult.getVersionCode());
    zzb.zza(paramParcel, 2, paramActivityRecognitionResult.zzalI);
    zzb.zza(paramParcel, 3, paramActivityRecognitionResult.zzalJ);
    zzb.zzH(paramParcel, i);
  }

  public ActivityRecognitionResult createFromParcel(Parcel paramParcel)
  {
    long l1 = 0L;
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList = null;
    long l2 = l1;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localArrayList = zza.zzc(paramParcel, k, DetectedActivity.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        l2 = zza.zzi(paramParcel, k);
        break;
      case 3:
        l1 = zza.zzi(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new ActivityRecognitionResult(j, localArrayList, l2, l1);
  }

  public ActivityRecognitionResult[] newArray(int paramInt)
  {
    return new ActivityRecognitionResult[paramInt];
  }
}