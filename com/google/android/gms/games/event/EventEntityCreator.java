package com.google.android.gms.games.event;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.games.PlayerEntity;

public class EventEntityCreator
  implements Parcelable.Creator<EventEntity>
{
  public static final int CONTENT_DESCRIPTION;

  static void zza(EventEntity paramEventEntity, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramEventEntity.getEventId(), false);
    zzb.zzc(paramParcel, 1000, paramEventEntity.getVersionCode());
    zzb.zza(paramParcel, 2, paramEventEntity.getName(), false);
    zzb.zza(paramParcel, 3, paramEventEntity.getDescription(), false);
    zzb.zza(paramParcel, 4, paramEventEntity.getIconImageUri(), paramInt, false);
    zzb.zza(paramParcel, 5, paramEventEntity.getIconImageUrl(), false);
    zzb.zza(paramParcel, 6, paramEventEntity.getPlayer(), paramInt, false);
    zzb.zza(paramParcel, 7, paramEventEntity.getValue());
    zzb.zza(paramParcel, 8, paramEventEntity.getFormattedValue(), false);
    zzb.zza(paramParcel, 9, paramEventEntity.isVisible());
    zzb.zzH(paramParcel, i);
  }

  public EventEntity createFromParcel(Parcel paramParcel)
  {
    boolean bool = false;
    String str1 = null;
    int i = zza.zzJ(paramParcel);
    long l = 0L;
    PlayerEntity localPlayerEntity = null;
    String str2 = null;
    Uri localUri = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    int j = 0;
    while (paramParcel.dataPosition() < i)
    {
      int k = zza.zzI(paramParcel);
      switch (zza.zzaP(k))
      {
      default:
        zza.zzb(paramParcel, k);
        break;
      case 1:
        str5 = zza.zzo(paramParcel, k);
        break;
      case 1000:
        j = zza.zzg(paramParcel, k);
        break;
      case 2:
        str4 = zza.zzo(paramParcel, k);
        break;
      case 3:
        str3 = zza.zzo(paramParcel, k);
        break;
      case 4:
        localUri = (Uri)zza.zza(paramParcel, k, Uri.CREATOR);
        break;
      case 5:
        str2 = zza.zzo(paramParcel, k);
        break;
      case 6:
        localPlayerEntity = (PlayerEntity)zza.zza(paramParcel, k, PlayerEntity.CREATOR);
        break;
      case 7:
        l = zza.zzi(paramParcel, k);
        break;
      case 8:
        str1 = zza.zzo(paramParcel, k);
        break;
      case 9:
        bool = zza.zzc(paramParcel, k);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new EventEntity(j, str5, str4, str3, localUri, str2, localPlayerEntity, l, str1, bool);
  }

  public EventEntity[] newArray(int paramInt)
  {
    return new EventEntity[paramInt];
  }
}