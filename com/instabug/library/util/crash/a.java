package com.instabug.library.util.crash;

import com.instabug.library.Instabug.a;
import com.instabug.library.internal.module.d;
import com.instabug.library.x;
import org.json.JSONException;
import org.json.JSONObject;

public final class a
  implements Thread.UncaughtExceptionHandler
{
  private com.instabug.library.interactor.a a;
  private com.instabug.library.util.a b;
  private com.instabug.library.model.b c;
  private x d;

  public a(com.instabug.library.interactor.a parama, d paramd, com.instabug.library.util.a parama1)
  {
    this.a = parama;
    this.b = parama1;
    this.c = paramd.d();
    this.d = paramd.c();
  }

  public final void uncaughtException(Thread paramThread, Throwable paramThrowable)
  {
    if (!this.d.m())
    {
      this.b.a(paramThread, paramThrowable);
      return;
    }
    Instabug.a.a("Instabug Caught an Unhandled Exception: " + paramThrowable.getClass().getCanonicalName());
    JSONObject localJSONObject1 = new JSONObject();
    try
    {
      JSONObject localJSONObject2 = new JSONObject();
      localJSONObject2.put("threadName", paramThread.getName());
      localJSONObject2.put("threadId", paramThread.getId());
      localJSONObject2.put("threadPriority", paramThread.getPriority());
      localJSONObject2.put("threadState", paramThread.getState().toString());
      JSONObject localJSONObject3 = new JSONObject();
      localJSONObject3.put("name", paramThread.getThreadGroup().getName());
      localJSONObject3.put("maxPriority", paramThread.getThreadGroup().getMaxPriority());
      localJSONObject3.put("activeCount", paramThread.getThreadGroup().activeCount());
      localJSONObject2.put("threadGroup", localJSONObject3);
      localJSONObject1.put("thread", localJSONObject2);
      localJSONObject1.put("error", Instabug.a.b(paramThrowable));
      if (this.d.d() == null);
    }
    catch (JSONException localJSONException)
    {
      try
      {
        this.d.d().run();
        com.instabug.library.model.a locala = this.c.a(this.d.x(), localJSONObject1.toString(), null, 3);
        this.a.a(locala, new b(this, paramThread, paramThrowable));
        return;
        localJSONException = localJSONException;
        localJSONException.printStackTrace();
      }
      catch (Exception localException)
      {
        while (true)
          Instabug.a.a("Pre sending runnable failed to run.", localException);
      }
    }
  }
}