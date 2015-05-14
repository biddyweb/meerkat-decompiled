package com.twitter.sdk.android.core.internal.scribe;

public class ScribeConfig
{
  public static final String BASE_URL = "https://api.twitter.com";
  public static final int DEFAULT_MAX_FILES_TO_KEEP = 100;
  public static final int DEFAULT_SEND_INTERVAL_SECONDS = 600;
  public final String baseUrl;
  public final boolean isEnabled;
  public final int maxFilesToKeep;
  public final String pathType;
  public final String pathVersion;
  public final int sendIntervalSeconds;
  public final String sequence;
  public final String userAgent;

  public ScribeConfig(boolean paramBoolean, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt1, int paramInt2)
  {
    this.isEnabled = paramBoolean;
    this.baseUrl = paramString1;
    this.pathVersion = paramString2;
    this.pathType = paramString3;
    this.sequence = paramString4;
    this.userAgent = paramString5;
    this.maxFilesToKeep = paramInt1;
    this.sendIntervalSeconds = paramInt2;
  }
}