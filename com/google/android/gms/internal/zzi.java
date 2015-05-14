package com.google.android.gms.internal;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import dalvik.system.DexClassLoader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.util.ArrayList;

public abstract class zzi extends zzh
{
  private static long startTime = 0L;
  private static Method zzkA;
  private static Method zzkB;
  private static Method zzkC;
  private static Method zzkD;
  private static Method zzkE;
  private static Method zzkF;
  private static Method zzkG;
  private static Method zzkH;
  private static String zzkI;
  private static String zzkJ;
  private static String zzkK;
  private static zzo zzkL;
  static boolean zzkM = false;
  private static Method zzkz;

  protected zzi(Context paramContext, zzm paramzzm, zzn paramzzn)
  {
    super(paramContext, paramzzm, paramzzn);
  }

  static String zza(Context paramContext, zzm paramzzm)
    throws zzi.zza
  {
    if (zzkJ != null)
      return zzkJ;
    if (zzkC == null)
      throw new zza();
    try
    {
      localByteBuffer = (ByteBuffer)zzkC.invoke(null, new Object[] { paramContext });
      if (localByteBuffer == null)
        throw new zza();
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      ByteBuffer localByteBuffer;
      throw new zza(localIllegalAccessException);
      zzkJ = paramzzm.zza(localByteBuffer.array(), true);
      String str = zzkJ;
      return str;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      throw new zza(localInvocationTargetException);
    }
  }

  static ArrayList<Long> zza(MotionEvent paramMotionEvent, DisplayMetrics paramDisplayMetrics)
    throws zzi.zza
  {
    if ((zzkD == null) || (paramMotionEvent == null))
      throw new zza();
    try
    {
      ArrayList localArrayList = (ArrayList)zzkD.invoke(null, new Object[] { paramMotionEvent, paramDisplayMetrics });
      return localArrayList;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new zza(localIllegalAccessException);
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      throw new zza(localInvocationTargetException);
    }
  }

