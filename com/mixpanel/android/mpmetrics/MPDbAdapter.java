package com.mixpanel.android.mpmetrics;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import java.io.File;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class MPDbAdapter
{
  private static final String CREATE_EVENTS_TABLE = "CREATE TABLE " + Table.EVENTS.getName() + " (_id INTEGER PRIMARY KEY AUTOINCREMENT, " + "data" + " STRING NOT NULL, " + "created_at" + " INTEGER NOT NULL);";
  private static final String CREATE_PEOPLE_TABLE = "CREATE TABLE " + Table.PEOPLE.getName() + " (_id INTEGER PRIMARY KEY AUTOINCREMENT, " + "data" + " STRING NOT NULL, " + "created_at" + " INTEGER NOT NULL);";
  private static final String DATABASE_NAME = "mixpanel";
  private static final int DATABASE_VERSION = 4;
  private static final String EVENTS_TIME_INDEX = "CREATE INDEX IF NOT EXISTS time_idx ON " + Table.EVENTS.getName() + " (" + "created_at" + ");";
  public static final String KEY_CREATED_AT = "created_at";
  public static final String KEY_DATA = "data";
  private static final String LOGTAG = "MixpanelAPI.Database";
  private static final String PEOPLE_TIME_INDEX = "CREATE INDEX IF NOT EXISTS time_idx ON " + Table.PEOPLE.getName() + " (" + "created_at" + ");";
  private final MPDatabaseHelper mDb;

  public MPDbAdapter(Context paramContext)
  {
    this(paramContext, "mixpanel");
  }

  public MPDbAdapter(Context paramContext, String paramString)
  {
    this.mDb = new MPDatabaseHelper(paramContext, paramString);
  }

  public int addJSON(JSONObject paramJSONObject, Table paramTable)
  {
    String str = paramTable.getName();
    Cursor localCursor = null;
    try
    {
      SQLiteDatabase localSQLiteDatabase = this.mDb.getWritableDatabase();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("data", paramJSONObject.toString());
      localContentValues.put("created_at", Long.valueOf(System.currentTimeMillis()));
      localSQLiteDatabase.insert(str, null, localContentValues);
      localCursor = localSQLiteDatabase.rawQuery("SELECT COUNT(*) FROM " + str, null);
      localCursor.moveToFirst();
      int i = localCursor.getInt(0);
      return i;
    }
    catch (SQLiteException localSQLiteException)
    {
      Log.e("MixpanelAPI.Database", "Could not add Mixpanel data to table " + str + ". Re-initializing database.", localSQLiteException);
      if (localCursor != null)
      {
        localCursor.close();
        localCursor = null;
      }
      this.mDb.deleteDatabase();
      return -1;
    }
    finally
    {
      if (localCursor != null)
        localCursor.close();
      this.mDb.close();
    }
  }

  public void cleanupEvents(long paramLong, Table paramTable)
  {
    String str = paramTable.getName();
    try
    {
      this.mDb.getWritableDatabase().delete(str, "created_at <= " + paramLong, null);
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      Log.e("MixpanelAPI.Database", "Could not clean timed-out Mixpanel records from " + str + ". Re-initializing database.", localSQLiteException);
      this.mDb.deleteDatabase();
      return;
    }
    finally
    {
      this.mDb.close();
    }
  }

  public void cleanupEvents(String paramString, Table paramTable)
  {
    String str = paramTable.getName();
    try
    {
      this.mDb.getWritableDatabase().delete(str, "_id <= " + paramString, null);
      return;
    }
    catch (SQLiteException localSQLiteException)
    {
      Log.e("MixpanelAPI.Database", "Could not clean sent Mixpanel records from " + str + ". Re-initializing database.", localSQLiteException);
      this.mDb.deleteDatabase();
      return;
    }
    finally
    {
      this.mDb.close();
    }
  }

  public void deleteDB()
  {
    this.mDb.deleteDatabase();
  }

  public String[] generateDataString(Table paramTable)
  {
    Cursor localCursor = null;
    Object localObject1 = null;
    String str1 = paramTable.getName();
    try
    {
      localCursor = this.mDb.getReadableDatabase().rawQuery("SELECT * FROM " + str1 + " ORDER BY " + "created_at" + " ASC LIMIT 50", null);
      JSONArray localJSONArray = new JSONArray();
      while (localCursor.moveToNext())
      {
        if (localCursor.isLast())
        {
          String str3 = localCursor.getString(localCursor.getColumnIndex("_id"));
          localObject1 = str3;
        }
        try
        {
          localJSONArray.put(new JSONObject(localCursor.getString(localCursor.getColumnIndex("data"))));
        }
        catch (JSONException localJSONException)
        {
        }
      }
      int i = localJSONArray.length();
      localObject3 = null;
      if (i > 0)
      {
        String str2 = localJSONArray.toString();
        localObject3 = str2;
      }
      this.mDb.close();
      if (localCursor != null)
        localCursor.close();
      String[] arrayOfString = null;
      if (localObject1 != null)
      {
        arrayOfString = null;
        if (localObject3 != null)
          arrayOfString = new String[] { localObject1, localObject3 };
      }
      return arrayOfString;
    }
    catch (SQLiteException localSQLiteException)
    {
      while (true)
      {
        Log.e("MixpanelAPI.Database", "Could not pull records for Mixpanel out of database " + str1 + ". Waiting to send.", localSQLiteException);
        this.mDb.close();
        Object localObject3 = null;
        localObject1 = null;
        if (localCursor != null)
        {
          localCursor.close();
          localObject3 = null;
          localObject1 = null;
        }
      }
    }
    finally
    {
      this.mDb.close();
      if (localCursor != null)
        localCursor.close();
    }
  }

  private static class MPDatabaseHelper extends SQLiteOpenHelper
  {
    private final File mDatabaseFile;

    MPDatabaseHelper(Context paramContext, String paramString)
    {
      super(paramString, null, 4);
      this.mDatabaseFile = paramContext.getDatabasePath(paramString);
    }

    public void deleteDatabase()
    {
      close();
      this.mDatabaseFile.delete();
    }

    public void onCreate(SQLiteDatabase paramSQLiteDatabase)
    {
      if (MPConfig.DEBUG)
        Log.v("MixpanelAPI.Database", "Creating a new Mixpanel events DB");
      paramSQLiteDatabase.execSQL(MPDbAdapter.CREATE_EVENTS_TABLE);
      paramSQLiteDatabase.execSQL(MPDbAdapter.CREATE_PEOPLE_TABLE);
      paramSQLiteDatabase.execSQL(MPDbAdapter.EVENTS_TIME_INDEX);
      paramSQLiteDatabase.execSQL(MPDbAdapter.PEOPLE_TIME_INDEX);
    }

    public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
    {
      if (MPConfig.DEBUG)
        Log.v("MixpanelAPI.Database", "Upgrading app, replacing Mixpanel events DB");
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS " + MPDbAdapter.Table.EVENTS.getName());
      paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS " + MPDbAdapter.Table.PEOPLE.getName());
      paramSQLiteDatabase.execSQL(MPDbAdapter.CREATE_EVENTS_TABLE);
      paramSQLiteDatabase.execSQL(MPDbAdapter.CREATE_PEOPLE_TABLE);
      paramSQLiteDatabase.execSQL(MPDbAdapter.EVENTS_TIME_INDEX);
      paramSQLiteDatabase.execSQL(MPDbAdapter.PEOPLE_TIME_INDEX);
    }
  }

  public static enum Table
  {
    private final String mTableName;

    static
    {
      Table[] arrayOfTable = new Table[2];
      arrayOfTable[0] = EVENTS;
      arrayOfTable[1] = PEOPLE;
    }

    private Table(String paramString)
    {
      this.mTableName = paramString;
    }

    public String getName()
    {
      return this.mTableName;
    }
  }
}