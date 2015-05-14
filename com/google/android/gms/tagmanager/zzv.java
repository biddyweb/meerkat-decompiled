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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

class zzv
  implements DataLayer.zzc
{
  private static final String zzayn = String.format("CREATE TABLE IF NOT EXISTS %s ( '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '%s' STRING NOT NULL, '%s' BLOB NOT NULL, '%s' INTEGER NOT NULL);", new Object[] { "datalayer", "ID", "key", "value", "expires" });
  private final Context mContext;
  private final Executor zzayo;
  private zza zzayp;
  private int zzayq;
  private zzlv zzmW;

  public zzv(Context paramContext)
  {
    this(paramContext, zzlx.zzkc(), "google_tagmanager.db", 2000, Executors.newSingleThreadExecutor());
  }

  zzv(Context paramContext, zzlv paramzzlv, String paramString, int paramInt, Executor paramExecutor)
  {
    this.mContext = paramContext;
    this.zzmW = paramzzlv;
    this.zzayq = paramInt;
    this.zzayo = paramExecutor;
    this.zzayp = new zza(this.mContext, paramString);
  }

  private void zzG(long paramLong)
  {
    SQLiteDatabase localSQLiteDatabase = zzar("Error opening database for deleteOlderThan.");
    if (localSQLiteDatabase == null)
      return;
    try
    {
      String[] arrayOfString = new String[1];
      arrayOfString[0] = Long.toString(paramLong);
      int i = localSQLiteDatabase.delete("datalayer", "expires <= ?", arrayOfString);
      zzbf.zzab("Deleted " + i + " expired items");
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzbf.zzac("Error deleting old entries.");
    }
  }

  private SQLiteDatabase zzar(String paramString)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = this.zzayp.getWritableDatabase();
      return localSQLiteDatabase;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzbf.zzac(paramString);
    }
    return null;
  }

  // ERROR //
  private void zzb(List<zzb> paramList, long paramLong)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 65\011com/google/android/gms/tagmanager/zzv:zzmW\011Lcom/google/android/gms/internal/zzlv;
    //   6: invokeinterface 154 1 0
    //   11: lstore 6
    //   13: aload_0
    //   14: lload 6
    //   16: invokespecial 156\011com/google/android/gms/tagmanager/zzv:zzG\011(J)V
    //   19: aload_0
    //   20: aload_1
    //   21: invokeinterface 162 1 0
    //   26: invokespecial 166\011com/google/android/gms/tagmanager/zzv:zzhd\011(I)V
    //   29: aload_0
    //   30: aload_1
    //   31: lload 6
    //   33: lload_2
    //   34: ladd
    //   35: invokespecial 169\011com/google/android/gms/tagmanager/zzv:zzc\011(Ljava/util/List;J)V
    //   38: aload_0
    //   39: invokespecial 172\011com/google/android/gms/tagmanager/zzv:zztb\011()V
    //   42: aload_0
    //   43: monitorexit
    //   44: return
    //   45: astore 4
    //   47: aload_0
    //   48: invokespecial 172\011com/google/android/gms/tagmanager/zzv:zztb\011()V
    //   51: aload 4
    //   53: athrow
    //   54: astore 5
    //   56: aload_0
    //   57: monitorexit
    //   58: aload 5
    //   60: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01138\01145\011finally
    //   38\01142\01154\011finally
    //   47\01154\01154\011finally
  }

  private void zzc(List<zzb> paramList, long paramLong)
  {
    SQLiteDatabase localSQLiteDatabase = zzar("Error opening database for writeEntryToDatabase.");
    if (localSQLiteDatabase == null);
    while (true)
    {
      return;
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        zzb localzzb = (zzb)localIterator.next();
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("expires", Long.valueOf(paramLong));
        localContentValues.put("key", localzzb.zzqd);
        localContentValues.put("value", localzzb.zzayw);
        localSQLiteDatabase.insert("datalayer", null, localContentValues);
      }
    }
  }

  private void zzcX(String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = zzar("Error opening database for clearKeysWithPrefix.");
    if (localSQLiteDatabase == null)
      return;
    try
    {
      String[] arrayOfString = new String[2];
      arrayOfString[0] = paramString;
      arrayOfString[1] = (paramString + ".%");
      int i = localSQLiteDatabase.delete("datalayer", "key = ? OR key LIKE ?", arrayOfString);
      zzbf.zzab("Cleared " + i + " items");
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzbf.zzac("Error deleting entries with key prefix: " + paramString + " (" + localSQLiteException + ").");
      return;
    }
    finally
    {
      zztb();
    }
  }

  private void zzg(String[] paramArrayOfString)
  {
    if ((paramArrayOfString == null) || (paramArrayOfString.length == 0));
    SQLiteDatabase localSQLiteDatabase;
    do
    {
      return;
      localSQLiteDatabase = zzar("Error opening database for deleteEntries.");
    }
    while (localSQLiteDatabase == null);
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = "ID";
    arrayOfObject[1] = TextUtils.join(",", Collections.nCopies(paramArrayOfString.length, "?"));
    String str = String.format("%s in (%s)", arrayOfObject);
    try
    {
      localSQLiteDatabase.delete("datalayer", str, paramArrayOfString);
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      zzbf.zzac("Error deleting entries " + Arrays.toString(paramArrayOfString));
    }
  }

  private void zzhd(int paramInt)
  {
    int i = paramInt + (zzta() - this.zzayq);
    if (i > 0)
    {
      List localList = zzhe(i);
      zzbf.zzaa("DataLayer store full, deleting " + localList.size() + " entries to make room.");
      zzg((String[])localList.toArray(new String[0]));
    }
  }

  // ERROR //
  private List<String> zzhe(int paramInt)
  {
    // Byte code:
    //   0: new 290\011java/util/ArrayList
    //   3: dup
    //   4: invokespecial 291\011java/util/ArrayList:<init>\011()V
    //   7: astore_2
    //   8: iload_1
    //   9: ifgt +11 -> 20
    //   12: ldc_w 293
    //   15: invokestatic 128\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   18: aload_2
    //   19: areturn
    //   20: aload_0
    //   21: ldc_w 295
    //   24: invokespecial 86\011com/google/android/gms/tagmanager/zzv:zzar\011(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    //   27: astore_3
    //   28: aload_3
    //   29: ifnonnull +5 -> 34
    //   32: aload_2
    //   33: areturn
    //   34: aload_3
    //   35: ldc 24
    //   37: iconst_1
    //   38: anewarray 34\011java/lang/String
    //   41: dup
    //   42: iconst_0
    //   43: ldc 26
    //   45: aastore
    //   46: aconst_null
    //   47: aconst_null
    //   48: aconst_null
    //   49: aconst_null
    //   50: ldc_w 297
    //   53: iconst_1
    //   54: anewarray 4\011java/lang/Object
    //   57: dup
    //   58: iconst_0
    //   59: ldc 26
    //   61: aastore
    //   62: invokestatic 38\011java/lang/String:format\011(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   65: iload_1
    //   66: invokestatic 302\011java/lang/Integer:toString\011(I)Ljava/lang/String;
    //   69: invokevirtual 306\011android/database/sqlite/SQLiteDatabase:query\011(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   72: astore 7
    //   74: aload 7
    //   76: astore 5
    //   78: aload 5
    //   80: invokeinterface 311 1 0
    //   85: ifeq +35 -> 120
    //   88: aload_2
    //   89: aload 5
    //   91: iconst_0
    //   92: invokeinterface 315 2 0
    //   97: invokestatic 317\011java/lang/String:valueOf\011(J)Ljava/lang/String;
    //   100: invokeinterface 321 2 0
    //   105: pop
    //   106: aload 5
    //   108: invokeinterface 324 1 0
    //   113: istore 9
    //   115: iload 9
    //   117: ifne -29 -> 88
    //   120: aload 5
    //   122: ifnull +10 -> 132
    //   125: aload 5
    //   127: invokeinterface 327 1 0
    //   132: aload_2
    //   133: areturn
    //   134: astore 6
    //   136: aconst_null
    //   137: astore 5
    //   139: new 102\011java/lang/StringBuilder
    //   142: dup
    //   143: invokespecial 103\011java/lang/StringBuilder:<init>\011()V
    //   146: ldc_w 329
    //   149: invokevirtual 109\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   152: aload 6
    //   154: invokevirtual 332\011android/database/sqlite/SQLiteException:getMessage\011()Ljava/lang/String;
    //   157: invokevirtual 109\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   160: invokevirtual 117\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   163: invokestatic 128\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   166: aload 5
    //   168: ifnull -36 -> 132
    //   171: aload 5
    //   173: invokeinterface 327 1 0
    //   178: goto -46 -> 132
    //   181: astore 4
    //   183: aconst_null
    //   184: astore 5
    //   186: aload 5
    //   188: ifnull +10 -> 198
    //   191: aload 5
    //   193: invokeinterface 327 1 0
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
  private Object zzk(byte[] paramArrayOfByte)
  {
    // Byte code:
    //   0: new 340\011java/io/ByteArrayInputStream
    //   3: dup
    //   4: aload_1
    //   5: invokespecial 343\011java/io/ByteArrayInputStream:<init>\011([B)V
    //   8: astore_2
    //   9: new 345\011java/io/ObjectInputStream
    //   12: dup
    //   13: aload_2
    //   14: invokespecial 348\011java/io/ObjectInputStream:<init>\011(Ljava/io/InputStream;)V
    //   17: astore_3
    //   18: aload_3
    //   19: invokevirtual 351\011java/io/ObjectInputStream:readObject\011()Ljava/lang/Object;
    //   22: astore 10
    //   24: aload_3
    //   25: ifnull +7 -> 32
    //   28: aload_3
    //   29: invokevirtual 352\011java/io/ObjectInputStream:close\011()V
    //   32: aload_2
    //   33: invokevirtual 353\011java/io/ByteArrayInputStream:close\011()V
    //   36: aload 10
    //   38: areturn
    //   39: astore 14
    //   41: aconst_null
    //   42: astore_3
    //   43: aload_3
    //   44: ifnull +7 -> 51
    //   47: aload_3
    //   48: invokevirtual 352\011java/io/ObjectInputStream:close\011()V
    //   51: aload_2
    //   52: invokevirtual 353\011java/io/ByteArrayInputStream:close\011()V
    //   55: aconst_null
    //   56: areturn
    //   57: astore 5
    //   59: aconst_null
    //   60: areturn
    //   61: astore 13
    //   63: aconst_null
    //   64: astore_3
    //   65: aload_3
    //   66: ifnull +7 -> 73
    //   69: aload_3
    //   70: invokevirtual 352\011java/io/ObjectInputStream:close\011()V
    //   73: aload_2
    //   74: invokevirtual 353\011java/io/ByteArrayInputStream:close\011()V
    //   77: aconst_null
    //   78: areturn
    //   79: astore 7
    //   81: aconst_null
    //   82: areturn
    //   83: astore 12
    //   85: aconst_null
    //   86: astore_3
    //   87: aload 12
    //   89: astore 8
    //   91: aload_3
    //   92: ifnull +7 -> 99
    //   95: aload_3
    //   96: invokevirtual 352\011java/io/ObjectInputStream:close\011()V
    //   99: aload_2
    //   100: invokevirtual 353\011java/io/ByteArrayInputStream:close\011()V
    //   103: aload 8
    //   105: athrow
    //   106: astore 9
    //   108: goto -5 -> 103
    //   111: astore 8
    //   113: goto -22 -> 91
    //   116: astore 6
    //   118: goto -53 -> 65
    //   121: astore 4
    //   123: goto -80 -> 43
    //   126: astore 11
    //   128: aload 10
    //   130: areturn
    //
    // Exception table:
    //   from\011to\011target\011type
    //   9\01118\01139\011java/io/IOException
    //   47\01151\01157\011java/io/IOException
    //   51\01155\01157\011java/io/IOException
    //   9\01118\01161\011java/lang/ClassNotFoundException
    //   69\01173\01179\011java/io/IOException
    //   73\01177\01179\011java/io/IOException
    //   9\01118\01183\011finally
    //   95\01199\011106\011java/io/IOException
    //   99\011103\011106\011java/io/IOException
    //   18\01124\011111\011finally
    //   18\01124\011116\011java/lang/ClassNotFoundException
    //   18\01124\011121\011java/io/IOException
    //   28\01132\011126\011java/io/IOException
    //   32\01136\011126\011java/io/IOException
  }

  // ERROR //
  private byte[] zzp(Object paramObject)
  {
    // Byte code:
    //   0: new 357\011java/io/ByteArrayOutputStream
    //   3: dup
    //   4: invokespecial 358\011java/io/ByteArrayOutputStream:<init>\011()V
    //   7: astore_2
    //   8: new 360\011java/io/ObjectOutputStream
    //   11: dup
    //   12: aload_2
    //   13: invokespecial 363\011java/io/ObjectOutputStream:<init>\011(Ljava/io/OutputStream;)V
    //   16: astore_3
    //   17: aload_3
    //   18: aload_1
    //   19: invokevirtual 367\011java/io/ObjectOutputStream:writeObject\011(Ljava/lang/Object;)V
    //   22: aload_2
    //   23: invokevirtual 371\011java/io/ByteArrayOutputStream:toByteArray\011()[B
    //   26: astore 8
    //   28: aload_3
    //   29: ifnull +7 -> 36
    //   32: aload_3
    //   33: invokevirtual 372\011java/io/ObjectOutputStream:close\011()V
    //   36: aload_2
    //   37: invokevirtual 373\011java/io/ByteArrayOutputStream:close\011()V
    //   40: aload 8
    //   42: areturn
    //   43: astore 11
    //   45: aconst_null
    //   46: astore_3
    //   47: aload_3
    //   48: ifnull +7 -> 55
    //   51: aload_3
    //   52: invokevirtual 372\011java/io/ObjectOutputStream:close\011()V
    //   55: aload_2
    //   56: invokevirtual 373\011java/io/ByteArrayOutputStream:close\011()V
    //   59: aconst_null
    //   60: areturn
    //   61: astore 5
    //   63: aconst_null
    //   64: areturn
    //   65: astore 10
    //   67: aconst_null
    //   68: astore_3
    //   69: aload 10
    //   71: astore 6
    //   73: aload_3
    //   74: ifnull +7 -> 81
    //   77: aload_3
    //   78: invokevirtual 372\011java/io/ObjectOutputStream:close\011()V
    //   81: aload_2
    //   82: invokevirtual 373\011java/io/ByteArrayOutputStream:close\011()V
    //   85: aload 6
    //   87: athrow
    //   88: astore 7
    //   90: goto -5 -> 85
    //   93: astore 6
    //   95: goto -22 -> 73
    //   98: astore 4
    //   100: goto -53 -> 47
    //   103: astore 9
    //   105: aload 8
    //   107: areturn
    //
    // Exception table:
    //   from\011to\011target\011type
    //   8\01117\01143\011java/io/IOException
    //   51\01155\01161\011java/io/IOException
    //   55\01159\01161\011java/io/IOException
    //   8\01117\01165\011finally
    //   77\01181\01188\011java/io/IOException
    //   81\01185\01188\011java/io/IOException
    //   17\01128\01193\011finally
    //   17\01128\01198\011java/io/IOException
    //   32\01136\011103\011java/io/IOException
    //   36\01140\011103\011java/io/IOException
  }

  private List<DataLayer.zza> zzr(List<zzb> paramList)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      zzb localzzb = (zzb)localIterator.next();
      localArrayList.add(new DataLayer.zza(localzzb.zzqd, zzk(localzzb.zzayw)));
    }
    return localArrayList;
  }

  private List<zzb> zzs(List<DataLayer.zza> paramList)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      DataLayer.zza localzza = (DataLayer.zza)localIterator.next();
      localArrayList.add(new zzb(localzza.zzqd, zzp(localzza.zzzt)));
    }
    return localArrayList;
  }

  private List<DataLayer.zza> zzsY()
  {
    try
    {
      zzG(this.zzmW.currentTimeMillis());
      List localList = zzr(zzsZ());
      return localList;
    }
    finally
    {
      zztb();
    }
  }

  private List<zzb> zzsZ()
  {
    SQLiteDatabase localSQLiteDatabase = zzar("Error opening database for loadSerialized.");
    ArrayList localArrayList = new ArrayList();
    if (localSQLiteDatabase == null)
      return localArrayList;
    Cursor localCursor = localSQLiteDatabase.query("datalayer", new String[] { "key", "value" }, null, null, null, null, "ID", null);
    try
    {
      if (localCursor.moveToNext())
        localArrayList.add(new zzb(localCursor.getString(0), localCursor.getBlob(1)));
    }
    finally
    {
      localCursor.close();
    }
    return localArrayList;
  }

  private int zzta()
  {
    Cursor localCursor = null;
    SQLiteDatabase localSQLiteDatabase = zzar("Error opening database for getNumStoredEntries.");
    int i = 0;
    if (localSQLiteDatabase == null);
    while (true)
    {
      return i;
      try
      {
        localCursor = localSQLiteDatabase.rawQuery("SELECT COUNT(*) from datalayer", null);
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
        zzbf.zzac("Error getting numStoredEntries");
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

  private void zztb()
  {
    try
    {
      this.zzayp.close();
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
    }
  }

  public void zza(final DataLayer.zzc.zza paramzza)
  {
    this.zzayo.execute(new Runnable()
    {
      public void run()
      {
        paramzza.zzq(zzv.zza(zzv.this));
      }
    });
  }

  public void zza(List<DataLayer.zza> paramList, final long paramLong)
  {
    final List localList = zzs(paramList);
    this.zzayo.execute(new Runnable()
    {
      public void run()
      {
        zzv.zza(zzv.this, localList, paramLong);
      }
    });
  }

  public void zzcW(final String paramString)
  {
    this.zzayo.execute(new Runnable()
    {
      public void run()
      {
        zzv.zza(zzv.this, paramString);
      }
    });
  }

  class zza extends SQLiteOpenHelper
  {
    zza(Context paramString, String arg3)
    {
      super(str, null, 1);
    }

    private void zza(SQLiteDatabase paramSQLiteDatabase)
    {
      Cursor localCursor = paramSQLiteDatabase.rawQuery("SELECT * FROM datalayer WHERE 0", null);
      HashSet localHashSet = new HashSet();
      try
      {
        String[] arrayOfString = localCursor.getColumnNames();
        for (int i = 0; i < arrayOfString.length; i++)
          localHashSet.add(arrayOfString[i]);
        localCursor.close();
        if ((!localHashSet.remove("key")) || (!localHashSet.remove("value")) || (!localHashSet.remove("ID")) || (!localHashSet.remove("expires")))
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
      //   3: ldc 70
      //   5: iconst_1
      //   6: anewarray 72\011java/lang/String
      //   9: dup
      //   10: iconst_0
      //   11: ldc 74
      //   13: aastore
      //   14: ldc 76
      //   16: iconst_1
      //   17: anewarray 72\011java/lang/String
      //   20: dup
      //   21: iconst_0
      //   22: aload_1
      //   23: aastore
      //   24: aconst_null
      //   25: aconst_null
      //   26: aconst_null
      //   27: invokevirtual 80\011android/database/sqlite/SQLiteDatabase:query\011(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
      //   30: astore 8
      //   32: aload 8
      //   34: invokeinterface 83 1 0
      //   39: istore 10
      //   41: aload 8
      //   43: ifnull +10 -> 53
      //   46: aload 8
      //   48: invokeinterface 43 1 0
      //   53: iload 10
      //   55: ireturn
      //   56: astore 5
      //   58: aconst_null
      //   59: astore 6
      //   61: new 85\011java/lang/StringBuilder
      //   64: dup
      //   65: invokespecial 86\011java/lang/StringBuilder:<init>\011()V
      //   68: ldc 88
      //   70: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   73: aload_1
      //   74: invokevirtual 92\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   77: invokevirtual 96\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
      //   80: invokestatic 101\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
      //   83: aload 6
      //   85: ifnull +10 -> 95
      //   88: aload 6
      //   90: invokeinterface 43 1 0
      //   95: iconst_0
      //   96: ireturn
      //   97: astore 4
      //   99: aload_3
      //   100: ifnull +9 -> 109
      //   103: aload_3
      //   104: invokeinterface 43 1 0
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
      try
      {
        SQLiteDatabase localSQLiteDatabase2 = super.getWritableDatabase();
        localSQLiteDatabase1 = localSQLiteDatabase2;
        if (localSQLiteDatabase1 == null)
          localSQLiteDatabase1 = super.getWritableDatabase();
        return localSQLiteDatabase1;
      }
      catch (SQLiteException localSQLiteException)
      {
        while (true)
        {
          zzv.zzb(zzv.this).getDatabasePath("google_tagmanager.db").delete();
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
        if (!zza("datalayer", paramSQLiteDatabase))
        {
          paramSQLiteDatabase.execSQL(zzv.zztc());
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

  private static class zzb
  {
    final byte[] zzayw;
    final String zzqd;

    zzb(String paramString, byte[] paramArrayOfByte)
    {
      this.zzqd = paramString;
      this.zzayw = paramArrayOfByte;
    }

    public String toString()
    {
      return "KeyAndSerialized: key = " + this.zzqd + " serialized hash = " + Arrays.hashCode(this.zzayw);
    }
  }
}