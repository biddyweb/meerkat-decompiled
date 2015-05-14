package com.google.android.gms.drive.events;

import android.os.IBinder;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import java.util.ArrayList;

public class zzb
  implements Parcelable.Creator<CompletionEvent>
{
  static void zza(CompletionEvent paramCompletionEvent, Parcel paramParcel, int paramInt)
  {
    int i = com.google.android.gms.common.internal.safeparcel.zzb.zzK(paramParcel);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 1, paramCompletionEvent.zzFG);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 2, paramCompletionEvent.zzRX, paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 3, paramCompletionEvent.zzHg, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 4, paramCompletionEvent.zzSP, paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 5, paramCompletionEvent.zzSQ, paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 6, paramCompletionEvent.zzSR, paramInt, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzb(paramParcel, 7, paramCompletionEvent.zzSS, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzc(paramParcel, 8, paramCompletionEvent.zzrX);
    com.google.android.gms.common.internal.safeparcel.zzb.zza(paramParcel, 9, paramCompletionEvent.zzST, false);
    com.google.android.gms.common.internal.safeparcel.zzb.zzH(paramParcel, i);
  }

  public CompletionEvent zzae(Parcel paramParcel)
  {
    int i = 0;
    IBinder localIBinder = null;
    int j = zza.zzJ(paramParcel);
    ArrayList localArrayList = null;
    MetadataBundle localMetadataBundle = null;
    ParcelFileDescriptor localParcelFileDescriptor1 = null;
    ParcelFileDescriptor localParcelFileDescriptor2 = null;
    String str = null;
    DriveId localDriveId = null;
    int k = 0;
    while (paramParcel.dataPosition() < j)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        k = zza.zzg(paramParcel, m);
        break;
      case 2:
        localDriveId = (DriveId)zza.zza(paramParcel, m, DriveId.CREATOR);
        break;
      case 3:
        str = zza.zzo(paramParcel, m);
        break;
      case 4:
        localParcelFileDescriptor2 = (ParcelFileDescriptor)zza.zza(paramParcel, m, ParcelFileDescriptor.CREATOR);
        break;
      case 5:
        localParcelFileDescriptor1 = (ParcelFileDescriptor)zza.zza(paramParcel, m, ParcelFileDescriptor.CREATOR);
        break;
      case 6:
        localMetadataBundle = (MetadataBundle)zza.zza(paramParcel, m, MetadataBundle.CREATOR);
        break;
      case 7:
        localArrayList = zza.zzC(paramParcel, m);
        break;
      case 8:
        i = zza.zzg(paramParcel, m);
        break;
      case 9:
        localIBinder = zza.zzp(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != j)
      throw new zza.zza("Overread allowed size end=" + j, paramParcel);
    return new CompletionEvent(k, localDriveId, str, localParcelFileDescriptor2, localParcelFileDescriptor1, localMetadataBundle, localArrayList, i, localIBinder);
  }

  public CompletionEvent[] zzbr(int paramInt)
  {
    return new CompletionEvent[paramInt];
  }
}