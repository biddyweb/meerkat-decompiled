package com.google.android.gms.internal;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.os.SystemClock;

@zzgi
public class zzfi
{
  private static final Object zznh = new Object();
  private static final String zzvs = String.format("CREATE TABLE IF NOT EXISTS %s ( %s INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, %s TEXT NOT NULL, %s TEXT NOT NULL, %s INTEGER)", new Object[] { "InAppPurchase", "purchase_id", "product_id", "developer_payload", "record_time" });
  private static zzfi zzvu;
  private final zzfi.zza zzvt;

  zzfi(Context paramContext)
  {
    this.zzvt = new zzfi.zza(this, paramContext, "google_inapp_purchase.db");
  }

  public static zzfi zzm(Context paramContext)
  {
    synchronized (zznh)
    {
      if (zzvu == null)
        zzvu = new zzfi(paramContext);
      zzfi localzzfi = zzvu;
      return localzzfi;
    }
  }

  public int getRecordCount()
  {
    Cursor localCursor = null;
    SQLiteDatabase localSQLiteDatabase;
    synchronized (zznh)
    {
      localSQLiteDatabase = getWritableDatabase();
      if (localSQLiteDatabase == null)
        return 0;
    }
    try
    {
      localCursor = localSQLiteDatabase.rawQuery("select count(*) from InAppPurchase", null);
      if (localCursor.moveToFirst())
      {
        int i = localCursor.getInt(0);
        if (localCursor != null)
          localCursor.close();
        return i;
        localObject2 = finally;
        throw localObject2;
      }
      if (localCursor != null)
        localCursor.close();
      return 0;
    }
    catch (SQLiteException localSQLiteException)
    {
      while (true)
      {
        zzhx.zzac("Error getting record count" + localSQLiteException.getMessage());
        if (localCursor != null)
          localCursor.close();
      }
    }
    finally
    {
      if (localCursor != null)
        localCursor.close();
    }
  }

