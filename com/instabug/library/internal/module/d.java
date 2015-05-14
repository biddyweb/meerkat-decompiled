package com.instabug.library.internal.module;

import com.instabug.library.internal.storage.e;
import com.instabug.library.internal.storage.s;
import com.instabug.library.model.b;
import com.instabug.library.x;

public final class d
{
  private final x a;
  private final b b;
  private final s c;
  private final e d;
  private final com.instabug.library.internal.storage.a e;
  private final com.instabug.library.internal.device.a f;

  public d(com.instabug.library.internal.storage.db.d paramd, com.instabug.library.internal.storage.a parama, x paramx, e parame, s params, b paramb, com.instabug.library.internal.device.a parama1)
  {
    this.e = parama;
    this.c = params;
    this.a = paramx;
    this.d = parame;
    this.f = parama1;
    this.b = paramb;
  }

  public final com.instabug.library.internal.device.a a()
  {
    return this.f;
  }

  public final com.instabug.library.internal.storage.a b()
  {
    return this.e;
  }

  public final x c()
  {
    return this.a;
  }

  public final b d()
  {
    return this.b;
  }

  public final s e()
  {
    return this.c;
  }

  public final e f()
  {
    return this.d;
  }
}