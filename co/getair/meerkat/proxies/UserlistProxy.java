package co.getair.meerkat.proxies;

import android.content.Context;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class UserlistProxy extends Proxy
{
  private Context context;

  public UserlistProxy(String paramString, Context paramContext)
  {
    super(paramString);
    this.context = paramContext;
  }
}