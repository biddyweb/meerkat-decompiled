package com.mixpanel.android.mpmetrics;

import android.R.drawable;
import android.R.id;
import android.content.Context;
import android.util.Log;
import android.util.SparseArray;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public abstract class ResourceReader
  implements ResourceIds
{
  private static final String LOGTAG = "MixpanelAPI.ResourceReader";
  private final Context mContext;
  private final Map<String, Integer> mIdNameToId;
  private final SparseArray<String> mIdToIdName;

  protected ResourceReader(Context paramContext)
  {
    this.mContext = paramContext;
    this.mIdNameToId = new HashMap();
    this.mIdToIdName = new SparseArray();
  }

  private static void readClassIds(Class<?> paramClass, String paramString, Map<String, Integer> paramMap)
  {
    while (true)
    {
      int i;
      try
      {
        Field[] arrayOfField = paramClass.getFields();
        i = 0;
        if (i < arrayOfField.length)
        {
          Field localField = arrayOfField[i];
          if ((!Modifier.isStatic(localField.getModifiers())) || (localField.getType() != Integer.TYPE))
            break label150;
          String str1 = localField.getName();
          int j = localField.getInt(null);
          if (paramString == null)
          {
            localObject = str1;
            paramMap.put(localObject, Integer.valueOf(j));
            break label150;
          }
          String str2 = paramString + ":" + str1;
          Object localObject = str2;
          continue;
        }
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        Log.e("MixpanelAPI.ResourceReader", "Can't read built-in id names from " + paramClass.getName(), localIllegalAccessException);
      }
      return;
      label150: i++;
    }
  }

  protected abstract String getLocalClassName(Context paramContext);

  protected abstract Class<?> getSystemClass();

  public int idFromName(String paramString)
  {
    return ((Integer)this.mIdNameToId.get(paramString)).intValue();
  }

  protected void initialize()
  {
    this.mIdNameToId.clear();
    this.mIdToIdName.clear();
    readClassIds(getSystemClass(), "android", this.mIdNameToId);
    String str = getLocalClassName(this.mContext);
    try
    {
      readClassIds(Class.forName(str), null, this.mIdNameToId);
      Iterator localIterator = this.mIdNameToId.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        this.mIdToIdName.put(((Integer)localEntry.getValue()).intValue(), localEntry.getKey());
      }
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      while (true)
      {
        Log.w("MixpanelAPI.ResourceReader", "Can't load names for Android view ids from '" + str + "', ids by name will not be available in the events editor.");
        Log.i("MixpanelAPI.ResourceReader", "You may be missing a Resources class for your package due to your proguard configuration, or you may be using an applicationId in your build that isn't the same as the package declared in your AndroidManifest.xml file.\nIf you're using proguard, you can fix this issue by adding the following to your proguard configuration:\n\n-keep class **.R$* {\n    <fields>;\n}\n\nIf you're not using proguard, or if your proguard configuration already contains the directive above, you can add the following to your AndroidManifest.xml file to explicitly point the Mixpanel library to the appropriate library for your resources class:\n\n<meta-data android:name=\"com.mixpanel.android.MPConfig.ResourcePackageName\" android:value=\"YOUR_PACKAGE_NAME\" />\n\nwhere YOUR_PACKAGE_NAME is the same string you use for the \"package\" attribute in your <manifest> tag.");
      }
    }
  }

  public boolean knownIdName(String paramString)
  {
    return this.mIdNameToId.containsKey(paramString);
  }

  public String nameForId(int paramInt)
  {
    return (String)this.mIdToIdName.get(paramInt);
  }

  public static class Drawables extends ResourceReader
  {
    private final String mResourcePackageName;

    protected Drawables(String paramString, Context paramContext)
    {
      super();
      this.mResourcePackageName = paramString;
      initialize();
    }

    protected String getLocalClassName(Context paramContext)
    {
      return this.mResourcePackageName + ".R$drawable";
    }

    protected Class<?> getSystemClass()
    {
      return R.drawable.class;
    }
  }

  public static class Ids extends ResourceReader
  {
    private final String mResourcePackageName;

    public Ids(String paramString, Context paramContext)
    {
      super();
      this.mResourcePackageName = paramString;
      initialize();
    }

    protected String getLocalClassName(Context paramContext)
    {
      return this.mResourcePackageName + ".R$id";
    }

    protected Class<?> getSystemClass()
    {
      return R.id.class;
    }
  }
}