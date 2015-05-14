package org.joda.time.tz;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.SoftReference;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import org.joda.time.DateTimeZone;

public class ZoneInfoProvider
  implements Provider
{
  private final File iFileDir;
  private final ClassLoader iLoader;
  private final String iResourcePath;
  private final Set<String> iZoneInfoKeys;
  private final Map<String, Object> iZoneInfoMap;

  public ZoneInfoProvider(File paramFile)
    throws IOException
  {
    if (paramFile == null)
      throw new IllegalArgumentException("No file directory provided");
    if (!paramFile.exists())
      throw new IOException("File directory doesn't exist: " + paramFile);
    if (!paramFile.isDirectory())
      throw new IOException("File doesn't refer to a directory: " + paramFile);
    this.iFileDir = paramFile;
    this.iResourcePath = null;
    this.iLoader = null;
    this.iZoneInfoMap = loadZoneInfoMap(openResource("ZoneInfoMap"));
    this.iZoneInfoKeys = Collections.unmodifiableSortedSet(new TreeSet(this.iZoneInfoMap.keySet()));
  }

  public ZoneInfoProvider(String paramString)
    throws IOException
  {
    this(paramString, null, false);
  }

  public ZoneInfoProvider(String paramString, ClassLoader paramClassLoader)
    throws IOException
  {
    this(paramString, paramClassLoader, true);
  }

  private ZoneInfoProvider(String paramString, ClassLoader paramClassLoader, boolean paramBoolean)
    throws IOException
  {
    if (paramString == null)
      throw new IllegalArgumentException("No resource path provided");
    if (!paramString.endsWith("/"))
      paramString = paramString + '/';
    this.iFileDir = null;
    this.iResourcePath = paramString;
    if ((paramClassLoader == null) && (!paramBoolean))
      paramClassLoader = getClass().getClassLoader();
    this.iLoader = paramClassLoader;
    this.iZoneInfoMap = loadZoneInfoMap(openResource("ZoneInfoMap"));
    this.iZoneInfoKeys = Collections.unmodifiableSortedSet(new TreeSet(this.iZoneInfoMap.keySet()));
  }

  // ERROR //
  private DateTimeZone loadZoneData(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_1
    //   2: invokespecial 72\011org/joda/time/tz/ZoneInfoProvider:openResource\011(Ljava/lang/String;)Ljava/io/InputStream;
    //   5: astore 8
    //   7: aload 8
    //   9: astore_3
    //   10: aload_3
    //   11: aload_1
    //   12: invokestatic 132\011org/joda/time/tz/DateTimeZoneBuilder:readFrom\011(Ljava/io/InputStream;Ljava/lang/String;)Lorg/joda/time/DateTimeZone;
    //   15: astore 9
    //   17: aload_0
    //   18: getfield 78\011org/joda/time/tz/ZoneInfoProvider:iZoneInfoMap\011Ljava/util/Map;
    //   21: aload_1
    //   22: new 134\011java/lang/ref/SoftReference
    //   25: dup
    //   26: aload 9
    //   28: invokespecial 137\011java/lang/ref/SoftReference:<init>\011(Ljava/lang/Object;)V
    //   31: invokeinterface 141 3 0
    //   36: pop
    //   37: aload_3
    //   38: ifnull +7 -> 45
    //   41: aload_3
    //   42: invokevirtual 146\011java/io/InputStream:close\011()V
    //   45: aload 9
    //   47: areturn
    //   48: astore 5
    //   50: aconst_null
    //   51: astore_3
    //   52: aload_0
    //   53: aload 5
    //   55: invokevirtual 150\011org/joda/time/tz/ZoneInfoProvider:uncaughtException\011(Ljava/lang/Exception;)V
    //   58: aload_0
    //   59: getfield 78\011org/joda/time/tz/ZoneInfoProvider:iZoneInfoMap\011Ljava/util/Map;
    //   62: aload_1
    //   63: invokeinterface 154 2 0
    //   68: pop
    //   69: aload_3
    //   70: ifnull +7 -> 77
    //   73: aload_3
    //   74: invokevirtual 146\011java/io/InputStream:close\011()V
    //   77: aconst_null
    //   78: areturn
    //   79: astore_2
    //   80: aconst_null
    //   81: astore_3
    //   82: aload_3
    //   83: ifnull +7 -> 90
    //   86: aload_3
    //   87: invokevirtual 146\011java/io/InputStream:close\011()V
    //   90: aload_2
    //   91: athrow
    //   92: astore 11
    //   94: aload 9
    //   96: areturn
    //   97: astore 7
    //   99: goto -22 -> 77
    //   102: astore 4
    //   104: goto -14 -> 90
    //   107: astore_2
    //   108: goto -26 -> 82
    //   111: astore 5
    //   113: goto -61 -> 52
    //
    // Exception table:
    //   from\011to\011target\011type
    //   0\0117\01148\011java/io/IOException
    //   0\0117\01179\011finally
    //   41\01145\01192\011java/io/IOException
    //   73\01177\01197\011java/io/IOException
    //   86\01190\011102\011java/io/IOException
    //   10\01137\011107\011finally
    //   52\01169\011107\011finally
    //   10\01137\011111\011java/io/IOException
  }

  // ERROR //
  private static Map<String, Object> loadZoneInfoMap(InputStream paramInputStream)
    throws IOException
  {
    // Byte code:
    //   0: new 156\011java/util/concurrent/ConcurrentHashMap
    //   3: dup
    //   4: invokespecial 157\011java/util/concurrent/ConcurrentHashMap:<init>\011()V
    //   7: astore_1
    //   8: new 159\011java/io/DataInputStream
    //   11: dup
    //   12: aload_0
    //   13: invokespecial 162\011java/io/DataInputStream:<init>\011(Ljava/io/InputStream;)V
    //   16: astore_2
    //   17: aload_2
    //   18: aload_1
    //   19: invokestatic 166\011org/joda/time/tz/ZoneInfoProvider:readZoneInfoMap\011(Ljava/io/DataInputStream;Ljava/util/Map;)V
    //   22: aload_2
    //   23: invokevirtual 167\011java/io/DataInputStream:close\011()V
    //   26: aload_1
    //   27: ldc 169
    //   29: new 134\011java/lang/ref/SoftReference
    //   32: dup
    //   33: getstatic 174\011org/joda/time/DateTimeZone:UTC\011Lorg/joda/time/DateTimeZone;
    //   36: invokespecial 137\011java/lang/ref/SoftReference:<init>\011(Ljava/lang/Object;)V
    //   39: invokeinterface 141 3 0
    //   44: pop
    //   45: aload_1
    //   46: areturn
    //   47: astore_3
    //   48: aload_2
    //   49: invokevirtual 167\011java/io/DataInputStream:close\011()V
    //   52: aload_3
    //   53: athrow
    //   54: astore 5
    //   56: goto -30 -> 26
    //   59: astore 4
    //   61: goto -9 -> 52
    //
    // Exception table:
    //   from\011to\011target\011type
    //   17\01122\01147\011finally
    //   22\01126\01154\011java/io/IOException
    //   48\01152\01159\011java/io/IOException
  }

  private InputStream openResource(String paramString)
    throws IOException
  {
    Object localObject;
    if (this.iFileDir != null)
    {
      localObject = new FileInputStream(new File(this.iFileDir, paramString));
      return localObject;
    }
    String str1 = this.iResourcePath.concat(paramString);
    label54: StringBuilder localStringBuilder;
    if (this.iLoader != null)
    {
      localObject = this.iLoader.getResourceAsStream(str1);
      if (localObject != null)
        break label123;
      localStringBuilder = new StringBuilder(40).append("Resource not found: \"").append(str1).append("\" ClassLoader: ");
      if (this.iLoader == null)
        break label125;
    }
    label123: label125: for (String str2 = this.iLoader.toString(); ; str2 = "system")
    {
      throw new IOException(str2);
      localObject = ClassLoader.getSystemResourceAsStream(str1);
      break label54;
      break;
    }
  }

  private static void readZoneInfoMap(DataInputStream paramDataInputStream, Map<String, Object> paramMap)
    throws IOException
  {
    int i = 0;
    int j = paramDataInputStream.readUnsignedShort();
    String[] arrayOfString = new String[j];
    for (int k = 0; k < j; k++)
      arrayOfString[k] = paramDataInputStream.readUTF().intern();
    int m = paramDataInputStream.readUnsignedShort();
    while (i < m)
      try
      {
        paramMap.put(arrayOfString[paramDataInputStream.readUnsignedShort()], arrayOfString[paramDataInputStream.readUnsignedShort()]);
        i++;
      }
      catch (ArrayIndexOutOfBoundsException localArrayIndexOutOfBoundsException)
      {
        throw new IOException("Corrupt zone info map");
      }
  }

  public Set<String> getAvailableIDs()
  {
    return this.iZoneInfoKeys;
  }

  public DateTimeZone getZone(String paramString)
  {
    DateTimeZone localDateTimeZone;
    if (paramString == null)
      localDateTimeZone = null;
    Object localObject;
    do
    {
      return localDateTimeZone;
      localObject = this.iZoneInfoMap.get(paramString);
      if (localObject == null)
        return null;
      if (!(localObject instanceof SoftReference))
        break;
      localDateTimeZone = (DateTimeZone)((SoftReference)localObject).get();
    }
    while (localDateTimeZone != null);
    return loadZoneData(paramString);
    if (paramString.equals(localObject))
      return loadZoneData(paramString);
    return getZone((String)localObject);
  }

  protected void uncaughtException(Exception paramException)
  {
    paramException.printStackTrace();
  }
}