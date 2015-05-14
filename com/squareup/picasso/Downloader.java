package com.squareup.picasso;

import android.net.Uri;
import java.io.IOException;

public abstract interface Downloader
{
  public abstract Downloader.Response load(Uri paramUri, boolean paramBoolean)
    throws IOException;

  public static class ResponseException extends IOException
  {
    public ResponseException(String paramString)
    {
      super();
    }
  }
}