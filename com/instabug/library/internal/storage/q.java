package com.instabug.library.internal.storage;

import com.instabug.library.model.a;
import java.util.ArrayList;

public final class q
  implements s
{
  private static q a;
  private p b;

  private q(p paramp)
  {
    this.b = paramp;
  }

  public static q a(p paramp)
  {
    try
    {
      if (a == null)
        a = new q(paramp);
      q localq = a;
      return localq;
    }
    finally
    {
    }
  }

  public final ArrayList a()
  {
    try
    {
      ArrayList localArrayList = this.b.a();
      return localArrayList;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public final void a(a parama, e.a parama1)
  {
    try
    {
      this.b.b(parama, new r(this, parama1));
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}