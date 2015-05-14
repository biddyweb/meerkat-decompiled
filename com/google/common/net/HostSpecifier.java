package com.google.common.net;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.net.InetAddress;
import java.text.ParseException;
import javax.annotation.Nullable;

@Beta
public final class HostSpecifier
{
  private final String canonicalForm;

  private HostSpecifier(String paramString)
  {
    this.canonicalForm = paramString;
  }

  public static HostSpecifier from(String paramString)
    throws ParseException
  {
    String str1;
    try
    {
      HostSpecifier localHostSpecifier = fromValid(paramString);
      return localHostSpecifier;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      str1 = String.valueOf(paramString);
      if (str1.length() == 0);
    }
    for (String str2 = "Invalid host specifier: ".concat(str1); ; str2 = new String("Invalid host specifier: "))
    {
      ParseException localParseException = new ParseException(str2, 0);
      localParseException.initCause(localIllegalArgumentException);
      throw localParseException;
    }
  }

  public static HostSpecifier fromValid(String paramString)
  {
    HostAndPort localHostAndPort = HostAndPort.fromString(paramString);
    boolean bool;
    if (!localHostAndPort.hasPort())
      bool = true;
    while (true)
    {
      Preconditions.checkArgument(bool);
      String str1 = localHostAndPort.getHostText();
      try
      {
        InetAddress localInetAddress2 = InetAddresses.forString(str1);
        localInetAddress1 = localInetAddress2;
        if (localInetAddress1 != null)
        {
          return new HostSpecifier(InetAddresses.toUriString(localInetAddress1));
          bool = false;
          continue;
        }
        InternetDomainName localInternetDomainName = InternetDomainName.from(str1);
        if (localInternetDomainName.hasPublicSuffix())
          return new HostSpecifier(localInternetDomainName.toString());
        String str2 = String.valueOf(str1);
        if (str2.length() != 0);
        for (String str3 = "Domain name does not have a recognized public suffix: ".concat(str2); ; str3 = new String("Domain name does not have a recognized public suffix: "))
          throw new IllegalArgumentException(str3);
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        while (true)
          InetAddress localInetAddress1 = null;
      }
    }
  }

  public static boolean isValid(String paramString)
  {
    try
    {
      fromValid(paramString);
      return true;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
    }
    return false;
  }

  public boolean equals(@Nullable Object paramObject)
  {
    if (this == paramObject)
      return true;
    if ((paramObject instanceof HostSpecifier))
    {
      HostSpecifier localHostSpecifier = (HostSpecifier)paramObject;
      return this.canonicalForm.equals(localHostSpecifier.canonicalForm);
    }
    return false;
  }

  public int hashCode()
  {
    return this.canonicalForm.hashCode();
  }

  public String toString()
  {
    return this.canonicalForm;
  }
}