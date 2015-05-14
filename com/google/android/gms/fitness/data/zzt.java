package com.google.android.gms.fitness.data;

import java.util.List;

public class zzt
{
  public static <T> int zza(T paramT, List<T> paramList)
  {
    int i;
    if (paramT == null)
      i = -1;
    do
    {
      return i;
      i = paramList.indexOf(paramT);
    }
    while (i >= 0);
    paramList.add(paramT);
    return -1 + paramList.size();
  }
}