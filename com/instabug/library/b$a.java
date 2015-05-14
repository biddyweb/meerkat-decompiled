package com.instabug.library;

import android.os.AsyncTask;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.lang.ref.WeakReference;
import org.json.JSONObject;

final class b$a extends AsyncTask
{
  private WeakReference a;

  private JSONObject a(Object[] paramArrayOfObject)
  {
    try
    {
      this.a = new WeakReference((b)paramArrayOfObject[1]);
      JSONObject localJSONObject = new JSONObject(new BufferedReader(new FileReader((File)paramArrayOfObject[0])).readLine());
      return localJSONObject;
    }
    catch (Exception localException)
    {
    }
    return null;
  }
}