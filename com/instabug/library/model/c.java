package com.instabug.library.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public final class c
{
  private String a;
  private String b;
  private String c;
  private String d;
  private String e;

  public final void a(long paramLong)
  {
    this.a = new SimpleDateFormat("MM-dd HH:MM:ss", Locale.US).format(new Date(paramLong));
  }

  public final void a(String paramString)
  {
    this.e = paramString;
  }

  public final void a(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append(this.a);
    paramStringBuilder.append("     ");
    if (this.e.equals("click"))
    {
      paramStringBuilder.append("In activity ");
      paramStringBuilder.append(this.d);
      paramStringBuilder.append(": ");
      if (this.b != null)
      {
        paramStringBuilder.append("View(");
        paramStringBuilder.append(this.b);
        paramStringBuilder.append(")");
        paramStringBuilder.append(" of type ");
        paramStringBuilder.append(this.c);
        paramStringBuilder.append(" received a ");
        paramStringBuilder.append(this.e);
        paramStringBuilder.append(" event");
      }
    }
    do
    {
      return;
      paramStringBuilder.append("View");
      break;
      if (this.e.equals("shake"))
      {
        paramStringBuilder.append("In activity ");
        paramStringBuilder.append(this.d);
        paramStringBuilder.append(": the user shook the phone");
        return;
      }
      if (this.e.equals("activity"))
      {
        paramStringBuilder.append(this.d);
        paramStringBuilder.append(" was resumed ");
        return;
      }
      if (this.e.equals("dialog"))
      {
        paramStringBuilder.append(this.d);
        paramStringBuilder.append(" was displayed ");
        return;
      }
      if (this.e.equals("pause"))
      {
        paramStringBuilder.append(this.d);
        paramStringBuilder.append(" was paused ");
        return;
      }
    }
    while (!this.e.equals("feedback"));
    paramStringBuilder.append("In activity ");
    paramStringBuilder.append(this.d);
    paramStringBuilder.append(": started feedback process. Feedback Options dialog displayed ");
  }

  public final void b(String paramString)
  {
    this.b = paramString;
  }

  public final void c(String paramString)
  {
    this.c = paramString;
  }

  public final void d(String paramString)
  {
    this.d = paramString;
  }
}