package com.google.android.exoplayer.dash.mpd;

import android.net.Uri;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.Util;

public final class RangedUri
{
  private final Uri baseUri;
  private int hashCode;
  public final long length;
  public final long start;
  private final String stringUri;

  public RangedUri(Uri paramUri, String paramString, long paramLong1, long paramLong2)
  {
    if ((paramUri != null) || (paramString != null));
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkArgument(bool);
      this.baseUri = paramUri;
      this.stringUri = paramString;
      this.start = paramLong1;
      this.length = paramLong2;
      return;
    }
  }

  public RangedUri attemptMerge(RangedUri paramRangedUri)
  {
    long l1 = -1L;
    if ((paramRangedUri == null) || (!getUri().equals(paramRangedUri.getUri())));
    do
    {
      return null;
      if ((this.length != l1) && (this.start + this.length == paramRangedUri.start))
      {
        Uri localUri2 = this.baseUri;
        String str2 = this.stringUri;
        long l3 = this.start;
        if (paramRangedUri.length == l1);
        while (true)
        {
          return new RangedUri(localUri2, str2, l3, l1);
          l1 = this.length + paramRangedUri.length;
        }
      }
    }
    while ((paramRangedUri.length == l1) || (paramRangedUri.start + paramRangedUri.length != this.start));
    Uri localUri1 = this.baseUri;
    String str1 = this.stringUri;
    long l2 = paramRangedUri.start;
    if (this.length == l1);
    while (true)
    {
      return new RangedUri(localUri1, str1, l2, l1);
      l1 = paramRangedUri.length + this.length;
    }
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    RangedUri localRangedUri;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localRangedUri = (RangedUri)paramObject;
    }
    while ((this.start == localRangedUri.start) && (this.length == localRangedUri.length) && (getUri().equals(localRangedUri.getUri())));
    return false;
  }

  public Uri getUri()
  {
    return Util.getMergedUri(this.baseUri, this.stringUri);
  }

  public int hashCode()
  {
    if (this.hashCode == 0)
      this.hashCode = (31 * (31 * (527 + (int)this.start) + (int)this.length) + getUri().hashCode());
    return this.hashCode;
  }
}