package org.puremvc.java.multicore.patterns.facade;

import java.util.HashMap;
import java.util.Map;
import org.puremvc.java.multicore.core.controller.Controller;
import org.puremvc.java.multicore.core.model.Model;
import org.puremvc.java.multicore.core.view.View;
import org.puremvc.java.multicore.interfaces.ICommand;
import org.puremvc.java.multicore.interfaces.IFacade;
import org.puremvc.java.multicore.interfaces.IMediator;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.interfaces.IProxy;
import org.puremvc.java.multicore.patterns.observer.Notification;

public class Facade
  implements IFacade
{
  protected static Map<String, Facade> instanceMap = new HashMap();
  protected Controller controller = null;
  protected Model model = null;
  protected String multitonKey;
  protected View view = null;

  protected Facade()
  {
  }

  protected Facade(String paramString)
  {
    init(paramString);
  }

  // ERROR //
  public static Facade getInstance(String paramString)
  {
    // Byte code:
    //   0: ldc 2
    //   2: monitorenter
    //   3: getstatic 26\011org/puremvc/java/multicore/patterns/facade/Facade:instanceMap\011Ljava/util/Map;
    //   6: aload_0
    //   7: invokeinterface 47 2 0
    //   12: astore_2
    //   13: aload_2
    //   14: ifnonnull +12 -> 26
    //   17: new 2\011org/puremvc/java/multicore/patterns/facade/Facade
    //   20: dup
    //   21: aload_0
    //   22: invokespecial 49\011org/puremvc/java/multicore/patterns/facade/Facade:<init>\011(Ljava/lang/String;)V
    //   25: pop
    //   26: getstatic 26\011org/puremvc/java/multicore/patterns/facade/Facade:instanceMap\011Ljava/util/Map;
    //   29: aload_0
    //   30: invokeinterface 47 2 0
    //   35: checkcast 2\011org/puremvc/java/multicore/patterns/facade/Facade
    //   38: astore_3
    //   39: ldc 2
    //   41: monitorexit
    //   42: aload_3
    //   43: areturn
    //   44: astore_1
    //   45: ldc 2
    //   47: monitorexit
    //   48: aload_1
    //   49: athrow
    //   50: astore 5
    //   52: goto -26 -> 26
    //
    // Exception table:
    //   from\011to\011target\011type
    //   3\01113\01144\011finally
    //   17\01126\01144\011finally
    //   26\01139\01144\011finally
    //   17\01126\01150\011java/lang/Exception
  }

  public static boolean hasCore(String paramString)
  {
    try
    {
      boolean bool = instanceMap.containsKey(paramString);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private void notifyObservers(INotification paramINotification)
  {
    if (this.view != null)
      this.view.notifyObservers(paramINotification);
  }

  public static void removeCore(String paramString)
  {
    try
    {
      Model.removeModel(paramString);
      View.removeView(paramString);
      Controller.removeController(paramString);
      instanceMap.remove(paramString);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void clearFacade()
  {
    this.model.clearModel();
    this.view.clearView();
    this.controller.clearController();
    this.model = null;
    this.view = null;
    this.controller = null;
  }

  public boolean hasCommand(String paramString)
  {
    return this.controller.hasCommand(paramString);
  }

  public boolean hasMediator(String paramString)
  {
    return this.view.hasMediator(paramString);
  }

  public boolean hasProxy(String paramString)
  {
    return this.model.hasProxy(paramString);
  }

  protected void init(String paramString)
  {
    if (instanceMap.get(paramString) != null)
      throw new RuntimeException(paramString + " Facade already constructed");
    initializeNotifier(paramString);
    instanceMap.put(paramString, this);
    initializeFacade();
  }

  protected void initializeController()
  {
    if (this.controller != null)
      return;
    this.controller = Controller.getInstance(this.multitonKey);
  }

  protected void initializeFacade()
  {
    initializeModel();
    initializeController();
    initializeView();
  }

  protected void initializeModel()
  {
    if (this.model != null)
      return;
    this.model = Model.getInstance(this.multitonKey);
  }

  public void initializeNotifier(String paramString)
  {
    this.multitonKey = paramString;
  }

  protected void initializeView()
  {
    if (this.view != null)
      return;
    this.view = View.getInstance(this.multitonKey);
  }

  public void registerCommand(String paramString, ICommand paramICommand)
  {
    this.controller.registerCommand(paramString, paramICommand);
  }

  public void registerMediator(IMediator paramIMediator)
  {
    if (this.view != null)
      this.view.registerMediator(paramIMediator);
  }

  public void registerProxy(IProxy paramIProxy)
  {
    this.model.registerProxy(paramIProxy);
  }

  public void removeCommand(String paramString)
  {
    this.controller.removeCommand(paramString);
  }

  public IMediator removeMediator(String paramString)
  {
    if (this.view != null)
      return this.view.removeMediator(paramString);
    return null;
  }

  public IProxy removeProxy(String paramString)
  {
    if (this.model != null)
      return this.model.removeProxy(paramString);
    return null;
  }

  public IMediator retrieveMediator(String paramString)
  {
    return this.view.retrieveMediator(paramString);
  }

  public IProxy retrieveProxy(String paramString)
  {
    return this.model.retrieveProxy(paramString);
  }

  public void sendNotification(String paramString)
  {
    sendNotification(paramString, null, null);
  }

  public void sendNotification(String paramString, Object paramObject)
  {
    sendNotification(paramString, paramObject, null);
  }

  public void sendNotification(String paramString1, Object paramObject, String paramString2)
  {
    notifyObservers(new Notification(paramString1, paramObject, paramString2));
  }
}