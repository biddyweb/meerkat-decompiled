package com.crashlytics.android;

import java.io.InputStream;

class CrashlyticsPinningInfoProvider
  implements io.fabric.sdk.android.services.network.PinningInfoProvider
{
  private final PinningInfoProvider pinningInfo;

  public CrashlyticsPinningInfoProvider(PinningInfoProvider paramPinningInfoProvider)
  {
    this.pinningInfo = paramPinningInfoProvider;
  }

  public String getKeyStorePassword()
  {
    return this.pinningInfo.getKeyStorePassword();
  }

  public InputStream getKeyStoreStream()
  {
    return this.pinningInfo.getKeyStoreStream();
  }

  public long getPinCreationTimeInMillis()
  {
    return -1L;
  }

  public String[] getPins()
  {
    return this.pinningInfo.getPins();
  }
}