package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import org.json.JSONException;

@zzgi
public class zzgk extends zzhl
  implements zzgl.zza
{
  private final Context mContext;
  Object zznh = new Object();
  zzdk zzsf;
  private final Object zzvM = new Object();
  zzgq zzvO;
  private final zzgj.zza zzwe;
  private final zzgo.zza zzwf;
  private final zzk zzwg;
  zzhl zzwh;

  public zzgk(Context paramContext, zzgo.zza paramzza, zzk paramzzk, zzgj.zza paramzza1)
  {
    this.zzwe = paramzza1;
    this.mContext = paramContext;
    this.zzwf = paramzza;
    this.zzwg = paramzzk;
  }

  public void onStop()
  {
    synchronized (this.zzvM)
    {
      if (this.zzwh != null)
        this.zzwh.cancel();
      return;
    }
  }

  zzhl zza(zzgo paramzzgo)
  {
    return zzgl.zza(this.mContext, paramzzgo, this);
  }

  protected zzba zzb(zzgo paramzzgo)
    throws zzgk.zza
  {
    if (this.zzvO.zzwL == null)
      throw new zza("The ad response must specify one of the supported ad sizes.", 0);
    String[] arrayOfString = this.zzvO.zzwL.split("x");
    if (arrayOfString.length != 2)
      throw new zza("Invalid ad size format from the ad response: " + this.zzvO.zzwL, 0);
    while (true)
    {
      int m;
      zzba localzzba;
      try
      {
        int i = Integer.parseInt(arrayOfString[0]);
        int j = Integer.parseInt(arrayOfString[1]);
        zzba[] arrayOfzzba = paramzzgo.zzlV.zzpc;
        int k = arrayOfzzba.length;
        m = 0;
        if (m >= k)
          break;
        localzzba = arrayOfzzba[m];
        float f = this.mContext.getResources().getDisplayMetrics().density;
        if (localzzba.width == -1)
        {
          n = (int)(localzzba.widthPixels / f);
          if (localzzba.height != -2)
            break label255;
          i1 = (int)(localzzba.heightPixels / f);
          if ((i != n) || (j != i1))
            break label265;
          return new zzba(localzzba, paramzzgo.zzlV.zzpc);
        }
      }
      catch (NumberFormatException localNumberFormatException)
      {
        throw new zza("Invalid ad size number from the ad response: " + this.zzvO.zzwL, 0);
      }
      int n = localzzba.width;
      continue;
      label255: int i1 = localzzba.height;
      continue;
      label265: m++;
    }
    throw new zza("The ad size from the ad response was not one of the requested sizes: " + this.zzvO.zzwL, 0);
  }

  public void zzb(zzgq paramzzgq)
  {
    synchronized (this.zznh)
    {
      zzhx.zzY("Received ad response.");
      this.zzvO = paramzzgq;
      this.zznh.notify();
      return;
    }
  }

  protected boolean zzd(long paramLong)
    throws zzgk.zza
  {
    long l = 60000L - (zzab.zzaQ().elapsedRealtime() - paramLong);
    if (l <= 0L)
      return false;
    try
    {
      this.zznh.wait(l);
      return true;
    }
    catch (InterruptedException localInterruptedException)
    {
    }
    throw new zza("Ad request cancelled.", -1);
  }

  protected void zzdI()
    throws zzgk.zza
  {
    if (this.zzvO.errorCode == -3);
    do
    {
      return;
      if (TextUtils.isEmpty(this.zzvO.zzwG))
        throw new zza("No fill from ad server.", 3);
      zzab.zzaP().zza(this.mContext, this.zzvO.zzwv);
    }
    while (!this.zzvO.zzwI);
    try
    {
      this.zzsf = new zzdk(this.zzvO.zzwG);
      return;
    }
    catch (JSONException localJSONException)
    {
    }
    throw new zza("Could not parse mediation config: " + this.zzvO.zzwG, 0);
  }

  // ERROR //
  public void zzdw()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 36\011com/google/android/gms/internal/zzgk:zznh\011Ljava/lang/Object;
    //   4: astore_1
    //   5: aload_1
    //   6: monitorenter
    //   7: ldc 236
    //   9: invokestatic 163\011com/google/android/gms/internal/zzhx:zzY\011(Ljava/lang/String;)V
    //   12: aload_0
    //   13: getfield 44\011com/google/android/gms/internal/zzgk:zzwg\011Lcom/google/android/gms/internal/zzk;
    //   16: invokevirtual 242\011com/google/android/gms/internal/zzk:zzC\011()Lcom/google/android/gms/internal/zzg;
    //   19: aload_0
    //   20: getfield 40\011com/google/android/gms/internal/zzgk:mContext\011Landroid/content/Context;
    //   23: invokeinterface 247 2 0
    //   28: astore_3
    //   29: aload_0
    //   30: getfield 40\011com/google/android/gms/internal/zzgk:mContext\011Landroid/content/Context;
    //   33: invokestatic 253\011com/google/android/gms/internal/zzz:zzj\011(Landroid/content/Context;)Lcom/google/android/gms/internal/zzz;
    //   36: invokevirtual 256\011com/google/android/gms/internal/zzz:getClientId\011()Ljava/lang/String;
    //   39: astore 4
    //   41: new 106\011com/google/android/gms/internal/zzgo
    //   44: dup
    //   45: aload_0
    //   46: getfield 42\011com/google/android/gms/internal/zzgk:zzwf\011Lcom/google/android/gms/internal/zzgo$zza;
    //   49: aload_3
    //   50: aload 4
    //   52: invokespecial 259\011com/google/android/gms/internal/zzgo:<init>\011(Lcom/google/android/gms/internal/zzgo$zza;Ljava/lang/String;Ljava/lang/String;)V
    //   55: astore 5
    //   57: bipush 254
    //   59: istore 6
    //   61: ldc2_w 260
    //   64: lstore 7
    //   66: invokestatic 178\011com/google/android/gms/internal/zzab:zzaQ\011()Lcom/google/android/gms/internal/zzlv;
    //   69: invokeinterface 184 1 0
    //   74: lstore 19
    //   76: aload_0
    //   77: aload 5
    //   79: invokevirtual 263\011com/google/android/gms/internal/zzgk:zza\011(Lcom/google/android/gms/internal/zzgo;)Lcom/google/android/gms/internal/zzhl;
    //   82: astore 21
    //   84: aload_0
    //   85: getfield 34\011com/google/android/gms/internal/zzgk:zzvM\011Ljava/lang/Object;
    //   88: astore 22
    //   90: aload 22
    //   92: monitorenter
    //   93: aload_0
    //   94: aload 21
    //   96: putfield 49\011com/google/android/gms/internal/zzgk:zzwh\011Lcom/google/android/gms/internal/zzhl;
    //   99: aload_0
    //   100: getfield 49\011com/google/android/gms/internal/zzgk:zzwh\011Lcom/google/android/gms/internal/zzhl;
    //   103: ifnonnull +181 -> 284
    //   106: new 62\011com/google/android/gms/internal/zzgk$zza
    //   109: dup
    //   110: ldc_w 265
    //   113: iconst_0
    //   114: invokespecial 77\011com/google/android/gms/internal/zzgk$zza:<init>\011(Ljava/lang/String;I)V
    //   117: athrow
    //   118: astore 23
    //   120: aload 22
    //   122: monitorexit
    //   123: aload 23
    //   125: athrow
    //   126: astore 9
    //   128: aconst_null
    //   129: astore 10
    //   131: aload 9
    //   133: invokevirtual 269\011com/google/android/gms/internal/zzgk$zza:getErrorCode\011()I
    //   136: istore 6
    //   138: iload 6
    //   140: iconst_3
    //   141: if_icmpeq +9 -> 150
    //   144: iload 6
    //   146: iconst_m1
    //   147: if_icmpne +201 -> 348
    //   150: aload 9
    //   152: invokevirtual 272\011com/google/android/gms/internal/zzgk$zza:getMessage\011()Ljava/lang/String;
    //   155: invokestatic 275\011com/google/android/gms/internal/zzhx:zzaa\011(Ljava/lang/String;)V
    //   158: aload_0
    //   159: getfield 66\011com/google/android/gms/internal/zzgk:zzvO\011Lcom/google/android/gms/internal/zzgq;
    //   162: ifnonnull +202 -> 364
    //   165: aload_0
    //   166: new 68\011com/google/android/gms/internal/zzgq
    //   169: dup
    //   170: iload 6
    //   172: invokespecial 278\011com/google/android/gms/internal/zzgq:<init>\011(I)V
    //   175: putfield 66\011com/google/android/gms/internal/zzgk:zzvO\011Lcom/google/android/gms/internal/zzgq;
    //   178: getstatic 284\011com/google/android/gms/internal/zzhw:zzzG\011Landroid/os/Handler;
    //   181: new 286\011com/google/android/gms/internal/zzgk$1
    //   184: dup
    //   185: aload_0
    //   186: invokespecial 289\011com/google/android/gms/internal/zzgk$1:<init>\011(Lcom/google/android/gms/internal/zzgk;)V
    //   189: invokevirtual 295\011android/os/Handler:post\011(Ljava/lang/Runnable;)Z
    //   192: pop
    //   193: lload 7
    //   195: lstore 12
    //   197: aload_0
    //   198: getfield 66\011com/google/android/gms/internal/zzgk:zzvO\011Lcom/google/android/gms/internal/zzgq;
    //   201: getfield 298\011com/google/android/gms/internal/zzgq:zzwQ\011Ljava/lang/String;
    //   204: invokestatic 205\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   207: istore 14
    //   209: iload 14
    //   211: ifne +186 -> 397
    //   214: new 300\011org/json/JSONObject
    //   217: dup
    //   218: aload_0
    //   219: getfield 66\011com/google/android/gms/internal/zzgk:zzvO\011Lcom/google/android/gms/internal/zzgq;
    //   222: getfield 298\011com/google/android/gms/internal/zzgq:zzwQ\011Ljava/lang/String;
    //   225: invokespecial 301\011org/json/JSONObject:<init>\011(Ljava/lang/String;)V
    //   228: astore 15
    //   230: new 303\011com/google/android/gms/internal/zzhe$zza
    //   233: dup
    //   234: aload 5
    //   236: aload_0
    //   237: getfield 66\011com/google/android/gms/internal/zzgk:zzvO\011Lcom/google/android/gms/internal/zzgq;
    //   240: aload_0
    //   241: getfield 229\011com/google/android/gms/internal/zzgk:zzsf\011Lcom/google/android/gms/internal/zzdk;
    //   244: aload 10
    //   246: iload 6
    //   248: lload 12
    //   250: aload_0
    //   251: getfield 66\011com/google/android/gms/internal/zzgk:zzvO\011Lcom/google/android/gms/internal/zzgq;
    //   254: getfield 307\011com/google/android/gms/internal/zzgq:zzwM\011J
    //   257: aload 15
    //   259: invokespecial 310\011com/google/android/gms/internal/zzhe$zza:<init>\011(Lcom/google/android/gms/internal/zzgo;Lcom/google/android/gms/internal/zzgq;Lcom/google/android/gms/internal/zzdk;Lcom/google/android/gms/internal/zzba;IJJLorg/json/JSONObject;)V
    //   262: astore 16
    //   264: getstatic 284\011com/google/android/gms/internal/zzhw:zzzG\011Landroid/os/Handler;
    //   267: new 312\011com/google/android/gms/internal/zzgk$2
    //   270: dup
    //   271: aload_0
    //   272: aload 16
    //   274: invokespecial 315\011com/google/android/gms/internal/zzgk$2:<init>\011(Lcom/google/android/gms/internal/zzgk;Lcom/google/android/gms/internal/zzhe$zza;)V
    //   277: invokevirtual 295\011android/os/Handler:post\011(Ljava/lang/Runnable;)Z
    //   280: pop
    //   281: aload_1
    //   282: monitorexit
    //   283: return
    //   284: aload 22
    //   286: monitorexit
    //   287: aload_0
    //   288: lload 19
    //   290: invokevirtual 318\011com/google/android/gms/internal/zzgk:zzh\011(J)V
    //   293: invokestatic 178\011com/google/android/gms/internal/zzab:zzaQ\011()Lcom/google/android/gms/internal/zzlv;
    //   296: invokeinterface 184 1 0
    //   301: lstore 7
    //   303: aload_0
    //   304: invokevirtual 320\011com/google/android/gms/internal/zzgk:zzdI\011()V
    //   307: aload 5
    //   309: getfield 110\011com/google/android/gms/internal/zzgo:zzlV\011Lcom/google/android/gms/internal/zzba;
    //   312: getfield 116\011com/google/android/gms/internal/zzba:zzpc\011[Lcom/google/android/gms/internal/zzba;
    //   315: ifnull +93 -> 408
    //   318: aload_0
    //   319: aload 5
    //   321: invokevirtual 322\011com/google/android/gms/internal/zzgk:zzb\011(Lcom/google/android/gms/internal/zzgo;)Lcom/google/android/gms/internal/zzba;
    //   324: astore 24
    //   326: aload 24
    //   328: astore 10
    //   330: aload_0
    //   331: aload_0
    //   332: getfield 66\011com/google/android/gms/internal/zzgk:zzvO\011Lcom/google/android/gms/internal/zzgq;
    //   335: getfield 325\011com/google/android/gms/internal/zzgq:zzwT\011Z
    //   338: invokevirtual 329\011com/google/android/gms/internal/zzgk:zzv\011(Z)V
    //   341: lload 7
    //   343: lstore 12
    //   345: goto -148 -> 197
    //   348: aload 9
    //   350: invokevirtual 272\011com/google/android/gms/internal/zzgk$zza:getMessage\011()Ljava/lang/String;
    //   353: invokestatic 332\011com/google/android/gms/internal/zzhx:zzac\011(Ljava/lang/String;)V
    //   356: goto -198 -> 158
    //   359: astore_2
    //   360: aload_1
    //   361: monitorexit
    //   362: aload_2
    //   363: athrow
    //   364: aload_0
    //   365: new 68\011com/google/android/gms/internal/zzgq
    //   368: dup
    //   369: iload 6
    //   371: aload_0
    //   372: getfield 66\011com/google/android/gms/internal/zzgk:zzvO\011Lcom/google/android/gms/internal/zzgq;
    //   375: getfield 335\011com/google/android/gms/internal/zzgq:zzsx\011J
    //   378: invokespecial 338\011com/google/android/gms/internal/zzgq:<init>\011(IJ)V
    //   381: putfield 66\011com/google/android/gms/internal/zzgk:zzvO\011Lcom/google/android/gms/internal/zzgq;
    //   384: goto -206 -> 178
    //   387: astore 18
    //   389: ldc_w 340
    //   392: aload 18
    //   394: invokestatic 343\011com/google/android/gms/internal/zzhx:zzb\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   397: aconst_null
    //   398: astore 15
    //   400: goto -170 -> 230
    //   403: astore 9
    //   405: goto -274 -> 131
    //   408: aconst_null
    //   409: astore 10
    //   411: goto -81 -> 330
    //
    // Exception table:
    //   from\011to\011target\011type
    //   93\011118\011118\011finally
    //   120\011123\011118\011finally
    //   284\011287\011118\011finally
    //   66\01193\011126\011com/google/android/gms/internal/zzgk$zza
    //   123\011126\011126\011com/google/android/gms/internal/zzgk$zza
    //   287\011326\011126\011com/google/android/gms/internal/zzgk$zza
    //   7\01157\011359\011finally
    //   66\01193\011359\011finally
    //   123\011126\011359\011finally
    //   131\011138\011359\011finally
    //   150\011158\011359\011finally
    //   158\011178\011359\011finally
    //   178\011193\011359\011finally
    //   197\011209\011359\011finally
    //   214\011230\011359\011finally
    //   230\011283\011359\011finally
    //   287\011326\011359\011finally
    //   330\011341\011359\011finally
    //   348\011356\011359\011finally
    //   360\011362\011359\011finally
    //   364\011384\011359\011finally
    //   389\011397\011359\011finally
    //   214\011230\011387\011java/lang/Exception
    //   330\011341\011403\011com/google/android/gms/internal/zzgk$zza
  }

  protected void zzh(long paramLong)
    throws zzgk.zza
  {
    do
      if (!zzd(paramLong))
        throw new zza("Timed out waiting for ad response.", 2);
    while (this.zzvO == null);
    synchronized (this.zzvM)
    {
      this.zzwh = null;
      if ((this.zzvO.errorCode != -2) && (this.zzvO.errorCode != -3))
        throw new zza("There was a problem getting an ad response. ErrorCode: " + this.zzvO.errorCode, this.zzvO.errorCode);
    }
  }

  protected void zzv(boolean paramBoolean)
  {
    zzab.zzaP().zzz(paramBoolean);
    zzan localzzan = zzab.zzaP().zzo(this.mContext);
    if ((localzzan != null) && (!localzzan.isAlive()))
    {
      zzhx.zzY("start fetching content...");
      localzzan.zzbt();
    }
  }

  @zzgi
  static final class zza extends Exception
  {
    private final int zzvR;

    public zza(String paramString, int paramInt)
    {
      super();
      this.zzvR = paramInt;
    }

    public int getErrorCode()
    {
      return this.zzvR;
    }
  }
}