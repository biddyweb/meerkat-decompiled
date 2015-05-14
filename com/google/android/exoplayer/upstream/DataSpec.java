package com.google.android.exoplayer.upstream;

import android.net.Uri;
import com.google.android.exoplayer.util.Assertions;

public final class DataSpec
{
  public final long absoluteStreamPosition;
  public final String key;
  public final long length;
  public final long position;
  public final Uri uri;
  public final boolean uriIsFullStream;

  public DataSpec(Uri paramUri)
  {
    this(paramUri, 0L, -1L, null);
  }

  public DataSpec(Uri paramUri, long paramLong1, long paramLong2, String paramString)
  {
    this(paramUri, paramLong1, paramLong2, paramString, paramLong1, true);
  }

  public DataSpec(Uri paramUri, long paramLong1, long paramLong2, String paramString, long paramLong3)
  {
    this(paramUri, paramLong1, paramLong2, paramString, paramLong3, false);
  }

  public DataSpec(Uri paramUri, long paramLong1, long paramLong2, String paramString, long paramLong3, boolean paramBoolean)
  {
    boolean bool1;
    boolean bool2;
    if (paramLong1 >= 0L)
    {
      bool1 = true;
      Assertions.checkArgument(bool1);
      if (paramLong3 < 0L)
        break label121;
      bool2 = true;
      label28: Assertions.checkArgument(bool2);
      if ((paramLong2 <= 0L) && (paramLong2 != -1L))
        break label127;
    }
    label121: label127: for (boolean bool3 = true; ; bool3 = false)
    {
      Assertions.checkArgument(bool3);
      boolean bool4;
      if (paramLong1 != paramLong3)
      {
        bool4 = false;
        if (paramBoolean);
      }
      else
      {
        bool4 = true;
      }
      Assertions.checkArgument(bool4);
      this.uri = paramUri;
      this.uriIsFullStream = paramBoolean;
      this.absoluteStreamPosition = paramLong1;
      this.position = paramLong3;
      this.length = paramLong2;
      this.key = paramString;
      return;
      bool1 = false;
      break;
      bool2 = false;
      break label28;
    }
  }

  public String toString()
  {
    return "DataSpec[" + this.uri + ", " + this.uriIsFullStream + ", " + this.absoluteStreamPosition + ", " + this.position + ", " + this.length + ", " + this.key + "]";
  }
}