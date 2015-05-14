package com.instabug.library;

import android.app.Dialog;
import android.os.AsyncTask;
import com.instabug.library.activity.a.a;
import java.io.File;

final class q
  implements a.a
{
  q(h paramh, File paramFile)
  {
  }

  public final void a()
  {
    Instabug.a.a(this.b.q());
    h.a(this.b, false);
    r localr = new r(this);
    File[] arrayOfFile = new File[1];
    arrayOfFile[0] = this.a;
    localr.execute(arrayOfFile);
  }

  public final void b()
  {
    Instabug.a.a(this.b.q());
    h.a(this.b, false);
    h.a(h.c(this.b), h.x(), h.d(this.b), h.e(this.b), this.a);
  }

  public final void c()
  {
    h.f(this.b).dismiss();
    this.b.i();
    s locals = new s(this);
    File[] arrayOfFile = new File[1];
    arrayOfFile[0] = this.a;
    locals.execute(arrayOfFile);
  }
}