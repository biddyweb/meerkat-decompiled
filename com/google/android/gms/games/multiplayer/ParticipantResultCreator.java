package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;

public class ParticipantResultCreator
  implements Parcelable.Creator<ParticipantResult>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(ParticipantResult paramParticipantResult, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramParticipantResult.getParticipantId(), false);
    zzb.zzc(paramParcel, 1000, paramParticipantResult.getVersionCode());
    zzb.zzc(paramParcel, 2, paramParticipantResult.getResult());
    zzb.zzc(paramParcel, 3, paramParticipantResult.getPlacing());
    zzb.zzH(paramParcel, i);
  }

  public ParticipantResult createFromParcel(Parcel paramParcel)
  {
    int i = 0;
    int j = zza.zzJ(paramParcel);
    String str = null;
    int k = 0;
    int m = 0;
    while (paramParcel.dataPosition() < j)
    {
      int n = zza.zzI(paramParcel);
      switch (zza.zzaP(n))
      {
      default:
        zza.zzb(paramParcel, n);
        break;
      case 1:
        str = zza.zzo(paramParcel, n);
        break;
      case 1000:
        m = zza.zzg(paramParcel, n);
        break;
      case 2:
        k = zza.zzg(paramParcel, n);
        break;
      case 3:
        i = zza.zzg(paramParcel, n);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new ParticipantResult(m, str, k, i);
  }

  public ParticipantResult[] newArray(int paramInt)
  {
    return new ParticipantResult[paramInt];
  }
}