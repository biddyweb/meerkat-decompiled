package org.puremvc.java.multicore.core.model;

import java.util.HashMap;
import java.util.Map;
import org.puremvc.java.multicore.interfaces.IModel;
import org.puremvc.java.multicore.interfaces.IProxy;

public class Model
  implements IModel
{
  protected static Model instance;
  protected static Map<String, Model> instanceMap = new HashMap();
  protected String multitonKey;
  protected Map<String, IProxy> proxyMap;

  protected Model(String paramString)
  {
    this.multitonKey = paramString;
    instanceMap.put(this.multitonKey, this);
    this.proxyMap = new HashMap();
    initializeModel();
  }

  public static Model getInstance(String paramString)
  {
    try
    {
      if (instanceMap.get(paramString) == null)
        new Model(paramString);
      Model localModel = (Model)instanceMap.get(paramString);
      return localModel;
    }
    finally
    {
    }
  }

  public static void removeModel(String paramString)
  {
    try
    {
      instanceMap.remove(paramString);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void clearModel()
  {
    this.proxyMap.clear();
  }

  public boolean hasProxy(String paramString)
  {
    return this.proxyMap.containsKey(paramString);
  }

  protected void initializeModel()
  {
  }

  public void registerProxy(IProxy paramIProxy)
  {
    paramIProxy.initializeNotifier(this.multitonKey);
    this.proxyMap.put(paramIProxy.getProxyName(), paramIProxy);
    paramIProxy.onRegister();
  }

  public IProxy removeProxy(String paramString)
  {
    IProxy localIProxy = (IProxy)this.proxyMap.get(paramString);
    if (localIProxy != null)
    {
      this.proxyMap.remove(paramString);
      localIProxy.onRemove();
    }
    return localIProxy;
  }

  public IProxy retrieveProxy(String paramString)
  {
    return (IProxy)this.proxyMap.get(paramString);
  }
}