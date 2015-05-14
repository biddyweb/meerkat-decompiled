package com.google.android.gms.internal;

import com.google.android.gms.common.api.Api.zzc;
import java.nio.charset.Charset;
import java.nio.charset.IllegalCharsetNameException;
import java.nio.charset.UnsupportedCharsetException;

public final class zzkb
{
  public static final Api.zzc<zzju> zzGR = new Api.zzc();
  public static final String zzKO = zzjv.zzaL("com.google.cast.receiver");
  public static final String zzKP = zzjv.zzaL("com.google.cast.tp.connection");
  public static final Charset zzKQ;

  static
  {
    try
    {
      Charset localCharset2 = Charset.forName("UTF-8");
      localCharset1 = localCharset2;
      zzKQ = localCharset1;
      return;
    }
    catch (UnsupportedCharsetException localUnsupportedCharsetException)
    {
      while (true)
        localCharset1 = null;
    }
    catch (IllegalCharsetNameException localIllegalCharsetNameException)
    {
      while (true)
        Charset localCharset1 = null;
    }
  }
}