package com.digits.sdk.android;

import com.twitter.sdk.android.core.TwitterApiException;
import com.twitter.sdk.android.core.TwitterException;
import retrofit.RetrofitError;

public class DigitsException extends RuntimeException
{
  private final int errorCode;

  DigitsException(String paramString)
  {
    this(paramString, -1);
  }

  DigitsException(String paramString, int paramInt)
  {
    super(paramString);
    this.errorCode = paramInt;
  }

  static DigitsException create(ErrorCodes paramErrorCodes, TwitterException paramTwitterException)
  {
    if ((paramTwitterException instanceof TwitterApiException))
    {
      TwitterApiException localTwitterApiException = (TwitterApiException)paramTwitterException;
      String str = getMessageForApiError(paramErrorCodes, localTwitterApiException);
      return createException(localTwitterApiException.getErrorCode(), str);
    }
    return new DigitsException(paramErrorCodes.getDefaultMessage());
  }

  private static DigitsException createException(int paramInt, String paramString)
  {
    if (paramInt == 285)
      return new AlreadyRegisteredException(paramString, paramInt);
    if (isUnrecoverable(paramInt))
      return new UnrecoverableException(paramString, paramInt);
    return new DigitsException(paramString, paramInt);
  }

  private static String getMessageForApiError(ErrorCodes paramErrorCodes, TwitterApiException paramTwitterApiException)
  {
    if (paramTwitterApiException.getRetrofitError().isNetworkError())
      return paramErrorCodes.getNetworkError();
    return paramErrorCodes.getMessage(paramTwitterApiException.getErrorCode());
  }

  private static boolean isUnrecoverable(int paramInt)
  {
    return (paramInt == 286) || (paramInt == 269) || (paramInt == 235) || (paramInt == 237) || (paramInt == 299) || (paramInt == 284);
  }

  public int getErrorCode()
  {
    return this.errorCode;
  }
}