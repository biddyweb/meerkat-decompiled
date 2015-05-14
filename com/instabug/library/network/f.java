package com.instabug.library.network;

import android.content.Intent;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.HttpStack;
import com.android.volley.toolbox.Volley;
import com.instabug.library.internal.storage.e;
import com.instabug.library.internal.storage.g;
import com.instabug.library.internal.storage.q;
import com.instabug.library.internal.storage.s;
import com.instabug.library.network.restapi.c;
import com.instabug.library.network.toolbox.b.a;
import java.util.ArrayList;

final class f
  implements b.a
{
  f(UploadCacheService paramUploadCacheService, Intent paramIntent, com.instabug.library.internal.device.a parama)
  {
  }

  public final void a(HttpStack paramHttpStack)
  {
    RequestQueue localRequestQueue = Volley.newRequestQueue(this.c, paramHttpStack);
    com.instabug.library.network.restapi.a locala = new com.instabug.library.network.restapi.a(this.c.getApplicationContext(), new c());
    UploadCacheService.a(this.c, this.a, localRequestQueue, this.b);
    g localg = new g(new e(new com.instabug.library.internal.storage.d(com.instabug.library.internal.storage.db.d.a(this.c.getApplicationContext()))), locala, new com.instabug.library.internal.storage.a(this.c.getApplicationContext()));
    UploadCacheService.a(this.c, q.a(localg));
    ArrayList localArrayList = UploadCacheService.a(this.c).a();
    if (localArrayList != null)
      UploadCacheService.a(this.c, localArrayList);
  }
}