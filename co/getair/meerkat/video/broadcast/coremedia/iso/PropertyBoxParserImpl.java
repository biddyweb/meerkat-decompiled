package co.getair.meerkat.video.broadcast.coremedia.iso;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PropertyBoxParserImpl extends AbstractBoxParser
{
  static String[] EMPTY_STRING_ARRAY = new String[0];
  StringBuilder buildLookupStrings = new StringBuilder();
  String clazzName;
  Pattern constuctorPattern = Pattern.compile("(.*)\\((.*?)\\)");
  Properties mapping;
  String[] param;

  public PropertyBoxParserImpl(Properties paramProperties)
  {
    this.mapping = paramProperties;
  }

  // ERROR //
  public PropertyBoxParserImpl(String[] paramArrayOfString)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokespecial 25\011co/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser:<init>\011()V
    //   4: aload_0
    //   5: ldc 27
    //   7: invokestatic 33\011java/util/regex/Pattern:compile\011(Ljava/lang/String;)Ljava/util/regex/Pattern;
    //   10: putfield 35\011co/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl:constuctorPattern\011Ljava/util/regex/Pattern;
    //   13: aload_0
    //   14: new 37\011java/lang/StringBuilder
    //   17: dup
    //   18: invokespecial 38\011java/lang/StringBuilder:<init>\011()V
    //   21: putfield 40\011co/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl:buildLookupStrings\011Ljava/lang/StringBuilder;
    //   24: aload_0
    //   25: invokevirtual 51\011java/lang/Object:getClass\011()Ljava/lang/Class;
    //   28: ldc 53
    //   30: invokevirtual 59\011java/lang/Class:getResourceAsStream\011(Ljava/lang/String;)Ljava/io/InputStream;
    //   33: astore_2
    //   34: aload_0
    //   35: new 61\011java/util/Properties
    //   38: dup
    //   39: invokespecial 62\011java/util/Properties:<init>\011()V
    //   42: putfield 42\011co/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl:mapping\011Ljava/util/Properties;
    //   45: aload_0
    //   46: getfield 42\011co/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl:mapping\011Ljava/util/Properties;
    //   49: aload_2
    //   50: invokevirtual 66\011java/util/Properties:load\011(Ljava/io/InputStream;)V
    //   53: invokestatic 72\011java/lang/Thread:currentThread\011()Ljava/lang/Thread;
    //   56: invokevirtual 76\011java/lang/Thread:getContextClassLoader\011()Ljava/lang/ClassLoader;
    //   59: astore 6
    //   61: aload 6
    //   63: ifnonnull +8 -> 71
    //   66: invokestatic 81\011java/lang/ClassLoader:getSystemClassLoader\011()Ljava/lang/ClassLoader;
    //   69: astore 6
    //   71: aload 6
    //   73: ldc 83
    //   75: invokevirtual 87\011java/lang/ClassLoader:getResources\011(Ljava/lang/String;)Ljava/util/Enumeration;
    //   78: astore 7
    //   80: aload 7
    //   82: invokeinterface 93 1 0
    //   87: ifeq +64 -> 151
    //   90: aload 7
    //   92: invokeinterface 97 1 0
    //   97: checkcast 99\011java/net/URL
    //   100: invokevirtual 103\011java/net/URL:openStream\011()Ljava/io/InputStream;
    //   103: astore 12
    //   105: aload_0
    //   106: getfield 42\011co/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl:mapping\011Ljava/util/Properties;
    //   109: aload 12
    //   111: invokevirtual 66\011java/util/Properties:load\011(Ljava/io/InputStream;)V
    //   114: aload 12
    //   116: invokevirtual 108\011java/io/InputStream:close\011()V
    //   119: goto -39 -> 80
    //   122: astore 5
    //   124: new 110\011java/lang/RuntimeException
    //   127: dup
    //   128: aload 5
    //   130: invokespecial 113\011java/lang/RuntimeException:<init>\011(Ljava/lang/Throwable;)V
    //   133: athrow
    //   134: astore_3
    //   135: aload_2
    //   136: invokevirtual 108\011java/io/InputStream:close\011()V
    //   139: aload_3
    //   140: athrow
    //   141: astore 13
    //   143: aload 12
    //   145: invokevirtual 108\011java/io/InputStream:close\011()V
    //   148: aload 13
    //   150: athrow
    //   151: aload_1
    //   152: arraylength
    //   153: istore 8
    //   155: iconst_0
    //   156: istore 9
    //   158: iload 9
    //   160: iload 8
    //   162: if_icmpge +31 -> 193
    //   165: aload_1
    //   166: iload 9
    //   168: aaload
    //   169: astore 10
    //   171: aload_0
    //   172: getfield 42\011co/getair/meerkat/video/broadcast/coremedia/iso/PropertyBoxParserImpl:mapping\011Ljava/util/Properties;
    //   175: aload_0
    //   176: invokevirtual 51\011java/lang/Object:getClass\011()Ljava/lang/Class;
    //   179: aload 10
    //   181: invokevirtual 59\011java/lang/Class:getResourceAsStream\011(Ljava/lang/String;)Ljava/io/InputStream;
    //   184: invokevirtual 66\011java/util/Properties:load\011(Ljava/io/InputStream;)V
    //   187: iinc 9 1
    //   190: goto -32 -> 158
    //   193: aload_2
    //   194: invokevirtual 108\011java/io/InputStream:close\011()V
    //   197: return
    //   198: astore 11
    //   200: aload 11
    //   202: invokevirtual 116\011java/io/IOException:printStackTrace\011()V
    //   205: return
    //   206: astore 4
    //   208: aload 4
    //   210: invokevirtual 116\011java/io/IOException:printStackTrace\011()V
    //   213: goto -74 -> 139
    //
    // Exception table:
    //   from\011to\011target\011type
    //   45\01161\011122\011java/io/IOException
    //   66\01171\011122\011java/io/IOException
    //   71\01180\011122\011java/io/IOException
    //   80\011105\011122\011java/io/IOException
    //   114\011119\011122\011java/io/IOException
    //   143\011151\011122\011java/io/IOException
    //   151\011155\011122\011java/io/IOException
    //   165\011187\011122\011java/io/IOException
    //   34\01145\011134\011finally
    //   45\01161\011134\011finally
    //   66\01171\011134\011finally
    //   71\01180\011134\011finally
    //   80\011105\011134\011finally
    //   114\011119\011134\011finally
    //   124\011134\011134\011finally
    //   143\011151\011134\011finally
    //   151\011155\011134\011finally
    //   165\011187\011134\011finally
    //   105\011114\011141\011finally
    //   193\011197\011198\011java/io/IOException
    //   135\011139\011206\011java/io/IOException
  }

  public Box createBox(String paramString1, byte[] paramArrayOfByte, String paramString2)
  {
    invoke(paramString1, paramArrayOfByte, paramString2);
    while (true)
    {
      int i;
      try
      {
        localClass = Class.forName(this.clazzName);
        if (this.param.length > 0)
        {
          arrayOfClass = new Class[this.param.length];
          arrayOfObject = new Object[this.param.length];
          i = 0;
          if (i < this.param.length)
            if ("userType".equals(this.param[i]))
            {
              arrayOfObject[i] = paramArrayOfByte;
              arrayOfClass[i] = [B.class;
            }
            else if ("type".equals(this.param[i]))
            {
              arrayOfObject[i] = paramString1;
              arrayOfClass[i] = String.class;
            }
        }
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        throw new RuntimeException(localClassNotFoundException);
        if ("parent".equals(this.param[i]))
        {
          arrayOfObject[i] = paramString2;
          arrayOfClass[i] = String.class;
        }
      }
      catch (InstantiationException localInstantiationException)
      {
        throw new RuntimeException(localInstantiationException);
        throw new InternalError("No such param: " + this.param[i]);
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        Class localClass;
        Class[] arrayOfClass;
        Object[] arrayOfObject;
        throw new RuntimeException(localIllegalAccessException);
        return (Box)localClass.getConstructor(arrayOfClass).newInstance(arrayOfObject);
        Box localBox = (Box)localClass.newInstance();
        return localBox;
      }
      catch (InvocationTargetException localInvocationTargetException)
      {
        throw new RuntimeException(localInvocationTargetException);
      }
      catch (NoSuchMethodException localNoSuchMethodException)
      {
        throw new RuntimeException(localNoSuchMethodException);
      }
      i++;
    }
  }

  public void invoke(String paramString1, byte[] paramArrayOfByte, String paramString2)
  {
    String str1;
    if (paramArrayOfByte != null)
    {
      if (!"uuid".equals(paramString1))
        throw new RuntimeException("we have a userType but no uuid box type. Something's wrong");
      str1 = this.mapping.getProperty("uuid[" + Hex.encodeHex(paramArrayOfByte).toUpperCase() + "]");
      if (str1 == null)
        str1 = this.mapping.getProperty(paramString2 + "-uuid[" + Hex.encodeHex(paramArrayOfByte).toUpperCase() + "]");
      if (str1 == null)
        str1 = this.mapping.getProperty("uuid");
    }
    while (true)
    {
      if (str1 == null)
        str1 = this.mapping.getProperty("default");
      if (str1 != null)
        break;
      throw new RuntimeException("No box object found for " + paramString1);
      str1 = this.mapping.getProperty(paramString1);
      if (str1 == null)
      {
        String str2 = paramString2 + '-' + paramString1;
        this.buildLookupStrings.setLength(0);
        str1 = this.mapping.getProperty(str2);
      }
    }
    if (!str1.endsWith(")"))
    {
      this.param = EMPTY_STRING_ARRAY;
      this.clazzName = str1;
      return;
    }
    Matcher localMatcher = this.constuctorPattern.matcher(str1);
    if (!localMatcher.matches())
      throw new RuntimeException("Cannot work with that constructor: " + str1);
    this.clazzName = localMatcher.group(1);
    if (localMatcher.group(2).length() == 0)
    {
      this.param = EMPTY_STRING_ARRAY;
      return;
    }
    if (localMatcher.group(2).length() > 0);
    for (String[] arrayOfString = localMatcher.group(2).split(","); ; arrayOfString = new String[0])
    {
      this.param = arrayOfString;
      return;
    }
  }
}