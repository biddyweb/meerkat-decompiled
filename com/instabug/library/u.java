package com.instabug.library;

import android.app.Activity;
import android.app.Application;
import android.content.res.Resources;
import com.instabug.library.dialog.i;

final class u
  implements Runnable
{
  u(h paramh)
  {
  }

  public final void run()
  {
    Activity localActivity = this.a.q();
    if ((localActivity != null) && (!localActivity.isFinishing()))
    {
      i locali = new i(localActivity, h.b(this.a).getResources().getIdentifier("twofingerswipestartalerttext", "string", h.b(this.a).getPackageName()));
      locali.setCanceledOnTouchOutside(true);
      locali.show();
    }
  }
}