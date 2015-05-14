package co.getair.meerkat.video.broadcast.googlecode.mp4parser.util;

import android.util.Log;

public class AndroidLogger extends Logger
{
  private static final String TAG = "isoparser";
  String name;

  public AndroidLogger(String paramString)
  {
    this.name = paramString;
  }

  public void logDebug(String paramString)
  {
    Log.d("isoparser", this.name + ":" + paramString);
  }

  public void logError(String paramString)
  {
    Log.e("isoparser", this.name + ":" + paramString);
  }

  public void logWarn(String paramString)
  {
    Log.w("isoparser", this.name + ":" + paramString);
  }
}