package io.fabric.sdk.android.services.network;

import java.io.InputStream;

public abstract interface PinningInfoProvider
{
  public static final long PIN_CREATION_TIME_UNDEFINED = -1L;

  public abstract String getKeyStorePassword();

  public abstract InputStream getKeyStoreStream();

  public abstract long getPinCreationTimeInMillis();

  public abstract String[] getPins();
}