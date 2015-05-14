package com.google.android.gms.internal;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.zza;
import com.google.android.gms.common.internal.safeparcel.zza.zza;
import com.google.android.gms.common.internal.safeparcel.zzb;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import java.util.ArrayList;

public class zzpz
  implements Parcelable.Creator<zzpy>
{
  static void zza(zzpy paramzzpy, Parcel paramParcel, int paramInt)
  {
    int i = zzb.zzK(paramParcel);
    zzb.zza(paramParcel, 1, paramzzpy.getId(), false);
    zzb.zza(paramParcel, 2, paramzzpy.zzpS(), false);
    zzb.zza(paramParcel, 3, paramzzpy.zzpU(), paramInt, false);
    zzb.zza(paramParcel, 4, paramzzpy.getLatLng(), paramInt, false);
    zzb.zza(paramParcel, 5, paramzzpy.zzpO());
    zzb.zza(paramParcel, 6, paramzzpy.getViewport(), paramInt, false);
    zzb.zza(paramParcel, 7, paramzzpy.zzpT(), false);
    zzb.zza(paramParcel, 8, paramzzpy.getWebsiteUri(), paramInt, false);
    zzb.zza(paramParcel, 9, paramzzpy.zzpI());
    zzb.zza(paramParcel, 10, paramzzpy.getRating());
    zzb.zzc(paramParcel, 11, paramzzpy.getPriceLevel());
    zzb.zza(paramParcel, 12, paramzzpy.zzpR());
    zzb.zza(paramParcel, 13, paramzzpy.zzpN(), false);
    zzb.zza(paramParcel, 14, paramzzpy.getAddress(), false);
    zzb.zza(paramParcel, 15, paramzzpy.getPhoneNumber(), false);
    zzb.zzb(paramParcel, 17, paramzzpy.zzpQ(), false);
    zzb.zza(paramParcel, 16, paramzzpy.zzpP(), false);
    zzb.zzc(paramParcel, 1000, paramzzpy.zzFG);
    zzb.zza(paramParcel, 19, paramzzpy.getName(), false);
    zzb.zza(paramParcel, 18, paramzzpy.zzaoI);
    zzb.zza(paramParcel, 20, paramzzpy.getPlaceTypes(), false);
    zzb.zzH(paramParcel, i);
  }

  public zzpy zzdF(Parcel paramParcel)
  {
    int i = zza.zzJ(paramParcel);
    int j = 0;
    String str1 = null;
    ArrayList localArrayList1 = null;
    ArrayList localArrayList2 = null;
    Bundle localBundle = null;
    String str2 = null;
    String str3 = null;
    String str4 = null;
    String str5 = null;
    ArrayList localArrayList3 = null;
    LatLng localLatLng = null;
    float f1 = 0.0F;
    LatLngBounds localLatLngBounds = null;
    String str6 = null;
    Uri localUri = null;
    boolean bool1 = false;
    float f2 = 0.0F;
    int k = 0;
    long l = 0L;
    boolean bool2 = false;
    zzqd localzzqd = null;
    while (paramParcel.dataPosition() < i)
    {
      int m = zza.zzI(paramParcel);
      switch (zza.zzaP(m))
      {
      default:
        zza.zzb(paramParcel, m);
        break;
      case 1:
        str1 = zza.zzo(paramParcel, m);
        break;
      case 2:
        localBundle = zza.zzq(paramParcel, m);
        break;
      case 3:
        localzzqd = (zzqd)zza.zza(paramParcel, m, zzqd.CREATOR);
        break;
      case 4:
        localLatLng = (LatLng)zza.zza(paramParcel, m, LatLng.CREATOR);
        break;
      case 5:
        f1 = zza.zzl(paramParcel, m);
        break;
      case 6:
        localLatLngBounds = (LatLngBounds)zza.zza(paramParcel, m, LatLngBounds.CREATOR);
        break;
      case 7:
        str6 = zza.zzo(paramParcel, m);
        break;
      case 8:
        localUri = (Uri)zza.zza(paramParcel, m, Uri.CREATOR);
        break;
      case 9:
        bool1 = zza.zzc(paramParcel, m);
        break;
      case 10:
        f2 = zza.zzl(paramParcel, m);
        break;
      case 11:
        k = zza.zzg(paramParcel, m);
        break;
      case 12:
        l = zza.zzi(paramParcel, m);
        break;
      case 13:
        localArrayList2 = zza.zzB(paramParcel, m);
        break;
      case 14:
        str3 = zza.zzo(paramParcel, m);
        break;
      case 15:
        str4 = zza.zzo(paramParcel, m);
        break;
      case 17:
        localArrayList3 = zza.zzC(paramParcel, m);
        break;
      case 16:
        str5 = zza.zzo(paramParcel, m);
        break;
      case 1000:
        j = zza.zzg(paramParcel, m);
        break;
      case 19:
        str2 = zza.zzo(paramParcel, m);
        break;
      case 18:
        bool2 = zza.zzc(paramParcel, m);
        break;
      case 20:
        localArrayList1 = zza.zzB(paramParcel, m);
      }
    }
    if (paramParcel.dataPosition() != i)
      throw new zza.zza("Overread allowed size end=" + i, paramParcel);
    return new zzpy(j, str1, localArrayList1, localArrayList2, localBundle, str2, str3, str4, str5, localArrayList3, localLatLng, f1, localLatLngBounds, str6, localUri, bool1, f2, k, l, bool2, localzzqd);
  }

  public zzpy[] zzfI(int paramInt)
  {
    return new zzpy[paramInt];
  }
}