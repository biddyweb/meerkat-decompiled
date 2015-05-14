package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.util.Assertions;
import java.util.Comparator;

public class Format
{
  public final int audioSamplingRate;

  @Deprecated
  public final int bandwidth;
  public final int bitrate;
  public final String codecs;
  public final int height;
  public final String id;
  public final String language;
  public final String mimeType;
  public final int numChannels;
  public final int width;

  public Format(String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    this(paramString1, paramString2, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, null, null);
  }

  public Format(String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, String paramString3)
  {
    this(paramString1, paramString2, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramString3, null);
  }

  public Format(String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, String paramString3, String paramString4)
  {
    this.id = ((String)Assertions.checkNotNull(paramString1));
    this.mimeType = paramString2;
    this.width = paramInt1;
    this.height = paramInt2;
    this.numChannels = paramInt3;
    this.audioSamplingRate = paramInt4;
    this.bitrate = paramInt5;
    this.language = paramString3;
    this.codecs = paramString4;
    this.bandwidth = (paramInt5 / 8);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject)
      return true;
    if ((paramObject == null) || (getClass() != paramObject.getClass()))
      return false;
    return ((Format)paramObject).id.equals(this.id);
  }

  public int hashCode()
  {
    return this.id.hashCode();
  }

  public static final class DecreasingBandwidthComparator
    implements Comparator<Format>
  {
    public int compare(Format paramFormat1, Format paramFormat2)
    {
      return paramFormat2.bitrate - paramFormat1.bitrate;
    }
  }
}