package com.instabug.library.network.toolbox;

import com.android.volley.NetworkResponse;
import com.android.volley.ParseError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.toolbox.HttpHeaderParser;
import com.instabug.library.Instabug.a;
import com.squareup.mimecraft.Multipart;
import com.squareup.mimecraft.Multipart.Builder;
import com.squareup.mimecraft.Multipart.Type;
import com.squareup.mimecraft.Part.Builder;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

public final class a extends Request
{
  private final Response.Listener a;
  private Map b = new HashMap();
  private Map c = new HashMap();
  private Multipart d;

  public a(int paramInt, String paramString, Response.Listener paramListener, Response.ErrorListener paramErrorListener)
  {
    super(1, paramString, paramErrorListener);
    new HashMap();
    this.a = paramListener;
  }

  public final void a()
  {
    Multipart.Builder localBuilder = new Multipart.Builder().type(Multipart.Type.FORM);
    Iterator localIterator1 = this.b.entrySet().iterator();
    while (localIterator1.hasNext())
    {
      Map.Entry localEntry2 = (Map.Entry)localIterator1.next();
      Instabug.a.b("Key = " + (String)localEntry2.getKey() + ", Value = " + localEntry2.getValue());
      String str = "application/octet-stream";
      if (((File)localEntry2.getValue()).getName().endsWith(".png"))
        str = "image/png";
      localBuilder.addPart(new Part.Builder().contentDisposition("file; name=\"file\"; filename=\"" + ((File)localEntry2.getValue()).getName() + "\"").contentType(str).body((File)localEntry2.getValue()).build());
    }
    Iterator localIterator2 = this.c.entrySet().iterator();
    while (localIterator2.hasNext())
    {
      Map.Entry localEntry1 = (Map.Entry)localIterator2.next();
      Instabug.a.b("Key = " + (String)localEntry1.getKey() + ", Value = " + (String)localEntry1.getValue());
      try
      {
        localBuilder.addPart(new Part.Builder().contentDisposition("form-data; name=\"" + (String)localEntry1.getKey() + "\";").contentType("text/plain").body((String)localEntry1.getValue()).build());
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
      }
    }
    this.d = localBuilder.build();
  }

  public final void a(String paramString, File paramFile)
  {
    this.b.put(paramString, paramFile);
  }

  public final void a(String paramString1, String paramString2)
  {
    this.c.put(paramString1, paramString2);
  }

  public final byte[] getBody()
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    try
    {
      this.d.writeBodyTo(localByteArrayOutputStream);
      byte[] arrayOfByte = localByteArrayOutputStream.toByteArray();
      return arrayOfByte;
    }
    catch (IOException localIOException)
    {
      localIOException.printStackTrace();
    }
    return super.getBody();
  }

  public final String getBodyContentType()
  {
    return (String)this.d.getHeaders().get("Content-Type");
  }

  public final Map getHeaders()
  {
    return this.d.getHeaders();
  }

  protected final String getParamsEncoding()
  {
    return "utf-8";
  }

  protected final Response parseNetworkResponse(NetworkResponse paramNetworkResponse)
  {
    try
    {
      Response localResponse = Response.success(new JSONObject(new String(paramNetworkResponse.data, HttpHeaderParser.parseCharset(paramNetworkResponse.headers))), HttpHeaderParser.parseCacheHeaders(paramNetworkResponse));
      return localResponse;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      return Response.error(new ParseError(localUnsupportedEncodingException));
    }
    catch (JSONException localJSONException)
    {
      return Response.error(new ParseError(localJSONException));
    }
  }
}