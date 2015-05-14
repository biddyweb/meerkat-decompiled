package com.google.android.exoplayer.hls;

import java.util.Comparator;

public final class Variant
{
  public final int bandwidth;
  public final String[] codecs;
  public final int height;
  public final int index;
  public final String url;
  public final int width;

  public Variant(int paramInt1, String paramString, int paramInt2, String[] paramArrayOfString, int paramInt3, int paramInt4)
  {
    this.index = paramInt1;
    this.bandwidth = paramInt2;
    this.url = paramString;
    this.codecs = paramArrayOfString;
    this.width = paramInt3;
    this.height = paramInt4;
  }

  public static final class DecreasingBandwidthComparator
    implements Comparator<Variant>
  {
    public int compare(Variant paramVariant1, Variant paramVariant2)
    {
      int i = paramVariant2.bandwidth - paramVariant1.bandwidth;
      if (i != 0)
        return i;
      return paramVariant1.index - paramVariant2.index;
    }
  }
}