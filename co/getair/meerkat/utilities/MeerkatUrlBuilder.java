package co.getair.meerkat.utilities;

import android.net.Uri;
import android.net.Uri.Builder;

public class MeerkatUrlBuilder
{
  private static final String HOST = "https://meerkatapp.co";
  private static final Uri HOST_URI = Uri.parse("https://meerkatapp.co");

  private static Uri.Builder buildUpon()
  {
    return HOST_URI.buildUpon();
  }

  public static Uri host()
  {
    return HOST_URI;
  }

  public static Uri scheduledBroadcast(String paramString1, String paramString2)
  {
    return buildUpon().appendPath(paramString1).appendPath(String.format("sch-%s", new Object[] { paramString2 })).build();
  }

  public static Uri user(String paramString)
  {
    return buildUpon().appendPath(paramString).build();
  }
}