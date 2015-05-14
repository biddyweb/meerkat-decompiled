package com.instabug.library.network.restapi;

import android.content.Context;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.HttpStack;
import com.android.volley.toolbox.Volley;
import com.instabug.library.network.toolbox.b.a;
import java.util.Iterator;
import java.util.List;

final class b
  implements b.a
{
  b(a parama, Context paramContext)
  {
  }

  public final void a(HttpStack paramHttpStack)
  {
    a.a(this.b, Volley.newRequestQueue(this.a, paramHttpStack));
    Iterator localIterator = a.a(this.b).iterator();
    while (localIterator.hasNext())
    {
      Request localRequest = (Request)localIterator.next();
      a.b(this.b).add(localRequest);
    }
  }
}