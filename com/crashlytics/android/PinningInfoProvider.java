package com.crashlytics.android;

import java.io.InputStream;

public abstract interface PinningInfoProvider
{
  public abstract String getKeyStorePassword();

  public abstract InputStream getKeyStoreStream();

  public abstract String[] getPins();
}