package com.instabug.library.util;

import android.content.Context;
import android.content.res.Resources;

public final class f
{
  private Resources a;
  private String b;

  public f(Context paramContext)
  {
    this.a = paramContext.getResources();
    this.b = paramContext.getPackageName();
  }

  public final int a(String paramString1, String paramString2)
  {
    return this.a.getIdentifier(paramString1, paramString2, this.b);
  }
}