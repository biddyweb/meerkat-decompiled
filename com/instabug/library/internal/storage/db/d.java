package com.instabug.library.internal.storage.db;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.instabug.library.Instabug.a;

public final class d extends SQLiteOpenHelper
{
  private static d a;

  private d(Context paramContext)
  {
    super(paramContext, "instabugdb", null, 2);
  }

  public static d a(Context paramContext)
  {
    try
    {
      if (a == null)
        a = new d(paramContext);
      d locald = a;
      return locald;
    }
    finally
    {
    }
  }

  public final SQLiteDatabase getReadableDatabase()
  {
    Instabug.a.a("DB: Readable Database reference requested");
    return super.getReadableDatabase();
  }

  public final SQLiteDatabase getWritableDatabase()
  {
    Instabug.a.a("DB: Writable Database reference requested.");
    return super.getWritableDatabase();
  }

  public final void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    Instabug.a.a("SQLiteOpenHelper: OnCreate");
    try
    {
      paramSQLiteDatabase.beginTransaction();
      paramSQLiteDatabase.execSQL("CREATE TABLE BUG_REPORTS(\n\t_id INTEGER PRIMARY KEY AUTOINCREMENT,\n\tBUG_JSON TEXT NOT NULL,\n\tIMAGE_PATH TEXT DEFAULT \"\",\n\tFILE_PATH TEXT DEFAULT \"\",\n\tBUG_ID INTEGER DEFAULT 0,\n\tSENT INTEGER DEFAULT 0,\n\tFILE_UPLOADED INTEGER DEFAULT 0,\n\tPHOTO_UPLOADED INTEGER DEFAULT 0\n);");
      paramSQLiteDatabase.setTransactionSuccessful();
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      return;
    }
    finally
    {
      paramSQLiteDatabase.endTransaction();
    }
  }

  public final void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    Instabug.a.a("SQLiteOpenHelper: OnUpgrade from " + paramInt1 + " to " + paramInt2);
  }
}