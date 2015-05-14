package com.google.android.gms.nearby.connection;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import java.util.ArrayList;

public class AppMetadataCreator
  implements Parcelable.Creator<AppMetadata>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(AppMetadata paramAppMetadata, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramAppMetadata.getAppIdentifiers(), false);
    zzb.zzc(paramParcel, 1000, paramAppMetadata.getVersionCode());
    zzb.zzH(paramParcel, i);
  }

  public AppMetadata createFromParcel(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    ArrayList localArrayList = null;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        localArrayList = zza.zzc(paramParcel, k, AppIdentifier.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new AppMetadata(j, localArrayList);
  }

  public AppMetadata[] newArray(int paramInt)
  {
    return new AppMetadata[paramInt];
  }
}