package com.google.android.gms.internal;

import android.net.Uri;
import android.net.Uri.Builder;
import android.text.TextUtils;
import android.util.LogPrinter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

public final class zzqw
  implements zzrc
{
  private static final Uri zzarS = localBuilder.build();
  private final LogPrinter zzarT = new LogPrinter(4, "GA/LogCatTransport");

  static
  {
    Uri.Builder localBuilder = new Uri.Builder();
    localBuilder.scheme("uri");
    localBuilder.authority("local");
  }

  public void zza(zzqx paramzzqx)
  {
    ArrayList localArrayList = new ArrayList(paramzzqx.zzqQ());
    Collections.sort(localArrayList, new Comparator()
    {
      public int zza(zzqy paramAnonymouszzqy1, zzqy paramAnonymouszzqy2)
      {
        return paramAnonymouszzqy1.getClass().getCanonicalName().compareTo(paramAnonymouszzqy2.getClass().getCanonicalName());
      }
    });
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = localArrayList.iterator();
    while (localIterator.hasNext())
    {
      String str = ((zzqy)localIterator.next()).toString();
      if (!TextUtils.isEmpty(str))
      {
        if (localStringBuilder.length() != 0)
          localStringBuilder.append(", ");
        localStringBuilder.append(str);
      }
    }
    this.zzarT.println(localStringBuilder.toString());
  }

  public Uri zzqP()
  {
    return zzarS;
  }
}