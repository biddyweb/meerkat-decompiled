package com.google.android.exoplayer.util;

import android.net.Uri;
import com.google.android.exoplayer.ParserException;
import java.io.IOException;
import java.io.InputStream;

public abstract interface ManifestParser<T>
{
  public abstract T parse(InputStream paramInputStream, String paramString1, String paramString2, Uri paramUri)
    throws IOException, ParserException;
}