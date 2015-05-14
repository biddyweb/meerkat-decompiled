package com.google.android.gms.internal;

import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.zzx;
import java.util.List;

public final class zzmh
{
  public static Scope[] zzi(List<String> paramList)
  {
    zzx.zzb(paramList, "scopeStrings can't be null.");
    Scope[] arrayOfScope = new Scope[paramList.size()];
    int i = paramList.size();
    for (int j = 0; j < i; j++)
      arrayOfScope[j] = new Scope((String)paramList.get(j));
    return arrayOfScope;
  }
}