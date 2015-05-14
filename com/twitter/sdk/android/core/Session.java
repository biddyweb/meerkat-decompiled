package com.twitter.sdk.android.core;

import com.google.gson.annotations.SerializedName;

public class Session<T extends AuthToken>
{

  @SerializedName("auth_token")
  private final T authToken;

  @SerializedName("id")
  private final long id;

  public Session(T paramT, long paramLong)
  {
    this.authToken = paramT;
    this.id = paramLong;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    Session localSession;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localSession = (Session)paramObject;
      if (this.id != localSession.id)
        return false;
      if (this.authToken == null)
        break;
    }
    while (this.authToken.equals(localSession.authToken));
    while (true)
    {
      return false;
      if (localSession.authToken == null)
        break;
    }
  }

  public T getAuthToken()
  {
    return this.authToken;
  }

  public long getId()
  {
    return this.id;
  }

  public int hashCode()
  {
    if (this.authToken != null);
    for (int i = this.authToken.hashCode(); ; i = 0)
      return i * 31 + (int)(this.id ^ this.id >>> 32);
  }
}