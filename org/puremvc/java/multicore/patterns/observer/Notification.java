package org.puremvc.java.multicore.patterns.observer;

import org.puremvc.java.multicore.interfaces.INotification;

public class Notification
  implements INotification
{
  private Object body = null;
  private String name = null;
  private String type = null;

  public Notification(String paramString)
  {
    this.name = paramString;
    this.body = null;
    this.type = null;
  }

  public Notification(String paramString, Object paramObject)
  {
    this.name = paramString;
    this.body = paramObject;
    this.type = null;
  }

  public Notification(String paramString1, Object paramObject, String paramString2)
  {
    this.name = paramString1;
    this.body = paramObject;
    this.type = paramString2;
  }

  public Object getBody()
  {
    return this.body;
  }

  public String getName()
  {
    return this.name;
  }

  public String getType()
  {
    return this.type;
  }

  public void setBody(Object paramObject)
  {
    this.body = paramObject;
  }

  public void setType(String paramString)
  {
    this.type = paramString;
  }

  public String toString()
  {
    String str1 = "Notification Name: " + getName() + " Body:";
    if (this.body != null);
    for (String str2 = str1 + this.body.toString() + " Type:"; this.type != null; str2 = str1 + "null Type:")
      return str2 + this.type;
    return str2 + "null ";
  }
}