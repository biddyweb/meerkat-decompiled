package com.google.android.gms.fitness;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class zza
{
  public static String zzbH(String paramString)
  {
    if (paramString.equals("https://www.googleapis.com/auth/fitness.activity.read"))
      paramString = "https://www.googleapis.com/auth/fitness.activity.write";
    do
    {
      return paramString;
      if (paramString.equals("https://www.googleapis.com/auth/fitness.location.read"))
        return "https://www.googleapis.com/auth/fitness.location.write";
      if (paramString.equals("https://www.googleapis.com/auth/fitness.body.read"))
        return "https://www.googleapis.com/auth/fitness.body.write";
    }
    while (!paramString.equals("https://www.googleapis.com/auth/fitness.nutrition.read"));
    return "https://www.googleapis.com/auth/fitness.nutrition.write";
  }

  public static List<String> zzj(List<String> paramList)
  {
    HashSet localHashSet = new HashSet(paramList.size());
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      String str1 = (String)localIterator.next();
      String str2 = zzbH(str1);
      if ((str2.equals(str1)) || (!paramList.contains(str2)))
        localHashSet.add(str1);
    }
    return new ArrayList(localHashSet);
  }
}