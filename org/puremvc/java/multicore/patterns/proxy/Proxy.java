package org.puremvc.java.multicore.patterns.proxy;

import org.puremvc.java.multicore.interfaces.IProxy;
import org.puremvc.java.multicore.patterns.observer.Notifier;

public class Proxy extends Notifier
  implements IProxy
{
  protected Object data = null;
  protected String proxyName = "Proxy";

  public Proxy()
  {
  }

  public Proxy(String paramString)
  {
    init(paramString);
  }

  public Proxy(String paramString, Object paramObject)
  {
    init(paramString, paramObject);
  }

  public Object getData()
  {
    return this.data;
  }

  public String getProxyName()
  {
    return this.proxyName;
  }

  protected void init(String paramString)
  {
    if (paramString != null)
      this.proxyName = paramString;
  }

  protected void init(String paramString, Object paramObject)
  {
    if (paramString != null)
      this.proxyName = paramString;
    if (paramObject != null)
      this.data = paramObject;
  }

  public void onRegister()
  {
  }

  public void onRemove()
  {
  }

  public void setData(Object paramObject)
  {
    this.data = paramObject;
  }
}