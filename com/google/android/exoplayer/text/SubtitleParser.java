package com.google.android.exoplayer.text;

import java.io.IOException;
import java.io.InputStream;

public abstract interface SubtitleParser
{
  public abstract boolean canParse(String paramString);

  public abstract Subtitle parse(InputStream paramInputStream, String paramString, long paramLong)
    throws IOException;
}