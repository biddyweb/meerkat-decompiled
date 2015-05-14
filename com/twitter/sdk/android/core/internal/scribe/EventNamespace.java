package com.twitter.sdk.android.core.internal.scribe;

import com.google.gson.annotations.SerializedName;

public class EventNamespace
{

  @SerializedName("action")
  public final String action;

  @SerializedName("client")
  public final String client;

  @SerializedName("component")
  public final String component;

  @SerializedName("element")
  public final String element;

  @SerializedName("page")
  public final String page;

  @SerializedName("section")
  public final String section;

  public EventNamespace(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6)
  {
    this.client = paramString1;
    this.page = paramString2;
    this.section = paramString3;
    this.component = paramString4;
    this.element = paramString5;
    this.action = paramString6;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    EventNamespace localEventNamespace;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localEventNamespace = (EventNamespace)paramObject;
      if (this.action != null)
      {
        if (this.action.equals(localEventNamespace.action));
      }
      else
        while (localEventNamespace.action != null)
          return false;
      if (this.client != null)
      {
        if (this.client.equals(localEventNamespace.client));
      }
      else
        while (localEventNamespace.client != null)
          return false;
      if (this.component != null)
      {
        if (this.component.equals(localEventNamespace.component));
      }
      else
        while (localEventNamespace.component != null)
          return false;
      if (this.element != null)
      {
        if (this.element.equals(localEventNamespace.element));
      }
      else
        while (localEventNamespace.element != null)
          return false;
      if (this.page != null)
      {
        if (this.page.equals(localEventNamespace.page));
      }
      else
        while (localEventNamespace.page != null)
          return false;
      if (this.section == null)
        break;
    }
    while (this.section.equals(localEventNamespace.section));
    while (true)
    {
      return false;
      if (localEventNamespace.section == null)
        break;
    }
  }

  public int hashCode()
  {
    int i;
    int k;
    label35: int n;
    label59: int i2;
    label85: int i3;
    if (this.client != null)
    {
      i = this.client.hashCode();
      int j = i * 31;
      if (this.page == null)
        break label155;
      k = this.page.hashCode();
      int m = 31 * (j + k);
      if (this.section == null)
        break label160;
      n = this.section.hashCode();
      int i1 = 31 * (m + n);
      if (this.component == null)
        break label166;
      i2 = this.component.hashCode();
      i3 = 31 * (i1 + i2);
      if (this.element == null)
        break label172;
    }
    label155: label160: label166: label172: for (int i4 = this.element.hashCode(); ; i4 = 0)
    {
      int i5 = 31 * (i3 + i4);
      String str = this.action;
      int i6 = 0;
      if (str != null)
        i6 = this.action.hashCode();
      return i5 + i6;
      i = 0;
      break;
      k = 0;
      break label35;
      n = 0;
      break label59;
      i2 = 0;
      break label85;
    }
  }

  public String toString()
  {
    return "client=" + this.client + ", page=" + this.page + ", section=" + this.section + ", component=" + this.component + ", element=" + this.element + ", action=" + this.action;
  }

  public static class Builder
  {
    private String action;
    private String client;
    private String component;
    private String element;
    private String page;
    private String section;

    public EventNamespace builder()
    {
      return new EventNamespace(this.client, this.page, this.section, this.component, this.element, this.action);
    }

    public Builder setAction(String paramString)
    {
      this.action = paramString;
      return this;
    }

    public Builder setClient(String paramString)
    {
      this.client = paramString;
      return this;
    }

    public Builder setComponent(String paramString)
    {
      this.component = paramString;
      return this;
    }

    public Builder setElement(String paramString)
    {
      this.element = paramString;
      return this;
    }

    public Builder setPage(String paramString)
    {
      this.page = paramString;
      return this;
    }

    public Builder setSection(String paramString)
    {
      this.section = paramString;
      return this;
    }
  }
}