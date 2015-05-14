package com.instabug.library.internal.layer;

import android.graphics.Bitmap;
import com.google.android.gms.maps.GoogleMap.SnapshotReadyCallback;

final class b
  implements GoogleMap.SnapshotReadyCallback
{
  b(a parama, c.a parama1)
  {
  }

  public final void onSnapshotReady(Bitmap paramBitmap)
  {
    a.a(this.b, paramBitmap);
    this.a.a();
  }
}