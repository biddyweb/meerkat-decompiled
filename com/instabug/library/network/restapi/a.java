package com.instabug.library.network.restapi;

import android.content.Context;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.JsonObjectRequest;
import com.instabug.library.Instabug.a;
import java.io.File;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONException;

public final class a
{
  private RequestQueue a;
  private c b;
  private List c = new LinkedList();

  public a(Context paramContext, c paramc)
  {
    com.instabug.library.network.toolbox.b.a(paramContext, new b(this, paramContext));
    this.b = paramc;
  }

  public final void a(com.instabug.library.model.a parama, a parama1)
  {
    Instabug.a.a("Api: saveIssue");
    com.instabug.library.network.c localc = new com.instabug.library.network.c();
    localc.a(parama.f());
    JsonObjectRequest localJsonObjectRequest = new JsonObjectRequest(1, localc.a(1), localc.b(), new f(this.b, parama1), new g(this.b, parama1));
    localJsonObjectRequest.setShouldCache(false);
    if (this.a != null)
    {
      this.a.add(localJsonObjectRequest);
      return;
    }
    this.c.add(localJsonObjectRequest);
  }

  public final void a(com.instabug.library.model.a parama, File paramFile, int paramInt, com.instabug.library.interactor.a.a parama1)
  {
    Instabug.a.a("Api: saveIssueArtifact");
    switch (paramInt)
    {
    default:
    case 1:
    }
    com.instabug.library.network.toolbox.a locala;
    for (Object localObject = new com.instabug.library.network.e(); ; localObject = new com.instabug.library.network.d())
    {
      locala = new com.instabug.library.network.toolbox.a(1, ((com.instabug.library.network.h)localObject).a(1), new h(this.b, parama1), new i(this.b, parama1));
      locala.setRetryPolicy(new DefaultRetryPolicy(60000, 1, 1.0F));
      locala.a("file", paramFile);
      locala.a("bugID", Long.toString(parama.g()));
      locala.setShouldCache(false);
      locala.a();
      if (this.a == null)
        break;
      this.a.add(locala);
      return;
    }
    this.c.add(locala);
  }

  public final void a(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, String paramString7, com.instabug.library.interactor.a.a parama)
  {
    com.instabug.library.network.b localb = new com.instabug.library.network.b();
    try
    {
      localb.a("uuid", paramString1).a("token", paramString2).a("device", paramString3).a("os", paramString4).a("bundleID", paramString5).a("SDKVersion", paramString6).a("deviceRooted", paramString7);
      JsonObjectRequest localJsonObjectRequest = new JsonObjectRequest(1, localb.a(1), localb.b(), new d(this.b, parama), new e(this.b, parama));
      localJsonObjectRequest.setShouldCache(false);
      if (this.a != null)
      {
        this.a.add(localJsonObjectRequest);
        return;
      }
      this.c.add(localJsonObjectRequest);
      return;
    }
    catch (JSONException localJSONException)
    {
      localJSONException.printStackTrace();
    }
  }

  public static abstract interface a
  {
    public abstract void a(long paramLong);

    public abstract void a(String paramString);
  }
}