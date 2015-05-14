package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;

public abstract class zzqy<T extends zzqy>
{
  protected static String zzG(Map<String, Object> paramMap)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    Iterator localIterator = new TreeMap(paramMap).entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Object localObject = localEntry.getValue();
      if ((localObject != null) && ((!(localObject instanceof String)) || (!TextUtils.isEmpty((String)localObject))) && ((!(localObject instanceof Integer)) || (((Integer)localObject).intValue() != 0)) && ((!(localObject instanceof Long)) || (((Long)localObject).longValue() != 0L)) && ((!(localObject instanceof Double)) || (((Double)localObject).doubleValue() != 0.0D)) && ((!(localObject instanceof Boolean)) || (((Boolean)localObject).booleanValue())))
      {
        if (localStringBuffer.length() > 0)
          localStringBuffer.append(", ");
        localStringBuffer.append((String)localEntry.getKey());
        localStringBuffer.append('=');
        localStringBuffer.append(localObject);
      }
    }
    return localStringBuffer.toString();
  }
}