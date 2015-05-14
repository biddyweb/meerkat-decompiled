package com.instabug.library.interactor;

import com.instabug.library.internal.storage.s;
import com.instabug.library.model.a;

public final class c
{
  private s a;

  public c(s params)
  {
    this.a = params;
  }

  public final void a(a parama, a parama1)
  {
    parama1.a();
    this.a.a(parama, new d(this));
  }

  public static abstract interface a
  {
    public abstract void a();
  }
}