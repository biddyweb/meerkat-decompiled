package com.google.android.gms.analytics;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.google.android.gms.internal.zzik;
import com.google.android.gms.internal.zzlv;
import com.google.android.gms.internal.zzlx;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.apache.http.impl.client.DefaultHttpClient;

class zzag
  implements zzd
{
  private static final String zzES = String.format("CREATE TABLE IF NOT EXISTS %s ( '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '%s' INTEGER NOT NULL, '%s' TEXT NOT NULL, '%s' TEXT NOT NULL, '%s' INTEGER);", new Object[] { "hits2", "hit_id", "hit_time", "hit_url", "hit_string", "hit_app_id" });
  private static final String zzET = String.format("SELECT COUNT(*), MIN(%s), MAX(%s) FROM %s WHERE 1;", new Object[] { "hit_time", "hit_time", "hits2" });
  private final Context mContext;
  private zzo zzBr;
  private volatile boolean zzBs = true;
  private final zze zzCb;
  private final zza zzEU;
  private volatile zzr zzEV;
  private final String zzEW;
  private zzaf zzEX;
  private long zzEY;
  private final int zzEZ;
  private zzlv zzmW;

  zzag(zze paramzze, Context paramContext, zzo paramzzo)
  {
    this(paramzze, paramContext, "google_analytics_v4.db", 2000, paramzzo);
  }

  zzag(zze paramzze, Context paramContext, String paramString, int paramInt, zzo paramzzo)
  {
    this.mContext = paramContext.getApplicationContext();
    this.zzBr = paramzzo;
    this.zzEW = paramString;
    this.zzCb = paramzze;
    this.zzmW = zzlx.zzkc();
    this.zzEU = new zza(this.mContext, this.zzEW);
    this.zzEV = new zzh(new DefaultHttpClient(), this.mContext, this.zzBr);
    this.zzEY = 0L;
    this.zzEZ = paramInt;
  }

  static String zzD(Map<String, String> paramMap)
  {
    ArrayList localArrayList = new ArrayList(paramMap.size());
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localArrayList.add(zzac.encode((String)localEntry.getKey()) + "=" + zzac.encode((String)localEntry.getValue()));
    }
    return TextUtils.join("&", localArrayList);
  }

  // ERROR //
  private void zza(Map<String, String> paramMap, long paramLong, String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: ldc 195
    //   5: invokespecial 199\011com/google/android/gms/analytics/zzag:zzar\011(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   8: astore 6
    //   10: aload 6
    //   12: ifnonnull +6 -> 18
    //   15: aload_0
    //   16: monitorexit
    //   17: return
    //   18: new 201\011android/content/ContentValues
    //   21: dup
    //   22: invokespecial 202\011android/content/ContentValues:<init>\011()V
    //   25: astore 7
    //   27: aload 7
    //   29: ldc 44
    //   31: aload_1
    //   32: invokestatic 204\011com/google/android/gms/analytics/zzag:zzD\011(Ljava/util/Map;)Ljava/lang/String;
    //   35: invokevirtual 208\011android/content/ContentValues:put\011(Ljava/lang/String;Ljava/lang/String;)V
    //   38: aload 7
    //   40: ldc 40
    //   42: lload_2
    //   43: invokestatic 214\011java/lang/Long:valueOf\011(J)Ljava/lang/Long;
    //   46: invokevirtual 217\011android/content/ContentValues:put\011(Ljava/lang/String;Ljava/lang/Long;)V
    //   49: aload_1
    //   50: ldc 219
    //   52: invokeinterface 222 2 0
    //   57: istore 8
    //   59: iload 8
    //   61: ifeq +119 -> 180
    //   64: aload_1
    //   65: ldc 219
    //   67: invokeinterface 226 2 0
    //   72: checkcast 48\011java/lang/String
    //   75: invokestatic 230\011java/lang/Long:parseLong\011(Ljava/lang/String;)J
    //   78: lstore 15
    //   80: lload 15
    //   82: lstore 9
    //   84: aload 7
    //   86: ldc 46
    //   88: lload 9
    //   90: invokestatic 214\011java/lang/Long:valueOf\011(J)Ljava/lang/Long;
    //   93: invokevirtual 217\011android/content/ContentValues:put\011(Ljava/lang/String;Ljava/lang/Long;)V
    //   96: aload 4
    //   98: ifnonnull +7 -> 105
    //   101: ldc 232
    //   103: astore 4
    //   105: aload 4
    //   107: invokevirtual 235\011java/lang/String:length\011()I
    //   110: ifne +26 -> 136
    //   113: ldc 237
    //   115: invokestatic 243\011com/google/android/gms/analytics/zzae:zzac\011(Ljava/lang/String;)V
    //   118: goto -103 -> 15
    //   121: astore 5
    //   123: aload_0
    //   124: monitorexit
    //   125: aload 5
    //   127: athrow
    //   128: astore 14
    //   130: lconst_0
    //   131: lstore 9
    //   133: goto -49 -> 84
    //   136: aload 7
    //   138: ldc 42
    //   140: aload 4
    //   142: invokevirtual 208\011android/content/ContentValues:put\011(Ljava/lang/String;Ljava/lang/String;)V
    //   145: aload 6
    //   147: ldc 36
    //   149: aconst_null
    //   150: aload 7
    //   152: invokevirtual 249\011android/database/sqlite/SQLiteDatabase:insert\011(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   155: pop2
    //   156: aload_0
    //   157: getfield 83\011com/google/android/gms/analytics/zzag:zzCb\011Lcom/google/android/gms/analytics/zze;
    //   160: iconst_0
    //   161: invokeinterface 254 2 0
    //   166: goto -151 -> 15
    //   169: astore 11
    //   171: ldc_w 256
    //   174: invokestatic 243\011com/google/android/gms/analytics/zzae:zzac\011(Ljava/lang/String;)V
    //   177: goto -162 -> 15
    //   180: lconst_0
    //   181: lstore 9
    //   183: goto -99 -> 84
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01110\011121\011finally
    //   18\01159\011121\011finally
    //   64\01180\011121\011finally
    //   84\01196\011121\011finally
    //   105\011118\011121\011finally
    //   136\011145\011121\011finally
    //   145\011166\011121\011finally
    //   171\011177\011121\011finally
    //   64\01180\011128\011java/lang/NumberFormatException
    //   145\011166\011169\011android/database/sqlite/SQLiteException
  }

  private void zza(Map<String, String> paramMap, Collection<zzik> paramCollection)
  {
    String str = "&_v".substring(1);
    if (paramCollection != null)
    {
      Iterator localIterator = paramCollection.iterator();
      while (localIterator.hasNext())
      {
        zzik localzzik = (zzik)localIterator.next();
        if ("appendVersion".equals(localzzik.getId()))
          paramMap.put(str, localzzik.getValue());
      }
    }
  }

  private SQLiteDatabase zzar(String paramString)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase2 = this.zzEU.getWritableDatabase();
      localSQLiteDatabase1 = localSQLiteDatabase2;
      return localSQLiteDatabase1;
    }
    catch (SQLiteException localSQLiteException)
    {
      while (true)
      {
        zzae.zzac(paramString);
        SQLiteDatabase localSQLiteDatabase1 = null;
      }
    }
    finally
    {
    }
  }

  private void zzgy()
  {
    int i = 1 + (zzgA() - this.zzEZ);
    if (i > 0)
    {
      List localList = zzM(i);
      zzae.zzab("Store full, deleting " + localList.size() + " hits to make room.");
      zzb((String[])localList.toArray(new String[0]));
    }
  }

  public void dispatch()
  {
    boolean bool = true;
    zzae.zzab("Dispatch running...");
    if (!this.zzEV.zzfk())
      return;
    List localList = zzN(20);
    if (localList.isEmpty())
    {
      zzae.zzab("...nothing to dispatch");
      this.zzCb.zzD(bool);
      return;
    }
    if (this.zzEX == null)
      this.zzEX = new zzaf("_t=dispatch&_v=ma4.0.6", false);
    if (zzgA() <= localList.size());
    while (true)
    {
      int i = this.zzEV.zza(localList, this.zzEX, bool);
      zzae.zzab("sent " + i + " of " + localList.size() + " hits");
      zzb(localList.subList(0, Math.min(i, localList.size())));
      if ((i != localList.size()) || (zzgA() <= 0))
        break;
      GoogleAnalytics.getInstance(this.mContext).dispatchLocalHits();
      return;
      bool = false;
    }
    this.zzEX = null;
  }

  public void setDryRun(boolean paramBoolean)
  {
    this.zzBs = paramBoolean;
    if (this.zzEV != null)
      this.zzEV.setDryRun(paramBoolean);
  }

  // ERROR //
  List<String> zzM(int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 116\011java/util/ArrayList
    //   5: dup
    //   6: invokespecial 378\011java/util/ArrayList:<init>\011()V
    //   9: astore_2
    //   10: iload_1
    //   11: ifgt +17 -> 28
    //   14: ldc_w 380
    //   17: invokestatic 243\011com/google/android/gms/analytics/zzae:zzac\011(Ljava/lang/String;)V
    //   20: aload_2
    //   21: astore 4
    //   23: aload_0
    //   24: monitorexit
    //   25: aload 4
    //   27: areturn
    //   28: aload_0
    //   29: ldc_w 382
    //   32: invokespecial 199\011com/google/android/gms/analytics/zzag:zzar\011(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   35: astore 5
    //   37: aload 5
    //   39: ifnonnull +9 -> 48
    //   42: aload_2
    //   43: astore 4
    //   45: goto -22 -> 23
    //   48: aload 5
    //   50: ldc 36
    //   52: iconst_1
    //   53: anewarray 48\011java/lang/String
    //   56: dup
    //   57: iconst_0
    //   58: ldc 38
    //   60: aastore
    //   61: aconst_null
    //   62: aconst_null
    //   63: aconst_null
    //   64: aconst_null
    //   65: ldc_w 384
    //   68: iconst_1
    //   69: anewarray 4\011java/lang/Object
    //   72: dup
    //   73: iconst_0
    //   74: ldc 38
    //   76: aastore
    //   77: invokestatic 52\011java/lang/String:format\011(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   80: iload_1
    //   81: invokestatic 388\011java/lang/Integer:toString\011(I)Ljava/lang/String;
    //   84: invokevirtual 392\011android/database/sqlite/SQLiteDatabase:query\011(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   87: astore 9
    //   89: aload 9
    //   91: astore 7
    //   93: aload 7
    //   95: invokeinterface 397 1 0
    //   100: ifeq +35 -> 135
    //   103: aload_2
    //   104: aload 7
    //   106: iconst_0
    //   107: invokeinterface 401 2 0
    //   112: invokestatic 404\011java/lang/String:valueOf\011(J)Ljava/lang/String;
    //   115: invokeinterface 178 2 0
    //   120: pop
    //   121: aload 7
    //   123: invokeinterface 407 1 0
    //   128: istore 11
    //   130: iload 11
    //   132: ifne -29 -> 103
    //   135: aload 7
    //   137: ifnull +10 -> 147
    //   140: aload 7
    //   142: invokeinterface 410 1 0
    //   147: aload_2
    //   148: astore 4
    //   150: goto -127 -> 23
    //   153: astore 8
    //   155: aconst_null
    //   156: astore 7
    //   158: new 149\011java/lang/StringBuilder
    //   161: dup
    //   162: invokespecial 150\011java/lang/StringBuilder:<init>\011()V
    //   165: ldc_w 412
    //   168: invokevirtual 163\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   171: aload 8
    //   173: invokevirtual 415\011android/database/sqlite/SQLiteException:getMessage\011()Ljava/lang/String;
    //   176: invokevirtual 163\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   179: invokevirtual 172\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   182: invokestatic 243\011com/google/android/gms/analytics/zzae:zzac\011(Ljava/lang/String;)V
    //   185: aload 7
    //   187: ifnull -40 -> 147
    //   190: aload 7
    //   192: invokeinterface 410 1 0
    //   197: goto -50 -> 147
    //   200: astore_3
    //   201: aload_0
    //   202: monitorexit
    //   203: aload_3
    //   204: athrow
    //   205: astore 6
    //   207: aconst_null
    //   208: astore 7
    //   210: aload 7
    //   212: ifnull +10 -> 222
    //   215: aload 7
    //   217: invokeinterface 410 1 0
    //   222: aload 6
    //   224: athrow
    //   225: astore 6
    //   227: goto -17 -> 210
    //   230: astore 8
    //   232: goto -74 -> 158
    //
    // Exception table:
    //   from\011to\011target\011type
    //   48\01189\011153\011android/database/sqlite/SQLiteException
    //   2\01110\011200\011finally
    //   14\01120\011200\011finally
    //   28\01137\011200\011finally
    //   140\011147\011200\011finally
    //   190\011197\011200\011finally
    //   215\011222\011200\011finally
    //   222\011225\011200\011finally
    //   48\01189\011205\011finally
    //   93\011103\011225\011finally
    //   103\011130\011225\011finally
    //   158\011185\011225\011finally
    //   93\011103\011230\011android/database/sqlite/SQLiteException
    //   103\011130\011230\011android/database/sqlite/SQLiteException
  }

  // ERROR //
  public List<zzab> zzN(int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 116\011java/util/ArrayList
    //   5: dup
    //   6: invokespecial 378\011java/util/ArrayList:<init>\011()V
    //   9: astore_2
    //   10: aload_0
    //   11: ldc_w 417
    //   14: invokespecial 199\011com/google/android/gms/analytics/zzag:zzar\011(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   17: astore 4
    //   19: aload 4
    //   21: ifnonnull +11 -> 32
    //   24: aload_2
    //   25: astore 10
    //   27: aload_0
    //   28: monitorexit
    //   29: aload 10
    //   31: areturn
    //   32: aconst_null
    //   33: astore 5
    //   35: aload 4
    //   37: ldc 36
    //   39: iconst_2
    //   40: anewarray 48\011java/lang/String
    //   43: dup
    //   44: iconst_0
    //   45: ldc 38
    //   47: aastore
    //   48: dup
    //   49: iconst_1
    //   50: ldc 40
    //   52: aastore
    //   53: aconst_null
    //   54: aconst_null
    //   55: aconst_null
    //   56: aconst_null
    //   57: ldc_w 384
    //   60: iconst_1
    //   61: anewarray 4\011java/lang/Object
    //   64: dup
    //   65: iconst_0
    //   66: ldc 38
    //   68: aastore
    //   69: invokestatic 52\011java/lang/String:format\011(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   72: iload_1
    //   73: invokestatic 388\011java/lang/Integer:toString\011(I)Ljava/lang/String;
    //   76: invokevirtual 392\011android/database/sqlite/SQLiteDatabase:query\011(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   79: astore 11
    //   81: aload 11
    //   83: astore 12
    //   85: new 116\011java/util/ArrayList
    //   88: dup
    //   89: invokespecial 378\011java/util/ArrayList:<init>\011()V
    //   92: astore 13
    //   94: aload 12
    //   96: invokeinterface 397 1 0
    //   101: ifeq +52 -> 153
    //   104: aload 13
    //   106: new 419\011com/google/android/gms/analytics/zzab
    //   109: dup
    //   110: aconst_null
    //   111: aload 12
    //   113: iconst_0
    //   114: invokeinterface 401 2 0
    //   119: aload 12
    //   121: iconst_1
    //   122: invokeinterface 401 2 0
    //   127: ldc_w 421
    //   130: invokespecial 424\011com/google/android/gms/analytics/zzab:<init>\011(Ljava/lang/String;JJLjava/lang/String;)V
    //   133: invokeinterface 178 2 0
    //   138: pop
    //   139: aload 12
    //   141: invokeinterface 407 1 0
    //   146: istore 16
    //   148: iload 16
    //   150: ifne -46 -> 104
    //   153: aload 12
    //   155: ifnull +10 -> 165
    //   158: aload 12
    //   160: invokeinterface 410 1 0
    //   165: aload 4
    //   167: ldc 36
    //   169: iconst_3
    //   170: anewarray 48\011java/lang/String
    //   173: dup
    //   174: iconst_0
    //   175: ldc 38
    //   177: aastore
    //   178: dup
    //   179: iconst_1
    //   180: ldc 44
    //   182: aastore
    //   183: dup
    //   184: iconst_2
    //   185: ldc 42
    //   187: aastore
    //   188: aconst_null
    //   189: aconst_null
    //   190: aconst_null
    //   191: aconst_null
    //   192: ldc_w 384
    //   195: iconst_1
    //   196: anewarray 4\011java/lang/Object
    //   199: dup
    //   200: iconst_0
    //   201: ldc 38
    //   203: aastore
    //   204: invokestatic 52\011java/lang/String:format\011(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   207: iload_1
    //   208: invokestatic 388\011java/lang/Integer:toString\011(I)Ljava/lang/String;
    //   211: invokevirtual 392\011android/database/sqlite/SQLiteDatabase:query\011(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   214: astore 25
    //   216: aload 25
    //   218: invokeinterface 397 1 0
    //   223: ifeq +86 -> 309
    //   226: iconst_0
    //   227: istore 26
    //   229: aload 25
    //   231: checkcast 426\011android/database/sqlite/SQLiteCursor
    //   234: invokevirtual 430\011android/database/sqlite/SQLiteCursor:getWindow\011()Landroid/database/CursorWindow;
    //   237: invokevirtual 435\011android/database/CursorWindow:getNumRows\011()I
    //   240: ifle +164 -> 404
    //   243: aload 13
    //   245: iload 26
    //   247: invokeinterface 438 2 0
    //   252: checkcast 419\011com/google/android/gms/analytics/zzab
    //   255: aload 25
    //   257: iconst_1
    //   258: invokeinterface 441 2 0
    //   263: invokevirtual 444\011com/google/android/gms/analytics/zzab:zzap\011(Ljava/lang/String;)V
    //   266: aload 13
    //   268: iload 26
    //   270: invokeinterface 438 2 0
    //   275: checkcast 419\011com/google/android/gms/analytics/zzab
    //   278: aload 25
    //   280: iconst_2
    //   281: invokeinterface 441 2 0
    //   286: invokevirtual 447\011com/google/android/gms/analytics/zzab:zzaq\011(Ljava/lang/String;)V
    //   289: iload 26
    //   291: iconst_1
    //   292: iadd
    //   293: istore 28
    //   295: aload 25
    //   297: invokeinterface 407 1 0
    //   302: istore 29
    //   304: iload 29
    //   306: ifne +353 -> 659
    //   309: aload 25
    //   311: ifnull +10 -> 321
    //   314: aload 25
    //   316: invokeinterface 410 1 0
    //   321: aload 13
    //   323: astore 10
    //   325: goto -298 -> 27
    //   328: astore 7
    //   330: aload 7
    //   332: astore 8
    //   334: aconst_null
    //   335: astore 9
    //   337: aload_2
    //   338: astore 10
    //   340: new 149\011java/lang/StringBuilder
    //   343: dup
    //   344: invokespecial 150\011java/lang/StringBuilder:<init>\011()V
    //   347: ldc_w 412
    //   350: invokevirtual 163\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   353: aload 8
    //   355: invokevirtual 415\011android/database/sqlite/SQLiteException:getMessage\011()Ljava/lang/String;
    //   358: invokevirtual 163\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   361: invokevirtual 172\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   364: invokestatic 243\011com/google/android/gms/analytics/zzae:zzac\011(Ljava/lang/String;)V
    //   367: aload 9
    //   369: ifnull -342 -> 27
    //   372: aload 9
    //   374: invokeinterface 410 1 0
    //   379: goto -352 -> 27
    //   382: astore_3
    //   383: aload_0
    //   384: monitorexit
    //   385: aload_3
    //   386: athrow
    //   387: astore 6
    //   389: aload 5
    //   391: ifnull +10 -> 401
    //   394: aload 5
    //   396: invokeinterface 410 1 0
    //   401: aload 6
    //   403: athrow
    //   404: iconst_1
    //   405: anewarray 4\011java/lang/Object
    //   408: astore 27
    //   410: aload 27
    //   412: iconst_0
    //   413: aload 13
    //   415: iload 26
    //   417: invokeinterface 438 2 0
    //   422: checkcast 419\011com/google/android/gms/analytics/zzab
    //   425: invokevirtual 451\011com/google/android/gms/analytics/zzab:zzgs\011()J
    //   428: invokestatic 214\011java/lang/Long:valueOf\011(J)Ljava/lang/Long;
    //   431: aastore
    //   432: ldc_w 453
    //   435: aload 27
    //   437: invokestatic 52\011java/lang/String:format\011(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   440: invokestatic 243\011com/google/android/gms/analytics/zzae:zzac\011(Ljava/lang/String;)V
    //   443: goto -154 -> 289
    //   446: astore 17
    //   448: aload 25
    //   450: astore 12
    //   452: new 149\011java/lang/StringBuilder
    //   455: dup
    //   456: invokespecial 150\011java/lang/StringBuilder:<init>\011()V
    //   459: ldc_w 455
    //   462: invokevirtual 163\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   465: aload 17
    //   467: invokevirtual 415\011android/database/sqlite/SQLiteException:getMessage\011()Ljava/lang/String;
    //   470: invokevirtual 163\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   473: invokevirtual 172\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   476: invokestatic 243\011com/google/android/gms/analytics/zzae:zzac\011(Ljava/lang/String;)V
    //   479: new 116\011java/util/ArrayList
    //   482: dup
    //   483: invokespecial 378\011java/util/ArrayList:<init>\011()V
    //   486: astore 19
    //   488: iconst_0
    //   489: istore 20
    //   491: aload 13
    //   493: invokeinterface 456 1 0
    //   498: astore 21
    //   500: aload 21
    //   502: invokeinterface 141 1 0
    //   507: ifeq +35 -> 542
    //   510: aload 21
    //   512: invokeinterface 145 1 0
    //   517: checkcast 419\011com/google/android/gms/analytics/zzab
    //   520: astore 22
    //   522: aload 22
    //   524: invokevirtual 459\011com/google/android/gms/analytics/zzab:zzgr\011()Ljava/lang/String;
    //   527: invokestatic 462\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   530: istore 23
    //   532: iload 23
    //   534: ifeq +30 -> 564
    //   537: iload 20
    //   539: ifeq +22 -> 561
    //   542: aload 12
    //   544: ifnull +10 -> 554
    //   547: aload 12
    //   549: invokeinterface 410 1 0
    //   554: aload 19
    //   556: astore 10
    //   558: goto -531 -> 27
    //   561: iconst_1
    //   562: istore 20
    //   564: aload 19
    //   566: aload 22
    //   568: invokeinterface 178 2 0
    //   573: pop
    //   574: goto -74 -> 500
    //   577: astore 18
    //   579: aload 12
    //   581: ifnull +10 -> 591
    //   584: aload 12
    //   586: invokeinterface 410 1 0
    //   591: aload 18
    //   593: athrow
    //   594: astore 18
    //   596: aload 25
    //   598: astore 12
    //   600: goto -21 -> 579
    //   603: astore 17
    //   605: goto -153 -> 452
    //   608: astore 6
    //   610: aload 12
    //   612: astore 5
    //   614: goto -225 -> 389
    //   617: astore 6
    //   619: aload 9
    //   621: astore 5
    //   623: goto -234 -> 389
    //   626: astore 30
    //   628: aload 30
    //   630: astore 8
    //   632: aload 12
    //   634: astore 9
    //   636: aload_2
    //   637: astore 10
    //   639: goto -299 -> 340
    //   642: astore 14
    //   644: aload 14
    //   646: astore 8
    //   648: aload 12
    //   650: astore 9
    //   652: aload 13
    //   654: astore 10
    //   656: goto -316 -> 340
    //   659: iload 28
    //   661: istore 26
    //   663: goto -434 -> 229
    //
    // Exception table:
    //   from\011to\011target\011type
    //   35\01181\011328\011android/database/sqlite/SQLiteException
    //   2\01119\011382\011finally
    //   158\011165\011382\011finally
    //   314\011321\011382\011finally
    //   372\011379\011382\011finally
    //   394\011401\011382\011finally
    //   401\011404\011382\011finally
    //   547\011554\011382\011finally
    //   584\011591\011382\011finally
    //   591\011594\011382\011finally
    //   35\01181\011387\011finally
    //   216\011226\011446\011android/database/sqlite/SQLiteException
    //   229\011289\011446\011android/database/sqlite/SQLiteException
    //   295\011304\011446\011android/database/sqlite/SQLiteException
    //   404\011443\011446\011android/database/sqlite/SQLiteException
    //   165\011216\011577\011finally
    //   452\011488\011577\011finally
    //   491\011500\011577\011finally
    //   500\011532\011577\011finally
    //   564\011574\011577\011finally
    //   216\011226\011594\011finally
    //   229\011289\011594\011finally
    //   295\011304\011594\011finally
    //   404\011443\011594\011finally
    //   165\011216\011603\011android/database/sqlite/SQLiteException
    //   85\01194\011608\011finally
    //   94\011104\011608\011finally
    //   104\011148\011608\011finally
    //   340\011367\011617\011finally
    //   85\01194\011626\011android/database/sqlite/SQLiteException
    //   94\011104\011642\011android/database/sqlite/SQLiteException
    //   104\011148\011642\011android/database/sqlite/SQLiteException
  }

  public void zza(Map<String, String> paramMap, long paramLong, String paramString, Collection<zzik> paramCollection)
  {
    zzgz();
    zzgy();
    zza(paramMap, paramCollection);
    zza(paramMap, paramLong, paramString);
  }

  @Deprecated
  void zzb(Collection<zzab> paramCollection)
  {
    if ((paramCollection == null) || (paramCollection.isEmpty()))
    {
      zzae.zzac("Empty/Null collection passed to deleteHits.");
      return;
    }
    String[] arrayOfString = new String[paramCollection.size()];
    Iterator localIterator = paramCollection.iterator();
    int j;
    for (int i = 0; localIterator.hasNext(); i = j)
    {
      zzab localzzab = (zzab)localIterator.next();
      j = i + 1;
      arrayOfString[i] = String.valueOf(localzzab.zzgs());
    }
    zzb(arrayOfString);
  }

  void zzb(String[] paramArrayOfString)
  {
    boolean bool = true;
    if (paramArrayOfString != null);
    while (true)
    {
      try
      {
        if (paramArrayOfString.length == 0)
        {
          zzae.zzac("Empty hitIds passed to deleteHits.");
          return;
        }
        SQLiteDatabase localSQLiteDatabase = zzar("Error opening database for deleteHits.");
        if (localSQLiteDatabase == null)
          continue;
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = TextUtils.join(",", Collections.nCopies(paramArrayOfString.length, "?"));
        String str = String.format("HIT_ID in (%s)", arrayOfObject);
        try
        {
          localSQLiteDatabase.delete("hits2", str, paramArrayOfString);
          zze localzze = this.zzCb;
          if (zzgA() != 0)
            break label144;
          localzze.zzD(bool);
        }
        catch (SQLiteException localSQLiteException)
        {
          zzae.zzac("Error deleting hits " + TextUtils.join(",", paramArrayOfString));
        }
        continue;
      }
      finally
      {
      }
      label144: bool = false;
    }
  }

  public zzr zzff()
  {
    return this.zzEV;
  }

  // ERROR //
  public android.util.Pair<Long, Long> zzfg()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_1
    //   2: aload_0
    //   3: monitorenter
    //   4: ldc_w 508
    //   7: invokestatic 513\011com/google/android/gms/common/internal/zzx:zzbe\011(Ljava/lang/String;)V
    //   10: lconst_0
    //   11: invokestatic 214\011java/lang/Long:valueOf\011(J)Ljava/lang/Long;
    //   14: lconst_0
    //   15: invokestatic 214\011java/lang/Long:valueOf\011(J)Ljava/lang/Long;
    //   18: invokestatic 519\011android/util/Pair:create\011(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;
    //   21: astore_3
    //   22: aload_0
    //   23: ldc_w 521
    //   26: invokespecial 199\011com/google/android/gms/analytics/zzag:zzar\011(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   29: astore 4
    //   31: aload 4
    //   33: ifnonnull +7 -> 40
    //   36: aload_0
    //   37: monitorexit
    //   38: aload_3
    //   39: areturn
    //   40: aload 4
    //   42: getstatic 58\011com/google/android/gms/analytics/zzag:zzET\011Ljava/lang/String;
    //   45: aconst_null
    //   46: invokevirtual 525\011android/database/sqlite/SQLiteDatabase:rawQuery\011(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   49: astore_1
    //   50: aload_1
    //   51: invokeinterface 397 1 0
    //   56: ifeq +31 -> 87
    //   59: aload_1
    //   60: iconst_1
    //   61: invokeinterface 401 2 0
    //   66: invokestatic 214\011java/lang/Long:valueOf\011(J)Ljava/lang/Long;
    //   69: aload_1
    //   70: iconst_2
    //   71: invokeinterface 401 2 0
    //   76: invokestatic 214\011java/lang/Long:valueOf\011(J)Ljava/lang/Long;
    //   79: invokestatic 519\011android/util/Pair:create\011(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;
    //   82: astore 7
    //   84: aload 7
    //   86: astore_3
    //   87: aload_1
    //   88: ifnull -52 -> 36
    //   91: aload_1
    //   92: invokeinterface 410 1 0
    //   97: goto -61 -> 36
    //   100: astore_2
    //   101: aload_0
    //   102: monitorexit
    //   103: aload_2
    //   104: athrow
    //   105: astore 6
    //   107: ldc_w 527
    //   110: invokestatic 243\011com/google/android/gms/analytics/zzae:zzac\011(Ljava/lang/String;)V
    //   113: aload_1
    //   114: ifnull -78 -> 36
    //   117: aload_1
    //   118: invokeinterface 410 1 0
    //   123: goto -87 -> 36
    //   126: astore 5
    //   128: aload_1
    //   129: ifnull +9 -> 138
    //   132: aload_1
    //   133: invokeinterface 410 1 0
    //   138: aload 5
    //   140: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   4\01131\011100\011finally
    //   91\01197\011100\011finally
    //   117\011123\011100\011finally
    //   132\011138\011100\011finally
    //   138\011141\011100\011finally
    //   40\01184\011105\011android/database/sqlite/SQLiteException
    //   40\01184\011126\011finally
    //   107\011113\011126\011finally
  }

  // ERROR //
  int zzgA()
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_1
    //   2: aload_0
    //   3: monitorenter
    //   4: aload_0
    //   5: ldc_w 529
    //   8: invokespecial 199\011com/google/android/gms/analytics/zzag:zzar\011(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   11: astore_3
    //   12: iconst_0
    //   13: istore 4
    //   15: aload_3
    //   16: ifnonnull +8 -> 24
    //   19: aload_0
    //   20: monitorexit
    //   21: iload 4
    //   23: ireturn
    //   24: aload_3
    //   25: ldc_w 531
    //   28: aconst_null
    //   29: invokevirtual 525\011android/database/sqlite/SQLiteDatabase:rawQuery\011(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   32: astore_1
    //   33: aload_1
    //   34: invokeinterface 397 1 0
    //   39: istore 7
    //   41: iconst_0
    //   42: istore 4
    //   44: iload 7
    //   46: ifeq +17 -> 63
    //   49: aload_1
    //   50: iconst_0
    //   51: invokeinterface 401 2 0
    //   56: lstore 8
    //   58: lload 8
    //   60: l2i
    //   61: istore 4
    //   63: aload_1
    //   64: ifnull -45 -> 19
    //   67: aload_1
    //   68: invokeinterface 410 1 0
    //   73: goto -54 -> 19
    //   76: astore_2
    //   77: aload_0
    //   78: monitorexit
    //   79: aload_2
    //   80: athrow
    //   81: astore 6
    //   83: ldc_w 533
    //   86: invokestatic 243\011com/google/android/gms/analytics/zzae:zzac\011(Ljava/lang/String;)V
    //   89: iconst_0
    //   90: istore 4
    //   92: aload_1
    //   93: ifnull -74 -> 19
    //   96: aload_1
    //   97: invokeinterface 410 1 0
    //   102: iconst_0
    //   103: istore 4
    //   105: goto -86 -> 19
    //   108: astore 5
    //   110: aload_1
    //   111: ifnull +9 -> 120
    //   114: aload_1
    //   115: invokeinterface 410 1 0
    //   120: aload 5
    //   122: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   4\01112\01176\011finally
    //   67\01173\01176\011finally
    //   96\011102\01176\011finally
    //   114\011120\01176\011finally
    //   120\011123\01176\011finally
    //   24\01141\01181\011android/database/sqlite/SQLiteException
    //   49\01158\01181\011android/database/sqlite/SQLiteException
    //   24\01141\011108\011finally
    //   49\01158\011108\011finally
    //   83\01189\011108\011finally
  }

  int zzgz()
  {
    try
    {
      long l1 = this.zzmW.currentTimeMillis();
      long l2 = this.zzEY;
      boolean bool1 = l1 < l2 + 86400000L;
      int i = 0;
      if (!bool1);
      while (true)
      {
        return i;
        this.zzEY = l1;
        SQLiteDatabase localSQLiteDatabase = zzar("Error opening database for deleteStaleHits.");
        i = 0;
        if (localSQLiteDatabase != null)
        {
          long l3 = this.zzmW.currentTimeMillis() - 2592000000L;
          String[] arrayOfString = new String[1];
          arrayOfString[0] = Long.toString(l3);
          int j = localSQLiteDatabase.delete("hits2", "HIT_TIME < ?", arrayOfString);
          zze localzze = this.zzCb;
          int k = zzgA();
          boolean bool2 = false;
          if (k == 0)
            bool2 = true;
          localzze.zzD(bool2);
          i = j;
        }
      }
    }
    finally
    {
    }
  }

  public void zzl(long paramLong)
  {
    boolean bool = true;
    while (true)
    {
      try
      {
        SQLiteDatabase localSQLiteDatabase = zzar("Error opening database for clearHits");
        if (localSQLiteDatabase != null)
        {
          if (paramLong == 0L)
          {
            localSQLiteDatabase.delete("hits2", null, null);
            zze localzze = this.zzCb;
            if (zzgA() != 0)
              break label98;
            localzze.zzD(bool);
          }
        }
        else
          return;
        String[] arrayOfString = new String[1];
        arrayOfString[0] = Long.valueOf(paramLong).toString();
        localSQLiteDatabase.delete("hits2", "hit_app_id = ?", arrayOfString);
        continue;
      }
      finally
      {
      }
      label98: bool = false;
    }
  }

  class zza extends SQLiteOpenHelper
  {
    private boolean zzFa;
    private long zzFb = 0L;

    zza(Context paramString, String arg3)
    {
      super(str, null, 1);
    }

    private void zza(SQLiteDatabase paramSQLiteDatabase)
    {
      Cursor localCursor = paramSQLiteDatabase.rawQuery("SELECT * FROM hits2 WHERE 0", null);
      HashSet localHashSet = new HashSet();
      try
      {
        String[] arrayOfString = localCursor.getColumnNames();
        for (int i = 0; i < arrayOfString.length; i++)
          localHashSet.add(arrayOfString[i]);
        localCursor.close();
        if ((!localHashSet.remove("hit_id")) || (!localHashSet.remove("hit_url")) || (!localHashSet.remove("hit_string")) || (!localHashSet.remove("hit_time")))
          throw new SQLiteException("Database column missing");
      }
      finally
      {
        localCursor.close();
      }
      boolean bool = localHashSet.remove("hit_app_id");
      int j = 0;
      if (!bool)
        j = 1;
      if (!localHashSet.isEmpty())
        throw new SQLiteException("Database has extra columns");
      if (j != 0)
        paramSQLiteDatabase.execSQL("ALTER TABLE hits2 ADD COLUMN hit_app_id");
    }

    // ERROR //
    private boolean zza(String paramString, SQLiteDatabase paramSQLiteDatabase)
    {
      // Byte code:
      //   0: aconst_null
      //   1: astore_3
      //   2: aload_2
      //   3: ldc 83
      //   5: iconst_1
      //   6: anewarray 85\011java/lang/String
      //   9: dup
      //   10: iconst_0
      //   11: ldc 87
      //   13: aastore
      //   14: ldc 89
      //   16: iconst_1
      //   17: anewarray 85\011java/lang/String
      //   20: dup
      //   21: iconst_0
      //   22: aload_1
      //   23: aastore
      //   24: aconst_null
      //   25: aconst_null
      //   26: aconst_null
      //   27: invokevirtual 93\011android/database/sqlite/SQLiteDatabase:query\011(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
      //   30: astore 8
      //   32: aload 8
      //   34: invokeinterface 96 1 0
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
      //   61: new 98\011java/lang/StringBuilder
      //   64: dup
      //   65: invokespecial 99\011java/lang/StringBuilder:<init>\011()V
      //   68: ldc 101
      //   70: invokevirtual 105\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   73: aload_1
      //   74: invokevirtual 105\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   77: invokevirtual 109\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
      //   80: invokestatic 114\011com/google/android/gms/analytics/zzae:zzac\011(Ljava/lang/String;)V
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
      if ((this.zzFa) && (3600000L + this.zzFb > zzag.zza(zzag.this).currentTimeMillis()))
        throw new SQLiteException("Database creation failed");
      this.zzFa = true;
      this.zzFb = zzag.zza(zzag.this).currentTimeMillis();
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
          zzag.zzc(zzag.this).getDatabasePath(zzag.zzb(zzag.this)).delete();
          SQLiteDatabase localSQLiteDatabase1 = null;
        }
      }
    }

    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      zzt.zzam(paramSQLiteDatabase.getPath());
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
        if (!zza("hits2", paramSQLiteDatabase))
        {
          paramSQLiteDatabase.execSQL(zzag.zzgB());
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