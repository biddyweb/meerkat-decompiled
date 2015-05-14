package com.instabug.library.internal.storage.db.AsyncTasks;

import android.os.AsyncTask;
import com.instabug.library.internal.storage.d;
import com.instabug.library.internal.storage.e.a;
import com.instabug.library.model.a;

public final class b extends AsyncTask
{
  private d a;
  private e.a b;

  public b(d paramd, e.a parama)
  {
    this.a = paramd;
    this.b = parama;
  }

  private Boolean a(a[] paramArrayOfa)
  {
    if (paramArrayOfa[0] != null);
    try
    {
      Boolean localBoolean = Boolean.valueOf(this.a.b(paramArrayOfa[0]));
      return localBoolean;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      return Boolean.valueOf(false);
    }
    finally
    {
      this.a = null;
    }
  }
}