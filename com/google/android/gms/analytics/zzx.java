package com.google.android.gms.analytics;

import android.text.TextUtils;
import com.google.android.gms.internal.zzik;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

class zzx extends Thread
  implements zzf
{
  private volatile boolean mClosed;
  private final GoogleAnalytics zzBN;
  private final LinkedBlockingQueue<Runnable> zzCJ = new LinkedBlockingQueue();
  private volatile boolean zzCK;
  private volatile String zzCL;
  private volatile zzak zzCM;
  private final Lock zzCN;
  private final List<zzik> zzCO = new ArrayList();

  zzx(GoogleAnalytics paramGoogleAnalytics, zzak paramzzak)
  {
    super("GAThread");
    com.google.android.gms.common.internal.zzx.zzl(paramGoogleAnalytics);
    this.zzBN = paramGoogleAnalytics;
    this.zzCM = paramzzak;
    this.zzCO.add(new zzik("appendVersion", "&_v".substring(1), "ma4.0.6"));
    this.zzCN = new ReentrantLock();
    start();
  }

  // ERROR //
  static String zzH(android.content.Context paramContext)
  {
    // Byte code:
    //   0: aload_0
    //   1: ldc 91
    //   3: invokevirtual 97\011android/content/Context:openFileInput\011(Ljava/lang/String;)Ljava/io/FileInputStream;
    //   6: astore 10
    //   8: aload 10
    //   10: astore_2
    //   11: sipush 8192
    //   14: newarray byte
    //   16: astore 13
    //   18: aload_2
    //   19: aload 13
    //   21: iconst_0
    //   22: sipush 8192
    //   25: invokevirtual 103\011java/io/FileInputStream:read\011([BII)I
    //   28: istore 14
    //   30: aload_2
    //   31: invokevirtual 107\011java/io/FileInputStream:available\011()I
    //   34: ifle +56 -> 90
    //   37: ldc 109
    //   39: invokestatic 114\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   42: aload_2
    //   43: invokevirtual 117\011java/io/FileInputStream:close\011()V
    //   46: aload_0
    //   47: ldc 91
    //   49: invokevirtual 121\011android/content/Context:deleteFile\011(Ljava/lang/String;)Z
    //   52: pop
    //   53: iconst_0
    //   54: ifeq +7 -> 61
    //   57: aconst_null
    //   58: invokevirtual 117\011java/io/FileInputStream:close\011()V
    //   61: aconst_null
    //   62: areturn
    //   63: astore 20
    //   65: new 123\011java/lang/StringBuilder
    //   68: dup
    //   69: invokespecial 124\011java/lang/StringBuilder:<init>\011()V
    //   72: ldc 126
    //   74: invokevirtual 130\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   77: aload 20
    //   79: invokevirtual 133\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   82: invokevirtual 137\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   85: invokestatic 114\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   88: aconst_null
    //   89: areturn
    //   90: aload_2
    //   91: invokevirtual 117\011java/io/FileInputStream:close\011()V
    //   94: aload_0
    //   95: ldc 91
    //   97: invokevirtual 121\011android/content/Context:deleteFile\011(Ljava/lang/String;)Z
    //   100: pop
    //   101: iload 14
    //   103: ifgt +45 -> 148
    //   106: ldc 139
    //   108: invokestatic 142\011com/google/android/gms/analytics/zzae:zzac\011(Ljava/lang/String;)V
    //   111: iconst_0
    //   112: ifeq -51 -> 61
    //   115: aconst_null
    //   116: invokevirtual 117\011java/io/FileInputStream:close\011()V
    //   119: aconst_null
    //   120: areturn
    //   121: astore 16
    //   123: new 123\011java/lang/StringBuilder
    //   126: dup
    //   127: invokespecial 124\011java/lang/StringBuilder:<init>\011()V
    //   130: ldc 126
    //   132: invokevirtual 130\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   135: aload 16
    //   137: invokevirtual 133\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   140: invokevirtual 137\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   143: invokestatic 114\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   146: aconst_null
    //   147: areturn
    //   148: new 60\011java/lang/String
    //   151: dup
    //   152: aload 13
    //   154: iconst_0
    //   155: iload 14
    //   157: invokespecial 145\011java/lang/String:<init>\011([BII)V
    //   160: astore 17
    //   162: new 123\011java/lang/StringBuilder
    //   165: dup
    //   166: invokespecial 124\011java/lang/StringBuilder:<init>\011()V
    //   169: ldc 147
    //   171: invokevirtual 130\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   174: aload 17
    //   176: invokevirtual 130\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   179: invokevirtual 137\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   182: invokestatic 150\011com/google/android/gms/analytics/zzae:zzaa\011(Ljava/lang/String;)V
    //   185: iconst_0
    //   186: ifeq +7 -> 193
    //   189: aconst_null
    //   190: invokevirtual 117\011java/io/FileInputStream:close\011()V
    //   193: aload 17
    //   195: areturn
    //   196: astore 18
    //   198: new 123\011java/lang/StringBuilder
    //   201: dup
    //   202: invokespecial 124\011java/lang/StringBuilder:<init>\011()V
    //   205: ldc 126
    //   207: invokevirtual 130\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   210: aload 18
    //   212: invokevirtual 133\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   215: invokevirtual 137\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   218: invokestatic 114\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   221: goto -28 -> 193
    //   224: astore 8
    //   226: aconst_null
    //   227: astore_2
    //   228: ldc 152
    //   230: invokestatic 150\011com/google/android/gms/analytics/zzae:zzaa\011(Ljava/lang/String;)V
    //   233: aload_2
    //   234: ifnull -173 -> 61
    //   237: aload_2
    //   238: invokevirtual 117\011java/io/FileInputStream:close\011()V
    //   241: aconst_null
    //   242: areturn
    //   243: astore 9
    //   245: new 123\011java/lang/StringBuilder
    //   248: dup
    //   249: invokespecial 124\011java/lang/StringBuilder:<init>\011()V
    //   252: ldc 126
    //   254: invokevirtual 130\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   257: aload 9
    //   259: invokevirtual 133\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   262: invokevirtual 137\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   265: invokestatic 114\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   268: aconst_null
    //   269: areturn
    //   270: astore 5
    //   272: aconst_null
    //   273: astore_2
    //   274: ldc 154
    //   276: invokestatic 114\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   279: aload_0
    //   280: ldc 91
    //   282: invokevirtual 121\011android/content/Context:deleteFile\011(Ljava/lang/String;)Z
    //   285: pop
    //   286: aload_2
    //   287: ifnull -226 -> 61
    //   290: aload_2
    //   291: invokevirtual 117\011java/io/FileInputStream:close\011()V
    //   294: aconst_null
    //   295: areturn
    //   296: astore 7
    //   298: new 123\011java/lang/StringBuilder
    //   301: dup
    //   302: invokespecial 124\011java/lang/StringBuilder:<init>\011()V
    //   305: ldc 126
    //   307: invokevirtual 130\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   310: aload 7
    //   312: invokevirtual 133\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   315: invokevirtual 137\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   318: invokestatic 114\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   321: aconst_null
    //   322: areturn
    //   323: astore_1
    //   324: aconst_null
    //   325: astore_2
    //   326: aload_1
    //   327: astore_3
    //   328: aload_2
    //   329: ifnull +7 -> 336
    //   332: aload_2
    //   333: invokevirtual 117\011java/io/FileInputStream:close\011()V
    //   336: aload_3
    //   337: athrow
    //   338: astore 4
    //   340: new 123\011java/lang/StringBuilder
    //   343: dup
    //   344: invokespecial 124\011java/lang/StringBuilder:<init>\011()V
    //   347: ldc 126
    //   349: invokevirtual 130\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   352: aload 4
    //   354: invokevirtual 133\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   357: invokevirtual 137\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   360: invokestatic 114\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   363: goto -27 -> 336
    //   366: astore_3
    //   367: goto -39 -> 328
    //   370: astore 12
    //   372: goto -98 -> 274
    //   375: astore 11
    //   377: goto -149 -> 228
    //
    // Exception table:
    //   from\011to\011target\011type
    //   57\01161\01163\011java/io/IOException
    //   115\011119\011121\011java/io/IOException
    //   189\011193\011196\011java/io/IOException
    //   0\0118\011224\011java/io/FileNotFoundException
    //   46\01153\011224\011java/io/FileNotFoundException
    //   94\011101\011224\011java/io/FileNotFoundException
    //   106\011111\011224\011java/io/FileNotFoundException
    //   148\011185\011224\011java/io/FileNotFoundException
    //   237\011241\011243\011java/io/IOException
    //   0\0118\011270\011java/io/IOException
    //   46\01153\011270\011java/io/IOException
    //   94\011101\011270\011java/io/IOException
    //   106\011111\011270\011java/io/IOException
    //   148\011185\011270\011java/io/IOException
    //   290\011294\011296\011java/io/IOException
    //   0\0118\011323\011finally
    //   46\01153\011323\011finally
    //   94\011101\011323\011finally
    //   106\011111\011323\011finally
    //   148\011185\011323\011finally
    //   332\011336\011338\011java/io/IOException
    //   11\01146\011366\011finally
    //   90\01194\011366\011finally
    //   228\011233\011366\011finally
    //   274\011286\011366\011finally
    //   11\01146\011370\011java/io/IOException
    //   90\01194\011370\011java/io/IOException
    //   11\01146\011375\011java/io/FileNotFoundException
    //   90\01194\011375\011java/io/FileNotFoundException
  }

  static int zzan(String paramString)
  {
    int i = 1;
    if (!TextUtils.isEmpty(paramString))
    {
      int j = -1 + paramString.length();
      i = 0;
      for (int k = j; k >= 0; k--)
      {
        int m = paramString.charAt(k);
        i = m + (0xFFFFFFF & i << 6) + (m << 14);
        int n = 0xFE00000 & i;
        if (n != 0)
          i ^= n >> 21;
      }
    }
    return i;
  }

  private void zzc(Runnable paramRunnable)
  {
    this.zzCJ.add(paramRunnable);
  }

  private String zzf(Throwable paramThrowable)
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    PrintStream localPrintStream = new PrintStream(localByteArrayOutputStream);
    paramThrowable.printStackTrace(localPrintStream);
    localPrintStream.flush();
    return new String(localByteArrayOutputStream.toByteArray());
  }

  public void dispatch()
  {
    zzc(new zzb(null));
  }

  public Thread getThread()
  {
    return this;
  }

  protected void init()
  {
    try
    {
      zzak localzzak = this.zzCM;
      if (localzzak != null);
      while (true)
      {
        return;
        this.zzCM = new zzw(this.zzBN.getContext(), this);
        this.zzCM.zzfM();
      }
    }
    finally
    {
    }
  }

  // ERROR //
  public void run()
  {
    // Byte code:
    //   0: bipush 10
    //   2: invokestatic 246\011android/os/Process:setThreadPriority\011(I)V
    //   5: ldc2_w 247
    //   8: invokestatic 252\011java/lang/Thread:sleep\011(J)V
    //   11: aload_0
    //   12: invokevirtual 254\011com/google/android/gms/analytics/zzx:init\011()V
    //   15: aload_0
    //   16: aload_0
    //   17: getfield 50\011com/google/android/gms/analytics/zzx:zzBN\011Lcom/google/android/gms/analytics/GoogleAnalytics;
    //   20: invokevirtual 229\011com/google/android/gms/analytics/GoogleAnalytics:getContext\011()Landroid/content/Context;
    //   23: invokestatic 256\011com/google/android/gms/analytics/zzx:zzH\011(Landroid/content/Context;)Ljava/lang/String;
    //   26: putfield 159\011com/google/android/gms/analytics/zzx:zzCL\011Ljava/lang/String;
    //   29: ldc_w 258
    //   32: invokestatic 261\011com/google/android/gms/analytics/zzae:zzab\011(Ljava/lang/String;)V
    //   35: aload_0
    //   36: getfield 263\011com/google/android/gms/analytics/zzx:mClosed\011Z
    //   39: ifne +171 -> 210
    //   42: aload_0
    //   43: getfield 37\011com/google/android/gms/analytics/zzx:zzCJ\011Ljava/util/concurrent/LinkedBlockingQueue;
    //   46: invokevirtual 267\011java/util/concurrent/LinkedBlockingQueue:take\011()Ljava/lang/Object;
    //   49: checkcast 269\011java/lang/Runnable
    //   52: astore 5
    //   54: aload_0
    //   55: getfield 80\011com/google/android/gms/analytics/zzx:zzCN\011Ljava/util/concurrent/locks/Lock;
    //   58: invokeinterface 274 1 0
    //   63: aload_0
    //   64: getfield 276\011com/google/android/gms/analytics/zzx:zzCK\011Z
    //   67: ifne +10 -> 77
    //   70: aload 5
    //   72: invokeinterface 278 1 0
    //   77: aload_0
    //   78: getfield 80\011com/google/android/gms/analytics/zzx:zzCN\011Ljava/util/concurrent/locks/Lock;
    //   81: invokeinterface 281 1 0
    //   86: goto -51 -> 35
    //   89: astore 4
    //   91: aload 4
    //   93: invokevirtual 282\011java/lang/InterruptedException:toString\011()Ljava/lang/String;
    //   96: invokestatic 150\011com/google/android/gms/analytics/zzae:zzaa\011(Ljava/lang/String;)V
    //   99: goto -64 -> 35
    //   102: astore_3
    //   103: new 123\011java/lang/StringBuilder
    //   106: dup
    //   107: invokespecial 124\011java/lang/StringBuilder:<init>\011()V
    //   110: ldc_w 284
    //   113: invokevirtual 130\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   116: aload_0
    //   117: aload_3
    //   118: invokespecial 286\011com/google/android/gms/analytics/zzx:zzf\011(Ljava/lang/Throwable;)Ljava/lang/String;
    //   121: invokevirtual 130\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   124: invokevirtual 137\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   127: invokestatic 114\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   130: ldc_w 288
    //   133: invokestatic 114\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   136: aload_0
    //   137: iconst_1
    //   138: putfield 276\011com/google/android/gms/analytics/zzx:zzCK\011Z
    //   141: goto -106 -> 35
    //   144: astore_1
    //   145: ldc_w 290
    //   148: invokestatic 142\011com/google/android/gms/analytics/zzae:zzac\011(Ljava/lang/String;)V
    //   151: goto -140 -> 11
    //   154: astore_2
    //   155: new 123\011java/lang/StringBuilder
    //   158: dup
    //   159: invokespecial 124\011java/lang/StringBuilder:<init>\011()V
    //   162: ldc_w 292
    //   165: invokevirtual 130\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   168: aload_0
    //   169: aload_2
    //   170: invokespecial 286\011com/google/android/gms/analytics/zzx:zzf\011(Ljava/lang/Throwable;)Ljava/lang/String;
    //   173: invokevirtual 130\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   176: invokevirtual 137\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   179: invokestatic 114\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   182: ldc_w 294
    //   185: invokestatic 114\011com/google/android/gms/analytics/zzae:zzZ\011(Ljava/lang/String;)V
    //   188: aload_0
    //   189: iconst_1
    //   190: putfield 276\011com/google/android/gms/analytics/zzx:zzCK\011Z
    //   193: goto -158 -> 35
    //   196: astore 6
    //   198: aload_0
    //   199: getfield 80\011com/google/android/gms/analytics/zzx:zzCN\011Ljava/util/concurrent/locks/Lock;
    //   202: invokeinterface 281 1 0
    //   207: aload 6
    //   209: athrow
    //   210: return
    //
    // Exception table:
    //   from\011to\011target\011type
    //   42\01163\01189\011java/lang/InterruptedException
    //   77\01186\01189\011java/lang/InterruptedException
    //   198\011210\01189\011java/lang/InterruptedException
    //   42\01163\011102\011java/lang/Throwable
    //   77\01186\011102\011java/lang/Throwable
    //   91\01199\011102\011java/lang/Throwable
    //   198\011210\011102\011java/lang/Throwable
    //   5\01111\011144\011java/lang/InterruptedException
    //   11\01135\011154\011java/lang/Throwable
    //   63\01177\011196\011finally
  }

  public void zzfa()
  {
    zzc(new zza(null));
  }

  public void zzfh()
  {
    zzc(new zzc(null));
  }

  public LinkedBlockingQueue<Runnable> zzfi()
  {
    return this.zzCJ;
  }

  public void zzfj()
  {
    init();
    ArrayList localArrayList = new ArrayList();
    this.zzCJ.drainTo(localArrayList);
    this.zzCN.lock();
    try
    {
      this.zzCK = true;
      Iterator localIterator = localArrayList.iterator();
      while (true)
        if (localIterator.hasNext())
        {
          Runnable localRunnable = (Runnable)localIterator.next();
          try
          {
            localRunnable.run();
          }
          catch (Throwable localThrowable)
          {
            zzae.zzZ("Error dispatching all events on exit, giving up: " + zzf(localThrowable));
          }
        }
      return;
    }
    finally
    {
      this.zzCN.unlock();
    }
  }

  public void zzx(Map<String, String> paramMap)
  {
    zzc(new zzd(paramMap));
  }

  private class zza
    implements Runnable
  {
    private zza()
    {
    }

    public void run()
    {
      zzx.zzd(zzx.this).zzfa();
    }
  }

  private class zzb
    implements Runnable
  {
    private zzb()
    {
    }

    public void run()
    {
      zzx.zzd(zzx.this).dispatch();
    }
  }

  private class zzc
    implements Runnable
  {
    private zzc()
    {
    }

    public void run()
    {
      zzx.zzd(zzx.this).zzfh();
    }
  }

  private class zzd
    implements Runnable
  {
    private final Map<String, String> zzCQ;

    zzd()
    {
      Map localMap;
      this.zzCQ = new HashMap(localMap);
      String str = (String)localMap.get("&ht");
      if (str != null);
      try
      {
        Long.valueOf(str);
        if (str == null)
        {
          long l = System.currentTimeMillis();
          this.zzCQ.put("&ht", Long.toString(l));
        }
        return;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        while (true)
          str = null;
      }
    }

    private void zzA(Map<String, String> paramMap)
    {
      zzg localzzg = zzx.zza(zzx.this).zzgo();
      zzan.zza(paramMap, "&an", localzzg);
      zzan.zza(paramMap, "&av", localzzg);
      zzan.zza(paramMap, "&aid", localzzg);
      zzan.zza(paramMap, "&aiid", localzzg);
      paramMap.put("&v", "1");
    }

    private boolean zzB(Map<String, String> paramMap)
    {
      if (paramMap.get("&sf") == null)
        return false;
      double d = zzan.zza((String)paramMap.get("&sf"), 100.0D);
      if (d >= 100.0D)
        return false;
      if (zzx.zzan((String)paramMap.get("&cid")) % 10000 >= d * 100.0D)
      {
        if (paramMap.get("&t") == null);
        for (String str = "unknown"; ; str = (String)paramMap.get("&t"))
        {
          zzae.zzab(String.format("%s hit sampled out", new Object[] { str }));
          return true;
        }
      }
      return false;
    }

    private String zzy(Map<String, String> paramMap)
    {
      if (paramMap.containsKey("useSecure"))
      {
        if (zzan.zze((String)paramMap.get("useSecure"), true))
          return "https:";
        return "http:";
      }
      return "https:";
    }

    private void zzz(Map<String, String> paramMap)
    {
      zzx.zza(zzx.this).getContext();
      zza localzza = zzx.zza(zzx.this).zzgq();
      zzan.zza(paramMap, "&adid", localzza);
      zzan.zza(paramMap, "&ate", localzza);
    }

    public void run()
    {
      zzz(this.zzCQ);
      if (TextUtils.isEmpty((CharSequence)this.zzCQ.get("&cid")))
      {
        zzk localzzk = zzx.zza(zzx.this).zzgp();
        this.zzCQ.put("&cid", localzzk.getValue("&cid"));
      }
      if ((zzx.zza(zzx.this).getAppOptOut()) || (zzB(this.zzCQ)))
        return;
      if (!TextUtils.isEmpty(zzx.zzb(zzx.this)))
      {
        zzy.zzfV().zzF(true);
        HitBuilders.HitBuilder localHitBuilder = new HitBuilders.HitBuilder().setCampaignParamsFromUrl(zzx.zzb(zzx.this));
        zzx.zza(zzx.this, null);
        Map localMap2 = localHitBuilder.build();
        zzy.zzfV().zzF(false);
        this.zzCQ.putAll(localMap2);
      }
      zzA(this.zzCQ);
      Map localMap1 = zzac.zzC(this.zzCQ);
      zzx.zzd(zzx.this).zzb(localMap1, Long.valueOf((String)this.zzCQ.get("&ht")).longValue(), zzy(this.zzCQ), zzx.zzc(zzx.this));
    }
  }
}