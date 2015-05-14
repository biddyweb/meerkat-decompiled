package com.twitter.sdk.android.core.internal;

public class TwitterApiConstants
{
  public static class Base
  {
    public static final String FIELD_ID = "id";
    public static final String PARAM_ID = "id";
  }

  public static class Errors extends TwitterApiConstants.Base
  {
    public static final int APP_AUTH_ERROR_CODE = 89;
    public static final String ERRORS = "errors";
    public static final int GUEST_AUTH_ERROR_CODE = 239;
    public static final int LEGACY_ERROR;
  }
}