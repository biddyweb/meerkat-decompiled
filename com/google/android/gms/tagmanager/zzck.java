package com.google.android.gms.tagmanager;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.google.android.gms.internal.zzc.zzj;
import com.google.android.gms.internal.zzvs;

class zzck
  implements Runnable
{
  private final Context mContext;
  private volatile String zzaxT;
  private final String zzaxw;
  private final zzvs zzazL;
  private final String zzazM;
  private zzbe<zzc.zzj> zzazN;
  private volatile zzr zzazO;
  private volatile String zzazP;

  zzck(Context paramContext, String paramString, zzvs paramzzvs, zzr paramzzr)
  {
    this.mContext = paramContext;
    this.zzazL = paramzzvs;
    this.zzaxw = paramString;
    this.zzazO = paramzzr;
    this.zzazM = ("/r?id=" + paramString);
    this.zzaxT = this.zzazM;
    this.zzazP = null;
  }

  public zzck(Context paramContext, String paramString, zzr paramzzr)
  {
    this(paramContext, paramString, new zzvs(), paramzzr);
  }

  private boolean zztA()
  {
    NetworkInfo localNetworkInfo = ((ConnectivityManager)this.mContext.getSystemService("connectivity")).getActiveNetworkInfo();
    if ((localNetworkInfo == null) || (!localNetworkInfo.isConnected()))
    {
      zzbf.zzab("...no network connectivity");
      return false;
    }
    return true;
  }

  // ERROR //
  private void zztB()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokespecial 94\011com/google/android/gms/tagmanager/zzck:zztA\011()Z
    //   4: ifne +16 -> 20
    //   7: aload_0
    //   8: getfield 96\011com/google/android/gms/tagmanager/zzck:zzazN\011Lcom/google/android/gms/tagmanager/zzbe;
    //   11: getstatic 102\011com/google/android/gms/tagmanager/zzbe$zza:zzazg\011Lcom/google/android/gms/tagmanager/zzbe$zza;
    //   14: invokeinterface 108 2 0
    //   19: return
    //   20: ldc 110
    //   22: invokestatic 87\011com/google/android/gms/tagmanager/zzbf:zzab\011(Ljava/lang/String;)V
    //   25: aload_0
    //   26: invokevirtual 113\011com/google/android/gms/tagmanager/zzck:zztC\011()Ljava/lang/String;
    //   29: astore_1
    //   30: aload_0
    //   31: getfield 29\011com/google/android/gms/tagmanager/zzck:zzazL\011Lcom/google/android/gms/internal/zzvs;
    //   34: invokevirtual 117\011com/google/android/gms/internal/zzvs:zzuO\011()Lcom/google/android/gms/internal/zzvr;
    //   37: astore_2
    //   38: aload_2
    //   39: aload_1
    //   40: invokeinterface 123 2 0
    //   45: astore 6
    //   47: new 125\011java/io/ByteArrayOutputStream
    //   50: dup
    //   51: invokespecial 126\011java/io/ByteArrayOutputStream:<init>\011()V
    //   54: astore 7
    //   56: aload 6
    //   58: aload 7
    //   60: invokestatic 132\011com/google/android/gms/internal/zzvl:zzc\011(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    //   63: aload 7
    //   65: invokevirtual 136\011java/io/ByteArrayOutputStream:toByteArray\011()[B
    //   68: invokestatic 142\011com/google/android/gms/internal/zzc$zzj:zzb\011([B)Lcom/google/android/gms/internal/zzc$zzj;
    //   71: astore 9
    //   73: new 35\011java/lang/StringBuilder
    //   76: dup
    //   77: invokespecial 36\011java/lang/StringBuilder:<init>\011()V
    //   80: ldc 144
    //   82: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   85: aload 9
    //   87: invokevirtual 147\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   90: invokevirtual 46\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   93: invokestatic 87\011com/google/android/gms/tagmanager/zzbf:zzab\011(Ljava/lang/String;)V
    //   96: aload 9
    //   98: getfield 151\011com/google/android/gms/internal/zzc$zzj:zzgs\011Lcom/google/android/gms/internal/zzc$zzf;
    //   101: ifnonnull +37 -> 138
    //   104: aload 9
    //   106: getfield 155\011com/google/android/gms/internal/zzc$zzj:zzgr\011[Lcom/google/android/gms/internal/zzc$zzi;
    //   109: arraylength
    //   110: ifne +28 -> 138
    //   113: new 35\011java/lang/StringBuilder
    //   116: dup
    //   117: invokespecial 36\011java/lang/StringBuilder:<init>\011()V
    //   120: ldc 157
    //   122: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   125: aload_0
    //   126: getfield 31\011com/google/android/gms/tagmanager/zzck:zzaxw\011Ljava/lang/String;
    //   129: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   132: invokevirtual 46\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   135: invokestatic 87\011com/google/android/gms/tagmanager/zzbf:zzab\011(Ljava/lang/String;)V
    //   138: aload_0
    //   139: getfield 96\011com/google/android/gms/tagmanager/zzck:zzazN\011Lcom/google/android/gms/tagmanager/zzbe;
    //   142: aload 9
    //   144: invokeinterface 161 2 0
    //   149: aload_2
    //   150: invokeinterface 164 1 0
    //   155: ldc 166
    //   157: invokestatic 87\011com/google/android/gms/tagmanager/zzbf:zzab\011(Ljava/lang/String;)V
    //   160: return
    //   161: astore 5
    //   163: new 35\011java/lang/StringBuilder
    //   166: dup
    //   167: invokespecial 36\011java/lang/StringBuilder:<init>\011()V
    //   170: ldc 168
    //   172: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   175: aload_1
    //   176: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   179: ldc 170
    //   181: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   184: aload_0
    //   185: getfield 31\011com/google/android/gms/tagmanager/zzck:zzaxw\011Ljava/lang/String;
    //   188: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   191: ldc 172
    //   193: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   196: invokevirtual 46\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   199: invokestatic 175\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   202: aload_0
    //   203: getfield 96\011com/google/android/gms/tagmanager/zzck:zzazN\011Lcom/google/android/gms/tagmanager/zzbe;
    //   206: getstatic 178\011com/google/android/gms/tagmanager/zzbe$zza:zzazi\011Lcom/google/android/gms/tagmanager/zzbe$zza;
    //   209: invokeinterface 108 2 0
    //   214: aload_2
    //   215: invokeinterface 164 1 0
    //   220: return
    //   221: astore 4
    //   223: new 35\011java/lang/StringBuilder
    //   226: dup
    //   227: invokespecial 36\011java/lang/StringBuilder:<init>\011()V
    //   230: ldc 180
    //   232: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   235: aload_1
    //   236: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   239: ldc 182
    //   241: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   244: aload 4
    //   246: invokevirtual 185\011java/io/IOException:getMessage\011()Ljava/lang/String;
    //   249: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   252: invokevirtual 46\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   255: aload 4
    //   257: invokestatic 189\011com/google/android/gms/tagmanager/zzbf:zzd\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   260: aload_0
    //   261: getfield 96\011com/google/android/gms/tagmanager/zzck:zzazN\011Lcom/google/android/gms/tagmanager/zzbe;
    //   264: getstatic 192\011com/google/android/gms/tagmanager/zzbe$zza:zzazh\011Lcom/google/android/gms/tagmanager/zzbe$zza;
    //   267: invokeinterface 108 2 0
    //   272: aload_2
    //   273: invokeinterface 164 1 0
    //   278: return
    //   279: astore 8
    //   281: new 35\011java/lang/StringBuilder
    //   284: dup
    //   285: invokespecial 36\011java/lang/StringBuilder:<init>\011()V
    //   288: ldc 194
    //   290: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   293: aload_1
    //   294: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   297: ldc 182
    //   299: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   302: aload 8
    //   304: invokevirtual 185\011java/io/IOException:getMessage\011()Ljava/lang/String;
    //   307: invokevirtual 42\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   310: invokevirtual 46\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   313: aload 8
    //   315: invokestatic 189\011com/google/android/gms/tagmanager/zzbf:zzd\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   318: aload_0
    //   319: getfield 96\011com/google/android/gms/tagmanager/zzck:zzazN\011Lcom/google/android/gms/tagmanager/zzbe;
    //   322: getstatic 178\011com/google/android/gms/tagmanager/zzbe$zza:zzazi\011Lcom/google/android/gms/tagmanager/zzbe$zza;
    //   325: invokeinterface 108 2 0
    //   330: aload_2
    //   331: invokeinterface 164 1 0
    //   336: return
    //   337: astore_3
    //   338: aload_2
    //   339: invokeinterface 164 1 0
    //   344: aload_3
    //   345: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   38\01147\011161\011java/io/FileNotFoundException
    //   38\01147\011221\011java/io/IOException
    //   47\011138\011279\011java/io/IOException
    //   138\011149\011279\011java/io/IOException
    //   38\01147\011337\011finally
    //   47\011138\011337\011finally
    //   138\011149\011337\011finally
    //   163\011214\011337\011finally
    //   223\011272\011337\011finally
    //   281\011330\011337\011finally
  }

  public void run()
  {
    if (this.zzazN == null)
      throw new IllegalStateException("callback must be set before execute");
    this.zzazN.zzsR();
    zztB();
  }

  void zza(zzbe<zzc.zzj> paramzzbe)
  {
    this.zzazN = paramzzbe;
  }

  void zzcT(String paramString)
  {
    if (paramString == null)
    {
      this.zzaxT = this.zzazM;
      return;
    }
    zzbf.zzY("Setting CTFE URL path: " + paramString);
    this.zzaxT = paramString;
  }

  void zzdg(String paramString)
  {
    zzbf.zzY("Setting previous container version: " + paramString);
    this.zzazP = paramString;
  }

  String zztC()
  {
    String str = this.zzazO.zzsT() + this.zzaxT + "&v=a65833898";
    if ((this.zzazP != null) && (!this.zzazP.trim().equals("")))
      str = str + "&pv=" + this.zzazP;
    if (zzca.zztx().zzty().equals(zzca.zza.zzazD))
      str = str + "&gtm_debug=x";
    return str;
  }
}