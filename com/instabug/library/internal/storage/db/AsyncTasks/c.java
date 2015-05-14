package com.instabug.library.internal.storage.db.AsyncTasks;

import android.os.AsyncTask;
import java.io.File;

public final class c extends AsyncTask
{
  private static Void a(String[] paramArrayOfString)
  {
    String str = paramArrayOfString[0];
    try
    {
      new File(str).delete();
      return null;
    }
    catch (Exception localException)
    {
      while (true)
        localException.printStackTrace();
    }
  }
}