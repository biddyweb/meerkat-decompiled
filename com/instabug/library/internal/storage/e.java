package com.instabug.library.internal.storage;

import com.instabug.library.internal.storage.db.AsyncTasks.b;
import java.util.ArrayList;

public final class e
{
  private d a;

  public e(d paramd)
  {
    this.a = paramd;
  }

  public final ArrayList a()
  {
    return this.a.a();
  }

  public final void a(com.instabug.library.model.a parama, e.a parama1)
  {
    new Thread(new f(this, parama, parama1)).start();
  }

  public final void b(com.instabug.library.model.a parama, e.a parama1)
  {
    new com.instabug.library.internal.storage.db.AsyncTasks.a(this.a, parama1).execute(new com.instabug.library.model.a[] { parama });
  }

  public final void c(com.instabug.library.model.a parama, e.a parama1)
  {
    new b(this.a, parama1).execute(new com.instabug.library.model.a[] { parama });
  }

  public final void d(com.instabug.library.model.a parama, e.a parama1)
  {
    new com.instabug.library.internal.storage.db.AsyncTasks.e(this.a, parama1).execute(new com.instabug.library.model.a[] { parama });
  }
}