package com.google.android.gms.tagmanager;

import android.net.Uri;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

class zzca
{
  private static zzca zzazx;
  private volatile String zzaxw;
  private volatile String zzazA;
  private volatile zza zzazy;
  private volatile String zzazz;

  zzca()
  {
    clear();
  }

  private String zzdf(String paramString)
  {
    return paramString.split("&")[0].split("=")[1];
  }

  private String zzm(Uri paramUri)
  {
    return paramUri.getQuery().replace("&gtm_debug=x", "");
  }

  static zzca zztx()
  {
    try
    {
      if (zzazx == null)
        zzazx = new zzca();
      zzca localzzca = zzazx;
      return localzzca;
    }
    finally
    {
    }
  }

  void clear()
  {
    this.zzazy = zza.zzazB;
    this.zzazz = null;
    this.zzaxw = null;
    this.zzazA = null;
  }

  String getContainerId()
  {
    return this.zzaxw;
  }

  boolean zzl(Uri paramUri)
  {
    boolean bool = true;
    while (true)
    {
      String str;
      try
      {
        str = URLDecoder.decode(paramUri.toString(), "UTF-8");
        if (str.matches("^tagmanager.c.\\S+:\\/\\/preview\\/p\\?id=\\S+&gtm_auth=\\S+&gtm_preview=\\d+(&gtm_debug=x)?$"))
        {
          zzbf.zzab("Container preview url: " + str);
          if (str.matches(".*?&gtm_debug=x$"))
          {
            this.zzazy = zza.zzazD;
            this.zzazA = zzm(paramUri);
            if ((this.zzazy == zza.zzazC) || (this.zzazy == zza.zzazD))
              this.zzazz = ("/r?" + this.zzazA);
            this.zzaxw = zzdf(this.zzazA);
            return bool;
          }
        }
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        bool = false;
        continue;
        this.zzazy = zza.zzazC;
        continue;
      }
      finally
      {
      }
      if (str.matches("^tagmanager.c.\\S+:\\/\\/preview\\/p\\?id=\\S+&gtm_preview=$"))
      {
        if (zzdf(paramUri.getQuery()).equals(this.zzaxw))
        {
          zzbf.zzab("Exit preview mode for container: " + this.zzaxw);
          this.zzazy = zza.zzazB;
          this.zzazz = null;
        }
      }
      else
      {
        zzbf.zzac("Invalid preview uri: " + str);
        bool = false;
        continue;
        bool = false;
      }
    }
  }

  zza zzty()
  {
    return this.zzazy;
  }

  String zztz()
  {
    return this.zzazz;
  }

  static enum zza
  {
    static
    {
      zza[] arrayOfzza = new zza[3];
      arrayOfzza[0] = zzazB;
      arrayOfzza[1] = zzazC;
      arrayOfzza[2] = zzazD;
    }
  }
}