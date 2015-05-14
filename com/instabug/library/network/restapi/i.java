package com.instabug.library.network.restapi;

import com.android.volley.Response.ErrorListener;
import com.android.volley.VolleyError;
import com.instabug.library.interactor.a.a;

final class i
  implements Response.ErrorListener
{
  i(c paramc, a.a parama)
  {
  }

  public final void onErrorResponse(VolleyError paramVolleyError)
  {
    this.a.a(c.a(this.b, paramVolleyError));
  }
}