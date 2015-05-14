package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tagmanager.zzbf;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class zzvn
{
  public static final Integer zzaCx = Integer.valueOf(0);
  public static final Integer zzaCy = Integer.valueOf(1);
  private final Context mContext;
  private final ExecutorService zzazT;

  public zzvn(Context paramContext)
  {
    this(paramContext, Executors.newSingleThreadExecutor());
  }

  zzvn(Context paramContext, ExecutorService paramExecutorService)
  {
    this.mContext = paramContext;
    this.zzazT = paramExecutorService;
  }

  private String zzdF(String paramString)
  {
    return "resource_" + paramString;
  }

  private byte[] zzf(InputStream paramInputStream)
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    try
    {
      zzlz.zza(paramInputStream, localByteArrayOutputStream);
      try
      {
        paramInputStream.close();
        return localByteArrayOutputStream.toByteArray();
      }
      catch (IOException localIOException4)
      {
        zzbf.zzac("Error closing stream for reading resource from disk");
        return null;
      }
    }
    catch (IOException localIOException2)
    {
      while (true)
      {
        zzbf.zzac("Failed to read the resource from disk");
        try
        {
          paramInputStream.close();
        }
        catch (IOException localIOException3)
        {
          zzbf.zzac("Error closing stream for reading resource from disk");
          return null;
        }
      }
    }
    finally
    {
      try
      {
        paramInputStream.close();
        throw localObject;
      }
      catch (IOException localIOException1)
      {
        zzbf.zzac("Error closing stream for reading resource from disk");
      }
    }
    return null;
  }

  public void zza(final String paramString, final Integer paramInteger, final zzvh paramzzvh, final zzvm paramzzvm)
  {
    this.zzazT.execute(new Runnable()
    {
      public void run()
      {
        zzvn.this.zzb(paramString, paramInteger, paramzzvh, paramzzvm);
      }
    });
  }

  void zzb(String paramString, Integer paramInteger, zzvh paramzzvh, zzvm paramzzvm)
  {
    zzbf.zzab("DiskLoader: Starting to load resource from Disk.");
    try
    {
      Object localObject2 = paramzzvh.zzn(zzf(new FileInputStream(zzdE(paramString))));
      if (localObject2 != null)
      {
        zzbf.zzab("Saved resource loaded: " + zzdF(paramString));
        paramzzvm.zza(Status.zzNo, localObject2, zzaCy, zzdD(paramString));
        return;
      }
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      zzbf.zzZ("Saved resource not found: " + zzdF(paramString));
      if (paramInteger == null)
      {
        paramzzvm.zza(Status.zzNq, null, null, 0L);
        return;
      }
    }
    catch (zzvl.zzg localzzg1)
    {
      while (true)
        zzbf.zzZ("Saved resource is corrupted: " + zzdF(paramString));
    }
    try
    {
      InputStream localInputStream = this.mContext.getResources().openRawResource(paramInteger.intValue());
      if (localInputStream != null)
      {
        Object localObject1 = paramzzvh.zzn(zzf(localInputStream));
        if (localObject1 != null)
        {
          zzbf.zzab("Default resource loaded: " + this.mContext.getResources().getResourceEntryName(paramInteger.intValue()));
          paramzzvm.zza(Status.zzNo, localObject1, zzaCx, 0L);
          return;
        }
      }
    }
    catch (Resources.NotFoundException localNotFoundException)
    {
      zzbf.zzZ("Default resource not found. ID: " + paramInteger);
      paramzzvm.zza(Status.zzNq, null, null, 0L);
      return;
    }
    catch (zzvl.zzg localzzg2)
    {
      while (true)
        zzbf.zzZ("Default resource resource is corrupted: " + paramInteger);
    }
  }

  public long zzdD(String paramString)
  {
    File localFile = zzdE(paramString);
    if (localFile.exists())
      return localFile.lastModified();
    return 0L;
  }

  File zzdE(String paramString)
  {
    return new File(this.mContext.getDir("google_tagmanager", 0), zzdF(paramString));
  }

  public void zzf(final String paramString, final byte[] paramArrayOfByte)
  {
    this.zzazT.execute(new Runnable()
    {
      public void run()
      {
        zzvn.this.zzg(paramString, paramArrayOfByte);
      }
    });
  }

  // ERROR //
  void zzg(String paramString, byte[] paramArrayOfByte)
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_1
    //   2: invokevirtual 117\011com/google/android/gms/internal/zzvn:zzdE\011(Ljava/lang/String;)Ljava/io/File;
    //   5: astore_3
    //   6: new 214\011java/io/FileOutputStream
    //   9: dup
    //   10: aload_3
    //   11: invokespecial 215\011java/io/FileOutputStream:<init>\011(Ljava/io/File;)V
    //   14: astore 4
    //   16: aload 4
    //   18: aload_2
    //   19: invokevirtual 219\011java/io/FileOutputStream:write\011([B)V
    //   22: aload 4
    //   24: invokevirtual 220\011java/io/FileOutputStream:close\011()V
    //   27: new 44\011java/lang/StringBuilder
    //   30: dup
    //   31: invokespecial 45\011java/lang/StringBuilder:<init>\011()V
    //   34: ldc 222
    //   36: invokevirtual 51\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   39: aload_1
    //   40: invokevirtual 51\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   43: ldc 224
    //   45: invokevirtual 51\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   48: invokevirtual 55\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   51: invokestatic 111\011com/google/android/gms/tagmanager/zzbf:zzab\011(Ljava/lang/String;)V
    //   54: return
    //   55: astore 11
    //   57: ldc 226
    //   59: invokestatic 152\011com/google/android/gms/tagmanager/zzbf:zzZ\011(Ljava/lang/String;)V
    //   62: return
    //   63: astore 10
    //   65: ldc 228
    //   67: invokestatic 152\011com/google/android/gms/tagmanager/zzbf:zzZ\011(Ljava/lang/String;)V
    //   70: return
    //   71: astore 7
    //   73: ldc 230
    //   75: invokestatic 152\011com/google/android/gms/tagmanager/zzbf:zzZ\011(Ljava/lang/String;)V
    //   78: aload_3
    //   79: invokevirtual 233\011java/io/File:delete\011()Z
    //   82: pop
    //   83: aload 4
    //   85: invokevirtual 220\011java/io/FileOutputStream:close\011()V
    //   88: new 44\011java/lang/StringBuilder
    //   91: dup
    //   92: invokespecial 45\011java/lang/StringBuilder:<init>\011()V
    //   95: ldc 222
    //   97: invokevirtual 51\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   100: aload_1
    //   101: invokevirtual 51\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   104: ldc 224
    //   106: invokevirtual 51\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   109: invokevirtual 55\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   112: invokestatic 111\011com/google/android/gms/tagmanager/zzbf:zzab\011(Ljava/lang/String;)V
    //   115: return
    //   116: astore 9
    //   118: ldc 228
    //   120: invokestatic 152\011com/google/android/gms/tagmanager/zzbf:zzZ\011(Ljava/lang/String;)V
    //   123: return
    //   124: astore 5
    //   126: aload 4
    //   128: invokevirtual 220\011java/io/FileOutputStream:close\011()V
    //   131: new 44\011java/lang/StringBuilder
    //   134: dup
    //   135: invokespecial 45\011java/lang/StringBuilder:<init>\011()V
    //   138: ldc 222
    //   140: invokevirtual 51\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   143: aload_1
    //   144: invokevirtual 51\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   147: ldc 224
    //   149: invokevirtual 51\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   152: invokevirtual 55\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   155: invokestatic 111\011com/google/android/gms/tagmanager/zzbf:zzab\011(Ljava/lang/String;)V
    //   158: aload 5
    //   160: athrow
    //   161: astore 6
    //   163: ldc 228
    //   165: invokestatic 152\011com/google/android/gms/tagmanager/zzbf:zzZ\011(Ljava/lang/String;)V
    //   168: goto -10 -> 158
    //
    // Exception table:
    //   from\011to\011target\011type
    //   6\01116\01155\011java/io/FileNotFoundException
    //   22\01154\01163\011java/io/IOException
    //   16\01122\01171\011java/io/IOException
    //   83\011115\011116\011java/io/IOException
    //   16\01122\011124\011finally
    //   73\01183\011124\011finally
    //   126\011158\011161\011java/io/IOException
  }
}