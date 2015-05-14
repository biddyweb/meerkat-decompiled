package com.digits.sdk.android;

import android.content.Context;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.Result;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.internal.oauth.OAuth2Token;

class DigitsClient$1 extends DigitsCallback<OAuth2Token>
{
  DigitsClient$1(DigitsClient paramDigitsClient, Context paramContext, DigitsController paramDigitsController, String paramString, Callback paramCallback)
  {
    super(paramContext, paramDigitsController);
  }

  public void success(Result<OAuth2Token> paramResult)
  {
    DigitsSession localDigitsSession = DigitsClient.access$000(this.this$0, paramResult);
    this.this$0.digitsAPIProvider = new DigitsAPIProvider(localDigitsSession, DigitsClient.access$100(this.this$0).getAuthConfig(), DigitsClient.access$100(this.this$0).getSSLSocketFactory(), DigitsClient.access$200(this.this$0).getExecutorService());
    this.this$0.digitsAPIProvider.getDeviceService().register(this.val$phoneNumber, "third_party_confirmation_code", Boolean.valueOf(true), this.val$callback);
  }
}