package co.getair.meerkat.utilities;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class JSONObjectParser
{
  private static Object fromJson(Object paramObject)
    throws JSONException
  {
    if (paramObject == JSONObject.NULL)
      paramObject = null;
    do
    {
      return paramObject;
      if ((paramObject instanceof JSONObject))
        return toMap((JSONObject)paramObject);
    }
    while (!(paramObject instanceof JSONArray));
    return toList((JSONArray)paramObject);
  }

  public static ArrayList getList(JSONObject paramJSONObject, String paramString)
    throws JSONException
  {
    return toList(paramJSONObject.getJSONArray(paramString));
  }

  public static HashMap<String, Object> getMap(JSONObject paramJSONObject, String paramString)
    throws JSONException
  {
    return toMap(paramJSONObject.getJSONObject(paramString));
  }

  public static boolean isEmptyObject(JSONObject paramJSONObject)
  {
    return paramJSONObject.names() == null;
  }

  public static Object toJSON(Object paramObject)
    throws JSONException
  {
    if ((paramObject instanceof HashMap))
    {
      localObject1 = new JSONObject();
      HashMap localHashMap = (HashMap)paramObject;
      Iterator localIterator1 = localHashMap.keySet().iterator();
      while (localIterator1.hasNext())
      {
        Object localObject2 = localIterator1.next();
        ((JSONObject)localObject1).put(localObject2.toString(), toJSON(localHashMap.get(localObject2)));
      }
    }
    if ((paramObject instanceof Iterable))
    {
      localObject1 = new JSONArray();
      Iterator localIterator2 = ((Iterable)paramObject).iterator();
      while (localIterator2.hasNext())
        ((JSONArray)localObject1).put(localIterator2.next());
    }
    Object localObject1 = paramObject;
    return localObject1;
  }

  public static ArrayList toList(JSONArray paramJSONArray)
    throws JSONException
  {
    ArrayList localArrayList = new ArrayList();
    for (int i = 0; i < paramJSONArray.length(); i++)
      localArrayList.add(fromJson(paramJSONArray.get(i)));
    return localArrayList;
  }

  public static HashMap<String, Object> toMap(JSONObject paramJSONObject)
    throws JSONException
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramJSONObject.keys();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localHashMap.put(str, fromJson(paramJSONObject.get(str)));
    }
    return localHashMap;
  }
}