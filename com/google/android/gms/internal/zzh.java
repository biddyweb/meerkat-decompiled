package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public abstract class zzh
  implements zzg
{
  protected MotionEvent zzkv;
  protected DisplayMetrics zzkw;
  protected zzm zzkx;
  private zzn zzky;

  protected zzh(Context paramContext, zzm paramzzm, zzn paramzzn)
  {
    this.zzkx = paramzzm;
    this.zzky = paramzzn;
    try
    {
      this.zzkw = paramContext.getResources().getDisplayMetrics();
      return;
    }
    catch (UnsupportedOperationException localUnsupportedOperationException)
    {
      this.zzkw = new DisplayMetrics();
      this.zzkw.density = 1.0F;
    }
  }

  private String zza(Context paramContext, String paramString, boolean paramBoolean)
  {
    try
    {
      try
      {
        zzt();
        if (paramBoolean)
          zzc(paramContext);
        while (true)
        {
          arrayOfByte = zzu();
          if (arrayOfByte.length != 0)
            break;
          String str2 = Integer.toString(5);
          return str2;
          zzb(paramContext);
        }
      }
      finally
      {
      }
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      byte[] arrayOfByte;
      return Integer.toString(7);
      String str1 = zza(arrayOfByte, paramString);
      return str1;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      return Integer.toString(7);
    }
    catch (IOException localIOException)
    {
    }
    return Integer.toString(3);
  }

  private void zzt()
  {
    this.zzky.reset();
  }

  private byte[] zzu()
    throws IOException
  {
    return this.zzky.zzD();
  }

  public String zza(Context paramContext)
  {
    return zza(paramContext, null, false);
  }

  public String zza(Context paramContext, String paramString)
  {
    return zza(paramContext, paramString, true);
  }

  String zza(byte[] paramArrayOfByte, String paramString)
    throws NoSuchAlgorithmException, UnsupportedEncodingException, IOException
  {
    if (paramArrayOfByte.length > 239)
    {
      zzt();
      zza(20, 1L);
      paramArrayOfByte = zzu();
    }
    byte[] arrayOfByte5;
    if (paramArrayOfByte.length < 239)
    {
      arrayOfByte5 = new byte[239 - paramArrayOfByte.length];
      new SecureRandom().nextBytes(arrayOfByte5);
    }
    for (byte[] arrayOfByte1 = ByteBuffer.allocate(240).put((byte)paramArrayOfByte.length).put(paramArrayOfByte).put(arrayOfByte5).array(); ; arrayOfByte1 = ByteBuffer.allocate(240).put((byte)paramArrayOfByte.length).put(paramArrayOfByte).array())
    {
      MessageDigest localMessageDigest = MessageDigest.getInstance("MD5");
      localMessageDigest.update(arrayOfByte1);
      byte[] arrayOfByte2 = localMessageDigest.digest();
      byte[] arrayOfByte3 = ByteBuffer.allocate(256).put(arrayOfByte2).put(arrayOfByte1).array();
      byte[] arrayOfByte4 = new byte[256];
      new zzf().zza(arrayOfByte3, arrayOfByte4);
      if ((paramString != null) && (paramString.length() > 0))
        zza(paramString, arrayOfByte4);
      return this.zzkx.zza(arrayOfByte4, true);
    }
  }

  public void zza(int paramInt1, int paramInt2, int paramInt3)
  {
    if (this.zzkv != null)
      this.zzkv.recycle();
    this.zzkv = MotionEvent.obtain(0L, paramInt3, 1, paramInt1 * this.zzkw.density, paramInt2 * this.zzkw.density, 0.0F, 0.0F, 0, 0.0F, 0.0F, 0, 0);
  }

  protected void zza(int paramInt, long paramLong)
    throws IOException
  {
    this.zzky.zzb(paramInt, paramLong);
  }

  protected void zza(int paramInt, String paramString)
    throws IOException
  {
    this.zzky.zzb(paramInt, paramString);
  }

  public void zza(MotionEvent paramMotionEvent)
  {
    if (paramMotionEvent.getAction() == 1)
    {
      if (this.zzkv != null)
        this.zzkv.recycle();
      this.zzkv = MotionEvent.obtain(paramMotionEvent);
    }
  }

  void zza(String paramString, byte[] paramArrayOfByte)
    throws UnsupportedEncodingException
  {
    if (paramString.length() > 32)
      paramString = paramString.substring(0, 32);
    new zzwp(paramString.getBytes("UTF-8")).zzs(paramArrayOfByte);
  }

  protected abstract void zzb(Context paramContext);

  protected abstract void zzc(Context paramContext);
}