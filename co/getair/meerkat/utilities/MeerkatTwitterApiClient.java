package co.getair.meerkat.utilities;

import com.twitter.sdk.android.core.TwitterApiClient;
import com.twitter.sdk.android.core.TwitterSession;

public class MeerkatTwitterApiClient extends TwitterApiClient
{
  public MeerkatTwitterApiClient(TwitterSession paramTwitterSession)
  {
    super(paramTwitterSession);
  }

  public CustomService getCustomService()
  {
    return (CustomService)getService(CustomService.class);
  }
}