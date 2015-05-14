package com.google.android.gms.internal;

import android.util.Base64OutputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Locale;
import java.util.PriorityQueue;

public class zzap
{
  private final int zzoA;
  private final int zzoB;
  private final int zzoC;
  private final zzao zzoD = new zzar();

  public zzap(int paramInt)
  {
    this.zzoB = paramInt;
    this.zzoA = 6;
    this.zzoC = 0;
  }

  private String zzm(String paramString)
  {
    String[] arrayOfString = paramString.split("\n");
    if (arrayOfString.length == 0)
      return "";
    zza localzza = zzbz();
    Arrays.sort(arrayOfString, new Comparator()
    {
      public int compare(String paramAnonymousString1, String paramAnonymousString2)
      {
        return paramAnonymousString2.length() - paramAnonymousString1.length();
      }
    });
    int i = 0;
    if ((i < arrayOfString.length) && (i < this.zzoB))
    {
      if (arrayOfString[i].trim().length() == 0);
      while (true)
      {
        i++;
        break;
        try
        {
          localzza.write(this.zzoD.zzl(arrayOfString[i]));
        }
        catch (IOException localIOException)
        {
          zzhx.zzb("Error while writing hash to byteStream", localIOException);
        }
      }
    }
    return localzza.toString();
  }

  public String zza(ArrayList<String> paramArrayList)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    Iterator localIterator = paramArrayList.iterator();
    while (localIterator.hasNext())
    {
      localStringBuffer.append(((String)localIterator.next()).toLowerCase(Locale.US));
      localStringBuffer.append('\n');
    }
    switch (this.zzoC)
    {
    default:
      return "";
    case 0:
      return zzn(localStringBuffer.toString());
    case 1:
    }
    return zzm(localStringBuffer.toString());
  }

  zza zzbz()
  {
    return new zza();
  }

  String zzn(String paramString)
  {
    String[] arrayOfString1 = paramString.split("\n");
    if (arrayOfString1.length == 0)
      return "";
    zza localzza = zzbz();
    PriorityQueue localPriorityQueue = new PriorityQueue(this.zzoB, new Comparator()
    {
      public int zza(zzas.zza paramAnonymouszza1, zzas.zza paramAnonymouszza2)
      {
        return (int)(paramAnonymouszza1.value - paramAnonymouszza2.value);
      }
    });
    int i = 0;
    if (i < arrayOfString1.length)
    {
      String[] arrayOfString2 = zzaq.zzp(arrayOfString1[i]);
      if (arrayOfString2.length < this.zzoA);
      while (true)
      {
        i++;
        break;
        zzas.zza(arrayOfString2, this.zzoB, this.zzoA, localPriorityQueue);
      }
    }
    Iterator localIterator = localPriorityQueue.iterator();
    while (true)
      if (localIterator.hasNext())
      {
        zzas.zza localzza1 = (zzas.zza)localIterator.next();
        try
        {
          localzza.write(this.zzoD.zzl(localzza1.zzoI));
        }
        catch (IOException localIOException)
        {
          zzhx.zzb("Error while writing hash to byteStream", localIOException);
        }
      }
    return localzza.toString();
  }

  static class zza
  {
    ByteArrayOutputStream zzoF = new ByteArrayOutputStream(4096);
    Base64OutputStream zzoG = new Base64OutputStream(this.zzoF, 10);

    // ERROR //
    public String toString()
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 26\011com/google/android/gms/internal/zzap$zza:zzoG\011Landroid/util/Base64OutputStream;
      //   4: invokevirtual 33\011android/util/Base64OutputStream:close\011()V
      //   7: aload_0
      //   8: getfield 19\011com/google/android/gms/internal/zzap$zza:zzoF\011Ljava/io/ByteArrayOutputStream;
      //   11: invokevirtual 34\011java/io/ByteArrayOutputStream:close\011()V
      //   14: aload_0
      //   15: getfield 19\011com/google/android/gms/internal/zzap$zza:zzoF\011Ljava/io/ByteArrayOutputStream;
      //   18: invokevirtual 36\011java/io/ByteArrayOutputStream:toString\011()Ljava/lang/String;
      //   21: astore 4
      //   23: aload_0
      //   24: aconst_null
      //   25: putfield 19\011com/google/android/gms/internal/zzap$zza:zzoF\011Ljava/io/ByteArrayOutputStream;
      //   28: aload_0
      //   29: aconst_null
      //   30: putfield 26\011com/google/android/gms/internal/zzap$zza:zzoG\011Landroid/util/Base64OutputStream;
      //   33: aload 4
      //   35: areturn
      //   36: astore_1
      //   37: ldc 38
      //   39: aload_1
      //   40: invokestatic 44\011com/google/android/gms/internal/zzhx:zzb\011(Ljava/lang/String;Ljava/lang/Throwable;)V
      //   43: goto -36 -> 7
      //   46: astore_3
      //   47: ldc 38
      //   49: aload_3
      //   50: invokestatic 44\011com/google/android/gms/internal/zzhx:zzb\011(Ljava/lang/String;Ljava/lang/Throwable;)V
      //   53: aload_0
      //   54: aconst_null
      //   55: putfield 19\011com/google/android/gms/internal/zzap$zza:zzoF\011Ljava/io/ByteArrayOutputStream;
      //   58: aload_0
      //   59: aconst_null
      //   60: putfield 26\011com/google/android/gms/internal/zzap$zza:zzoG\011Landroid/util/Base64OutputStream;
      //   63: ldc 46
      //   65: areturn
      //   66: astore_2
      //   67: aload_0
      //   68: aconst_null
      //   69: putfield 19\011com/google/android/gms/internal/zzap$zza:zzoF\011Ljava/io/ByteArrayOutputStream;
      //   72: aload_0
      //   73: aconst_null
      //   74: putfield 26\011com/google/android/gms/internal/zzap$zza:zzoG\011Landroid/util/Base64OutputStream;
      //   77: aload_2
      //   78: athrow
      //
      // Exception table:
      //   from\011to\011target\011type
      //   0\0117\01136\011java/io/IOException
      //   7\01123\01146\011java/io/IOException
      //   7\01123\01166\011finally
      //   47\01153\01166\011finally
    }

    public void write(byte[] paramArrayOfByte)
      throws IOException
    {
      this.zzoG.write(paramArrayOfByte);
    }
  }
}