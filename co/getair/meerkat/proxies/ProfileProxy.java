package co.getair.meerkat.proxies;

import android.content.Context;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class ProfileProxy extends Proxy
{
  private Context context;

  public ProfileProxy(String paramString, Context paramContext)
  {
    super(paramString);
    this.context = paramContext;
  }
}