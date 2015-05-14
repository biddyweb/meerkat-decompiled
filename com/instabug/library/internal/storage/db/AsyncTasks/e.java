package com.instabug.library.internal.storage.db.AsyncTasks;

import android.os.AsyncTask;
import com.instabug.library.internal.storage.d;
import com.instabug.library.internal.storage.e.a;
import com.instabug.library.model.a;

public final class e extends AsyncTask
{
  private d a;
  private e.a b;

  public e(d paramd, e.a parama)
  {
    this.a = paramd;
    this.b = parama;
  }

  private a a(a[] paramArrayOfa)
  {
    if (paramArrayOfa[0] != null);
    try
    {
      if (this.a.c(paramArrayOfa[0]))
      {
        a locala = paramArrayOfa[0];
        return locala;
      }
      return null;
    }
    catch (Exception localException)
    {
      while (true)
      {
        localException.printStackTrace();
        this.a = null;
      }
    }
    finally
    {
      this.a = null;
    }
  }
}