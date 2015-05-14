package com.instabug.library.internal.storage.db;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.instabug.library.Instabug.a;
import java.util.ArrayList;
import org.json.JSONException;
import org.json.JSONObject;

public final class b extends a
{
  public b(SQLiteDatabase paramSQLiteDatabase)
  {
    super(paramSQLiteDatabase);
  }

  public static ContentValues a(com.instabug.library.model.a parama)
  {
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("BUG_JSON", parama.f().toString());
    localContentValues.put("FILE_PATH", parama.l());
    localContentValues.put("IMAGE_PATH", parama.k());
    localContentValues.put("SENT", Integer.valueOf(parama.h()));
    localContentValues.put("BUG_ID", Long.valueOf(parama.g()));
    localContentValues.put("FILE_UPLOADED", Integer.valueOf(parama.i()));
    localContentValues.put("PHOTO_UPLOADED", Integer.valueOf(parama.j()));
    return localContentValues;
  }

  private static com.instabug.library.model.a a(Cursor paramCursor)
  {
    com.instabug.library.model.a locala = new com.instabug.library.model.a();
    locala.a(paramCursor.getLong(paramCursor.getColumnIndex("_id")));
    try
    {
      locala.a(paramCursor.getString(paramCursor.getColumnIndex("BUG_JSON")));
      locala.b(paramCursor.getLong(paramCursor.getColumnIndex("BUG_ID")));
      locala.b(paramCursor.getString(paramCursor.getColumnIndex("IMAGE_PATH")));
      locala.c(paramCursor.getString(paramCursor.getColumnIndex("FILE_PATH")));
      locala.b(paramCursor.getInt(paramCursor.getColumnIndex("SENT")));
      locala.c(paramCursor.getInt(paramCursor.getColumnIndex("FILE_UPLOADED")));
      locala.d(paramCursor.getInt(paramCursor.getColumnIndex("PHOTO_UPLOADED")));
      return locala;
    }
    catch (JSONException localJSONException)
    {
      while (true)
        Instabug.a.a(localJSONException);
    }
  }

  protected final String a()
  {
    return "BUG_REPORTS";
  }

  public final ArrayList b()
  {
    ArrayList localArrayList = new ArrayList();
    Cursor localCursor = this.a.query("BUG_REPORTS", null, null, null, null, null, null);
    if (localCursor != null)
    {
      int i = 0;
      try
      {
        while (true)
        {
          int j = localCursor.getCount();
          if (i < j)
            try
            {
              localCursor.move(i);
              localArrayList.add(a(localCursor));
              i++;
            }
            catch (Exception localException)
            {
              while (true)
                Instabug.a.c("Couldn't read issue at row " + i + ". Skipping.");
            }
        }
      }
      finally
      {
        if (localCursor != null)
          localCursor.close();
      }
    }
    if (localCursor != null)
      localCursor.close();
    return localArrayList;
  }
}