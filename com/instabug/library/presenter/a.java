package com.instabug.library.presenter;

import android.graphics.Bitmap;
import android.util.Patterns;
import com.instabug.library.Instabug.a;
import com.instabug.library.interactor.c.a;
import com.instabug.library.x;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;

public final class a
{
  private com.instabug.library.view.a a;
  private com.instabug.library.interactor.c b;
  private x c;
  private com.instabug.library.model.b d;
  private com.instabug.library.internal.storage.a e;
  private c.a f = new d(this);

  public a(com.instabug.library.view.a parama, com.instabug.library.interactor.c paramc, x paramx, com.instabug.library.model.b paramb, com.instabug.library.internal.storage.a parama1)
  {
    this.a = parama;
    this.b = paramc;
    this.c = paramx;
    this.d = paramb;
    this.e = parama1;
  }

  public final void a()
  {
    this.a.a(this.c.A());
    if (this.c.A())
    {
      this.a.c(this.c.w());
      if ((this.c.x() != null) && (this.c.x().trim().length() > 0))
        this.a.b(this.c.x().trim());
    }
    this.a.a(this.c.B());
    this.a.d(this.c.v());
    String str = this.a.c();
    if (str != null)
    {
      this.e.a(str, new b(this));
      return;
    }
    this.a.g();
  }

  public final void a(int paramInt)
  {
    this.a.a(paramInt);
  }

  public final void b()
  {
    this.a = null;
    this.b = null;
    this.d = null;
    this.c = null;
    this.e = null;
  }

  public final void c()
  {
    String str1 = this.a.f();
    String str2 = this.a.e();
    Object localObject;
    if (str2 != null)
    {
      int i = str2.trim().length();
      localObject = null;
      if (i != 0);
    }
    while (true)
    {
      if ((this.c.y()) && ((str1 == null) || (str1.trim().isEmpty())))
      {
        this.a.f(this.c.u());
        return;
      }
      if ((this.c.z()) && (localObject == null))
      {
        this.a.e(this.c.t());
        return;
      }
      if ((localObject != null) && ((((String)localObject).length() > 190) || (!Patterns.EMAIL_ADDRESS.matcher((CharSequence)localObject).matches())))
      {
        this.a.e(this.c.t());
        return;
      }
      Bitmap localBitmap = this.a.d();
      this.a.g(this.c.q());
      this.c.d((String)localObject);
      if (this.c.d() != null);
      try
      {
        this.c.d().run();
        com.instabug.library.model.a locala1 = this.d.a((String)localObject, str1, localBitmap, 1);
        this.b.a(locala1, this.f);
        com.instabug.library.internal.storage.a.a(this.a.c());
        return;
      }
      catch (Exception localException)
      {
        while (true)
        {
          JSONObject localJSONObject = new JSONObject();
          try
          {
            localJSONObject.put("error", Instabug.a.b(localException));
            com.instabug.library.model.a locala2 = this.d.a((String)localObject, localJSONObject.toString(), null, 3);
            this.b.a(locala2, new c(this));
          }
          catch (JSONException localJSONException)
          {
            localException.printStackTrace();
          }
        }
      }
      localObject = str2;
    }
  }

  public final void d()
  {
    this.a.g();
    com.instabug.library.internal.storage.a.a(this.a.c());
  }

  public final void e()
  {
    this.a.h();
  }
}