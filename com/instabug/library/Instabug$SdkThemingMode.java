package com.instabug.library;

public enum Instabug$SdkThemingMode
{
  static
  {
    APPCOMPAT_V7 = new SdkThemingMode("APPCOMPAT_V7", 3);
    APP_COMPAT_MATERIAL = new SdkThemingMode("APP_COMPAT_MATERIAL", 4);
    SHERLOCK = new SdkThemingMode("SHERLOCK", 5);
    SdkThemingMode[] arrayOfSdkThemingMode = new SdkThemingMode[6];
    arrayOfSdkThemingMode[0] = AUTO;
    arrayOfSdkThemingMode[1] = MANUAL;
    arrayOfSdkThemingMode[2] = MIN_SDK_14;
    arrayOfSdkThemingMode[3] = APPCOMPAT_V7;
    arrayOfSdkThemingMode[4] = APP_COMPAT_MATERIAL;
    arrayOfSdkThemingMode[5] = SHERLOCK;
  }
}