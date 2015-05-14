package org.puremvc.java.multicore.core.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.puremvc.java.multicore.interfaces.IFunction;
import org.puremvc.java.multicore.interfaces.IMediator;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.interfaces.IObserver;
import org.puremvc.java.multicore.interfaces.IView;
import org.puremvc.java.multicore.patterns.observer.Observer;

public class View
  implements IView
{
  protected static Map<String, View> instanceMap = new HashMap();
  private HashMap<String, IMediator> mediatorMap;
  protected String multitonKey;
  private HashMap<String, List<IObserver>> observerMap;

  protected View(String paramString)
  {
    this.multitonKey = paramString;
    instanceMap.put(this.multitonKey, this);
    this.mediatorMap = new HashMap();
    this.observerMap = new HashMap();
    initializeView();
  }

  public static View getInstance(String paramString)
  {
    try
    {
      if (instanceMap.get(paramString) == null)
        new View(paramString);
      View localView = (View)instanceMap.get(paramString);
      return localView;
    }
    finally
    {
    }
  }

  public static void removeView(String paramString)
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

  public void clearView()
  {
    this.mediatorMap.clear();
  }

  public boolean hasMediator(String paramString)
  {
    return this.mediatorMap.containsKey(paramString);
  }

  protected void initializeView()
  {
  }

  public void notifyObservers(INotification paramINotification)
  {
    List localList = (List)this.observerMap.get(paramINotification.getName());
    if (localList != null)
    {
      Object[] arrayOfObject = (Object[])localList.toArray();
      for (int i = 0; i < arrayOfObject.length; i++)
        ((IObserver)arrayOfObject[i]).notifyObserver(paramINotification);
    }
  }

  public void registerMediator(final IMediator paramIMediator)
  {
    if (!this.mediatorMap.containsKey(paramIMediator.getMediatorName()))
    {
      paramIMediator.initializeNotifier(this.multitonKey);
      this.mediatorMap.put(paramIMediator.getMediatorName(), paramIMediator);
      String[] arrayOfString = paramIMediator.listNotificationInterests();
      if (arrayOfString.length != 0)
      {
        Observer localObserver = new Observer(new IFunction()
        {
          public void onNotification(INotification paramAnonymousINotification)
          {
            paramIMediator.handleNotification(paramAnonymousINotification);
          }
        }
        , paramIMediator);
        for (int i = 0; i < arrayOfString.length; i++)
          registerObserver(arrayOfString[i], localObserver);
      }
      paramIMediator.onRegister();
    }
  }

  public void registerObserver(String paramString, IObserver paramIObserver)
  {
    if (this.observerMap.get(paramString) == null)
      this.observerMap.put(paramString, new ArrayList());
    ((List)this.observerMap.get(paramString)).add(paramIObserver);
  }

  public IMediator removeMediator(String paramString)
  {
    IMediator localIMediator = (IMediator)this.mediatorMap.get(paramString);
    if (localIMediator != null)
    {
      String[] arrayOfString = localIMediator.listNotificationInterests();
      for (int i = 0; i < arrayOfString.length; i++)
        removeObserver(arrayOfString[i], localIMediator);
      this.mediatorMap.remove(paramString);
      localIMediator.onRemove();
    }
    return localIMediator;
  }

  public void removeObserver(String paramString, Object paramObject)
  {
    List localList = (List)this.observerMap.get(paramString);
    if (localList != null)
    {
      for (int i = 0; i < localList.size(); i++)
      {
        Observer localObserver = (Observer)localList.get(i);
        if (localObserver.compareNotifyContext(paramObject) == true)
          localList.remove(localObserver);
      }
      if (localList.size() == 0)
        this.observerMap.remove(paramString);
    }
  }

  public IMediator retrieveMediator(String paramString)
  {
    return (IMediator)this.mediatorMap.get(paramString);
  }
}