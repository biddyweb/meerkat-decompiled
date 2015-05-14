package com.twitter.sdk.android.core.identity;

import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.TwitterApiClient;
import com.twitter.sdk.android.core.TwitterSession;
import com.twitter.sdk.android.core.models.User;
import retrofit.http.GET;
import retrofit.http.Query;

class ShareEmailClient extends TwitterApiClient
{
  static final int RESULT_CODE_CANCELED = 0;
  static final int RESULT_CODE_ERROR = 1;
  static final int RESULT_CODE_OK = -1;
  static final String RESULT_DATA_EMAIL = "email";
  static final String RESULT_DATA_ERROR = "error";
  static final String RESULT_DATA_MSG = "msg";

  ShareEmailClient(TwitterSession paramTwitterSession)
  {
    super(paramTwitterSession);
  }

  protected void getEmail(Callback<User> paramCallback)
  {
    ((EmailService)getService(EmailService.class)).verifyCredentials(Boolean.valueOf(true), Boolean.valueOf(true), paramCallback);
  }

  static abstract interface EmailService
  {
    @GET("/1.1/account/verify_credentials.json?include_email=true")
    public abstract void verifyCredentials(@Query("include_entities") Boolean paramBoolean1, @Query("skip_status") Boolean paramBoolean2, Callback<User> paramCallback);
  }
}