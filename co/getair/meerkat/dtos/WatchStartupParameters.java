package co.getair.meerkat.dtos;

import android.content.Context;

public class WatchStartupParameters
{
  private Context context;
  private String streamId;

  public WatchStartupParameters(Context paramContext, String paramString)
  {
    this.context = paramContext;
    this.streamId = paramString;
  }

  public Context getContext()
  {
    return this.context;
  }

  public String getStreamId()
  {
    return this.streamId;
  }
}