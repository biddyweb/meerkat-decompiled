package com.instabug.library;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;

public final class x
{
  private StringBuilder A = new StringBuilder();
  private SharedPreferences B;
  private String C;
  String a = null;
  String b;
  String c;
  long d;
  private Resources e;
  private String f;
  private String g;
  private String h;
  private boolean i = false;
  private Runnable j;
  private boolean k = true;
  private Instabug.IBGInvocationEvent l = Instabug.IBGInvocationEvent.IBGInvocationEventShake;
  private boolean m = true;
  private boolean n = true;
  private boolean o;
  private boolean p;
  private boolean q;
  private String r;
  private String s;
  private String t;
  private String u;
  private boolean v = true;
  private boolean w = true;
  private boolean x = true;
  private boolean y = true;
  private Class z;

  public final boolean A()
  {
    return this.n;
  }

  public final String B()
  {
    return n()[0];
  }

  public final boolean C()
  {
    return this.v;
  }

  public final boolean D()
  {
    return this.x;
  }

  public final boolean E()
  {
    return this.y;
  }

  public final StringBuilder F()
  {
    return this.A;
  }

  public final boolean G()
  {
    return this.B.getBoolean("ib_device_registered", false);
  }

  public final boolean H()
  {
    return this.B.getBoolean("ib_first_run", true);
  }

  public final long a()
  {
    return this.d;
  }

  public final void a(Resources paramResources, String paramString, SharedPreferences paramSharedPreferences)
  {
    this.f = paramString;
    this.e = paramResources;
    this.B = paramSharedPreferences;
  }

  public final void a(Instabug.IBGInvocationEvent paramIBGInvocationEvent)
  {
    this.l = paramIBGInvocationEvent;
  }

  public final void a(Runnable paramRunnable)
  {
    this.j = paramRunnable;
  }

  public final void a(String paramString)
  {
    this.g = paramString;
  }

  public final void a(boolean paramBoolean)
  {
    this.k = paramBoolean;
  }

  public final void a(boolean paramBoolean, Class paramClass)
  {
    this.z = paramClass;
    this.k = paramBoolean;
  }

  public final void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramBoolean1)
    {
      this.n = paramBoolean1;
      this.o = paramBoolean2;
      return;
    }
    this.n = paramBoolean1;
    this.o = paramBoolean1;
  }

  public final String b()
  {
    return this.a;
  }

  public final void b(String paramString)
  {
    this.i = true;
    this.h = paramString;
  }

  public final void b(boolean paramBoolean)
  {
    this.m = paramBoolean;
  }

  public final String c()
  {
    return this.C;
  }

  public final void c(String paramString)
  {
    this.t = paramString;
  }

  public final void c(boolean paramBoolean)
  {
    this.p = paramBoolean;
  }

  public final Runnable d()
  {
    return this.j;
  }

  public final void d(String paramString)
  {
    this.B.edit().putString("ib_default_email", paramString).apply();
  }

  public final void d(boolean paramBoolean)
  {
    this.w = paramBoolean;
  }

  public final Instabug.IBGInvocationEvent e()
  {
    return this.l;
  }

  public final void e(String paramString)
  {
    this.r = paramString;
  }

  public final void e(boolean paramBoolean)
  {
    this.q = paramBoolean;
  }

  public final String f()
  {
    return this.g;
  }

  public final void f(String paramString)
  {
    this.s = paramString;
  }

  public final void f(boolean paramBoolean)
  {
    this.v = paramBoolean;
  }

  public final void g(String paramString)
  {
    this.u = paramString;
  }

  public final void g(boolean paramBoolean)
  {
    this.x = paramBoolean;
  }

  public final boolean g()
  {
    return this.k;
  }

  public final Class h()
  {
    return this.z;
  }

  public final void h(String paramString)
  {
    this.C = paramString;
  }

  public final void h(boolean paramBoolean)
  {
    this.B.edit().putBoolean("ib_device_registered", true).apply();
  }

  public final void i()
  {
    this.i = false;
    this.h = null;
  }

  public final void i(boolean paramBoolean)
  {
    this.B.edit().putBoolean("ib_first_run", false).apply();
  }

  public final void j(boolean paramBoolean)
  {
    this.n = paramBoolean;
  }

  public final boolean j()
  {
    return this.i;
  }

  public final String k()
  {
    return this.h;
  }

  public final void k(boolean paramBoolean)
  {
    this.o = paramBoolean;
  }

  public final boolean l()
  {
    return this.m;
  }

  public final boolean m()
  {
    return this.w;
  }

  public final String[] n()
  {
    return this.e.getStringArray(this.e.getIdentifier("report_options", "array", this.f));
  }

  public final boolean o()
  {
    return (this.q) && (this.B.getBoolean("ib_show_tutorial", true));
  }

  public final void p()
  {
    this.B.edit().putBoolean("ib_show_tutorial", false).apply();
  }

  public final String q()
  {
    return this.e.getString(this.e.getIdentifier("pleasewait", "string", this.f));
  }

  public final String r()
  {
    if (this.c != null)
      return this.c;
    return this.e.getString(this.e.getIdentifier("feedbacksentalerttitle", "string", this.f));
  }

  public final String s()
  {
    if (this.b != null)
      return this.b;
    return this.e.getString(this.e.getIdentifier("feedbacksentalerttitle", "string", this.f));
  }

  public final String t()
  {
    if (this.u != null)
      return this.u;
    return this.e.getString(this.e.getIdentifier("invalidemailalerttitle", "string", this.f));
  }

  public final String u()
  {
    if (this.t != null)
      return this.t;
    return this.e.getString(this.e.getIdentifier("invalidcommentalerttext", "string", this.f));
  }

  public final String v()
  {
    if (this.s != null)
      return this.s;
    return this.e.getString(this.e.getIdentifier("commentplaceholder", "string", this.f));
  }

  public final String w()
  {
    if (this.r != null)
      return this.r;
    return this.e.getString(this.e.getIdentifier("emailplaceholder", "string", this.f));
  }

  public final String x()
  {
    return this.B.getString("ib_default_email", null);
  }

  public final boolean y()
  {
    return this.p;
  }

  public final boolean z()
  {
    return this.o;
  }
}