package vijay.expirabledisklrucache.cache;

import android.content.Context;
import android.util.Log;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class ExpirableDiskLruCache
{
  private static final Long DEFAULT_EVICTION_TIME_SPAN = Long.valueOf(9223372036854775807L);
  private static final String EVICTION_TIME = "EVICTION_TIME";
  private static final String LOG_TAG = "EXPIRABLE_DISK_CACHE";
  private static boolean sLogEnabled = false;
  private Gson mGson;
  private SimpleDiskCache mSimpleDiskCache;

  private Long getEvictionTime(Long paramLong)
  {
    return Long.valueOf(System.currentTimeMillis() + paramLong.longValue());
  }

  public static ExpirableDiskLruCache getInstance()
  {
    return ExpirableDiskLruCache.LazyHolder.access$100();
  }

  public boolean contains(String paramString)
    throws IOException
  {
    return this.mSimpleDiskCache.contains(paramString);
  }

  public <T> T get(String paramString, Class<T> paramClass)
    throws IOException
  {
    SimpleDiskCache.StringEntry localStringEntry = this.mSimpleDiskCache.getString(paramString);
    if (localStringEntry == null)
    {
      if (sLogEnabled)
        Log.d("EXPIRABLE_DISK_CACHE", "[MISS] : " + paramString);
      return null;
    }
    Long localLong = (Long)localStringEntry.getMetadata().get("EVICTION_TIME");
    if (System.currentTimeMillis() <= localLong.longValue())
    {
      if (sLogEnabled)
        Log.d("EXPIRABLE_DISK_CACHE", "[HIT] : " + paramString);
      return this.mGson.fromJson(localStringEntry.getString(), paramClass);
    }
    if (sLogEnabled)
      Log.d("EXPIRABLE_DISK_CACHE", "[EXPIRED] : " + paramString);
    remove(paramString);
    return null;
  }

  public void init(Context paramContext, Long paramLong)
    throws IOException
  {
    this.mGson = new Gson();
    this.mSimpleDiskCache = SimpleDiskCache.open(paramContext.getFilesDir(), 1, paramLong.longValue());
  }

  public void init(Context paramContext, Long paramLong, boolean paramBoolean)
    throws IOException
  {
    this.mGson = new Gson();
    this.mSimpleDiskCache = SimpleDiskCache.open(paramContext.getFilesDir(), 1, paramLong.longValue());
    sLogEnabled = paramBoolean;
  }

  public void put(String paramString, Object paramObject)
    throws IOException
  {
    put(paramString, paramObject, DEFAULT_EVICTION_TIME_SPAN);
  }

  public void put(String paramString, Object paramObject, Long paramLong)
    throws IOException
  {
    HashMap localHashMap = new HashMap(1);
    localHashMap.put("EVICTION_TIME", getEvictionTime(paramLong));
    this.mSimpleDiskCache.put(paramString, this.mGson.toJson(paramObject), localHashMap);
    if (sLogEnabled)
      Log.d("EXPIRABLE_DISK_CACHE", "[PUT] : " + paramString);
  }

  public void remove(String paramString)
    throws IOException
  {
    this.mSimpleDiskCache.remove(paramString);
    if (sLogEnabled)
      Log.d("EXPIRABLE_DISK_CACHE", "[REMOVED] : " + paramString);
  }

  public void removeAll()
    throws IOException
  {
    this.mSimpleDiskCache.clear();
    if (sLogEnabled)
      Log.d("EXPIRABLE_DISK_CACHE", "[ALL CLEARED] : ");
  }
}