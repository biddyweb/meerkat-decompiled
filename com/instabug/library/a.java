package com.instabug.library;

import com.instabug.library.model.c;
import java.util.ArrayList;

public final class a
{
  private ArrayList a = new ArrayList();

  public final void a(String paramString1, String paramString2)
  {
    c localc = new c();
    localc.a(System.currentTimeMillis());
    localc.a(paramString2);
    localc.d(paramString1);
    this.a.add(localc);
  }

  public final void a(String paramString1, String paramString2, String paramString3, int paramInt)
  {
    c localc = new c();
    localc.a("click");
    localc.d(paramString1);
    localc.c(paramString3);
    localc.a(System.currentTimeMillis());
    Integer.toString(paramInt);
    if (paramString2 != null)
      localc.b(paramString2);
    this.a.add(localc);
  }

  public final String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    int i = this.a.size();
    int j = 0;
    if (i > 100)
      j = -100 + this.a.size();
    for (int k = j; k < this.a.size(); k++)
    {
      ((c)this.a.get(k)).a(localStringBuilder);
      if (k + 1 != this.a.size())
        localStringBuilder.append("\n");
    }
    return localStringBuilder.toString();
  }
}