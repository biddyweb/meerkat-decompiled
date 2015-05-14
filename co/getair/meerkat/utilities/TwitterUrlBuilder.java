package co.getair.meerkat.utilities;

public class TwitterUrlBuilder
{
  public static final String TWITTER_URL = "https://twitter.com";

  public static String forUser(String paramString)
  {
    return String.format("%s/%s", new Object[] { "https://twitter.com", paramString });
  }
}