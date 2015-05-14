package com.google.android.gms.internal;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import java.io.IOException;
import java.io.InputStream;

class zzgt$2
  implements zzht.zza<Drawable>
{
  zzgt$2(zzgt paramzzgt, boolean paramBoolean)
  {
  }

  public Drawable zza(InputStream paramInputStream)
  {
    try
    {
      byte[] arrayOfByte2 = zzlz.zzd(paramInputStream);
      arrayOfByte1 = arrayOfByte2;
      if (arrayOfByte1 == null)
      {
        this.zzxc.zza(2, this.zzxd);
        return null;
      }
    }
    catch (IOException localIOException)
    {
      byte[] arrayOfByte1;
      while (true)
        arrayOfByte1 = null;
      Bitmap localBitmap = BitmapFactory.decodeByteArray(arrayOfByte1, 0, arrayOfByte1.length);
      if (localBitmap == null)
      {
        this.zzxc.zza(2, this.zzxd);
        return null;
      }
      return new BitmapDrawable(Resources.getSystem(), localBitmap);
    }
  }

  public Drawable zzdP()
  {
    this.zzxc.zza(2, this.zzxd);
    return null;
  }
}