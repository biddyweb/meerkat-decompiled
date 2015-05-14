package com.instabug.library;

import android.app.Activity;
import android.app.Application;
import android.content.res.Resources;
import com.instabug.library.dialog.a;

final class v
  implements Runnable
{
  v(h paramh)
  {
  }

  public final void run()
  {
    Activity localActivity = this.a.q();
    if ((localActivity != null) && (!localActivity.isFinishing()))
    {
      h.b(this.a).getResources().getIdentifier("instabug_anim_shake", "anim", h.b(this.a).getPackageName());
      a locala = new a(localActivity);
      locala.setCanceledOnTouchOutside(true);
      locala.show();
    }
  }
}