package com.google.i18n.phonenumbers;

import java.io.InputStream;

public abstract interface MetadataLoader
{
  public abstract InputStream loadMetadata(String paramString);
}