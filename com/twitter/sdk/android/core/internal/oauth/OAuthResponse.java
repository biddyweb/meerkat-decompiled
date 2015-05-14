package com.twitter.sdk.android.core.internal.oauth;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.twitter.sdk.android.core.TwitterAuthToken;

public class OAuthResponse
  implements Parcelable
{
  public static final Parcelable.Creator<OAuthResponse> CREATOR = new Parcelable.Creator()
  {
    public OAuthResponse createFromParcel(Parcel paramAnonymousParcel)
    {
      return new OAuthResponse(paramAnonymousParcel, null);
    }

    public OAuthResponse[] newArray(int paramAnonymousInt)
    {
      return new OAuthResponse[paramAnonymousInt];
    }
  };
  public final TwitterAuthToken authToken;
  public final long userId;
  public final String userName;

  private OAuthResponse(Parcel paramParcel)
  {
    this.authToken = ((TwitterAuthToken)paramParcel.readParcelable(TwitterAuthToken.class.getClassLoader()));
    this.userName = paramParcel.readString();
    this.userId = paramParcel.readLong();
  }

  public OAuthResponse(TwitterAuthToken paramTwitterAuthToken, String paramString, long paramLong)
  {
    this.authToken = paramTwitterAuthToken;
    this.userName = paramString;
    this.userId = paramLong;
  }

  public int describeContents()
  {
    return 0;
  }

  public String toString()
  {
    return "authToken=" + this.authToken + ",userName=" + this.userName + ",userId=" + this.userId;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeParcelable(this.authToken, paramInt);
    paramParcel.writeString(this.userName);
    paramParcel.writeLong(this.userId);
  }
}