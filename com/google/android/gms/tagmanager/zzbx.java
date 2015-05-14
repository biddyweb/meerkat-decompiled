package com.google.android.gms.tagmanager;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.google.android.gms.internal.zzlv;
import com.google.android.gms.internal.zzlx;
import java.io.File;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.apache.http.impl.client.DefaultHttpClient;

class zzbx
  implements zzat
{
  private static final String zzES = String.format("CREATE TABLE IF NOT EXISTS %s ( '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '%s' INTEGER NOT NULL, '%s' TEXT NOT NULL,'%s' INTEGER NOT NULL);", new Object[] { "gtm_hits", "hit_id", "hit_time", "hit_url", "hit_first_send_time" });
  private final Context mContext;
  private final String zzEW;
  private long zzEY;
  private final int zzEZ;
  private final zzb zzazq;
  private volatile zzab zzazr;
  private final zzau zzazs;
  private zzlv zzmW;

  zzbx(zzau paramzzau, Context paramContext)
  {
    this(paramzzau, paramContext, "gtm_urls.db", 2000);
  }

  zzbx(zzau paramzzau, Context paramContext, String paramString, int paramInt)
  {
    this.mContext = paramContext.getApplicationContext();
    this.zzEW = paramString;
    this.zzazs = paramzzau;
    this.zzmW = zzlx.zzkc();
    this.zzazq = new zzb(this.mContext, this.zzEW);
    this.zzazr = new zzcw(new DefaultHttpClient(), this.mContext, new zza());
    this.zzEY = 0L;
    this.zzEZ = paramInt;
  }

  private void zzH(long paramLong)
  {
    String[] arrayOfString = new String[1];
    arrayOfString[0] = String.valueOf(paramLong);
    zzb(arrayOfString);
  }

  private SQLiteDatabase zzar(String paramString)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = this.zzazq.getWritableDatabase();
      return localSQLiteDatabase;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzbf.zzac(paramString);
    }
    return null;
  }

  private void zzd(long paramLong1, long paramLong2)
  {
    SQLiteDatabase localSQLiteDatabase = zzar("Error opening database for getNumStoredHits.");
    if (localSQLiteDatabase == null)
      return;
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("hit_first_send_time", Long.valueOf(paramLong2));
    try
    {
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramLong1);
      localSQLiteDatabase.update("gtm_hits", localContentValues, "hit_id=?", arrayOfString);
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzbf.zzac("Error setting HIT_FIRST_DISPATCH_TIME for hitId: " + paramLong1);
      zzH(paramLong1);
    }
  }

  private void zzg(long paramLong, String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = zzar("Error opening database for putHit");
    if (localSQLiteDatabase == null)
      return;
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("hit_time", Long.valueOf(paramLong));
    localContentValues.put("hit_url", paramString);
    localContentValues.put("hit_first_send_time", Integer.valueOf(0));
    try
    {
      localSQLiteDatabase.insert("gtm_hits", null, localContentValues);
      this.zzazs.zzD(false);
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzbf.zzac("Error storing hit");
    }
  }

  private void zzgy()
  {
    int i = 1 + (zzgA() - this.zzEZ);
    if (i > 0)
    {
      List localList = zzM(i);
      zzbf.zzab("Store full, deleting " + localList.size() + " hits to make room.");
      zzb((String[])localList.toArray(new String[0]));
    }
  }

  public void dispatch()
  {
    zzbf.zzab("GTM Dispatch running...");
    if (!this.zzazr.zzfk());
    do
    {
      return;
      List localList = zzN(40);
      if (localList.isEmpty())
      {
        zzbf.zzab("...nothing to dispatch");
        this.zzazs.zzD(true);
        return;
      }
      this.zzazr.zzt(localList);
    }
    while (zztv() <= 0);
    zzct.zztR().dispatch();
  }

  // ERROR //
  List<String> zzM(int paramInt)
  {
    // Byte code:
    //   0: new 269\011java/util/ArrayList
    //   3: dup
    //   4: invokespecial 270\011java/util/ArrayList:<init>\011()V
    //   7: astore_2
    //   8: iload_1
    //   9: ifgt +11 -> 20
    //   12: ldc_w 272
    //   15: invokestatic 134\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   18: aload_2
    //   19: areturn
    //   20: aload_0
    //   21: ldc_w 274
    //   24: invokespecial 141\011com/google/android/gms/tagmanager/zzbx:zzar\011(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   27: astore_3
    //   28: aload_3
    //   29: ifnonnull +5 -> 34
    //   32: aload_2
    //   33: areturn
    //   34: aload_3
    //   35: ldc 29
    //   37: iconst_1
    //   38: anewarray 39\011java/lang/String
    //   41: dup
    //   42: iconst_0
    //   43: ldc 31
    //   45: aastore
    //   46: aconst_null
    //   47: aconst_null
    //   48: aconst_null
    //   49: aconst_null
    //   50: ldc_w 276
    //   53: iconst_1
    //   54: anewarray 4\011java/lang/Object
    //   57: dup
    //   58: iconst_0
    //   59: ldc 31
    //   61: aastore
    //   62: invokestatic 43\011java/lang/String:format\011(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   65: iload_1
    //   66: invokestatic 279\011java/lang/Integer:toString\011(I)Ljava/lang/String;
    //   69: invokevirtual 283\011android/database/sqlite/SQLiteDatabase:query\011(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   72: astore 7
    //   74: aload 7
    //   76: astore 5
    //   78: aload 5
    //   80: invokeinterface 288 1 0
    //   85: ifeq +35 -> 120
    //   88: aload_2
    //   89: aload 5
    //   91: iconst_0
    //   92: invokeinterface 292 2 0
    //   97: invokestatic 106\011java/lang/String:valueOf\011(J)Ljava/lang/String;
    //   100: invokeinterface 296 2 0
    //   105: pop
    //   106: aload 5
    //   108: invokeinterface 299 1 0
    //   113: istore 9
    //   115: iload 9
    //   117: ifne -29 -> 88
    //   120: aload 5
    //   122: ifnull +10 -> 132
    //   125: aload 5
    //   127: invokeinterface 302 1 0
    //   132: aload_2
    //   133: areturn
    //   134: astore 6
    //   136: aconst_null
    //   137: astore 5
    //   139: new 163\011java/lang/StringBuilder
    //   142: dup
    //   143: invokespecial 164\011java/lang/StringBuilder:<init>\011()V
    //   146: ldc_w 304
    //   149: invokevirtual 170\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   152: aload 6
    //   154: invokevirtual 307\011android/database/sqlite/SQLiteException:getMessage\011()Ljava/lang/String;
    //   157: invokevirtual 170\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   160: invokevirtual 177\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   163: invokestatic 134\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   166: aload 5
    //   168: ifnull -36 -> 132
    //   171: aload 5
    //   173: invokeinterface 302 1 0
    //   178: goto -46 -> 132
    //   181: astore 4
    //   183: aconst_null
    //   184: astore 5
    //   186: aload 5
    //   188: ifnull +10 -> 198
    //   191: aload 5
    //   193: invokeinterface 302 1 0
    //   198: aload 4
    //   200: athrow
    //   201: astore 4
    //   203: goto -17 -> 186
    //   206: astore 6
    //   208: goto -69 -> 139
    //
    // Exception table:
    //   from\011to\011target\011type
    //   34\01174\011134\011android/database/sqlite/SQLiteException
    //   34\01174\011181\011finally
    //   78\01188\011201\011finally
    //   88\011115\011201\011finally
    //   139\011166\011201\011finally
    //   78\01188\011206\011android/database/sqlite/SQLiteException
    //   88\011115\011206\011android/database/sqlite/SQLiteException
  }

  // ERROR //
  public List<zzap> zzN(int paramInt)
  {
    // Byte code:
    //   0: new 269\011java/util/ArrayList
    //   3: dup
    //   4: invokespecial 270\011java/util/ArrayList:<init>\011()V
    //   7: astore_2
    //   8: aload_0
    //   9: ldc_w 309
    //   12: invokespecial 141\011com/google/android/gms/tagmanager/zzbx:zzar\011(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   15: astore_3
    //   16: aload_3
    //   17: ifnonnull +9 -> 26
    //   20: aload_2
    //   21: astore 9
    //   23: aload 9
    //   25: areturn
    //   26: aconst_null
    //   27: astore 4
    //   29: aload_3
    //   30: ldc 29
    //   32: iconst_3
    //   33: anewarray 39\011java/lang/String
    //   36: dup
    //   37: iconst_0
    //   38: ldc 31
    //   40: aastore
    //   41: dup
    //   42: iconst_1
    //   43: ldc 33
    //   45: aastore
    //   46: dup
    //   47: iconst_2
    //   48: ldc 37
    //   50: aastore
    //   51: aconst_null
    //   52: aconst_null
    //   53: aconst_null
    //   54: aconst_null
    //   55: ldc_w 276
    //   58: iconst_1
    //   59: anewarray 4\011java/lang/Object
    //   62: dup
    //   63: iconst_0
    //   64: ldc 31
    //   66: aastore
    //   67: invokestatic 43\011java/lang/String:format\011(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   70: iload_1
    //   71: invokestatic 279\011java/lang/Integer:toString\011(I)Ljava/lang/String;
    //   74: invokevirtual 283\011android/database/sqlite/SQLiteDatabase:query\011(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   77: astore 10
    //   79: aload 10
    //   81: astore 11
    //   83: new 269\011java/util/ArrayList
    //   86: dup
    //   87: invokespecial 270\011java/util/ArrayList:<init>\011()V
    //   90: astore 12
    //   92: aload 11
    //   94: invokeinterface 288 1 0
    //   99: ifeq +56 -> 155
    //   102: aload 12
    //   104: new 311\011com/google/android/gms/tagmanager/zzap
    //   107: dup
    //   108: aload 11
    //   110: iconst_0
    //   111: invokeinterface 292 2 0
    //   116: aload 11
    //   118: iconst_1
    //   119: invokeinterface 292 2 0
    //   124: aload 11
    //   126: iconst_2
    //   127: invokeinterface 292 2 0
    //   132: invokespecial 314\011com/google/android/gms/tagmanager/zzap:<init>\011(JJJ)V
    //   135: invokeinterface 296 2 0
    //   140: pop
    //   141: aload 11
    //   143: invokeinterface 299 1 0
    //   148: istore 15
    //   150: iload 15
    //   152: ifne -50 -> 102
    //   155: aload 11
    //   157: ifnull +10 -> 167
    //   160: aload 11
    //   162: invokeinterface 302 1 0
    //   167: aload_3
    //   168: ldc 29
    //   170: iconst_2
    //   171: anewarray 39\011java/lang/String
    //   174: dup
    //   175: iconst_0
    //   176: ldc 31
    //   178: aastore
    //   179: dup
    //   180: iconst_1
    //   181: ldc 35
    //   183: aastore
    //   184: aconst_null
    //   185: aconst_null
    //   186: aconst_null
    //   187: aconst_null
    //   188: ldc_w 276
    //   191: iconst_1
    //   192: anewarray 4\011java/lang/Object
    //   195: dup
    //   196: iconst_0
    //   197: ldc 31
    //   199: aastore
    //   200: invokestatic 43\011java/lang/String:format\011(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   203: iload_1
    //   204: invokestatic 279\011java/lang/Integer:toString\011(I)Ljava/lang/String;
    //   207: invokevirtual 283\011android/database/sqlite/SQLiteDatabase:query\011(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   210: astore 24
    //   212: aload 24
    //   214: invokeinterface 288 1 0
    //   219: ifeq +63 -> 282
    //   222: iconst_0
    //   223: istore 25
    //   225: aload 24
    //   227: checkcast 316\011android/database/sqlite/SQLiteCursor
    //   230: invokevirtual 320\011android/database/sqlite/SQLiteCursor:getWindow\011()Landroid/database/CursorWindow;
    //   233: invokevirtual 325\011android/database/CursorWindow:getNumRows\011()I
    //   236: ifle +132 -> 368
    //   239: aload 12
    //   241: iload 25
    //   243: invokeinterface 329 2 0
    //   248: checkcast 311\011com/google/android/gms/tagmanager/zzap
    //   251: aload 24
    //   253: iconst_1
    //   254: invokeinterface 332 2 0
    //   259: invokevirtual 335\011com/google/android/gms/tagmanager/zzap:zzaq\011(Ljava/lang/String;)V
    //   262: iload 25
    //   264: iconst_1
    //   265: iadd
    //   266: istore 27
    //   268: aload 24
    //   270: invokeinterface 299 1 0
    //   275: istore 28
    //   277: iload 28
    //   279: ifne +340 -> 619
    //   282: aload 24
    //   284: ifnull +10 -> 294
    //   287: aload 24
    //   289: invokeinterface 302 1 0
    //   294: aload 12
    //   296: areturn
    //   297: astore 6
    //   299: aload 6
    //   301: astore 7
    //   303: aconst_null
    //   304: astore 8
    //   306: aload_2
    //   307: astore 9
    //   309: new 163\011java/lang/StringBuilder
    //   312: dup
    //   313: invokespecial 164\011java/lang/StringBuilder:<init>\011()V
    //   316: ldc_w 304
    //   319: invokevirtual 170\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   322: aload 7
    //   324: invokevirtual 307\011android/database/sqlite/SQLiteException:getMessage\011()Ljava/lang/String;
    //   327: invokevirtual 170\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   330: invokevirtual 177\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   333: invokestatic 134\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   336: aload 8
    //   338: ifnull -315 -> 23
    //   341: aload 8
    //   343: invokeinterface 302 1 0
    //   348: aload 9
    //   350: areturn
    //   351: astore 5
    //   353: aload 4
    //   355: ifnull +10 -> 365
    //   358: aload 4
    //   360: invokeinterface 302 1 0
    //   365: aload 5
    //   367: athrow
    //   368: iconst_1
    //   369: anewarray 4\011java/lang/Object
    //   372: astore 26
    //   374: aload 26
    //   376: iconst_0
    //   377: aload 12
    //   379: iload 25
    //   381: invokeinterface 329 2 0
    //   386: checkcast 311\011com/google/android/gms/tagmanager/zzap
    //   389: invokevirtual 339\011com/google/android/gms/tagmanager/zzap:zzgs\011()J
    //   392: invokestatic 149\011java/lang/Long:valueOf\011(J)Ljava/lang/Long;
    //   395: aastore
    //   396: ldc_w 341
    //   399: aload 26
    //   401: invokestatic 43\011java/lang/String:format\011(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   404: invokestatic 134\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   407: goto -145 -> 262
    //   410: astore 16
    //   412: aload 24
    //   414: astore 11
    //   416: new 163\011java/lang/StringBuilder
    //   419: dup
    //   420: invokespecial 164\011java/lang/StringBuilder:<init>\011()V
    //   423: ldc_w 343
    //   426: invokevirtual 170\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   429: aload 16
    //   431: invokevirtual 307\011android/database/sqlite/SQLiteException:getMessage\011()Ljava/lang/String;
    //   434: invokevirtual 170\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   437: invokevirtual 177\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   440: invokestatic 134\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   443: new 269\011java/util/ArrayList
    //   446: dup
    //   447: invokespecial 270\011java/util/ArrayList:<init>\011()V
    //   450: astore 18
    //   452: iconst_0
    //   453: istore 19
    //   455: aload 12
    //   457: invokeinterface 347 1 0
    //   462: astore 20
    //   464: aload 20
    //   466: invokeinterface 352 1 0
    //   471: ifeq +35 -> 506
    //   474: aload 20
    //   476: invokeinterface 356 1 0
    //   481: checkcast 311\011com/google/android/gms/tagmanager/zzap
    //   484: astore 21
    //   486: aload 21
    //   488: invokevirtual 359\011com/google/android/gms/tagmanager/zzap:zztk\011()Ljava/lang/String;
    //   491: invokestatic 364\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   494: istore 22
    //   496: iload 22
    //   498: ifeq +26 -> 524
    //   501: iload 19
    //   503: ifeq +18 -> 521
    //   506: aload 11
    //   508: ifnull +10 -> 518
    //   511: aload 11
    //   513: invokeinterface 302 1 0
    //   518: aload 18
    //   520: areturn
    //   521: iconst_1
    //   522: istore 19
    //   524: aload 18
    //   526: aload 21
    //   528: invokeinterface 296 2 0
    //   533: pop
    //   534: goto -70 -> 464
    //   537: astore 17
    //   539: aload 11
    //   541: ifnull +10 -> 551
    //   544: aload 11
    //   546: invokeinterface 302 1 0
    //   551: aload 17
    //   553: athrow
    //   554: astore 17
    //   556: aload 24
    //   558: astore 11
    //   560: goto -21 -> 539
    //   563: astore 16
    //   565: goto -149 -> 416
    //   568: astore 5
    //   570: aload 11
    //   572: astore 4
    //   574: goto -221 -> 353
    //   577: astore 5
    //   579: aload 8
    //   581: astore 4
    //   583: goto -230 -> 353
    //   586: astore 29
    //   588: aload 29
    //   590: astore 7
    //   592: aload 11
    //   594: astore 8
    //   596: aload_2
    //   597: astore 9
    //   599: goto -290 -> 309
    //   602: astore 13
    //   604: aload 13
    //   606: astore 7
    //   608: aload 11
    //   610: astore 8
    //   612: aload 12
    //   614: astore 9
    //   616: goto -307 -> 309
    //   619: iload 27
    //   621: istore 25
    //   623: goto -398 -> 225
    //
    // Exception table:
    //   from\011to\011target\011type
    //   29\01179\011297\011android/database/sqlite/SQLiteException
    //   29\01179\011351\011finally
    //   212\011222\011410\011android/database/sqlite/SQLiteException
    //   225\011262\011410\011android/database/sqlite/SQLiteException
    //   268\011277\011410\011android/database/sqlite/SQLiteException
    //   368\011407\011410\011android/database/sqlite/SQLiteException
    //   167\011212\011537\011finally
    //   416\011452\011537\011finally
    //   455\011464\011537\011finally
    //   464\011496\011537\011finally
    //   524\011534\011537\011finally
    //   212\011222\011554\011finally
    //   225\011262\011554\011finally
    //   268\011277\011554\011finally
    //   368\011407\011554\011finally
    //   167\011212\011563\011android/database/sqlite/SQLiteException
    //   83\01192\011568\011finally
    //   92\011102\011568\011finally
    //   102\011150\011568\011finally
    //   309\011336\011577\011finally
    //   83\01192\011586\011android/database/sqlite/SQLiteException
    //   92\011102\011602\011android/database/sqlite/SQLiteException
    //   102\011150\011602\011android/database/sqlite/SQLiteException
  }

  void zzb(String[] paramArrayOfString)
  {
    boolean bool = true;
    if ((paramArrayOfString == null) || (paramArrayOfString.length == 0));
    SQLiteDatabase localSQLiteDatabase;
    do
    {
      return;
      localSQLiteDatabase = zzar("Error opening database for deleteHits.");
    }
    while (localSQLiteDatabase == null);
    Object[] arrayOfObject = new Object[bool];
    arrayOfObject[0] = TextUtils.join(",", Collections.nCopies(paramArrayOfString.length, "?"));
    String str = String.format("HIT_ID in (%s)", arrayOfObject);
    while (true)
    {
      try
      {
        localSQLiteDatabase.delete("gtm_hits", str, paramArrayOfString);
        zzau localzzau = this.zzazs;
        if (zzgA() == 0)
        {
          localzzau.zzD(bool);
          return;
        }
      }
      catch (SQLiteException localSQLiteException)
      {
        zzbf.zzac("Error deleting hits");
        return;
      }
      bool = false;
    }
  }

  public void zzf(long paramLong, String paramString)
  {
    zzgz();
    zzgy();
    zzg(paramLong, paramString);
  }

  int zzgA()
  {
    Cursor localCursor = null;
    SQLiteDatabase localSQLiteDatabase = zzar("Error opening database for getNumStoredHits.");
    int i = 0;
    if (localSQLiteDatabase == null);
    while (true)
    {
      return i;
      try
      {
        localCursor = localSQLiteDatabase.rawQuery("SELECT COUNT(*) from gtm_hits", null);
        boolean bool = localCursor.moveToFirst();
        i = 0;
        if (bool)
        {
          long l = localCursor.getLong(0);
          i = (int)l;
        }
        return i;
      }
      catch (SQLiteException localSQLiteException)
      {
        zzbf.zzac("Error getting numStoredHits");
        i = 0;
        return 0;
      }
      finally
      {
        if (localCursor != null)
          localCursor.close();
      }
    }
  }

  int zzgz()
  {
    boolean bool = true;
    long l1 = this.zzmW.currentTimeMillis();
    if (l1 <= 86400000L + this.zzEY);
    SQLiteDatabase localSQLiteDatabase;
    do
    {
      return 0;
      this.zzEY = l1;
      localSQLiteDatabase = zzar("Error opening database for deleteStaleHits.");
    }
    while (localSQLiteDatabase == null);
    long l2 = this.zzmW.currentTimeMillis() - 2592000000L;
    String[] arrayOfString = new String[bool];
    arrayOfString[0] = Long.toString(l2);
    int i = localSQLiteDatabase.delete("gtm_hits", "HIT_TIME < ?", arrayOfString);
    zzau localzzau = this.zzazs;
    if (zzgA() == 0);
    while (true)
    {
      localzzau.zzD(bool);
      return i;
      bool = false;
    }
  }

  // ERROR //
  int zztv()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_1
    //   2: aload_0
    //   3: ldc 139
    //   5: invokespecial 141\011com/google/android/gms/tagmanager/zzbx:zzar\011(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   8: astore_2
    //   9: aload_2
    //   10: ifnonnull +5 -> 15
    //   13: iconst_0
    //   14: ireturn
    //   15: aload_2
    //   16: ldc 29
    //   18: iconst_2
    //   19: anewarray 39\011java/lang/String
    //   22: dup
    //   23: iconst_0
    //   24: ldc 31
    //   26: aastore
    //   27: dup
    //   28: iconst_1
    //   29: ldc 37
    //   31: aastore
    //   32: ldc_w 421
    //   35: aconst_null
    //   36: aconst_null
    //   37: aconst_null
    //   38: aconst_null
    //   39: invokevirtual 424\011android/database/sqlite/SQLiteDatabase:query\011(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   42: astore 8
    //   44: aload 8
    //   46: invokeinterface 427 1 0
    //   51: istore 10
    //   53: iload 10
    //   55: istore 7
    //   57: aload 8
    //   59: ifnull +10 -> 69
    //   62: aload 8
    //   64: invokeinterface 302 1 0
    //   69: iload 7
    //   71: ireturn
    //   72: astore 4
    //   74: aconst_null
    //   75: astore 5
    //   77: ldc_w 429
    //   80: invokestatic 134\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   83: aload 5
    //   85: ifnull +56 -> 141
    //   88: aload 5
    //   90: invokeinterface 302 1 0
    //   95: iconst_0
    //   96: istore 7
    //   98: goto -29 -> 69
    //   101: astore_3
    //   102: aload_1
    //   103: ifnull +9 -> 112
    //   106: aload_1
    //   107: invokeinterface 302 1 0
    //   112: aload_3
    //   113: athrow
    //   114: astore_3
    //   115: aload 8
    //   117: astore_1
    //   118: goto -16 -> 102
    //   121: astore 6
    //   123: aload 5
    //   125: astore_1
    //   126: aload 6
    //   128: astore_3
    //   129: goto -27 -> 102
    //   132: astore 9
    //   134: aload 8
    //   136: astore 5
    //   138: goto -61 -> 77
    //   141: iconst_0
    //   142: istore 7
    //   144: goto -75 -> 69
    //
    // Exception table:
    //   from\011to\011target\011type
    //   15\01144\01172\011android/database/sqlite/SQLiteException
    //   15\01144\011101\011finally
    //   44\01153\011114\011finally
    //   77\01183\011121\011finally
    //   44\01153\011132\011android/database/sqlite/SQLiteException
  }

  class zza
    implements zzcw.zza
  {
    zza()
    {
    }

    public void zza(zzap paramzzap)
    {
      zzbx.zza(zzbx.this, paramzzap.zzgs());
    }

    public void zzb(zzap paramzzap)
    {
      zzbx.zza(zzbx.this, paramzzap.zzgs());
      zzbf.zzab("Permanent failure dispatching hitId: " + paramzzap.zzgs());
    }

    public void zzc(zzap paramzzap)
    {
      long l = paramzzap.zztj();
      if (l == 0L)
        zzbx.zza(zzbx.this, paramzzap.zzgs(), zzbx.zza(zzbx.this).currentTimeMillis());
      while (l + 14400000L >= zzbx.zza(zzbx.this).currentTimeMillis())
        return;
      zzbx.zza(zzbx.this, paramzzap.zzgs());
      zzbf.zzab("Giving up on failed hitId: " + paramzzap.zzgs());
    }
  }

  class zzb extends SQLiteOpenHelper
  {
    private boolean zzFa;
    private long zzFb = 0L;

    zzb(Context paramString, String arg3)
    {
      super(str, null, 1);
    }

    private void zza(SQLiteDatabase paramSQLiteDatabase)
    {
      Cursor localCursor = paramSQLiteDatabase.rawQuery("SELECT * FROM gtm_hits WHERE 0", null);
      HashSet localHashSet = new HashSet();
      try
      {
        String[] arrayOfString = localCursor.getColumnNames();
        for (int i = 0; i < arrayOfString.length; i++)
          localHashSet.add(arrayOfString[i]);
        localCursor.close();
        if ((!localHashSet.remove("hit_id")) || (!localHashSet.remove("hit_url")) || (!localHashSet.remove("hit_time")) || (!localHashSet.remove("hit_first_send_time")))
          throw new SQLiteException("Database column missing");
      }
      finally
      {
        localCursor.close();
      }
      if (!localHashSet.isEmpty())
        throw new SQLiteException("Database has extra columns");
    }

    // ERROR //
    private boolean zza(String paramString, SQLiteDatabase paramSQLiteDatabase)
    {
      // Byte code:
      //   0: aconst_null
      //   1: astore_3
      //   2: aload_2
      //   3: ldc 76
      //   5: iconst_1
      //   6: anewarray 78\011java/lang/String
      //   9: dup
      //   10: iconst_0
      //   11: ldc 80
      //   13: aastore
      //   14: ldc 82
      //   16: iconst_1
      //   17: anewarray 78\011java/lang/String
      //   20: dup
      //   21: iconst_0
      //   22: aload_1
      //   23: aastore
      //   24: aconst_null
      //   25: aconst_null
      //   26: aconst_null
      //   27: invokevirtual 86\011android/database/sqlite/SQLiteDatabase:query\011(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
      //   30: astore 8
      //   32: aload 8
      //   34: invokeinterface 89 1 0
      //   39: istore 10
      //   41: aload 8
      //   43: ifnull +10 -> 53
      //   46: aload 8
      //   48: invokeinterface 49 1 0
      //   53: iload 10
      //   55: ireturn
      //   56: astore 5
      //   58: aconst_null
      //   59: astore 6
      //   61: new 91\011java/lang/StringBuilder
      //   64: dup
      //   65: invokespecial 92\011java/lang/StringBuilder:<init>\011()V
      //   68: ldc 94
      //   70: invokevirtual 98\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   73: aload_1
      //   74: invokevirtual 98\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   77: invokevirtual 102\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
      //   80: invokestatic 107\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
      //   83: aload 6
      //   85: ifnull +10 -> 95
      //   88: aload 6
      //   90: invokeinterface 49 1 0
      //   95: iconst_0
      //   96: ireturn
      //   97: astore 4
      //   99: aload_3
      //   100: ifnull +9 -> 109
      //   103: aload_3
      //   104: invokeinterface 49 1 0
      //   109: aload 4
      //   111: athrow
      //   112: astore 4
      //   114: aload 8
      //   116: astore_3
      //   117: goto -18 -> 99
      //   120: astore 7
      //   122: aload 6
      //   124: astore_3
      //   125: aload 7
      //   127: astore 4
      //   129: goto -30 -> 99
      //   132: astore 9
      //   134: aload 8
      //   136: astore 6
      //   138: goto -77 -> 61
      //
      // Exception table:
      //   from\011to\011target\011type
      //   2\01132\01156\011android/database/sqlite/SQLiteException
      //   2\01132\01197\011finally
      //   32\01141\011112\011finally
      //   61\01183\011120\011finally
      //   32\01141\011132\011android/database/sqlite/SQLiteException
    }

    public SQLiteDatabase getWritableDatabase()
    {
      if ((this.zzFa) && (3600000L + this.zzFb > zzbx.zza(zzbx.this).currentTimeMillis()))
        throw new SQLiteException("Database creation failed");
      this.zzFa = true;
      this.zzFb = zzbx.zza(zzbx.this).currentTimeMillis();
      try
      {
        SQLiteDatabase localSQLiteDatabase2 = super.getWritableDatabase();
        localSQLiteDatabase1 = localSQLiteDatabase2;
        if (localSQLiteDatabase1 == null)
          localSQLiteDatabase1 = super.getWritableDatabase();
        this.zzFa = false;
        return localSQLiteDatabase1;
      }
      catch (SQLiteException localSQLiteException)
      {
        while (true)
        {
          zzbx.zzc(zzbx.this).getDatabasePath(zzbx.zzb(zzbx.this)).delete();
          SQLiteDatabase localSQLiteDatabase1 = null;
        }
      }
    }

    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      zzak.zzam(paramSQLiteDatabase.getPath());
    }

    public void onOpen(SQLiteDatabase paramSQLiteDatabase)
    {
      Cursor localCursor;
      if (Build.VERSION.SDK_INT < 15)
        localCursor = paramSQLiteDatabase.rawQuery("PRAGMA journal_mode=memory", null);
      try
      {
        localCursor.moveToFirst();
        localCursor.close();
        if (!zza("gtm_hits", paramSQLiteDatabase))
        {
          paramSQLiteDatabase.execSQL(zzbx.zztw());
          return;
        }
      }
      finally
      {
        localCursor.close();
      }
      zza(paramSQLiteDatabase);
    }

    public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
    {
    }
  }
}