  // ERROR //
  protected static void zza(String paramString, Context paramContext, zzm paramzzm)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 30\011com/google/android/gms/internal/zzi:zzkM\011Z
    //   6: istore 4
    //   8: iload 4
    //   10: ifne +36 -> 46
    //   13: new 80\011com/google/android/gms/internal/zzo
    //   16: dup
    //   17: aload_2
    //   18: aconst_null
    //   19: invokespecial 83\011com/google/android/gms/internal/zzo:<init>\011(Lcom/google/android/gms/internal/zzm;Ljava/security/SecureRandom;)V
    //   22: putstatic 85\011com/google/android/gms/internal/zzi:zzkL\011Lcom/google/android/gms/internal/zzo;
    //   25: aload_0
    //   26: putstatic 87\011com/google/android/gms/internal/zzi:zzkI\011Ljava/lang/String;
    //   29: aload_1
    //   30: invokestatic 91\011com/google/android/gms/internal/zzi:zzg\011(Landroid/content/Context;)V
    //   33: invokestatic 95\011com/google/android/gms/internal/zzi:zzw\011()Ljava/lang/Long;
    //   36: invokevirtual 101\011java/lang/Long:longValue\011()J
    //   39: putstatic 28\011com/google/android/gms/internal/zzi:startTime\011J
    //   42: iconst_1
    //   43: putstatic 30\011com/google/android/gms/internal/zzi:zzkM\011Z
    //   46: ldc 2
    //   48: monitorexit
    //   49: return
    //   50: astore_3
    //   51: ldc 2
    //   53: monitorexit
    //   54: aload_3
    //   55: athrow
    //   56: astore 6
    //   58: goto -12 -> 46
    //   61: astore 5
    //   63: goto -17 -> 46
    //
    // Exception table:
    //   from\011to\011target\011type
    //   3\0118\01150\011finally
    //   13\01146\01150\011finally
    //   13\01146\01156\011java/lang/UnsupportedOperationException
    //   13\01146\01161\011com/google/android/gms/internal/zzi$zza
  }

  static String zzb(Context paramContext, zzm paramzzm)
    throws zzi.zza
  {
    if (zzkK != null)
      return zzkK;
    if (zzkF == null)
      throw new zza();
    try
    {
      localByteBuffer = (ByteBuffer)zzkF.invoke(null, new Object[] { paramContext });
      if (localByteBuffer == null)
        throw new zza();
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      ByteBuffer localByteBuffer;
      throw new zza(localIllegalAccessException);
      zzkK = paramzzm.zza(localByteBuffer.array(), true);
      String str = zzkK;
      return str;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      throw new zza(localInvocationTargetException);
    }
  }

  private static String zzb(byte[] paramArrayOfByte, String paramString)
    throws zzi.zza
  {
    try
    {
      String str = new String(zzkL.zzc(paramArrayOfByte, paramString), "UTF-8");
      return str;
    }
    catch (zzo.zza localzza)
    {
      throw new zza(localzza);
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new zza(localUnsupportedEncodingException);
    }
  }

  static String zzd(Context paramContext)
    throws zzi.zza
  {
    if (zzkE == null)
      throw new zza();
    String str;
    try
    {
      str = (String)zzkE.invoke(null, new Object[] { paramContext });
      if (str == null)
        throw new zza();
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new zza(localIllegalAccessException);
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      throw new zza(localInvocationTargetException);
    }
    return str;
  }

  static ArrayList<Long> zze(Context paramContext)
    throws zzi.zza
  {
    if (zzkG == null)
      throw new zza();
    ArrayList localArrayList;
    try
    {
      localArrayList = (ArrayList)zzkG.invoke(null, new Object[] { paramContext });
      if ((localArrayList == null) || (localArrayList.size() != 2))
        throw new zza();
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new zza(localIllegalAccessException);
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      throw new zza(localInvocationTargetException);
    }
    return localArrayList;
  }

  static int[] zzf(Context paramContext)
    throws zzi.zza
  {
    if (zzkH == null)
      throw new zza();
    try
    {
      int[] arrayOfInt = (int[])zzkH.invoke(null, new Object[] { paramContext });
      return arrayOfInt;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new zza(localIllegalAccessException);
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      throw new zza(localInvocationTargetException);
    }
  }

  private static void zzg(Context paramContext)
    throws zzi.zza
  {
    try
    {
      arrayOfByte1 = zzkL.zzb(zzq.getKey());
      arrayOfByte2 = zzkL.zzc(arrayOfByte1, zzq.zzE());
      localFile1 = paramContext.getCacheDir();
      if (localFile1 == null)
      {
        localFile1 = paramContext.getDir("dex", 0);
        if (localFile1 == null)
          throw new zza();
      }
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      byte[] arrayOfByte1;
      byte[] arrayOfByte2;
      File localFile1;
      throw new zza(localFileNotFoundException);
      File localFile2 = localFile1;
      File localFile3 = File.createTempFile("ads", ".jar", localFile2);
      FileOutputStream localFileOutputStream = new FileOutputStream(localFile3);
      localFileOutputStream.write(arrayOfByte2, 0, arrayOfByte2.length);
      localFileOutputStream.close();
      try
      {
        DexClassLoader localDexClassLoader = new DexClassLoader(localFile3.getAbsolutePath(), localFile2.getAbsolutePath(), null, paramContext.getClassLoader());
        Class localClass1 = localDexClassLoader.loadClass(zzb(arrayOfByte1, zzq.zzH()));
        Class localClass2 = localDexClassLoader.loadClass(zzb(arrayOfByte1, zzq.zzT()));
        Class localClass3 = localDexClassLoader.loadClass(zzb(arrayOfByte1, zzq.zzN()));
        Class localClass4 = localDexClassLoader.loadClass(zzb(arrayOfByte1, zzq.zzL()));
        Class localClass5 = localDexClassLoader.loadClass(zzb(arrayOfByte1, zzq.zzV()));
        Class localClass6 = localDexClassLoader.loadClass(zzb(arrayOfByte1, zzq.zzJ()));
        Class localClass7 = localDexClassLoader.loadClass(zzb(arrayOfByte1, zzq.zzR()));
        Class localClass8 = localDexClassLoader.loadClass(zzb(arrayOfByte1, zzq.zzP()));
        Class localClass9 = localDexClassLoader.loadClass(zzb(arrayOfByte1, zzq.zzF()));
        zzkz = localClass1.getMethod(zzb(arrayOfByte1, zzq.zzI()), new Class[0]);
        zzkA = localClass2.getMethod(zzb(arrayOfByte1, zzq.zzU()), new Class[0]);
        zzkB = localClass3.getMethod(zzb(arrayOfByte1, zzq.zzO()), new Class[0]);
        zzkC = localClass4.getMethod(zzb(arrayOfByte1, zzq.zzM()), new Class[] { Context.class });
        zzkD = localClass5.getMethod(zzb(arrayOfByte1, zzq.zzW()), new Class[] { MotionEvent.class, DisplayMetrics.class });
        zzkE = localClass6.getMethod(zzb(arrayOfByte1, zzq.zzK()), new Class[] { Context.class });
        zzkF = localClass7.getMethod(zzb(arrayOfByte1, zzq.zzS()), new Class[] { Context.class });
        zzkG = localClass8.getMethod(zzb(arrayOfByte1, zzq.zzQ()), new Class[] { Context.class });
        zzkH = localClass9.getMethod(zzb(arrayOfByte1, zzq.zzG()), new Class[] { Context.class });
        String str2;
        return;
      }
      finally
      {
        String str1 = localFile3.getName();
        localFile3.delete();
        new File(localFile2, str1.replace(".jar", ".dex")).delete();
      }
    }
    catch (IOException localIOException)
    {
      throw new zza(localIOException);
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new zza(localClassNotFoundException);
    }
    catch (zzo.zza localzza)
    {
      throw new zza(localzza);
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      throw new zza(localNoSuchMethodException);
    }
    catch (NullPointerException localNullPointerException)
    {
      throw new zza(localNullPointerException);
    }
  }

  static String zzv()
    throws zzi.zza
  {
    if (zzkI == null)
      throw new zza();
    return zzkI;
  }

  static Long zzw()
    throws zzi.zza
  {
    if (zzkz == null)
      throw new zza();
    try
    {
      Long localLong = (Long)zzkz.invoke(null, new Object[0]);
      return localLong;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new zza(localIllegalAccessException);
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      throw new zza(localInvocationTargetException);
    }
  }

  static String zzx()
    throws zzi.zza
  {
    if (zzkB == null)
      throw new zza();
    try
    {
      String str = (String)zzkB.invoke(null, new Object[0]);
      return str;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new zza(localIllegalAccessException);
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      throw new zza(localInvocationTargetException);
    }
  }

  static Long zzy()
    throws zzi.zza
  {
    if (zzkA == null)
      throw new zza();
    try
    {
      Long localLong = (Long)zzkA.invoke(null, new Object[0]);
      return localLong;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new zza(localIllegalAccessException);
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      throw new zza(localInvocationTargetException);
    }
  }

  // ERROR //
  protected void zzb(Context paramContext)
  {
    // Byte code:
    //   0: aload_0
    //   1: iconst_1
    //   2: invokestatic 305\011com/google/android/gms/internal/zzi:zzx\011()Ljava/lang/String;
    //   5: invokevirtual 308\011com/google/android/gms/internal/zzi:zza\011(ILjava/lang/String;)V
    //   8: aload_0
    //   9: iconst_2
    //   10: invokestatic 310\011com/google/android/gms/internal/zzi:zzv\011()Ljava/lang/String;
    //   13: invokevirtual 308\011com/google/android/gms/internal/zzi:zza\011(ILjava/lang/String;)V
    //   16: invokestatic 95\011com/google/android/gms/internal/zzi:zzw\011()Ljava/lang/Long;
    //   19: invokevirtual 101\011java/lang/Long:longValue\011()J
    //   22: lstore 13
    //   24: aload_0
    //   25: bipush 25
    //   27: lload 13
    //   29: invokevirtual 313\011com/google/android/gms/internal/zzi:zza\011(IJ)V
    //   32: getstatic 28\011com/google/android/gms/internal/zzi:startTime\011J
    //   35: lconst_0
    //   36: lcmp
    //   37: ifeq +24 -> 61
    //   40: aload_0
    //   41: bipush 17
    //   43: lload 13
    //   45: getstatic 28\011com/google/android/gms/internal/zzi:startTime\011J
    //   48: lsub
    //   49: invokevirtual 313\011com/google/android/gms/internal/zzi:zza\011(IJ)V
    //   52: aload_0
    //   53: bipush 23
    //   55: getstatic 28\011com/google/android/gms/internal/zzi:startTime\011J
    //   58: invokevirtual 313\011com/google/android/gms/internal/zzi:zza\011(IJ)V
    //   61: aload_1
    //   62: invokestatic 315\011com/google/android/gms/internal/zzi:zze\011(Landroid/content/Context;)Ljava/util/ArrayList;
    //   65: astore 12
    //   67: aload_0
    //   68: bipush 31
    //   70: aload 12
    //   72: iconst_0
    //   73: invokevirtual 319\011java/util/ArrayList:get\011(I)Ljava/lang/Object;
    //   76: checkcast 97\011java/lang/Long
    //   79: invokevirtual 101\011java/lang/Long:longValue\011()J
    //   82: invokevirtual 313\011com/google/android/gms/internal/zzi:zza\011(IJ)V
    //   85: aload_0
    //   86: bipush 32
    //   88: aload 12
    //   90: iconst_1
    //   91: invokevirtual 319\011java/util/ArrayList:get\011(I)Ljava/lang/Object;
    //   94: checkcast 97\011java/lang/Long
    //   97: invokevirtual 101\011java/lang/Long:longValue\011()J
    //   100: invokevirtual 313\011com/google/android/gms/internal/zzi:zza\011(IJ)V
    //   103: aload_0
    //   104: bipush 33
    //   106: invokestatic 321\011com/google/android/gms/internal/zzi:zzy\011()Ljava/lang/Long;
    //   109: invokevirtual 101\011java/lang/Long:longValue\011()J
    //   112: invokevirtual 313\011com/google/android/gms/internal/zzi:zza\011(IJ)V
    //   115: aload_0
    //   116: bipush 27
    //   118: aload_1
    //   119: aload_0
    //   120: getfield 325\011com/google/android/gms/internal/zzi:zzkx\011Lcom/google/android/gms/internal/zzm;
    //   123: invokestatic 327\011com/google/android/gms/internal/zzi:zza\011(Landroid/content/Context;Lcom/google/android/gms/internal/zzm;)Ljava/lang/String;
    //   126: invokevirtual 308\011com/google/android/gms/internal/zzi:zza\011(ILjava/lang/String;)V
    //   129: aload_0
    //   130: bipush 29
    //   132: aload_1
    //   133: aload_0
    //   134: getfield 325\011com/google/android/gms/internal/zzi:zzkx\011Lcom/google/android/gms/internal/zzm;
    //   137: invokestatic 329\011com/google/android/gms/internal/zzi:zzb\011(Landroid/content/Context;Lcom/google/android/gms/internal/zzm;)Ljava/lang/String;
    //   140: invokevirtual 308\011com/google/android/gms/internal/zzi:zza\011(ILjava/lang/String;)V
    //   143: aload_1
    //   144: invokestatic 331\011com/google/android/gms/internal/zzi:zzf\011(Landroid/content/Context;)[I
    //   147: astore 11
    //   149: aload_0
    //   150: iconst_5
    //   151: aload 11
    //   153: iconst_0
    //   154: iaload
    //   155: i2l
    //   156: invokevirtual 313\011com/google/android/gms/internal/zzi:zza\011(IJ)V
    //   159: aload_0
    //   160: bipush 6
    //   162: aload 11
    //   164: iconst_1
    //   165: iaload
    //   166: i2l
    //   167: invokevirtual 313\011com/google/android/gms/internal/zzi:zza\011(IJ)V
    //   170: return
    //   171: astore 10
    //   173: return
    //   174: astore 9
    //   176: return
    //   177: astore 8
    //   179: goto -36 -> 143
    //   182: astore 7
    //   184: goto -55 -> 129
    //   187: astore 6
    //   189: goto -74 -> 115
    //   192: astore 5
    //   194: goto -91 -> 103
    //   197: astore 4
    //   199: goto -138 -> 61
    //   202: astore_3
    //   203: goto -187 -> 16
    //   206: astore_2
    //   207: goto -199 -> 8
    //
    // Exception table:
    //   from\011to\011target\011type
    //   0\0118\011171\011java/io/IOException
    //   8\01116\011171\011java/io/IOException
    //   16\01161\011171\011java/io/IOException
    //   61\011103\011171\011java/io/IOException
    //   103\011115\011171\011java/io/IOException
    //   115\011129\011171\011java/io/IOException
    //   129\011143\011171\011java/io/IOException
    //   143\011170\011171\011java/io/IOException
    //   143\011170\011174\011com/google/android/gms/internal/zzi$zza
    //   129\011143\011177\011com/google/android/gms/internal/zzi$zza
    //   115\011129\011182\011com/google/android/gms/internal/zzi$zza
    //   103\011115\011187\011com/google/android/gms/internal/zzi$zza
    //   61\011103\011192\011com/google/android/gms/internal/zzi$zza
    //   16\01161\011197\011com/google/android/gms/internal/zzi$zza
    //   8\01116\011202\011com/google/android/gms/internal/zzi$zza
    //   0\0118\011206\011com/google/android/gms/internal/zzi$zza
  }

  // ERROR //
  protected void zzc(Context paramContext)
  {
    // Byte code:
    //   0: aload_0
    //   1: iconst_2
    //   2: invokestatic 310\011com/google/android/gms/internal/zzi:zzv\011()Ljava/lang/String;
    //   5: invokevirtual 308\011com/google/android/gms/internal/zzi:zza\011(ILjava/lang/String;)V
    //   8: aload_0
    //   9: iconst_1
    //   10: invokestatic 305\011com/google/android/gms/internal/zzi:zzx\011()Ljava/lang/String;
    //   13: invokevirtual 308\011com/google/android/gms/internal/zzi:zza\011(ILjava/lang/String;)V
    //   16: aload_0
    //   17: bipush 25
    //   19: invokestatic 95\011com/google/android/gms/internal/zzi:zzw\011()Ljava/lang/Long;
    //   22: invokevirtual 101\011java/lang/Long:longValue\011()J
    //   25: invokevirtual 313\011com/google/android/gms/internal/zzi:zza\011(IJ)V
    //   28: aload_0
    //   29: getfield 335\011com/google/android/gms/internal/zzi:zzkv\011Landroid/view/MotionEvent;
    //   32: aload_0
    //   33: getfield 339\011com/google/android/gms/internal/zzi:zzkw\011Landroid/util/DisplayMetrics;
    //   36: invokestatic 341\011com/google/android/gms/internal/zzi:zza\011(Landroid/view/MotionEvent;Landroid/util/DisplayMetrics;)Ljava/util/ArrayList;
    //   39: astore 7
    //   41: aload_0
    //   42: bipush 14
    //   44: aload 7
    //   46: iconst_0
    //   47: invokevirtual 319\011java/util/ArrayList:get\011(I)Ljava/lang/Object;
    //   50: checkcast 97\011java/lang/Long
    //   53: invokevirtual 101\011java/lang/Long:longValue\011()J
    //   56: invokevirtual 313\011com/google/android/gms/internal/zzi:zza\011(IJ)V
    //   59: aload_0
    //   60: bipush 15
    //   62: aload 7
    //   64: iconst_1
    //   65: invokevirtual 319\011java/util/ArrayList:get\011(I)Ljava/lang/Object;
    //   68: checkcast 97\011java/lang/Long
    //   71: invokevirtual 101\011java/lang/Long:longValue\011()J
    //   74: invokevirtual 313\011com/google/android/gms/internal/zzi:zza\011(IJ)V
    //   77: aload 7
    //   79: invokevirtual 134\011java/util/ArrayList:size\011()I
    //   82: iconst_3
    //   83: if_icmplt +21 -> 104
    //   86: aload_0
    //   87: bipush 16
    //   89: aload 7
    //   91: iconst_2
    //   92: invokevirtual 319\011java/util/ArrayList:get\011(I)Ljava/lang/Object;
    //   95: checkcast 97\011java/lang/Long
    //   98: invokevirtual 101\011java/lang/Long:longValue\011()J
    //   101: invokevirtual 313\011com/google/android/gms/internal/zzi:zza\011(IJ)V
    //   104: return
    //   105: astore 6
    //   107: return
    //   108: astore 5
    //   110: return
    //   111: astore 4
    //   113: goto -85 -> 28
    //   116: astore_3
    //   117: goto -101 -> 16
    //   120: astore_2
    //   121: goto -113 -> 8
    //
    // Exception table:
    //   from\011to\011target\011type
    //   0\0118\011105\011java/io/IOException
    //   8\01116\011105\011java/io/IOException
    //   16\01128\011105\011java/io/IOException
    //   28\011104\011105\011java/io/IOException
    //   28\011104\011108\011com/google/android/gms/internal/zzi$zza
    //   16\01128\011111\011com/google/android/gms/internal/zzi$zza
    //   8\01116\011116\011com/google/android/gms/internal/zzi$zza
    //   0\0118\011120\011com/google/android/gms/internal/zzi$zza
  }

  static class zza extends Exception
  {
    public zza()
    {
    }

    public zza(Throwable paramThrowable)
    {
      super();
    }
  }
}