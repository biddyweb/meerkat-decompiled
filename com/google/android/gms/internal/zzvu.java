package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.tagmanager.zzbf;

public class zzvu
  implements Runnable
{
  private final Context mContext;
  private final zzvj zzaCG;
  private final zzvt zzaCN;
  private final zzvo zzaCO;
  private final zzvs zzazL;

  public zzvu(Context paramContext, zzvj paramzzvj, zzvt paramzzvt)
  {
    this(paramContext, paramzzvj, paramzzvt, new zzvs(), new zzvo());
  }

  zzvu(Context paramContext, zzvj paramzzvj, zzvt paramzzvt, zzvs paramzzvs, zzvo paramzzvo)
  {
    zzx.zzl(paramContext);
    zzx.zzl(paramzzvt);
    this.mContext = paramContext;
    this.zzaCG = paramzzvj;
    this.zzaCN = paramzzvt;
    this.zzazL = paramzzvs;
    this.zzaCO = paramzzvo;
  }

  public zzvu(Context paramContext, zzvj paramzzvj, zzvt paramzzvt, String paramString)
  {
    this(paramContext, paramzzvj, paramzzvt, new zzvs(), new zzvo());
    this.zzaCO.zzdx(paramString);
  }

  public void run()
  {
    zzdo();
  }

  boolean zzdI(String paramString)
  {
    return this.mContext.getPackageManager().checkPermission(paramString, this.mContext.getPackageName()) == 0;
  }

  // ERROR //
  void zzdo()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 81\011com/google/android/gms/internal/zzvu:zzuQ\011()Z
    //   4: ifne +14 -> 18
    //   7: aload_0
    //   8: getfield 42\011com/google/android/gms/internal/zzvu:zzaCN\011Lcom/google/android/gms/internal/zzvt;
    //   11: getstatic 87\011com/google/android/gms/internal/zzvt$zza:zzaCI\011Lcom/google/android/gms/internal/zzvt$zza;
    //   14: invokevirtual 93\011com/google/android/gms/internal/zzvt:zza\011(Lcom/google/android/gms/internal/zzvt$zza;)V
    //   17: return
    //   18: ldc 95
    //   20: invokestatic 100\011com/google/android/gms/tagmanager/zzbf:zzab\011(Ljava/lang/String;)V
    //   23: aload_0
    //   24: getfield 44\011com/google/android/gms/internal/zzvu:zzazL\011Lcom/google/android/gms/internal/zzvs;
    //   27: invokevirtual 104\011com/google/android/gms/internal/zzvs:zzuO\011()Lcom/google/android/gms/internal/zzvr;
    //   30: astore_1
    //   31: aload_0
    //   32: getfield 46\011com/google/android/gms/internal/zzvu:zzaCO\011Lcom/google/android/gms/internal/zzvo;
    //   35: aload_0
    //   36: getfield 40\011com/google/android/gms/internal/zzvu:zzaCG\011Lcom/google/android/gms/internal/zzvj;
    //   39: invokevirtual 110\011com/google/android/gms/internal/zzvj:zzun\011()Ljava/util/List;
    //   42: invokevirtual 114\011com/google/android/gms/internal/zzvo:zzv\011(Ljava/util/List;)Ljava/lang/String;
    //   45: astore_3
    //   46: aload_1
    //   47: aload_3
    //   48: invokeinterface 120 2 0
    //   53: astore 6
    //   55: new 122\011java/io/ByteArrayOutputStream
    //   58: dup
    //   59: invokespecial 123\011java/io/ByteArrayOutputStream:<init>\011()V
    //   62: astore 7
    //   64: aload 6
    //   66: aload 7
    //   68: invokestatic 128\011com/google/android/gms/internal/zzlz:zza\011(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    //   71: pop2
    //   72: aload_0
    //   73: getfield 42\011com/google/android/gms/internal/zzvu:zzaCN\011Lcom/google/android/gms/internal/zzvt;
    //   76: aload 7
    //   78: invokevirtual 132\011java/io/ByteArrayOutputStream:toByteArray\011()[B
    //   81: invokevirtual 136\011com/google/android/gms/internal/zzvt:zzo\011([B)V
    //   84: aload_1
    //   85: invokeinterface 139 1 0
    //   90: ldc 141
    //   92: invokestatic 100\011com/google/android/gms/tagmanager/zzbf:zzab\011(Ljava/lang/String;)V
    //   95: return
    //   96: astore 5
    //   98: new 143\011java/lang/StringBuilder
    //   101: dup
    //   102: invokespecial 144\011java/lang/StringBuilder:<init>\011()V
    //   105: ldc 146
    //   107: invokevirtual 150\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   110: aload_3
    //   111: invokevirtual 150\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   114: invokevirtual 153\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   117: invokestatic 156\011com/google/android/gms/tagmanager/zzbf:zzZ\011(Ljava/lang/String;)V
    //   120: aload_0
    //   121: getfield 42\011com/google/android/gms/internal/zzvu:zzaCN\011Lcom/google/android/gms/internal/zzvt;
    //   124: getstatic 159\011com/google/android/gms/internal/zzvt$zza:zzaCK\011Lcom/google/android/gms/internal/zzvt$zza;
    //   127: invokevirtual 93\011com/google/android/gms/internal/zzvt:zza\011(Lcom/google/android/gms/internal/zzvt$zza;)V
    //   130: aload_1
    //   131: invokeinterface 139 1 0
    //   136: return
    //   137: astore 4
    //   139: new 143\011java/lang/StringBuilder
    //   142: dup
    //   143: invokespecial 144\011java/lang/StringBuilder:<init>\011()V
    //   146: ldc 161
    //   148: invokevirtual 150\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   151: aload_3
    //   152: invokevirtual 150\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   155: ldc 163
    //   157: invokevirtual 150\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   160: aload 4
    //   162: invokevirtual 166\011java/io/IOException:getMessage\011()Ljava/lang/String;
    //   165: invokevirtual 150\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   168: invokevirtual 153\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   171: aload 4
    //   173: invokestatic 170\011com/google/android/gms/tagmanager/zzbf:zzb\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   176: aload_0
    //   177: getfield 42\011com/google/android/gms/internal/zzvu:zzaCN\011Lcom/google/android/gms/internal/zzvt;
    //   180: getstatic 173\011com/google/android/gms/internal/zzvt$zza:zzaCJ\011Lcom/google/android/gms/internal/zzvt$zza;
    //   183: invokevirtual 93\011com/google/android/gms/internal/zzvt:zza\011(Lcom/google/android/gms/internal/zzvt$zza;)V
    //   186: aload_1
    //   187: invokeinterface 139 1 0
    //   192: return
    //   193: astore 8
    //   195: new 143\011java/lang/StringBuilder
    //   198: dup
    //   199: invokespecial 144\011java/lang/StringBuilder:<init>\011()V
    //   202: ldc 175
    //   204: invokevirtual 150\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   207: aload_3
    //   208: invokevirtual 150\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   211: ldc 163
    //   213: invokevirtual 150\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   216: aload 8
    //   218: invokevirtual 166\011java/io/IOException:getMessage\011()Ljava/lang/String;
    //   221: invokevirtual 150\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   224: invokevirtual 153\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   227: aload 8
    //   229: invokestatic 170\011com/google/android/gms/tagmanager/zzbf:zzb\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   232: aload_0
    //   233: getfield 42\011com/google/android/gms/internal/zzvu:zzaCN\011Lcom/google/android/gms/internal/zzvt;
    //   236: getstatic 159\011com/google/android/gms/internal/zzvt$zza:zzaCK\011Lcom/google/android/gms/internal/zzvt$zza;
    //   239: invokevirtual 93\011com/google/android/gms/internal/zzvt:zza\011(Lcom/google/android/gms/internal/zzvt$zza;)V
    //   242: aload_1
    //   243: invokeinterface 139 1 0
    //   248: return
    //   249: astore_2
    //   250: aload_1
    //   251: invokeinterface 139 1 0
    //   256: aload_2
    //   257: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   46\01155\01196\011java/io/FileNotFoundException
    //   46\01155\011137\011java/io/IOException
    //   55\01184\011193\011java/io/IOException
    //   31\01146\011249\011finally
    //   46\01155\011249\011finally
    //   55\01184\011249\011finally
    //   98\011130\011249\011finally
    //   139\011186\011249\011finally
    //   195\011242\011249\011finally
  }

  boolean zzuQ()
  {
    if (!zzdI("android.permission.INTERNET"))
    {
      zzbf.zzZ("Missing android.permission.INTERNET. Please add the following declaration to your AndroidManifest.xml: <uses-permission android:name=\"android.permission.INTERNET\" />");
      return false;
    }
    if (!zzdI("android.permission.ACCESS_NETWORK_STATE"))
    {
      zzbf.zzZ("Missing android.permission.ACCESS_NETWORK_STATE. Please add the following declaration to your AndroidManifest.xml: <uses-permission android:name=\"android.permission.ACCESS_NETWORK_STATE\" />");
      return false;
    }
    NetworkInfo localNetworkInfo = ((ConnectivityManager)this.mContext.getSystemService("connectivity")).getActiveNetworkInfo();
    if ((localNetworkInfo == null) || (!localNetworkInfo.isConnected()))
    {
      zzbf.zzac("NetworkLoader: No network connectivity - Offline");
      return false;
    }
    return true;
  }
}