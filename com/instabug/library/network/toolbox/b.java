package com.instabug.library.network.toolbox;

import android.content.Context;
import com.android.volley.toolbox.HttpStack;

public class b
{
  public int a;
  public int b;

  public static void a(Context paramContext, a parama)
  {
    new Thread(new c(paramContext, parama), "InstabugNetInit").start();
  }

  public static abstract interface a
  {
    public abstract void a(HttpStack paramHttpStack);
  }
}