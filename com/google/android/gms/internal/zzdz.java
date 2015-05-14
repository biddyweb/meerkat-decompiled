package com.google.android.gms.internal;

import com.google.ads.AdRequest.ErrorCode;
import com.google.ads.AdRequest.Gender;
import com.google.ads.AdSize;
import com.google.ads.mediation.MediationAdRequest;
import com.google.android.gms.ads.zza;
import java.util.Date;
import java.util.HashSet;

@zzgi
public final class zzdz
{
  public static int zza(AdRequest.ErrorCode paramErrorCode)
  {
    switch (zzdz.1.zzsY[paramErrorCode.ordinal()])
    {
    default:
      return 0;
    case 2:
      return 1;
    case 3:
      return 2;
    case 4:
    }
    return 3;
  }

  public static AdSize zzb(zzba paramzzba)
  {
    int i = 0;
    AdSize[] arrayOfAdSize = new AdSize[6];
    arrayOfAdSize[0] = AdSize.SMART_BANNER;
    arrayOfAdSize[1] = AdSize.BANNER;
    arrayOfAdSize[2] = AdSize.IAB_MRECT;
    arrayOfAdSize[3] = AdSize.IAB_BANNER;
    arrayOfAdSize[4] = AdSize.IAB_LEADERBOARD;
    arrayOfAdSize[5] = AdSize.IAB_WIDE_SKYSCRAPER;
    while (i < arrayOfAdSize.length)
    {
      if ((arrayOfAdSize[i].getWidth() == paramzzba.width) && (arrayOfAdSize[i].getHeight() == paramzzba.height))
        return arrayOfAdSize[i];
      i++;
    }
    return new AdSize(zza.zza(paramzzba.width, paramzzba.height, paramzzba.zzpa));
  }

  public static MediationAdRequest zzd(zzax paramzzax)
  {
    if (paramzzax.zzoN != null);
    for (HashSet localHashSet = new HashSet(paramzzax.zzoN); ; localHashSet = null)
      return new MediationAdRequest(new Date(paramzzax.zzoL), zzn(paramzzax.zzoM), localHashSet, paramzzax.zzoO, paramzzax.zzoT);
  }

  public static AdRequest.Gender zzn(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return AdRequest.Gender.UNKNOWN;
    case 2:
      return AdRequest.Gender.FEMALE;
    case 1:
    }
    return AdRequest.Gender.MALE;
  }
}