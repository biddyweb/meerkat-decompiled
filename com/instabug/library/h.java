package com.instabug.library;

import android.app.Activity;
import android.app.Application;
import android.app.Application.ActivityLifecycleCallbacks;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.opengl.GLSurfaceView;
import android.os.Build.VERSION;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import com.google.android.gms.maps.GoogleMap;
import com.instabug.library.dialog.d.a;
import com.instabug.library.internal.layer.c.a;
import com.instabug.library.internal.storage.s;
import com.instabug.library.invoker.a.d;
import com.instabug.library.invoker.a.e;
import com.instabug.library.network.UploadCacheService;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

final class h
  implements a.e
{
  private static com.instabug.library.internal.theming.a c;
  private static Instabug.SdkThemingMode d;
  private static Class i = InstabugFeedbackActivity.class;
  private static com.instabug.library.internal.module.d y;
  private com.instabug.library.model.b A;
  private Activity B;
  private d.a C = null;
  private com.instabug.library.network.toolbox.b D;
  private Instabug.IBGInvocationMode E = Instabug.IBGInvocationMode.IBGInvocationModeNA;
  com.instabug.library.invoker.a a = new com.instabug.library.invoker.a(this);
  a.d b;
  private Instabug.GestureMode e = Instabug.GestureMode.NONE;
  private com.instabug.library.invoker.c f;
  private com.instabug.library.util.j g;
  private Application h;
  private WeakReference j;
  private GLSurfaceView k;
  private Instabug.SdkThemingMode l = Instabug.SdkThemingMode.AUTO;
  private Instabug.SdkThemeSource m = Instabug.SdkThemeSource.OWN_THEME;
  private boolean n;
  private boolean o = false;
  private long p;
  private long q;
  private long r;
  private Dialog s;
  private ProgressDialog t;
  private x u;
  private a v;
  private s w;
  private List x = new LinkedList();
  private com.instabug.library.internal.theming.a z;

  public h(Application paramApplication, com.instabug.library.internal.module.a parama, String paramString)
  {
    this.h = paramApplication;
    i locali = new i(this);
    this.v = parama.a();
    y = parama.b();
    this.u = y.c();
    this.u.a = paramString;
    this.f = parama.a(locali);
    this.g = new com.instabug.library.util.j(y.b());
    Intent localIntent = new Intent(paramApplication, UploadCacheService.class);
    localIntent.putExtra("com.instabug.token", paramString);
    com.instabug.library.util.b localb = new com.instabug.library.util.b(parama.b().c(), parama.c().a(), parama.b().a());
    Thread.setDefaultUncaughtExceptionHandler(parama.d());
    this.w = y.e();
    this.A = y.d();
    this.u.a(paramApplication.getResources(), paramApplication.getPackageName(), paramApplication.getSharedPreferences("instabug", 0));
    if (Build.VERSION.SDK_INT >= 14)
      a(new com.instabug.library.util.e(), localIntent);
    while (true)
    {
      if (!this.u.G())
      {
        Instabug.a.a("Device is not registered. Registering..");
        localb.a(new n(this));
      }
      if (this.u.H())
      {
        Instabug.a.a("This is the app's first run..");
        this.n = true;
        this.u.i(false);
      }
      return;
      a(null, localIntent);
    }
  }

  private void a(Activity paramActivity, b paramb)
  {
    Instabug.a.a("ScreenshotProcessor: Starting Screenshot Capture");
    if (this.j == null);
    for (Dialog localDialog = null; ; localDialog = (Dialog)this.j.get())
    {
      com.instabug.library.util.h localh = new com.instabug.library.util.h(paramActivity, localDialog, this.k, this.x, y.a());
      this.g.a(localh, new t(this, paramb));
      return;
    }
  }

  public static void a(Activity paramActivity, Class paramClass, com.instabug.library.internal.theming.a parama, Instabug.SdkThemingMode paramSdkThemingMode, File paramFile)
  {
    c = parama;
    d = paramSdkThemingMode;
    Instabug.a.a(paramActivity);
    if (paramClass == null)
      throw new IllegalStateException("Annotation Activity Class not found. Please initialize the SDK properly");
    Intent localIntent = new Intent(paramActivity, paramClass);
    localIntent.putExtra("com.instabug.snapshot_file_path", paramFile.getAbsolutePath());
    if (parama == null);
    for (boolean bool = true; ; bool = false)
    {
      localIntent.putExtra("com.instabug.load_own_theme", bool);
      paramActivity.startActivity(localIntent);
      return;
    }
  }

  private void a(Application.ActivityLifecycleCallbacks paramActivityLifecycleCallbacks, Intent paramIntent)
  {
    if ((paramActivityLifecycleCallbacks != null) && (Build.VERSION.SDK_INT >= 14))
      this.h.registerActivityLifecycleCallbacks(paramActivityLifecycleCallbacks);
    this.h.startService(paramIntent);
  }

  private void a(b paramb)
  {
    Instabug.a.a("Starting Instabug process");
    this.o = true;
    y();
    Activity localActivity = q();
    if ((localActivity != null) && (!localActivity.isFinishing()))
    {
      Instabug.a.b(localActivity);
      this.t = ProgressDialog.show(this.B, null, this.u.q(), false, false);
      if ((this.l != Instabug.SdkThemingMode.MANUAL) && (this.m == Instabug.SdkThemeSource.CALLER_THEME))
        this.z = z();
      if (this.x.isEmpty())
        a(localActivity, paramb);
    }
    else
    {
      return;
    }
    Instabug.a.a("Invoking advanced screenshot capturing");
    a locala = new a(localActivity, paramb);
    ((com.instabug.library.internal.layer.c)this.x.get(0)).a(locala);
  }

  public static void a(Class paramClass)
  {
    i = paramClass;
  }

  public static com.instabug.library.internal.theming.a b()
  {
    return c;
  }

  public static Instabug.SdkThemingMode c()
  {
    return d;
  }

  private void y()
  {
    int i1 = 0;
    while (i1 < this.x.size())
      if (!((com.instabug.library.internal.layer.c)this.x.get(i1)).a())
        this.x.remove(i1);
      else
        i1++;
  }

  private com.instabug.library.internal.theming.a z()
  {
    if (this.l == Instabug.SdkThemingMode.MIN_SDK_14)
    {
      Instabug.a.a("Explicitly loading Native Theme");
      new com.instabug.library.internal.theming.d();
      return com.instabug.library.internal.theming.d.a(this.B);
    }
    if (this.l == Instabug.SdkThemingMode.APPCOMPAT_V7)
    {
      Instabug.a.a("Explicitly loading AppCompat Theme");
      new com.instabug.library.internal.theming.b();
      return com.instabug.library.internal.theming.b.a(this.B);
    }
    if (this.l == Instabug.SdkThemingMode.SHERLOCK)
    {
      Instabug.a.a("Explicitly loading ActionBarSherlock Material Theme");
      new com.instabug.library.internal.theming.e();
      return com.instabug.library.internal.theming.e.a(this.B);
    }
    if (this.l == Instabug.SdkThemingMode.APP_COMPAT_MATERIAL)
    {
      Instabug.a.a("Explicitly loading AppCompat Material Theme");
      new com.instabug.library.internal.theming.c();
      return com.instabug.library.internal.theming.c.a(this.B);
    }
    try
    {
      Class.forName("android.support.v7.widget.Toolbar");
      Instabug.a.a("AppCompat Material found, loading theme");
      new com.instabug.library.internal.theming.c();
      com.instabug.library.internal.theming.a locala3 = com.instabug.library.internal.theming.c.a(this.B);
      return locala3;
    }
    catch (ClassNotFoundException localClassNotFoundException1)
    {
      try
      {
        Class.forName("android.support.v7.app.ActionBarActivity");
        Instabug.a.a("AppCompat found, loading theme");
        new com.instabug.library.internal.theming.b();
        com.instabug.library.internal.theming.a locala2 = com.instabug.library.internal.theming.b.a(this.B);
        return locala2;
      }
      catch (ClassNotFoundException localClassNotFoundException2)
      {
        try
        {
          Class.forName("com.actionbarsherlock.app.SherlockActivity");
          Instabug.a.a("ActionBarSherlock found, loading theme");
          new com.instabug.library.internal.theming.b();
          com.instabug.library.internal.theming.a locala1 = com.instabug.library.internal.theming.b.a(this.B);
          return locala1;
        }
        catch (ClassNotFoundException localClassNotFoundException3)
        {
          if (Build.VERSION.SDK_INT >= 14)
          {
            Instabug.a.a("No ActionBar libraries found, loading native theme");
            new com.instabug.library.internal.theming.b();
            return com.instabug.library.internal.theming.b.a(this.B);
          }
        }
      }
    }
    return null;
  }

  public final Instabug.GestureMode a()
  {
    return this.e;
  }

  public final void a(float paramFloat)
  {
    this.f.a(paramFloat);
  }

  public final void a(int paramInt1, int paramInt2)
  {
    this.D = new com.instabug.library.network.toolbox.b();
    this.D.a = paramInt1;
    this.D.b = paramInt2;
  }

  public final void a(int paramInt1, int paramInt2, int paramInt3)
  {
    this.C = new d.a();
    this.C.a = paramInt1;
    this.C.b = paramInt2;
    this.C.c = paramInt3;
  }

  public final void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    this.l = Instabug.SdkThemingMode.MANUAL;
    this.z = new com.instabug.library.internal.theming.a();
    new ColorDrawable(paramInt1);
    this.z.a = new ColorDrawable(paramInt2);
    this.z.c = paramInt3;
    this.z.b = new ColorDrawable(paramInt4);
  }

  public final void a(Activity paramActivity)
  {
    this.B = paramActivity;
    this.s = null;
    this.u.a(paramActivity.getResources(), this.h.getPackageName(), this.h.getSharedPreferences("instabug", 0));
    if (this.u.e() == Instabug.IBGInvocationEvent.IBGInvocationEventShake)
      this.f.a(true);
    if (this.u.e() == Instabug.IBGInvocationEvent.IBGInvocationEventFloatingButton)
      this.a.a(paramActivity);
    if (this.u.l())
      this.v.a(this.B.getClass().getName(), "activity");
    if ((this.n) && (this.u.g()) && ((this.u.h() == null) || (this.B.getClass().equals(this.u.h()))))
    {
      this.n = false;
      e();
    }
    this.q = System.currentTimeMillis();
  }

  public final void a(Dialog paramDialog)
  {
    this.j = new WeakReference(paramDialog);
    if (this.u.l())
      this.v.a(this.j.getClass().getName(), "dialog");
  }

  public final void a(Bitmap paramBitmap, String paramString1, String paramString2, Instabug.b paramb)
  {
    if ((paramString2 != null) && (paramString2.length() > 190))
    {
      Instabug.a.c("Email field too long, sending first set of characters only");
      paramString2 = paramString2.substring(0, 190);
    }
    com.instabug.library.model.a locala = this.A.a(paramString2, paramString1, paramBitmap, 1);
    this.w.a(locala, new p(this, paramb));
  }

  public final void a(Drawable paramDrawable1, Drawable paramDrawable2, int paramInt1, Drawable paramDrawable3, int paramInt2)
  {
    this.l = Instabug.SdkThemingMode.MANUAL;
    this.z = new com.instabug.library.internal.theming.a();
    this.z.a = paramDrawable2;
    this.z.c = paramInt1;
    this.z.b = paramDrawable3;
  }

  public final void a(GLSurfaceView paramGLSurfaceView)
  {
    this.k = paramGLSurfaceView;
  }

  public final void a(View paramView)
  {
    Object localObject;
    if (paramView != null)
    {
      int i1 = paramView.getId();
      localObject = null;
      if (i1 <= 0);
    }
    try
    {
      String str = this.h.getResources().getResourceEntryName(paramView.getId());
      localObject = str;
      if (this.u.l())
        this.v.a(this.B.getClass().getName(), localObject, paramView.getClass().getName(), paramView.getId());
      return;
    }
    catch (Exception localException)
    {
      while (true)
      {
        localException.printStackTrace();
        localObject = null;
      }
    }
  }

  public final void a(View paramView, GoogleMap paramGoogleMap)
  {
    for (int i1 = 0; ; i1++)
      if (i1 < this.x.size())
      {
        if ((((com.instabug.library.internal.layer.c)this.x.get(i1)).b() != null) && (((com.instabug.library.internal.layer.c)this.x.get(i1)).b() == paramView))
          this.x.remove(i1);
      }
      else
      {
        com.instabug.library.internal.layer.a locala = new com.instabug.library.internal.layer.a(paramView, paramGoogleMap);
        this.x.add(locala);
        return;
      }
  }

  public final void a(Instabug.GestureMode paramGestureMode)
  {
    this.e = paramGestureMode;
  }

  public final void a(Instabug.IBGInvocationEvent paramIBGInvocationEvent)
  {
    this.u.a(paramIBGInvocationEvent);
  }

  public final void a(Instabug.IBGInvocationMode paramIBGInvocationMode)
  {
    this.E = paramIBGInvocationMode;
  }

  public final void a(Instabug.SdkThemingMode paramSdkThemingMode, Instabug.SdkThemeSource paramSdkThemeSource)
  {
    this.l = paramSdkThemingMode;
    this.m = paramSdkThemeSource;
  }

  public final void a(File paramFile)
  {
    Instabug.a.a(q());
    this.o = false;
    if (i == null)
      throw new IllegalStateException("Annotation Activity Class not found. Please initialize the SDK properly");
    Intent localIntent = new Intent(this.B, i);
    localIntent.putExtra("com.instabug.snapshot_file_path", paramFile.getAbsolutePath());
    this.B.startActivity(localIntent);
  }

  public final void a(String paramString)
  {
    this.u.c(paramString);
  }

  public final void a(String paramString1, String paramString2, Instabug.b paramb)
  {
    if ((paramString2 != null) && (paramString2.length() > 190))
    {
      Instabug.a.c("Email field too long, sending first set of characters only");
      paramString2 = paramString2.substring(0, 190);
    }
    com.instabug.library.model.a locala = this.A.a(paramString2, paramString1, null, 2);
    this.w.a(locala, new k(this, paramb));
  }

  public final void a(Throwable paramThrowable)
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("error", Instabug.a.b(paramThrowable));
      com.instabug.library.model.a locala = this.A.a(this.u.x(), localJSONObject.toString(), null, 3);
      this.w.a(locala, new l(this));
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }

  public final void a(boolean paramBoolean)
  {
    this.u.a(paramBoolean);
  }

  public final void a(boolean paramBoolean, Class paramClass)
  {
    this.u.a(paramBoolean, paramClass);
  }

  public final void a(boolean paramBoolean1, boolean paramBoolean2)
  {
    this.u.a(paramBoolean1, paramBoolean2);
  }

  public final void b(Activity paramActivity)
  {
    if (this.B == null)
      Instabug.a.d("No activity was set earlier than this call. Doing nothing");
    while (true)
    {
      return;
      if (!paramActivity.equals(this.B))
      {
        Instabug.a.d("You're trying to pause an activity that is not the current activity! Please make sure you're calling onPause and onResume on every activity");
        return;
      }
      if (this.u.e() == Instabug.IBGInvocationEvent.IBGInvocationEventShake)
        this.f.a(false);
      if (this.u.e() == Instabug.IBGInvocationEvent.IBGInvocationEventFloatingButton)
        this.a.a();
      if (this.u.l())
        this.v.a(paramActivity.getClass().getName(), "pause");
      this.p = System.currentTimeMillis();
      this.r = this.p;
      x localx = this.u;
      localx.d += this.r - this.q;
      try
      {
        if ((this.t != null) && (this.t.isShowing()))
        {
          this.t.dismiss();
          this.t = null;
        }
        try
        {
          if ((this.s == null) || (!this.s.isShowing()))
            continue;
          this.s.dismiss();
          this.s = null;
          return;
        }
        catch (Exception localException2)
        {
          Instabug.a.a(Log.getStackTraceString(localException2.getCause()));
          return;
        }
      }
      catch (Exception localException1)
      {
        while (true)
          Instabug.a.a(Log.getStackTraceString(localException1.getCause()));
      }
    }
  }

  public final void b(String paramString)
  {
    this.u.b(paramString);
  }

  public final void b(boolean paramBoolean)
  {
    this.u.c(paramBoolean);
  }

  public final void c(Activity paramActivity)
  {
    if (paramActivity.equals(this.B))
    {
      this.B = null;
      this.s = null;
      y();
    }
  }

  public final void c(String paramString)
  {
    this.u.a(paramString);
  }

  public final void c(boolean paramBoolean)
  {
    this.u.b(paramBoolean);
  }

  public final s d()
  {
    return this.w;
  }

  public final void d(String paramString)
  {
    this.u.d(paramString);
  }

  public final void d(boolean paramBoolean)
  {
    this.u.f(paramBoolean);
  }

  public final void e()
  {
    if (this.u.e() == Instabug.IBGInvocationEvent.IBGInvocationEventTwoFingersSwipeLeft)
      new Handler().postDelayed(new u(this), 1500L);
    while (this.u.e() != Instabug.IBGInvocationEvent.IBGInvocationEventShake)
      return;
    new Handler().postDelayed(new v(this), 1500L);
  }

  public final void e(String paramString)
  {
    this.u.e(paramString);
  }

  public final void e(boolean paramBoolean)
  {
    this.u.j(paramBoolean);
  }

  public final void f()
  {
    if (this.o)
      return;
    a locala;
    if (this.u.l())
    {
      locala = this.v;
      if (this.B == null)
        break label102;
    }
    label102: for (String str = this.B.getClass().getName(); ; str = "Unknown Activity")
    {
      locala.a(str, "feedback");
      switch (m.a[this.E.ordinal()])
      {
      default:
        return;
      case 1:
        a(new w(this));
        return;
      case 2:
      case 3:
      }
    }
    g();
    return;
    h();
  }

  public final void f(String paramString)
  {
    this.u.f(paramString);
  }

  public final void f(boolean paramBoolean)
  {
    this.u.k(paramBoolean);
  }

  public final void g()
  {
    if (this.o)
      return;
    a(new j(this));
  }

  public final void g(String paramString)
  {
    this.u.b = paramString;
  }

  public final void h()
  {
    if (this.o)
      return;
    i();
  }

  public final void h(String paramString)
  {
    this.u.c = paramString;
  }

  public final void i()
  {
    this.o = false;
    com.instabug.library.interactor.c localc = new com.instabug.library.interactor.c(this.w);
    com.instabug.library.model.b localb = com.instabug.library.model.b.a(this.u, this.v, y.a());
    new com.instabug.library.dialog.d(q(), this.C, localc, localb).show();
  }

  public final void i(String paramString)
  {
    this.u.h(paramString);
  }

  public final Dialog j()
  {
    return (Dialog)this.j.get();
  }

  public final void k()
  {
    this.u.i();
  }

  public final boolean l()
  {
    return this.u.j();
  }

  public final String m()
  {
    return this.u.f();
  }

  public final boolean n()
  {
    return this.u.l();
  }

  public final boolean o()
  {
    return this.u.g();
  }

  public final String p()
  {
    return this.u.k();
  }

  final Activity q()
  {
    Activity localActivity;
    if ((this.B != null) && (this.B.getParent() != null))
      localActivity = this.B.getParent();
    while (localActivity.getParent() != null)
    {
      localActivity = localActivity.getParent();
      continue;
      localActivity = this.B;
    }
    return localActivity;
  }

  public final String r()
  {
    return this.u.q();
  }

  public final x s()
  {
    return this.u;
  }

  public final Application t()
  {
    return this.h;
  }

  public final a u()
  {
    return this.v;
  }

  public final d.a v()
  {
    return this.C;
  }

  public final void w()
  {
    f();
  }

  final class a
    implements c.a
  {
    private int a = 1;
    private h.b b;
    private Activity c;

    public a(Activity paramb, h.b arg3)
    {
      this.c = paramb;
      Object localObject;
      this.b = localObject;
    }

    public final void a()
    {
      if (h.i(h.this).size() >= this.a)
      {
        h.a(h.this, this.c, this.b);
        return;
      }
      this.a = (1 + this.a);
      ((com.instabug.library.internal.layer.c)h.i(h.this).get(this.a)).a(this);
    }
  }

  static abstract interface b
  {
    public abstract void a(File paramFile);
  }
}