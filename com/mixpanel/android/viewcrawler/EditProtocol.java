package com.mixpanel.android.viewcrawler;

import android.graphics.BitmapFactory;
import android.util.Base64;
import android.util.Log;
import com.mixpanel.android.mpmetrics.ResourceIds;
import com.mixpanel.android.util.JSONUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class EditProtocol
{
  private static final String LOGTAG = "MixpanelAPI.EditProtocol";
  private static final List<Pathfinder.PathElement> NEVER_MATCH_PATH = Collections.emptyList();
  private static final Class<?>[] NO_PARAMS = new Class[0];
  private final ResourceIds mResourceIds;

  public EditProtocol(ResourceIds paramResourceIds)
  {
    this.mResourceIds = paramResourceIds;
  }

  private Object convertArgument(Object paramObject, String paramString)
    throws EditProtocol.BadInstructionsException
  {
    try
    {
      if ("java.lang.CharSequence".equals(paramString))
        return paramObject;
      if ((!"boolean".equals(paramString)) && (!"java.lang.Boolean".equals(paramString)))
      {
        if (("int".equals(paramString)) || ("java.lang.Integer".equals(paramString)))
          return Integer.valueOf(((Number)paramObject).intValue());
        if (("float".equals(paramString)) || ("java.lang.Float".equals(paramString)))
          return Float.valueOf(((Number)paramObject).floatValue());
        if ("android.graphics.Bitmap".equals(paramString))
        {
          byte[] arrayOfByte = Base64.decode((String)paramObject, 0);
          return BitmapFactory.decodeByteArray(arrayOfByte, 0, arrayOfByte.length);
        }
        throw new BadInstructionsException("Don't know how to interpret type " + paramString + " (arg was " + paramObject + ")");
      }
    }
    catch (ClassCastException localClassCastException)
    {
      throw new BadInstructionsException("Couldn't interpret <" + paramObject + "> as " + paramString);
    }
    return paramObject;
  }

  private PropertyDescription readPropertyDescription(Class<?> paramClass, JSONObject paramJSONObject)
    throws EditProtocol.BadInstructionsException
  {
    try
    {
      String str1 = paramJSONObject.getString("name");
      boolean bool = paramJSONObject.has("get");
      Caller localCaller = null;
      if (bool)
      {
        JSONObject localJSONObject = paramJSONObject.getJSONObject("get");
        String str2 = localJSONObject.getString("selector");
        Class localClass = Class.forName(localJSONObject.getJSONObject("result").getString("type"));
        localCaller = new Caller(paramClass, str2, NO_PARAMS, localClass);
      }
      if (paramJSONObject.has("set"));
      for (String str3 = paramJSONObject.getJSONObject("set").getString("selector"); ; str3 = null)
      {
        PropertyDescription localPropertyDescription = new PropertyDescription(str1, paramClass, localCaller, str3);
        return localPropertyDescription;
      }
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      throw new BadInstructionsException("Can't create property reader", localNoSuchMethodException);
    }
    catch (JSONException localJSONException)
    {
      throw new BadInstructionsException("Can't read property JSON", localJSONException);
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new BadInstructionsException("Can't read property JSON, relevant arg/return class not found", localClassNotFoundException);
    }
  }

  private Integer reconcileIdsInPath(int paramInt, String paramString, ResourceIds paramResourceIds)
  {
    if (paramString != null)
      if (!paramResourceIds.knownIdName(paramString));
    for (int i = paramResourceIds.idFromName(paramString); (-1 != i) && (-1 != paramInt) && (i != paramInt); i = -1)
    {
      Log.e("MixpanelAPI.EditProtocol", "Path contains both a named and an explicit id, and they don't match. No views will be matched.");
      return null;
      Log.w("MixpanelAPI.EditProtocol", "Path element contains an id name not known to the system. No views will be matched.\nMake sure that you're not stripping your packages R class out with proguard.\nid name was \"" + paramString + "\"");
      return null;
    }
    if (-1 != i)
      return Integer.valueOf(i);
    return Integer.valueOf(paramInt);
  }

  public ViewVisitor readEdit(JSONObject paramJSONObject)
    throws EditProtocol.BadInstructionsException
  {
    List localList;
    PropertyDescription localPropertyDescription;
    Object[] arrayOfObject;
    try
    {
      localList = readPath(paramJSONObject.getJSONArray("path"), this.mResourceIds);
      if (localList.size() == 0)
        throw new InapplicableInstructionsException("Edit will not be bound to any element in the UI.");
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      throw new BadInstructionsException("Can't create property mutator", localNoSuchMethodException);
      String str = ((Pathfinder.PathElement)localList.get(-1 + localList.size())).viewClassName;
      try
      {
        Class localClass = Class.forName(str);
        localPropertyDescription = readPropertyDescription(localClass, paramJSONObject.getJSONObject("property"));
        JSONArray localJSONArray1 = paramJSONObject.getJSONArray("args");
        arrayOfObject = new Object[localJSONArray1.length()];
        for (int i = 0; i < localJSONArray1.length(); i++)
        {
          JSONArray localJSONArray2 = localJSONArray1.getJSONArray(i);
          arrayOfObject[i] = convertArgument(localJSONArray2.get(0), localJSONArray2.getString(1));
        }
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        throw new BadInstructionsException("Can't find class for visit path: " + str, localClassNotFoundException);
      }
    }
    catch (JSONException localJSONException)
    {
      throw new BadInstructionsException("Can't interpret instructions due to JSONException", localJSONException);
    }
    Caller localCaller = localPropertyDescription.makeMutator(arrayOfObject);
    if (localCaller == null)
      throw new BadInstructionsException("Can't update a read-only property " + localPropertyDescription.name + " (add a mutator to make this work)");
    ViewVisitor.PropertySetVisitor localPropertySetVisitor = new ViewVisitor.PropertySetVisitor(localList, localCaller, localPropertyDescription.accessor);
    return localPropertySetVisitor;
  }

  public ViewVisitor readEventBinding(JSONObject paramJSONObject, ViewVisitor.OnEventListener paramOnEventListener)
    throws EditProtocol.BadInstructionsException
  {
    String str1;
    String str2;
    List localList;
    try
    {
      str1 = paramJSONObject.getString("event_name");
      str2 = paramJSONObject.getString("event_type");
      localList = readPath(paramJSONObject.getJSONArray("path"), this.mResourceIds);
      if (localList.size() == 0)
        throw new InapplicableInstructionsException("event '" + str1 + "' will not be bound to any element in the UI.");
    }
    catch (JSONException localJSONException)
    {
      throw new BadInstructionsException("Can't interpret instructions due to JSONException", localJSONException);
    }
    if ("click".equals(str2))
      return new ViewVisitor.AddAccessibilityEventVisitor(localList, 1, str1, paramOnEventListener);
    if ("selected".equals(str2))
      return new ViewVisitor.AddAccessibilityEventVisitor(localList, 4, str1, paramOnEventListener);
    if ("text_changed".equals(str2))
      return new ViewVisitor.AddTextChangeListener(localList, str1, paramOnEventListener);
    if ("detected".equals(str2))
      return new ViewVisitor.ViewDetectorVisitor(localList, str1, paramOnEventListener);
    throw new BadInstructionsException("Mixpanel can't track event type \"" + str2 + "\"");
  }

  List<Pathfinder.PathElement> readPath(JSONArray paramJSONArray, ResourceIds paramResourceIds)
    throws JSONException
  {
    Object localObject = new ArrayList();
    for (int i = 0; ; i++)
    {
      String str1;
      String str2;
      int j;
      String str3;
      int k;
      String str4;
      String str5;
      if (i < paramJSONArray.length())
      {
        JSONObject localJSONObject = paramJSONArray.getJSONObject(i);
        str1 = JSONUtils.optionalStringKey(localJSONObject, "prefix");
        str2 = JSONUtils.optionalStringKey(localJSONObject, "view_class");
        j = localJSONObject.optInt("index", -1);
        str3 = JSONUtils.optionalStringKey(localJSONObject, "contentDescription");
        k = localJSONObject.optInt("id", -1);
        str4 = JSONUtils.optionalStringKey(localJSONObject, "mp_id_name");
        str5 = JSONUtils.optionalStringKey(localJSONObject, "tag");
        if (!"shortest".equals(str1))
          break label136;
      }
      Integer localInteger;
      for (int m = 1; ; m = 0)
      {
        localInteger = reconcileIdsInPath(k, str4, paramResourceIds);
        if (localInteger != null)
          break label184;
        localObject = NEVER_MATCH_PATH;
        return localObject;
        label136: if (str1 != null)
          break;
      }
      Log.w("MixpanelAPI.EditProtocol", "Unrecognized prefix type \"" + str1 + "\". No views will be matched");
      return NEVER_MATCH_PATH;
      label184: ((List)localObject).add(new Pathfinder.PathElement(m, str2, j, localInteger.intValue(), str3, str5));
    }
  }

  public ViewSnapshot readSnapshotConfig(JSONObject paramJSONObject)
    throws EditProtocol.BadInstructionsException
  {
    ArrayList localArrayList = new ArrayList();
    while (true)
    {
      int i;
      try
      {
        JSONArray localJSONArray1 = paramJSONObject.getJSONObject("config").getJSONArray("classes");
        i = 0;
        ViewSnapshot localViewSnapshot;
        if (i < localJSONArray1.length())
        {
          JSONObject localJSONObject = localJSONArray1.getJSONObject(i);
          Class localClass = Class.forName(localJSONObject.getString("name"));
          JSONArray localJSONArray2 = localJSONObject.getJSONArray("properties");
          int j = 0;
          if (j < localJSONArray2.length())
          {
            localArrayList.add(readPropertyDescription(localClass, localJSONArray2.getJSONObject(j)));
            j++;
            continue;
          }
        }
        else
        {
          localViewSnapshot = new ViewSnapshot(localArrayList, this.mResourceIds);
          return localViewSnapshot;
        }
      }
      catch (JSONException localJSONException)
      {
        throw new BadInstructionsException("Can't read snapshot configuration", localJSONException);
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        throw new BadInstructionsException("Can't resolve types for snapshot configuration", localClassNotFoundException);
      }
      i++;
    }
  }

  public static class BadInstructionsException extends Exception
  {
    private static final long serialVersionUID = -4062004792184145311L;

    public BadInstructionsException(String paramString)
    {
      super();
    }

    public BadInstructionsException(String paramString, Exception paramException)
    {
      super(paramException);
    }
  }

  public static class InapplicableInstructionsException extends EditProtocol.BadInstructionsException
  {
    private static final long serialVersionUID = 3977056710817909104L;

    public InapplicableInstructionsException(String paramString)
    {
      super();
    }
  }
}