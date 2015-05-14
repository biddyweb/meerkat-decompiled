package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzc.zzf;
import com.google.android.gms.internal.zzvd.zza;
import com.google.android.gms.internal.zzvl;
import com.google.android.gms.internal.zzvl.zzc;
import com.google.android.gms.internal.zzvl.zzg;
import com.google.android.gms.internal.zzwx;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONException;

class zzcm
  implements zzo.zzf
{
  private final Context mContext;
  private final String zzaxw;
  private zzbe<zzvd.zza> zzazN;
  private final ExecutorService zzazT;

  zzcm(Context paramContext, String paramString)
  {
    this.mContext = paramContext;
    this.zzaxw = paramString;
    this.zzazT = Executors.newSingleThreadExecutor();
  }

  private zzvl.zzc zza(ByteArrayOutputStream paramByteArrayOutputStream)
  {
    try
    {
      zzvl.zzc localzzc = zzay.zzdd(paramByteArrayOutputStream.toString("UTF-8"));
      return localzzc;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      zzbf.zzY("Failed to convert binary resource to string for JSON parsing; the file format is not UTF-8 format.");
      return null;
    }
    catch (JSONException localJSONException)
    {
      zzbf.zzac("Failed to extract the container from the resource file. Resource is a UTF-8 encoded string but doesn't contain a JSON container");
    }
    return null;
  }

  private void zzd(zzvd.zza paramzza)
    throws IllegalArgumentException
  {
    if ((paramzza.zzgs == null) && (paramzza.zzaBL == null))
      throw new IllegalArgumentException("Resource and SupplementedResource are NULL.");
  }

  private zzvl.zzc zzl(byte[] paramArrayOfByte)
  {
    try
    {
      zzvl.zzc localzzc = zzvl.zzb(zzc.zzf.zza(paramArrayOfByte));
      if (localzzc != null)
        zzbf.zzab("The container was successfully loaded from the resource (using binary file)");
      return localzzc;
    }
    catch (zzwx localzzwx)
    {
      zzbf.zzZ("The resource file is corrupted. The container cannot be extracted from the binary file");
      return null;
    }
    catch (zzvl.zzg localzzg)
    {
      zzbf.zzac("The resource file is invalid. The container from the binary file is invalid");
    }
    return null;
  }

  public void release()
  {
    try
    {
      this.zzazT.shutdown();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void zza(zzbe<zzvd.zza> paramzzbe)
  {
    this.zzazN = paramzzbe;
  }

  public void zzb(final zzvd.zza paramzza)
  {
    this.zzazT.execute(new Runnable()
    {
      public void run()
      {
        zzcm.this.zzc(paramzza);
      }
    });
  }

  // ERROR //
  boolean zzc(zzvd.zza paramzza)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 140\011com/google/android/gms/tagmanager/zzcm:zztG\011()Ljava/io/File;
    //   4: astore_2
    //   5: new 142\011java/io/FileOutputStream
    //   8: dup
    //   9: aload_2
    //   10: invokespecial 145\011java/io/FileOutputStream:<init>\011(Ljava/io/File;)V
    //   13: astore_3
    //   14: aload_3
    //   15: aload_1
    //   16: invokestatic 151\011com/google/android/gms/internal/zzwy:zzf\011(Lcom/google/android/gms/internal/zzwy;)[B
    //   19: invokevirtual 155\011java/io/FileOutputStream:write\011([B)V
    //   22: aload_3
    //   23: invokevirtual 158\011java/io/FileOutputStream:close\011()V
    //   26: iconst_1
    //   27: ireturn
    //   28: astore 10
    //   30: ldc 160
    //   32: invokestatic 110\011com/google/android/gms/tagmanager/zzbf:zzZ\011(Ljava/lang/String;)V
    //   35: iconst_0
    //   36: ireturn
    //   37: astore 9
    //   39: ldc 162
    //   41: invokestatic 65\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   44: iconst_1
    //   45: ireturn
    //   46: astore 6
    //   48: ldc 164
    //   50: invokestatic 65\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   53: aload_2
    //   54: invokevirtual 170\011java/io/File:delete\011()Z
    //   57: pop
    //   58: aload_3
    //   59: invokevirtual 158\011java/io/FileOutputStream:close\011()V
    //   62: iconst_0
    //   63: ireturn
    //   64: astore 8
    //   66: ldc 162
    //   68: invokestatic 65\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   71: iconst_0
    //   72: ireturn
    //   73: astore 4
    //   75: aload_3
    //   76: invokevirtual 158\011java/io/FileOutputStream:close\011()V
    //   79: aload 4
    //   81: athrow
    //   82: astore 5
    //   84: ldc 162
    //   86: invokestatic 65\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   89: goto -10 -> 79
    //
    // Exception table:
    //   from\011to\011target\011type
    //   5\01114\01128\011java/io/FileNotFoundException
    //   22\01126\01137\011java/io/IOException
    //   14\01122\01146\011java/io/IOException
    //   58\01162\01164\011java/io/IOException
    //   14\01122\01173\011finally
    //   48\01158\01173\011finally
    //   75\01179\01182\011java/io/IOException
  }

  // ERROR //
  public zzvl.zzc zzhc(int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 22\011com/google/android/gms/tagmanager/zzcm:mContext\011Landroid/content/Context;
    //   4: invokevirtual 180\011android/content/Context:getResources\011()Landroid/content/res/Resources;
    //   7: iload_1
    //   8: invokevirtual 186\011android/content/res/Resources:openRawResource\011(I)Ljava/io/InputStream;
    //   11: astore_3
    //   12: new 188\011java/lang/StringBuilder
    //   15: dup
    //   16: invokespecial 189\011java/lang/StringBuilder:<init>\011()V
    //   19: ldc 191
    //   21: invokevirtual 195\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   24: iload_1
    //   25: invokevirtual 198\011java/lang/StringBuilder:append\011(I)Ljava/lang/StringBuilder;
    //   28: ldc 200
    //   30: invokevirtual 195\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   33: aload_0
    //   34: getfield 22\011com/google/android/gms/tagmanager/zzcm:mContext\011Landroid/content/Context;
    //   37: invokevirtual 180\011android/content/Context:getResources\011()Landroid/content/res/Resources;
    //   40: iload_1
    //   41: invokevirtual 204\011android/content/res/Resources:getResourceName\011(I)Ljava/lang/String;
    //   44: invokevirtual 195\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   47: ldc 206
    //   49: invokevirtual 195\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   52: invokevirtual 209\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   55: invokestatic 105\011com/google/android/gms/tagmanager/zzbf:zzab\011(Ljava/lang/String;)V
    //   58: new 42\011java/io/ByteArrayOutputStream
    //   61: dup
    //   62: invokespecial 210\011java/io/ByteArrayOutputStream:<init>\011()V
    //   65: astore 4
    //   67: aload_3
    //   68: aload 4
    //   70: invokestatic 213\011com/google/android/gms/internal/zzvl:zzc\011(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    //   73: aload_0
    //   74: aload 4
    //   76: invokespecial 215\011com/google/android/gms/tagmanager/zzcm:zza\011(Ljava/io/ByteArrayOutputStream;)Lcom/google/android/gms/internal/zzvl$zzc;
    //   79: astore 6
    //   81: aload 6
    //   83: ifnull +36 -> 119
    //   86: ldc 217
    //   88: invokestatic 105\011com/google/android/gms/tagmanager/zzbf:zzab\011(Ljava/lang/String;)V
    //   91: aload 6
    //   93: areturn
    //   94: astore_2
    //   95: new 188\011java/lang/StringBuilder
    //   98: dup
    //   99: invokespecial 189\011java/lang/StringBuilder:<init>\011()V
    //   102: ldc 219
    //   104: invokevirtual 195\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   107: iload_1
    //   108: invokevirtual 198\011java/lang/StringBuilder:append\011(I)Ljava/lang/StringBuilder;
    //   111: invokevirtual 209\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   114: invokestatic 65\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   117: aconst_null
    //   118: areturn
    //   119: aload_0
    //   120: aload 4
    //   122: invokevirtual 223\011java/io/ByteArrayOutputStream:toByteArray\011()[B
    //   125: invokespecial 225\011com/google/android/gms/tagmanager/zzcm:zzl\011([B)Lcom/google/android/gms/internal/zzvl$zzc;
    //   128: astore 7
    //   130: aload 7
    //   132: areturn
    //   133: astore 5
    //   135: new 188\011java/lang/StringBuilder
    //   138: dup
    //   139: invokespecial 189\011java/lang/StringBuilder:<init>\011()V
    //   142: ldc 227
    //   144: invokevirtual 195\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   147: iload_1
    //   148: invokevirtual 198\011java/lang/StringBuilder:append\011(I)Ljava/lang/StringBuilder;
    //   151: ldc 200
    //   153: invokevirtual 195\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   156: aload_0
    //   157: getfield 22\011com/google/android/gms/tagmanager/zzcm:mContext\011Landroid/content/Context;
    //   160: invokevirtual 180\011android/content/Context:getResources\011()Landroid/content/res/Resources;
    //   163: iload_1
    //   164: invokevirtual 204\011android/content/res/Resources:getResourceName\011(I)Ljava/lang/String;
    //   167: invokevirtual 195\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   170: ldc 206
    //   172: invokevirtual 195\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   175: invokevirtual 209\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   178: invokestatic 65\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   181: aconst_null
    //   182: areturn
    //
    // Exception table:
    //   from\011to\011target\011type
    //   0\01112\01194\011android/content/res/Resources$NotFoundException
    //   58\01181\011133\011java/io/IOException
    //   86\01191\011133\011java/io/IOException
    //   119\011130\011133\011java/io/IOException
  }

  public void zzsS()
  {
    this.zzazT.execute(new Runnable()
    {
      public void run()
      {
        zzcm.this.zztF();
      }
    });
  }

  // ERROR //
  void zztF()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 121\011com/google/android/gms/tagmanager/zzcm:zzazN\011Lcom/google/android/gms/tagmanager/zzbe;
    //   4: ifnonnull +13 -> 17
    //   7: new 236\011java/lang/IllegalStateException
    //   10: dup
    //   11: ldc 238
    //   13: invokespecial 239\011java/lang/IllegalStateException:<init>\011(Ljava/lang/String;)V
    //   16: athrow
    //   17: aload_0
    //   18: getfield 121\011com/google/android/gms/tagmanager/zzcm:zzazN\011Lcom/google/android/gms/tagmanager/zzbe;
    //   21: invokeinterface 244 1 0
    //   26: ldc 246
    //   28: invokestatic 105\011com/google/android/gms/tagmanager/zzbf:zzab\011(Ljava/lang/String;)V
    //   31: invokestatic 252\011com/google/android/gms/tagmanager/zzca:zztx\011()Lcom/google/android/gms/tagmanager/zzca;
    //   34: invokevirtual 256\011com/google/android/gms/tagmanager/zzca:zzty\011()Lcom/google/android/gms/tagmanager/zzca$zza;
    //   37: getstatic 262\011com/google/android/gms/tagmanager/zzca$zza:zzazC\011Lcom/google/android/gms/tagmanager/zzca$zza;
    //   40: if_acmpeq +15 -> 55
    //   43: invokestatic 252\011com/google/android/gms/tagmanager/zzca:zztx\011()Lcom/google/android/gms/tagmanager/zzca;
    //   46: invokevirtual 256\011com/google/android/gms/tagmanager/zzca:zzty\011()Lcom/google/android/gms/tagmanager/zzca$zza;
    //   49: getstatic 265\011com/google/android/gms/tagmanager/zzca$zza:zzazD\011Lcom/google/android/gms/tagmanager/zzca$zza;
    //   52: if_acmpne +32 -> 84
    //   55: aload_0
    //   56: getfield 24\011com/google/android/gms/tagmanager/zzcm:zzaxw\011Ljava/lang/String;
    //   59: invokestatic 252\011com/google/android/gms/tagmanager/zzca:zztx\011()Lcom/google/android/gms/tagmanager/zzca;
    //   62: invokevirtual 268\011com/google/android/gms/tagmanager/zzca:getContainerId\011()Ljava/lang/String;
    //   65: invokevirtual 274\011java/lang/String:equals\011(Ljava/lang/Object;)Z
    //   68: ifeq +16 -> 84
    //   71: aload_0
    //   72: getfield 121\011com/google/android/gms/tagmanager/zzcm:zzazN\011Lcom/google/android/gms/tagmanager/zzbe;
    //   75: getstatic 280\011com/google/android/gms/tagmanager/zzbe$zza:zzazg\011Lcom/google/android/gms/tagmanager/zzbe$zza;
    //   78: invokeinterface 283 2 0
    //   83: return
    //   84: new 285\011java/io/FileInputStream
    //   87: dup
    //   88: aload_0
    //   89: invokevirtual 140\011com/google/android/gms/tagmanager/zzcm:zztG\011()Ljava/io/File;
    //   92: invokespecial 286\011java/io/FileInputStream:<init>\011(Ljava/io/File;)V
    //   95: astore_1
    //   96: new 42\011java/io/ByteArrayOutputStream
    //   99: dup
    //   100: invokespecial 210\011java/io/ByteArrayOutputStream:<init>\011()V
    //   103: astore_2
    //   104: aload_1
    //   105: aload_2
    //   106: invokestatic 213\011com/google/android/gms/internal/zzvl:zzc\011(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    //   109: aload_2
    //   110: invokevirtual 223\011java/io/ByteArrayOutputStream:toByteArray\011()[B
    //   113: invokestatic 290\011com/google/android/gms/internal/zzvd$zza:zzm\011([B)Lcom/google/android/gms/internal/zzvd$zza;
    //   116: astore 9
    //   118: aload_0
    //   119: aload 9
    //   121: invokespecial 292\011com/google/android/gms/tagmanager/zzcm:zzd\011(Lcom/google/android/gms/internal/zzvd$zza;)V
    //   124: aload_0
    //   125: getfield 121\011com/google/android/gms/tagmanager/zzcm:zzazN\011Lcom/google/android/gms/tagmanager/zzbe;
    //   128: aload 9
    //   130: invokeinterface 296 2 0
    //   135: aload_1
    //   136: invokevirtual 297\011java/io/FileInputStream:close\011()V
    //   139: ldc_w 299
    //   142: invokestatic 105\011com/google/android/gms/tagmanager/zzbf:zzab\011(Ljava/lang/String;)V
    //   145: return
    //   146: astore 11
    //   148: ldc_w 301
    //   151: invokestatic 60\011com/google/android/gms/tagmanager/zzbf:zzY\011(Ljava/lang/String;)V
    //   154: aload_0
    //   155: getfield 121\011com/google/android/gms/tagmanager/zzcm:zzazN\011Lcom/google/android/gms/tagmanager/zzbe;
    //   158: getstatic 280\011com/google/android/gms/tagmanager/zzbe$zza:zzazg\011Lcom/google/android/gms/tagmanager/zzbe$zza;
    //   161: invokeinterface 283 2 0
    //   166: return
    //   167: astore 10
    //   169: ldc_w 303
    //   172: invokestatic 65\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   175: goto -36 -> 139
    //   178: astore 7
    //   180: aload_0
    //   181: getfield 121\011com/google/android/gms/tagmanager/zzcm:zzazN\011Lcom/google/android/gms/tagmanager/zzbe;
    //   184: getstatic 306\011com/google/android/gms/tagmanager/zzbe$zza:zzazh\011Lcom/google/android/gms/tagmanager/zzbe$zza;
    //   187: invokeinterface 283 2 0
    //   192: ldc_w 308
    //   195: invokestatic 65\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   198: aload_1
    //   199: invokevirtual 297\011java/io/FileInputStream:close\011()V
    //   202: goto -63 -> 139
    //   205: astore 8
    //   207: ldc_w 303
    //   210: invokestatic 65\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   213: goto -74 -> 139
    //   216: astore 5
    //   218: aload_0
    //   219: getfield 121\011com/google/android/gms/tagmanager/zzcm:zzazN\011Lcom/google/android/gms/tagmanager/zzbe;
    //   222: getstatic 306\011com/google/android/gms/tagmanager/zzbe$zza:zzazh\011Lcom/google/android/gms/tagmanager/zzbe$zza;
    //   225: invokeinterface 283 2 0
    //   230: ldc_w 310
    //   233: invokestatic 65\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   236: aload_1
    //   237: invokevirtual 297\011java/io/FileInputStream:close\011()V
    //   240: goto -101 -> 139
    //   243: astore 6
    //   245: ldc_w 303
    //   248: invokestatic 65\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   251: goto -112 -> 139
    //   254: astore_3
    //   255: aload_1
    //   256: invokevirtual 297\011java/io/FileInputStream:close\011()V
    //   259: aload_3
    //   260: athrow
    //   261: astore 4
    //   263: ldc_w 303
    //   266: invokestatic 65\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   269: goto -10 -> 259
    //
    // Exception table:
    //   from\011to\011target\011type
    //   84\01196\011146\011java/io/FileNotFoundException
    //   135\011139\011167\011java/io/IOException
    //   96\011135\011178\011java/io/IOException
    //   198\011202\011205\011java/io/IOException
    //   96\011135\011216\011java/lang/IllegalArgumentException
    //   236\011240\011243\011java/io/IOException
    //   96\011135\011254\011finally
    //   180\011198\011254\011finally
    //   218\011236\011254\011finally
    //   255\011259\011261\011java/io/IOException
  }

  File zztG()
  {
    String str = "resource_" + this.zzaxw;
    return new File(this.mContext.getDir("google_tagmanager", 0), str);
  }
}