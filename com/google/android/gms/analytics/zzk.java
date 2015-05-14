package com.google.android.gms.analytics;

import android.content.Context;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzra;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;

class zzk
  implements zzq
{
  private final zzra zzAM;
  private volatile String zzBC;
  private Future<String> zzBD;

  protected zzk(zzra paramzzra)
  {
    zzx.zzl(paramzzra);
    this.zzAM = paramzzra;
    this.zzBD = paramzzra.zza(new Callable()
    {
      public String zzfA()
        throws Exception
      {
        return zzk.this.zzfx();
      }
    });
  }

  // ERROR //
  protected static String zzC(Context paramContext)
  {
    // Byte code:
    //   0: ldc 47
    //   2: invokestatic 51\011com/google/android/gms/common/internal/zzx:zzbe\011(Ljava/lang/String;)V
    //   5: aload_0
    //   6: ldc 53
    //   8: invokevirtual 59\011android/content/Context:openFileInput\011(Ljava/lang/String;)Ljava/io/FileInputStream;
    //   11: astore 11
    //   13: aload 11
    //   15: astore_2
    //   16: bipush 36
    //   18: newarray byte
    //   20: astore 14
    //   22: aload_2
    //   23: aload 14
    //   25: iconst_0
    //   26: aload 14
    //   28: arraylength
    //   29: invokevirtual 65\011java/io/FileInputStream:read\011([BII)I
    //   32: istore 15
    //   34: aload_2
    //   35: invokevirtual 69\011java/io/FileInputStream:available\011()I
    //   38: ifle +56 -> 94
    //   41: ldc 71
    //   43: invokestatic 76\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   46: aload_2
    //   47: invokevirtual 79\011java/io/FileInputStream:close\011()V
    //   50: aload_0
    //   51: ldc 53
    //   53: invokevirtual 83\011android/content/Context:deleteFile\011(Ljava/lang/String;)Z
    //   56: pop
    //   57: aload_2
    //   58: ifnull +7 -> 65
    //   61: aload_2
    //   62: invokevirtual 79\011java/io/FileInputStream:close\011()V
    //   65: aconst_null
    //   66: areturn
    //   67: astore 21
    //   69: new 85\011java/lang/StringBuilder
    //   72: dup
    //   73: invokespecial 86\011java/lang/StringBuilder:<init>\011()V
    //   76: ldc 88
    //   78: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   81: aload 21
    //   83: invokevirtual 95\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   86: invokevirtual 99\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   89: invokestatic 76\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   92: aconst_null
    //   93: areturn
    //   94: iload 15
    //   96: bipush 14
    //   98: if_icmpge +56 -> 154
    //   101: ldc 101
    //   103: invokestatic 76\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   106: aload_2
    //   107: invokevirtual 79\011java/io/FileInputStream:close\011()V
    //   110: aload_0
    //   111: ldc 53
    //   113: invokevirtual 83\011android/content/Context:deleteFile\011(Ljava/lang/String;)Z
    //   116: pop
    //   117: aload_2
    //   118: ifnull -53 -> 65
    //   121: aload_2
    //   122: invokevirtual 79\011java/io/FileInputStream:close\011()V
    //   125: aconst_null
    //   126: areturn
    //   127: astore 19
    //   129: new 85\011java/lang/StringBuilder
    //   132: dup
    //   133: invokespecial 86\011java/lang/StringBuilder:<init>\011()V
    //   136: ldc 88
    //   138: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   141: aload 19
    //   143: invokevirtual 95\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   146: invokevirtual 99\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   149: invokestatic 76\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   152: aconst_null
    //   153: areturn
    //   154: aload_2
    //   155: invokevirtual 79\011java/io/FileInputStream:close\011()V
    //   158: new 103\011java/lang/String
    //   161: dup
    //   162: aload 14
    //   164: iconst_0
    //   165: iload 15
    //   167: invokespecial 106\011java/lang/String:<init>\011([BII)V
    //   170: astore 16
    //   172: ldc 108
    //   174: invokestatic 111\011com/google/android/gms/analytics/zzae:zzab\011(Ljava/lang/String;)V
    //   177: aload_2
    //   178: ifnull +7 -> 185
    //   181: aload_2
    //   182: invokevirtual 79\011java/io/FileInputStream:close\011()V
    //   185: aload 16
    //   187: areturn
    //   188: astore 17
    //   190: new 85\011java/lang/StringBuilder
    //   193: dup
    //   194: invokespecial 86\011java/lang/StringBuilder:<init>\011()V
    //   197: ldc 88
    //   199: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   202: aload 17
    //   204: invokevirtual 95\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   207: invokevirtual 99\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   210: invokestatic 76\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   213: goto -28 -> 185
    //   216: astore 8
    //   218: aconst_null
    //   219: astore 9
    //   221: aload 9
    //   223: ifnull -158 -> 65
    //   226: aload 9
    //   228: invokevirtual 79\011java/io/FileInputStream:close\011()V
    //   231: aconst_null
    //   232: areturn
    //   233: astore 10
    //   235: new 85\011java/lang/StringBuilder
    //   238: dup
    //   239: invokespecial 86\011java/lang/StringBuilder:<init>\011()V
    //   242: ldc 88
    //   244: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   247: aload 10
    //   249: invokevirtual 95\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   252: invokevirtual 99\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   255: invokestatic 76\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   258: aconst_null
    //   259: areturn
    //   260: astore 5
    //   262: aconst_null
    //   263: astore_2
    //   264: ldc 113
    //   266: invokestatic 76\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   269: aload_0
    //   270: ldc 53
    //   272: invokevirtual 83\011android/content/Context:deleteFile\011(Ljava/lang/String;)Z
    //   275: pop
    //   276: aload_2
    //   277: ifnull -212 -> 65
    //   280: aload_2
    //   281: invokevirtual 79\011java/io/FileInputStream:close\011()V
    //   284: aconst_null
    //   285: areturn
    //   286: astore 7
    //   288: new 85\011java/lang/StringBuilder
    //   291: dup
    //   292: invokespecial 86\011java/lang/StringBuilder:<init>\011()V
    //   295: ldc 88
    //   297: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   300: aload 7
    //   302: invokevirtual 95\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   305: invokevirtual 99\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   308: invokestatic 76\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   311: aconst_null
    //   312: areturn
    //   313: astore_1
    //   314: aconst_null
    //   315: astore_2
    //   316: aload_1
    //   317: astore_3
    //   318: aload_2
    //   319: ifnull +7 -> 326
    //   322: aload_2
    //   323: invokevirtual 79\011java/io/FileInputStream:close\011()V
    //   326: aload_3
    //   327: athrow
    //   328: astore 4
    //   330: new 85\011java/lang/StringBuilder
    //   333: dup
    //   334: invokespecial 86\011java/lang/StringBuilder:<init>\011()V
    //   337: ldc 88
    //   339: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   342: aload 4
    //   344: invokevirtual 95\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   347: invokevirtual 99\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   350: invokestatic 76\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   353: goto -27 -> 326
    //   356: astore_3
    //   357: goto -39 -> 318
    //   360: astore 13
    //   362: goto -98 -> 264
    //   365: astore 12
    //   367: aload_2
    //   368: astore 9
    //   370: goto -149 -> 221
    //
    // Exception table:
    //   from\011to\011target\011type
    //   61\01165\01167\011java/io/IOException
    //   121\011125\011127\011java/io/IOException
    //   181\011185\011188\011java/io/IOException
    //   5\01113\011216\011java/io/FileNotFoundException
    //   226\011231\011233\011java/io/IOException
    //   5\01113\011260\011java/io/IOException
    //   280\011284\011286\011java/io/IOException
    //   5\01113\011313\011finally
    //   322\011326\011328\011java/io/IOException
    //   16\01157\011356\011finally
    //   101\011117\011356\011finally
    //   154\011177\011356\011finally
    //   264\011276\011356\011finally
    //   16\01157\011360\011java/io/IOException
    //   101\011117\011360\011java/io/IOException
    //   154\011177\011360\011java/io/IOException
    //   16\01157\011365\011java/io/FileNotFoundException
    //   101\011117\011365\011java/io/FileNotFoundException
    //   154\011177\011365\011java/io/FileNotFoundException
  }

  private static boolean zzf(Context paramContext, String paramString)
  {
    zzx.zzbn(paramString);
    zzx.zzbe("ClientId should be saved from worker thread");
    FileOutputStream localFileOutputStream = null;
    try
    {
      zzae.zzab("Storing clientId.");
      localFileOutputStream = paramContext.openFileOutput("gaClientId", 0);
      localFileOutputStream.write(paramString.getBytes());
      bool = true;
      if (localFileOutputStream != null);
      try
      {
        localFileOutputStream.close();
        return bool;
      }
      catch (IOException localIOException5)
      {
        zzae.zzZ("Failed to close clientId writing stream: " + localIOException5);
        return bool;
      }
    }
    catch (FileNotFoundException localFileNotFoundException)
    {
      do
      {
        zzae.zzZ("Error creating clientId file.");
        bool = false;
      }
      while (localFileOutputStream == null);
      try
      {
        localFileOutputStream.close();
        return false;
      }
      catch (IOException localIOException4)
      {
        zzae.zzZ("Failed to close clientId writing stream: " + localIOException4);
        return false;
      }
    }
    catch (IOException localIOException2)
    {
      do
      {
        zzae.zzZ("Error writing to clientId file.");
        boolean bool = false;
      }
      while (localFileOutputStream == null);
      try
      {
        localFileOutputStream.close();
        return false;
      }
      catch (IOException localIOException3)
      {
        zzae.zzZ("Failed to close clientId writing stream: " + localIOException3);
        return false;
      }
    }
    finally
    {
      if (localFileOutputStream == null);
    }
    try
    {
      localFileOutputStream.close();
      throw localObject;
    }
    catch (IOException localIOException1)
    {
      while (true)
        zzae.zzZ("Failed to close clientId writing stream: " + localIOException1);
    }
  }

  private String zzfy()
  {
    String str = zzfz();
    try
    {
      if (!zzf(this.zzAM.getContext(), str))
        str = "0";
      return str;
    }
    catch (Exception localException)
    {
      zzae.zzZ("Error saving clientId file: " + localException);
    }
    return "0";
  }

  public String getValue(String paramString)
  {
    if ("&cid".equals(paramString))
      return zzfv();
    return null;
  }

  public boolean zzaj(String paramString)
  {
    return "&cid".equals(paramString);
  }

  // ERROR //
  protected String zzfv()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 39\011com/google/android/gms/analytics/zzk:zzBD\011Ljava/util/concurrent/Future;
    //   6: astore_2
    //   7: aload_2
    //   8: ifnull +29 -> 37
    //   11: aload_0
    //   12: aload_0
    //   13: getfield 39\011com/google/android/gms/analytics/zzk:zzBD\011Ljava/util/concurrent/Future;
    //   16: invokeinterface 184 1 0
    //   21: checkcast 103\011java/lang/String
    //   24: putfield 186\011com/google/android/gms/analytics/zzk:zzBC\011Ljava/lang/String;
    //   27: ldc 188
    //   29: invokestatic 111\011com/google/android/gms/analytics/zzae:zzab\011(Ljava/lang/String;)V
    //   32: aload_0
    //   33: aconst_null
    //   34: putfield 39\011com/google/android/gms/analytics/zzk:zzBD\011Ljava/util/concurrent/Future;
    //   37: aload_0
    //   38: getfield 186\011com/google/android/gms/analytics/zzk:zzBC\011Ljava/lang/String;
    //   41: astore_3
    //   42: aload_0
    //   43: monitorexit
    //   44: aload_3
    //   45: areturn
    //   46: astore 5
    //   48: new 85\011java/lang/StringBuilder
    //   51: dup
    //   52: invokespecial 86\011java/lang/StringBuilder:<init>\011()V
    //   55: ldc 190
    //   57: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   60: aload 5
    //   62: invokevirtual 95\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   65: invokevirtual 99\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   68: invokestatic 76\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   71: aload_0
    //   72: ldc 161
    //   74: putfield 186\011com/google/android/gms/analytics/zzk:zzBC\011Ljava/lang/String;
    //   77: goto -50 -> 27
    //   80: astore_1
    //   81: aload_0
    //   82: monitorexit
    //   83: aload_1
    //   84: athrow
    //   85: astore 4
    //   87: new 85\011java/lang/StringBuilder
    //   90: dup
    //   91: invokespecial 86\011java/lang/StringBuilder:<init>\011()V
    //   94: ldc 190
    //   96: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   99: aload 4
    //   101: invokevirtual 95\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   104: invokevirtual 99\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   107: invokestatic 76\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   110: aload_0
    //   111: ldc 161
    //   113: putfield 186\011com/google/android/gms/analytics/zzk:zzBC\011Ljava/lang/String;
    //   116: goto -89 -> 27
    //
    // Exception table:
    //   from\011to\011target\011type
    //   11\01127\01146\011java/lang/InterruptedException
    //   2\0117\01180\011finally
    //   11\01127\01180\011finally
    //   27\01137\01180\011finally
    //   37\01144\01180\011finally
    //   48\01177\01180\011finally
    //   81\01183\01180\011finally
    //   87\011116\01180\011finally
    //   11\01127\01185\011java/util/concurrent/ExecutionException
  }

  String zzfw()
  {
    try
    {
      this.zzBC = null;
      this.zzBD = this.zzAM.zza(new Callable()
      {
        public String zzfA()
          throws Exception
        {
          return zzk.zza(zzk.this);
        }
      });
      return zzfv();
    }
    finally
    {
    }
  }

  String zzfx()
  {
    String str = zzC(this.zzAM.getContext());
    if (str == null)
      str = zzfy();
    return str;
  }

  protected String zzfz()
  {
    return UUID.randomUUID().toString().toLowerCase();
  }
}