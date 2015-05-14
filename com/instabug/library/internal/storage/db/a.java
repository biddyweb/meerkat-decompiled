package com.instabug.library.internal.storage.db;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;

public abstract class a
{
  protected SQLiteDatabase a;

  public a(SQLiteDatabase paramSQLiteDatabase)
  {
    this.a = paramSQLiteDatabase;
  }

  public final long a(ContentValues paramContentValues)
  {
    return this.a.insert(a(), null, paramContentValues);
  }

  protected abstract String a();

  public final void a(long paramLong)
  {
    this.a.delete(a(), "_ID = " + paramLong, null);
  }

  public final void a(ContentValues paramContentValues, long paramLong)
  {
    this.a.update(a(), paramContentValues, "_ID = " + paramLong, null);
  }
}