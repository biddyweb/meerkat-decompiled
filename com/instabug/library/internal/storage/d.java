package com.instabug.library.internal.storage;

import android.database.sqlite.SQLiteDatabase;
import com.instabug.library.Instabug.a;
import com.instabug.library.internal.storage.db.b;
import com.instabug.library.internal.storage.db.c;
import com.instabug.library.model.a;
import java.util.ArrayList;

public class d
{
  private com.instabug.library.internal.storage.db.d a;

  public d(com.instabug.library.internal.storage.db.d paramd)
  {
    this.a = paramd;
  }

  public ArrayList a()
  {
    SQLiteDatabase localSQLiteDatabase = this.a.getReadableDatabase();
    ArrayList localArrayList = new b(localSQLiteDatabase).b();
    localSQLiteDatabase.close();
    return localArrayList;
  }

  public void a(a parama)
  {
    SQLiteDatabase localSQLiteDatabase = this.a.getWritableDatabase();
    b localb = new b(localSQLiteDatabase);
    Instabug.a.a("insertBugIntoCache: Inserting bug");
    long l = localb.a(b.a(parama));
    Instabug.a.a("insertBugIntoCache: Bug inserted " + l);
    parama.a(l);
    localSQLiteDatabase.close();
  }

  public boolean b(a parama)
  {
    SQLiteDatabase localSQLiteDatabase = this.a.getWritableDatabase();
    b localb = new b(localSQLiteDatabase);
    try
    {
      Instabug.a.a("removeBugFromCache: Deleting bug " + parama.e());
      localb.a(parama.e());
      Instabug.a.a("removeBugFromCache: Bug deleted");
      return true;
    }
    catch (c localc)
    {
      localc.printStackTrace();
      return false;
    }
    finally
    {
      localSQLiteDatabase.close();
    }
  }

  public boolean c(a parama)
  {
    SQLiteDatabase localSQLiteDatabase = this.a.getWritableDatabase();
    b localb = new b(localSQLiteDatabase);
    try
    {
      localb.a(b.a(parama), parama.e());
      return true;
    }
    catch (c localc)
    {
      localc.printStackTrace();
      return false;
    }
    finally
    {
      localSQLiteDatabase.close();
    }
  }
}