package org.puremvc.java.multicore.core.controller;

import java.util.HashMap;
import java.util.Map;
import org.puremvc.java.multicore.core.view.View;
import org.puremvc.java.multicore.interfaces.ICommand;
import org.puremvc.java.multicore.interfaces.IController;
import org.puremvc.java.multicore.interfaces.IFunction;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.observer.Observer;

public class Controller
  implements IController
{
  protected static Map<String, Controller> instanceMap = new HashMap();
  protected Map<String, ICommand> commandMap;
  protected String multitonKey;
  protected View view;

  protected Controller(String paramString)
  {
    this.multitonKey = paramString;
    instanceMap.put(this.multitonKey, this);
    this.commandMap = new HashMap();
    initializeController();
  }

  public static Controller getInstance(String paramString)
  {
    try
    {
      if (instanceMap.get(paramString) == null)
        new Controller(paramString);
      Controller localController = (Controller)instanceMap.get(paramString);
      return localController;
    }
    finally
    {
    }
  }

  public static void removeController(String paramString)
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

  public void clearController()
  {
    this.commandMap.clear();
  }

  public void executeCommand(INotification paramINotification)
  {
    ICommand localICommand = (ICommand)this.commandMap.get(paramINotification.getName());
    if (localICommand != null)
    {
      localICommand.initializeNotifier(this.multitonKey);
      localICommand.execute(paramINotification);
    }
  }

  public boolean hasCommand(String paramString)
  {
    return this.commandMap.containsKey(paramString);
  }

  protected void initializeController()
  {
    this.view = View.getInstance(this.multitonKey);
  }

  public void registerCommand(String paramString, ICommand paramICommand)
  {
    if (this.commandMap.put(paramString, paramICommand) != null)
      return;
    this.view.registerObserver(paramString, new Observer(new IFunction()
    {
      public void onNotification(INotification paramAnonymousINotification)
      {
        Controller.this.executeCommand(paramAnonymousINotification);
      }
    }
    , this));
  }

  public void removeCommand(String paramString)
  {
    if (hasCommand(paramString))
    {
      this.view.removeObserver(paramString, this);
      this.commandMap.remove(paramString);
    }
  }
}