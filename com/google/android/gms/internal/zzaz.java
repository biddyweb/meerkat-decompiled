package com.google.android.gms.internal;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.search.SearchAdRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Set;

@zzgi
public class zzaz
{
  public static final zzaz zzoZ = new zzaz();

  public static zzaz zzbA()
  {
    return zzoZ;
  }

  public zzax zza(Context paramContext, zzbo paramzzbo)
  {
    Date localDate = paramzzbo.getBirthday();
    long l;
    String str1;
    int i;
    List localList;
    label57: boolean bool1;
    int j;
    Location localLocation;
    Bundle localBundle;
    boolean bool2;
    String str2;
    SearchAdRequest localSearchAdRequest;
    if (localDate != null)
    {
      l = localDate.getTime();
      str1 = paramzzbo.getContentUrl();
      i = paramzzbo.getGender();
      Set localSet = paramzzbo.getKeywords();
      if (localSet.isEmpty())
        break label183;
      localList = Collections.unmodifiableList(new ArrayList(localSet));
      bool1 = paramzzbo.isTestDevice(paramContext);
      j = paramzzbo.zzbL();
      localLocation = paramzzbo.getLocation();
      localBundle = paramzzbo.getNetworkExtrasBundle(AdMobAdapter.class);
      bool2 = paramzzbo.getManualImpressionsEnabled();
      str2 = paramzzbo.getPublisherProvidedId();
      localSearchAdRequest = paramzzbo.zzbI();
      if (localSearchAdRequest == null)
        break label189;
    }
    label183: label189: for (zzbs localzzbs = new zzbs(localSearchAdRequest); ; localzzbs = null)
    {
      return new zzax(5, l, localBundle, i, localList, bool1, j, bool2, str2, localzzbs, localLocation, str1, paramzzbo.zzbK(), paramzzbo.getCustomTargeting(), Collections.unmodifiableList(new ArrayList(paramzzbo.zzbM())), paramzzbo.zzbH());
      l = -1L;
      break;
      localList = null;
      break label57;
    }
  }
}