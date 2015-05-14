package com.instabug.library;

import android.view.ViewGroup.LayoutParams;
import android.widget.FrameLayout;
import com.instabug.library.view.AnnotationView;

final class g
  implements Runnable
{
  g(b paramb)
  {
  }

  public final void run()
  {
    ViewGroup.LayoutParams localLayoutParams = b.e(this.a).getLayoutParams();
    localLayoutParams.width = b.f(this.a).getMeasuredWidth();
    b.e(this.a).setLayoutParams(localLayoutParams);
  }
}