package com.instabug.library.network.restapi;

import com.android.volley.Response.ErrorListener;
import com.android.volley.VolleyError;
import com.instabug.library.interactor.a.a;

final class e
  implements Response.ErrorListener
{
  e(c paramc, a.a parama)
  {
  }

  public final void onErrorResponse(VolleyError paramVolleyError)
  {
    c.a(this.b, paramVolleyError);
  }
}