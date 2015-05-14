package com.google.android.gms.games.internal.multiplayer;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.games.multiplayer.InvitationEntity;
import java.util.ArrayList;

public class InvitationClusterCreator
  implements Parcelable.Creator<ZInvitationCluster>
{
  static void zza(ZInvitationCluster paramZInvitationCluster, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zzc(paramParcel, 1, paramZInvitationCluster.zzoz(), false);
    zzb.zzc(paramParcel, 1000, paramZInvitationCluster.getVersionCode());
    zzb.zzH(paramParcel, i);
  }

  public ZInvitationCluster zzdb(Parcel paramParcel)
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
        localArrayList = zza.zzc(paramParcel, k, InvitationEntity.CREATOR);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new ZInvitationCluster(j, localArrayList);
  }

  public ZInvitationCluster[] zzeQ(int paramInt)
  {
    return new ZInvitationCluster[paramInt];
  }
}