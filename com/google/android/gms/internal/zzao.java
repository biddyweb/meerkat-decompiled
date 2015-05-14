package com.google.android.gms.internal;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public abstract class zzao
{
  private static MessageDigest zzoz = null;
  protected Object zznh = new Object();

  protected MessageDigest zzby()
  {
    while (true)
    {
      int i;
      synchronized (this.zznh)
      {
        if (zzoz != null)
        {
          MessageDigest localMessageDigest2 = zzoz;
          return localMessageDigest2;
        }
        i = 0;
        if (i >= 2);
      }
      try
      {
        zzoz = MessageDigest.getInstance("MD5");
        label38: i++;
        continue;
        MessageDigest localMessageDigest1 = zzoz;
        return localMessageDigest1;
        localObject2 = finally;
        throw localObject2;
      }
      catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
      {
        break label38;
      }
    }
  }

  abstract byte[] zzl(String paramString);
}