package com.instabug.library;

import android.app.Activity;
import android.app.Application;
import android.content.res.Resources;
import com.instabug.library.dialog.c;

final class o
  implements Runnable
{
  o(h paramh, Activity paramActivity)
  {
  }

  public final void run()
  {
    if (!this.a.isFinishing())
    {
      int i = h.b(this.b).getResources().getIdentifier("tutorialalerttext", "string", h.b(this.b).getPackageName());
      c localc = new c(this.a, i);
      localc.setCanceledOnTouchOutside(true);
      localc.show();
    }
  }
}