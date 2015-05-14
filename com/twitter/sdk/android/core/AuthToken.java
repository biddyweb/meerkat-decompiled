package com.twitter.sdk.android.core;

import com.twitter.sdk.android.core.internal.oauth.AuthHeaders;

public abstract class AuthToken
  implements AuthHeaders
{
  protected final long createdAt;

  public AuthToken()
  {
    this.createdAt = System.currentTimeMillis();
  }

  protected AuthToken(long paramLong)
  {
    this.createdAt = paramLong;
  }

  public abstract boolean isExpired();
}