package com.google.android.gms.ads;

import android.content.Context;
import android.content.res.Resources;
import com.google.android.gms.internal.zzba;
import com.google.android.gms.internal.zzbe;
import com.google.android.gms.internal.zzhw;

public final class AdSize
{
  public static final int AUTO_HEIGHT = -2;
  public static final AdSize BANNER = new AdSize(320, 50, "320x50_mb");
  public static final AdSize FULL_BANNER = new AdSize(468, 60, "468x60_as");
  public static final int FULL_WIDTH = -1;
  public static final AdSize LARGE_BANNER = new AdSize(320, 100, "320x100_as");
  public static final AdSize LEADERBOARD = new AdSize(728, 90, "728x90_as");
  public static final AdSize MEDIUM_RECTANGLE = new AdSize(300, 250, "300x250_as");
  public static final AdSize SMART_BANNER = new AdSize(-1, -2, "smart_banner");
  public static final AdSize WIDE_SKYSCRAPER = new AdSize(160, 600, "160x600_as");
  private final int zzli;
  private final int zzlj;
  private final String zzlk;

  public AdSize(int paramInt1, int paramInt2)
  {
  }

  AdSize(int paramInt1, int paramInt2, String paramString)
  {
    if ((paramInt1 < 0) && (paramInt1 != -1))
      throw new IllegalArgumentException("Invalid width for AdSize: " + paramInt1);
    if ((paramInt2 < 0) && (paramInt2 != -2))
      throw new IllegalArgumentException("Invalid height for AdSize: " + paramInt2);
    this.zzli = paramInt1;
    this.zzlj = paramInt2;
    this.zzlk = paramString;
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    AdSize localAdSize;
    do
    {
      return true;
      if (!(paramObject instanceof AdSize))
        return false;
      localAdSize = (AdSize)paramObject;
    }
    while ((this.zzli == localAdSize.zzli) && (this.zzlj == localAdSize.zzlj) && (this.zzlk.equals(localAdSize.zzlk)));
    return false;
  }

  public int getHeight()
  {
    return this.zzlj;
  }

  public int getHeightInPixels(Context paramContext)
  {
    if (this.zzlj == -2)
      return zzba.zzb(paramContext.getResources().getDisplayMetrics());
    return zzbe.zzbD().zzb(paramContext, this.zzlj);
  }

  public int getWidth()
  {
    return this.zzli;
  }

  public int getWidthInPixels(Context paramContext)
  {
    if (this.zzli == -1)
      return zzba.zza(paramContext.getResources().getDisplayMetrics());
    return zzbe.zzbD().zzb(paramContext, this.zzli);
  }

  public int hashCode()
  {
    return this.zzlk.hashCode();
  }

  public boolean isAutoHeight()
  {
    return this.zzlj == -2;
  }

  public boolean isFullWidth()
  {
    return this.zzli == -1;
  }

  public String toString()
  {
    return this.zzlk;
  }
}