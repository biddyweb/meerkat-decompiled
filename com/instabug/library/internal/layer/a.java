package com.instabug.library.internal.layer;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.view.View;
import com.google.android.gms.maps.GoogleMap;
import java.lang.ref.WeakReference;

public final class a
  implements c
{
  private WeakReference a;
  private WeakReference b;
  private Bitmap c;

  public a(View paramView, GoogleMap paramGoogleMap)
  {
    this.a = new WeakReference(paramGoogleMap);
    this.b = new WeakReference(paramView);
  }

  public final void a(Canvas paramCanvas)
  {
    int[] arrayOfInt = new int[2];
    ((View)this.b.get()).getLocationOnScreen(arrayOfInt);
    paramCanvas.drawBitmap(this.c, arrayOfInt[0], arrayOfInt[1], null);
  }

  public final void a(c.a parama)
  {
    if ((this.a == null) || (this.a.get() == null) || (this.b == null) || (this.b.get() == null) || (((View)this.b.get()).getVisibility() != 0))
      parama.a();
    ((GoogleMap)this.a.get()).snapshot(new b(this, parama));
  }

  public final boolean a()
  {
    return (this.a.get() != null) && (this.b.get() != null) && (((View)this.b.get()).getWindowToken() != null);
  }

  public final View b()
  {
    return (View)this.b.get();
  }
}