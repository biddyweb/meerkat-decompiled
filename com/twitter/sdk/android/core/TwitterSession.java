package com.twitter.sdk.android.core;

import android.text.TextUtils;
import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import io.fabric.sdk.android.services.persistence.SerializationStrategy;

public class TwitterSession extends Session<TwitterAuthToken>
{
  public static final long LOGGED_OUT_USER_ID = 0L;
  public static final long UNKNOWN_USER_ID = -1L;
  public static final String UNKNOWN_USER_NAME = "";

  @SerializedName("user_name")
  private final String userName;

  public TwitterSession(TwitterAuthToken paramTwitterAuthToken, long paramLong, String paramString)
  {
    super(paramTwitterAuthToken, paramLong);
    if (paramTwitterAuthToken == null)
      throw new IllegalArgumentException("AuthToken must not be null.");
    this.userName = paramString;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    TwitterSession localTwitterSession;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      if (!super.equals(paramObject))
        return false;
      localTwitterSession = (TwitterSession)paramObject;
      if (this.userName == null)
        break;
    }
    while (this.userName.equals(localTwitterSession.userName));
    while (true)
    {
      return false;
      if (localTwitterSession.userName == null)
        break;
    }
  }

  public long getUserId()
  {
    return getId();
  }

  public String getUserName()
  {
    return this.userName;
  }

  public int hashCode()
  {
    int i = 31 * super.hashCode();
    if (this.userName != null);
    for (int j = this.userName.hashCode(); ; j = 0)
      return i + j;
  }

  static class Serializer
    implements SerializationStrategy<TwitterSession>
  {
    private final Gson gson = new Gson();

    public TwitterSession deserialize(String paramString)
    {
      if (!TextUtils.isEmpty(paramString))
        try
        {
          TwitterSession localTwitterSession = (TwitterSession)this.gson.fromJson(paramString, TwitterSession.class);
          return localTwitterSession;
        }
        catch (Exception localException)
        {
          Fabric.getLogger().d("Twitter", localException.getMessage());
        }
      return null;
    }

    public String serialize(TwitterSession paramTwitterSession)
    {
      if ((paramTwitterSession != null) && (paramTwitterSession.getAuthToken() != null))
        try
        {
          String str = this.gson.toJson(paramTwitterSession);
          return str;
        }
        catch (Exception localException)
        {
          Fabric.getLogger().d("Twitter", localException.getMessage());
        }
      return "";
    }
  }
}