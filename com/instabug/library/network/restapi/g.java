package com.instabug.library.network.restapi;

import com.android.volley.Response.ErrorListener;
import com.android.volley.VolleyError;

final class g
  implements Response.ErrorListener
{
  g(c paramc, a.a parama)
  {
  }

  public final void onErrorResponse(VolleyError paramVolleyError)
  {
    this.a.a(c.a(this.b, paramVolleyError));
  }
}