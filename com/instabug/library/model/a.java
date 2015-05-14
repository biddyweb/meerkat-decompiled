package com.instabug.library.model;

import android.graphics.Bitmap;
import java.security.InvalidParameterException;
import org.json.JSONObject;

public final class a
{
  private long a;
  private long b;
  private int c;
  private int d;
  private int e;
  private int f;
  private int g = 1;
  private int h = 0;
  private String i;
  private String j;
  private JSONObject k;
  private Bitmap l;

  public final String a()
  {
    switch (this.d)
    {
    default:
      return "bug";
    case 1:
      return "bug";
    case 3:
      return "crash";
    case 2:
    }
    return "feedback";
  }

  public final void a(int paramInt)
  {
    if ((paramInt != 1) && (paramInt != 3) && (paramInt != 2))
      throw new InvalidParameterException("Type has to be TYPE_BUG or TYPE_CRASH or TYPE_FEEDBACK");
    this.d = paramInt;
  }

  public final void a(long paramLong)
  {
    this.a = paramLong;
  }

  public final void a(Bitmap paramBitmap)
  {
    this.l = paramBitmap;
  }

  public final void a(String paramString)
  {
    this.k = new JSONObject(paramString);
  }

  public final void a(JSONObject paramJSONObject)
  {
    this.k = paramJSONObject;
  }

  public final Bitmap b()
  {
    return this.l;
  }

  public final void b(int paramInt)
  {
    this.c = paramInt;
  }

  public final void b(long paramLong)
  {
    this.b = paramLong;
  }

  public final void b(String paramString)
  {
    this.i = paramString;
    this.g = (1 + this.g);
  }

  public final void c(int paramInt)
  {
    this.e = paramInt;
  }

  public final void c(String paramString)
  {
    this.j = paramString;
    this.g = (1 + this.g);
  }

  public final boolean c()
  {
    try
    {
      int m = this.h;
      int n = this.g;
      if (m == n)
      {
        bool = true;
        return bool;
      }
      boolean bool = false;
    }
    finally
    {
    }
  }

  public final void d()
  {
    try
    {
      this.h = (1 + this.h);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public final void d(int paramInt)
  {
    this.f = paramInt;
  }

  public final long e()
  {
    return this.a;
  }

  public final JSONObject f()
  {
    return this.k;
  }

  public final long g()
  {
    return this.b;
  }

  public final int h()
  {
    return this.c;
  }

  public final int i()
  {
    return this.e;
  }

  public final int j()
  {
    return this.f;
  }

  public final String k()
  {
    return this.i;
  }

  public final String l()
  {
    return this.j;
  }

  public final String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(" Internal ID: ");
    localStringBuilder.append(this.a);
    localStringBuilder.append(" Instabug ID:");
    localStringBuilder.append(this.b);
    localStringBuilder.append(", Sent=");
    localStringBuilder.append(this.c);
    localStringBuilder.append(", photoUploaded=");
    localStringBuilder.append(this.f);
    localStringBuilder.append(", fileUploaded=");
    localStringBuilder.append(this.e);
    localStringBuilder.append(", processedFlags=");
    localStringBuilder.append(this.h);
    localStringBuilder.append(", totalFlags=");
    this.g = 1;
    if ((this.i != null) && (this.i.trim().length() > 0))
      this.g = (1 + this.g);
    if ((this.j != null) && (this.j.trim().length() > 0))
      this.g = (1 + this.g);
    localStringBuilder.append(this.g);
    return localStringBuilder.toString();
  }
}