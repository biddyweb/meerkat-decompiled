package com.squareup.mimecraft;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.Map;

public final class FormEncoding
  implements Part
{
  private static final Map<String, String> HEADERS = Collections.singletonMap("Content-Type", "application/x-www-form-urlencoded");
  private final byte[] data;

  private FormEncoding(String paramString)
  {
    try
    {
      this.data = paramString.getBytes("UTF-8");
      return;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new IllegalArgumentException("Unable to convert input to UTF-8: " + paramString, localUnsupportedEncodingException);
    }
  }

  public Map<String, String> getHeaders()
  {
    return HEADERS;
  }

  public void writeBodyTo(OutputStream paramOutputStream)
    throws IOException
  {
    paramOutputStream.write(this.data);
  }

  public static class Builder
  {
    private final StringBuilder content = new StringBuilder();

    public Builder add(String paramString1, String paramString2)
    {
      if (this.content.length() > 0)
        this.content.append('&');
      try
      {
        this.content.append(URLEncoder.encode(paramString1, "UTF-8")).append('=').append(URLEncoder.encode(paramString2, "UTF-8"));
        return this;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        throw new AssertionError(localUnsupportedEncodingException);
      }
    }

    public FormEncoding build()
    {
      if (this.content.length() == 0)
        throw new IllegalStateException("Form encoded body must have at least one part.");
      return new FormEncoding(this.content.toString(), null);
    }
  }
}