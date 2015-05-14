package com.instabug.library.network;

import com.instabug.library.Instabug.a;
import com.instabug.library.internal.storage.e.a;
import com.instabug.library.model.a;

final class g
  implements e.a
{
  g(UploadCacheService paramUploadCacheService)
  {
  }

  public final void a(a parama)
  {
    Instabug.a.a("UploadCacheService: " + parama.e() + " uploaded");
  }

  public final void a(String paramString)
  {
    Instabug.a.a("UploadCacheService: " + paramString);
  }
}