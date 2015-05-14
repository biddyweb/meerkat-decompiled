package com.instabug.library;

public enum Instabug$SdkThemeSource
{
  static
  {
    CALLER_THEME = new SdkThemeSource("CALLER_THEME", 1);
    SdkThemeSource[] arrayOfSdkThemeSource = new SdkThemeSource[2];
    arrayOfSdkThemeSource[0] = OWN_THEME;
    arrayOfSdkThemeSource[1] = CALLER_THEME;
  }
}