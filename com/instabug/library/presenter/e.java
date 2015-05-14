package com.instabug.library.presenter;

import android.util.Patterns;
import com.instabug.library.Instabug.a;
import com.instabug.library.interactor.c;
import com.instabug.library.interactor.c.a;
import com.instabug.library.model.a;
import com.instabug.library.x;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;

public final class e
{
  private com.instabug.library.view.b a;
  private c b;
  private x c;
  private com.instabug.library.model.b d;
  private c.a e = new g(this);

  public e(com.instabug.library.view.b paramb, c paramc, x paramx, com.instabug.library.model.b paramb1)
  {
    this.a = paramb;
    this.b = paramc;
    this.c = paramx;
    this.d = paramb1;
  }

  public final void a()
  {
    String str1 = this.a.b();
    String str2 = this.a.a();
    if ((this.c.y()) && ((str1 == null) || (str1.trim().isEmpty())))
    {
      this.a.e(this.c.u());
      return;
    }
    if ((this.c.z()) && ((str2 == null) || (!Patterns.EMAIL_ADDRESS.matcher(str2).matches())))
    {
      this.a.d(this.c.t());
      return;
    }
    this.c.d(str2);
    if (this.c.d() != null);
    try
    {
      this.c.d().run();
      a locala1 = this.d.a(str2, str1, null, 2);
      this.b.a(locala1, this.e);
      if (this.c.D())
      {
        this.a.f(this.c.s());
        return;
      }
    }
    catch (Exception localException)
    {
      while (true)
      {
        JSONObject localJSONObject = new JSONObject();
        try
        {
          localJSONObject.put("error", Instabug.a.b(localException));
          a locala2 = this.d.a(str2, localJSONObject.toString(), null, 3);
          this.b.a(locala2, new f(this));
        }
        catch (JSONException localJSONException)
        {
          localException.printStackTrace();
        }
      }
      this.a.c();
    }
  }

  public final void b()
  {
    this.a.a(this.c.A());
    if (this.c.A())
    {
      this.a.b(this.c.w());
      if ((this.c.x() != null) && (this.c.x().trim().length() > 0))
        this.a.a(this.c.x().trim());
    }
    this.a.c(this.c.v());
  }
}