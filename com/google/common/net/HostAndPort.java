package com.google.common.net;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import java.io.Serializable;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

@Beta
@GwtCompatible
@Immutable
public final class HostAndPort
  implements Serializable
{
  private static final int NO_PORT = -1;
  private static final long serialVersionUID;
  private final boolean hasBracketlessColons;
  private final String host;
  private final int port;

  private HostAndPort(String paramString, int paramInt, boolean paramBoolean)
  {
    this.host = paramString;
    this.port = paramInt;
    this.hasBracketlessColons = paramBoolean;
  }

  public static HostAndPort fromHost(String paramString)
  {
    HostAndPort localHostAndPort = fromString(paramString);
    if (!localHostAndPort.hasPort());
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool, "Host has a port: %s", new Object[] { paramString });
      return localHostAndPort;
    }
  }

  public static HostAndPort fromParts(String paramString, int paramInt)
  {
    boolean bool1 = isValidPort(paramInt);
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Integer.valueOf(paramInt);
    Preconditions.checkArgument(bool1, "Port out of range: %s", arrayOfObject);
    HostAndPort localHostAndPort = fromString(paramString);
    if (!localHostAndPort.hasPort());
    for (boolean bool2 = true; ; bool2 = false)
    {
      Preconditions.checkArgument(bool2, "Host has a port: %s", new Object[] { paramString });
      return new HostAndPort(localHostAndPort.host, paramInt, localHostAndPort.hasBracketlessColons);
    }
  }

  public static HostAndPort fromString(String paramString)
  {
    Preconditions.checkNotNull(paramString);
    boolean bool1 = false;
    String str1;
    String str2;
    if (paramString.startsWith("["))
    {
      String[] arrayOfString = getHostAndPortFromBracketedHost(paramString);
      str1 = arrayOfString[0];
      str2 = arrayOfString[1];
    }
    label181: String str3;
    while (true)
    {
      int j = -1;
      boolean bool2;
      if (!Strings.isNullOrEmpty(str2))
      {
        if (str2.startsWith("+"))
          break label181;
        bool2 = true;
        Preconditions.checkArgument(bool2, "Unparseable port number: %s", new Object[] { paramString });
      }
      try
      {
        int k = Integer.parseInt(str2);
        j = k;
        Preconditions.checkArgument(isValidPort(j), "Port number out of range: %s", new Object[] { paramString });
        return new HostAndPort(str1, j, bool1);
        int i = paramString.indexOf(':');
        if ((i >= 0) && (paramString.indexOf(':', i + 1) == -1))
        {
          str1 = paramString.substring(0, i);
          str2 = paramString.substring(i + 1);
          bool1 = false;
        }
        else
        {
          str1 = paramString;
          if (i >= 0);
          for (bool1 = true; ; bool1 = false)
          {
            str2 = null;
            break;
          }
          bool2 = false;
        }
      }
      catch (NumberFormatException localNumberFormatException)
      {
        str3 = String.valueOf(paramString);
        if (str3.length() == 0);
      }
    }
    for (String str4 = "Unparseable port number: ".concat(str3); ; str4 = new String("Unparseable port number: "))
      throw new IllegalArgumentException(str4);
  }

  private static String[] getHostAndPortFromBracketedHost(String paramString)
  {
    boolean bool1;
    int j;
    if (paramString.charAt(0) == '[')
    {
      bool1 = true;
      Preconditions.checkArgument(bool1, "Bracketed host-port string must start with a bracket: %s", new Object[] { paramString });
      int i = paramString.indexOf(':');
      j = paramString.lastIndexOf(']');
      if ((i <= -1) || (j <= i))
        break label106;
    }
    String str;
    label106: for (boolean bool2 = true; ; bool2 = false)
    {
      Preconditions.checkArgument(bool2, "Invalid bracketed host/port: %s", new Object[] { paramString });
      str = paramString.substring(1, j);
      if (j + 1 != paramString.length())
        break label112;
      return new String[] { str, "" };
      bool1 = false;
      break;
    }
    label112: if (paramString.charAt(j + 1) == ':');
    for (boolean bool3 = true; ; bool3 = false)
    {
      Preconditions.checkArgument(bool3, "Only a colon may follow a close bracket: %s", new Object[] { paramString });
      for (int k = j + 2; k < paramString.length(); k++)
        Preconditions.checkArgument(Character.isDigit(paramString.charAt(k)), "Port must be numeric: %s", new Object[] { paramString });
    }
    String[] arrayOfString = new String[2];
    arrayOfString[0] = str;
    arrayOfString[1] = paramString.substring(j + 2);
    return arrayOfString;
  }

  private static boolean isValidPort(int paramInt)
  {
    return (paramInt >= 0) && (paramInt <= 65535);
  }

  public boolean equals(@Nullable Object paramObject)
  {
    if (this == paramObject);
    HostAndPort localHostAndPort;
    do
    {
      return true;
      if (!(paramObject instanceof HostAndPort))
        break;
      localHostAndPort = (HostAndPort)paramObject;
    }
    while ((Objects.equal(this.host, localHostAndPort.host)) && (this.port == localHostAndPort.port) && (this.hasBracketlessColons == localHostAndPort.hasBracketlessColons));
    return false;
    return false;
  }

  public String getHostText()
  {
    return this.host;
  }

  public int getPort()
  {
    Preconditions.checkState(hasPort());
    return this.port;
  }

  public int getPortOrDefault(int paramInt)
  {
    if (hasPort())
      paramInt = this.port;
    return paramInt;
  }

  public boolean hasPort()
  {
    return this.port >= 0;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = this.host;
    arrayOfObject[1] = Integer.valueOf(this.port);
    arrayOfObject[2] = Boolean.valueOf(this.hasBracketlessColons);
    return Objects.hashCode(arrayOfObject);
  }

  public HostAndPort requireBracketsForIPv6()
  {
    if (!this.hasBracketlessColons);
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = this.host;
      Preconditions.checkArgument(bool, "Possible bracketless IPv6 literal: %s", arrayOfObject);
      return this;
    }
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(8 + this.host.length());
    if (this.host.indexOf(':') >= 0)
      localStringBuilder.append('[').append(this.host).append(']');
    while (true)
    {
      if (hasPort())
        localStringBuilder.append(':').append(this.port);
      return localStringBuilder.toString();
      localStringBuilder.append(this.host);
    }
  }

  public HostAndPort withDefaultPort(int paramInt)
  {
    Preconditions.checkArgument(isValidPort(paramInt));
    if ((hasPort()) || (this.port == paramInt))
      return this;
    return new HostAndPort(this.host, paramInt, this.hasBracketlessColons);
  }
}