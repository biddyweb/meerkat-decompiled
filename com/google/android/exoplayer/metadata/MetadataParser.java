package com.google.android.exoplayer.metadata;

import java.io.IOException;

public abstract interface MetadataParser<T>
{
  public abstract boolean canParse(String paramString);

  public abstract T parse(byte[] paramArrayOfByte, int paramInt)
    throws IOException;
}