  public SQLiteDatabase getWritableDatabase()
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = this.zzvt.getWritableDatabase();
      return localSQLiteDatabase;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzhx.zzac("Error opening writable conversion tracking database");
    }
    return null;
  }

  public zzfg zza(Cursor paramCursor)
  {
    if (paramCursor == null)
      return null;
    return new zzfg(paramCursor.getLong(0), paramCursor.getString(1), paramCursor.getString(2));
  }

  public void zza(zzfg paramzzfg)
  {
    if (paramzzfg == null)
      return;
    SQLiteDatabase localSQLiteDatabase;
    synchronized (zznh)
    {
      localSQLiteDatabase = getWritableDatabase();
      if (localSQLiteDatabase == null)
        return;
    }
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = "purchase_id";
    arrayOfObject[1] = Long.valueOf(paramzzfg.zzvm);
    localSQLiteDatabase.delete("InAppPurchase", String.format("%s = %d", arrayOfObject), null);
  }

  public void zzb(zzfg paramzzfg)
  {
    if (paramzzfg == null)
      return;
    SQLiteDatabase localSQLiteDatabase;
    synchronized (zznh)
    {
      localSQLiteDatabase = getWritableDatabase();
      if (localSQLiteDatabase == null)
        return;
    }
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("product_id", paramzzfg.zzvo);
    localContentValues.put("developer_payload", paramzzfg.zzvn);
    localContentValues.put("record_time", Long.valueOf(SystemClock.elapsedRealtime()));
    paramzzfg.zzvm = localSQLiteDatabase.insert("InAppPurchase", null, localContentValues);
    if (getRecordCount() > 20000L)
      zzdz();
  }

  // ERROR //
  public void zzdz()
  {
    // Byte code:
    //   0: getstatic 40\011com/google/android/gms/internal/zzfi:zznh\011Ljava/lang/Object;
    //   3: astore_1
    //   4: aload_1
    //   5: monitorenter
    //   6: aload_0
    //   7: invokevirtual 66\011com/google/android/gms/internal/zzfi:getWritableDatabase\011()Landroid/database/sqlite/SQLiteDatabase;
    //   10: astore_3
    //   11: aload_3
    //   12: ifnonnull +6 -> 18
    //   15: aload_1
    //   16: monitorexit
    //   17: return
    //   18: aload_3
    //   19: ldc 19
    //   21: aconst_null
    //   22: aconst_null
    //   23: aconst_null
    //   24: aconst_null
    //   25: aconst_null
    //   26: ldc 179
    //   28: ldc 181
    //   30: invokevirtual 185\011android/database/sqlite/SQLiteDatabase:query\011(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   33: astore 7
    //   35: aload 7
    //   37: astore 5
    //   39: aload 5
    //   41: ifnull +23 -> 64
    //   44: aload 5
    //   46: invokeinterface 80 1 0
    //   51: ifeq +13 -> 64
    //   54: aload_0
    //   55: aload_0
    //   56: aload 5
    //   58: invokevirtual 187\011com/google/android/gms/internal/zzfi:zza\011(Landroid/database/Cursor;)Lcom/google/android/gms/internal/zzfg;
    //   61: invokevirtual 189\011com/google/android/gms/internal/zzfi:zza\011(Lcom/google/android/gms/internal/zzfg;)V
    //   64: aload 5
    //   66: ifnull +10 -> 76
    //   69: aload 5
    //   71: invokeinterface 87 1 0
    //   76: aload_1
    //   77: monitorexit
    //   78: return
    //   79: astore_2
    //   80: aload_1
    //   81: monitorexit
    //   82: aload_2
    //   83: athrow
    //   84: astore 6
    //   86: aconst_null
    //   87: astore 5
    //   89: new 89\011java/lang/StringBuilder
    //   92: dup
    //   93: invokespecial 90\011java/lang/StringBuilder:<init>\011()V
    //   96: ldc 191
    //   98: invokevirtual 96\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   101: aload 6
    //   103: invokevirtual 99\011android/database/sqlite/SQLiteException:getMessage\011()Ljava/lang/String;
    //   106: invokevirtual 96\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   109: invokevirtual 102\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   112: invokestatic 108\011com/google/android/gms/internal/zzhx:zzac\011(Ljava/lang/String;)V
    //   115: aload 5
    //   117: ifnull -41 -> 76
    //   120: aload 5
    //   122: invokeinterface 87 1 0
    //   127: goto -51 -> 76
    //   130: aload 5
    //   132: ifnull +10 -> 142
    //   135: aload 5
    //   137: invokeinterface 87 1 0
    //   142: aload 4
    //   144: athrow
    //   145: astore 4
    //   147: goto -17 -> 130
    //   150: astore 6
    //   152: goto -63 -> 89
    //   155: astore 4
    //   157: aconst_null
    //   158: astore 5
    //   160: goto -30 -> 130
    //
    // Exception table:
    //   from\011to\011target\011type
    //   6\01111\01179\011finally
    //   15\01117\01179\011finally
    //   69\01176\01179\011finally
    //   76\01178\01179\011finally
    //   80\01182\01179\011finally
    //   120\011127\01179\011finally
    //   135\011142\01179\011finally
    //   142\011145\01179\011finally
    //   18\01135\01184\011android/database/sqlite/SQLiteException
    //   44\01164\011145\011finally
    //   89\011115\011145\011finally
    //   44\01164\011150\011android/database/sqlite/SQLiteException
    //   18\01135\011155\011finally
  }

  // ERROR //
  public java.util.List<zzfg> zze(long paramLong)
  {
    // Byte code:
    //   0: getstatic 40\011com/google/android/gms/internal/zzfi:zznh\011Ljava/lang/Object;
    //   3: astore_3
    //   4: aload_3
    //   5: monitorenter
    //   6: new 195\011java/util/LinkedList
    //   9: dup
    //   10: invokespecial 196\011java/util/LinkedList:<init>\011()V
    //   13: astore 4
    //   15: lload_1
    //   16: lconst_0
    //   17: lcmp
    //   18: ifgt +8 -> 26
    //   21: aload_3
    //   22: monitorexit
    //   23: aload 4
    //   25: areturn
    //   26: aload_0
    //   27: invokevirtual 66\011com/google/android/gms/internal/zzfi:getWritableDatabase\011()Landroid/database/sqlite/SQLiteDatabase;
    //   30: astore 6
    //   32: aload 6
    //   34: ifnonnull +8 -> 42
    //   37: aload_3
    //   38: monitorexit
    //   39: aload 4
    //   41: areturn
    //   42: aload 6
    //   44: ldc 19
    //   46: aconst_null
    //   47: aconst_null
    //   48: aconst_null
    //   49: aconst_null
    //   50: aconst_null
    //   51: ldc 179
    //   53: lload_1
    //   54: invokestatic 199\011java/lang/String:valueOf\011(J)Ljava/lang/String;
    //   57: invokevirtual 185\011android/database/sqlite/SQLiteDatabase:query\011(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   60: astore 10
    //   62: aload 10
    //   64: astore 8
    //   66: aload 8
    //   68: invokeinterface 80 1 0
    //   73: ifeq +31 -> 104
    //   76: aload 4
    //   78: aload_0
    //   79: aload 8
    //   81: invokevirtual 187\011com/google/android/gms/internal/zzfi:zza\011(Landroid/database/Cursor;)Lcom/google/android/gms/internal/zzfg;
    //   84: invokeinterface 205 2 0
    //   89: pop
    //   90: aload 8
    //   92: invokeinterface 208 1 0
    //   97: istore 12
    //   99: iload 12
    //   101: ifne -25 -> 76
    //   104: aload 8
    //   106: ifnull +10 -> 116
    //   109: aload 8
    //   111: invokeinterface 87 1 0
    //   116: aload_3
    //   117: monitorexit
    //   118: aload 4
    //   120: areturn
    //   121: astore 9
    //   123: aconst_null
    //   124: astore 8
    //   126: new 89\011java/lang/StringBuilder
    //   129: dup
    //   130: invokespecial 90\011java/lang/StringBuilder:<init>\011()V
    //   133: ldc 210
    //   135: invokevirtual 96\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   138: aload 9
    //   140: invokevirtual 99\011android/database/sqlite/SQLiteException:getMessage\011()Ljava/lang/String;
    //   143: invokevirtual 96\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   146: invokevirtual 102\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   149: invokestatic 108\011com/google/android/gms/internal/zzhx:zzac\011(Ljava/lang/String;)V
    //   152: aload 8
    //   154: ifnull -38 -> 116
    //   157: aload 8
    //   159: invokeinterface 87 1 0
    //   164: goto -48 -> 116
    //   167: astore 5
    //   169: aload_3
    //   170: monitorexit
    //   171: aload 5
    //   173: athrow
    //   174: astore 7
    //   176: aconst_null
    //   177: astore 8
    //   179: aload 8
    //   181: ifnull +10 -> 191
    //   184: aload 8
    //   186: invokeinterface 87 1 0
    //   191: aload 7
    //   193: athrow
    //   194: astore 7
    //   196: goto -17 -> 179
    //   199: astore 9
    //   201: goto -75 -> 126
    //
    // Exception table:
    //   from\011to\011target\011type
    //   42\01162\011121\011android/database/sqlite/SQLiteException
    //   6\01115\011167\011finally
    //   21\01123\011167\011finally
    //   26\01132\011167\011finally
    //   37\01139\011167\011finally
    //   109\011116\011167\011finally
    //   116\011118\011167\011finally
    //   157\011164\011167\011finally
    //   169\011171\011167\011finally
    //   184\011191\011167\011finally
    //   191\011194\011167\011finally
    //   42\01162\011174\011finally
    //   66\01176\011194\011finally
    //   76\01199\011194\011finally
    //   126\011152\011194\011finally
    //   66\01176\011199\011android/database/sqlite/SQLiteException
    //   76\01199\011199\011android/database/sqlite/SQLiteException
  }
}