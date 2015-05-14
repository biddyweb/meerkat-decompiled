package com.google.common.reflect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.CharMatcher;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Splitter;
import com.google.common.collect.FluentIterable;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.ImmutableSet.Builder;
import com.google.common.collect.ImmutableSortedSet;
import com.google.common.collect.ImmutableSortedSet.Builder;
import com.google.common.collect.Maps;
import com.google.common.collect.Ordering;
import com.google.common.collect.Sets;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;
import java.util.jar.Attributes;
import java.util.jar.Attributes.Name;
import java.util.jar.Manifest;
import java.util.logging.Logger;
import javax.annotation.Nullable;

@Beta
public final class ClassPath
{
  private static final String CLASS_FILE_NAME_EXTENSION = ".class";
  private static final Splitter CLASS_PATH_ATTRIBUTE_SEPARATOR = Splitter.on(" ").omitEmptyStrings();
  private static final Predicate<ClassInfo> IS_TOP_LEVEL;
  private static final Logger logger = Logger.getLogger(ClassPath.class.getName());
  private final ImmutableSet<ResourceInfo> resources;

  static
  {
    IS_TOP_LEVEL = new Predicate()
    {
      public boolean apply(ClassPath.ClassInfo paramAnonymousClassInfo)
      {
        return ClassPath.ClassInfo.access$000(paramAnonymousClassInfo).indexOf('$') == -1;
      }
    };
  }

  private ClassPath(ImmutableSet<ResourceInfo> paramImmutableSet)
  {
    this.resources = paramImmutableSet;
  }

  public static ClassPath from(ClassLoader paramClassLoader)
    throws IOException
  {
    Scanner localScanner = new Scanner();
    Iterator localIterator = getClassPathEntries(paramClassLoader).entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localScanner.scan((URI)localEntry.getKey(), (ClassLoader)localEntry.getValue());
    }
    return new ClassPath(localScanner.getResources());
  }

  @VisibleForTesting
  static String getClassName(String paramString)
  {
    return paramString.substring(0, paramString.length() - ".class".length()).replace('/', '.');
  }

  @VisibleForTesting
  static ImmutableMap<URI, ClassLoader> getClassPathEntries(ClassLoader paramClassLoader)
  {
    LinkedHashMap localLinkedHashMap = Maps.newLinkedHashMap();
    ClassLoader localClassLoader = paramClassLoader.getParent();
    if (localClassLoader != null)
      localLinkedHashMap.putAll(getClassPathEntries(localClassLoader));
    if ((paramClassLoader instanceof URLClassLoader))
    {
      URL[] arrayOfURL = ((URLClassLoader)paramClassLoader).getURLs();
      int i = arrayOfURL.length;
      int j = 0;
      while (j < i)
      {
        URL localURL = arrayOfURL[j];
        try
        {
          URI localURI = localURL.toURI();
          if (!localLinkedHashMap.containsKey(localURI))
            localLinkedHashMap.put(localURI, paramClassLoader);
          j++;
        }
        catch (URISyntaxException localURISyntaxException)
        {
          throw new IllegalArgumentException(localURISyntaxException);
        }
      }
    }
    return ImmutableMap.copyOf(localLinkedHashMap);
  }

  public ImmutableSet<ClassInfo> getAllClasses()
  {
    return FluentIterable.from(this.resources).filter(ClassInfo.class).toSet();
  }

  public ImmutableSet<ResourceInfo> getResources()
  {
    return this.resources;
  }

  public ImmutableSet<ClassInfo> getTopLevelClasses()
  {
    return FluentIterable.from(this.resources).filter(ClassInfo.class).filter(IS_TOP_LEVEL).toSet();
  }

  public ImmutableSet<ClassInfo> getTopLevelClasses(String paramString)
  {
    Preconditions.checkNotNull(paramString);
    ImmutableSet.Builder localBuilder = ImmutableSet.builder();
    Iterator localIterator = getTopLevelClasses().iterator();
    while (localIterator.hasNext())
    {
      ClassInfo localClassInfo = (ClassInfo)localIterator.next();
      if (localClassInfo.getPackageName().equals(paramString))
        localBuilder.add(localClassInfo);
    }
    return localBuilder.build();
  }

  public ImmutableSet<ClassInfo> getTopLevelClassesRecursive(String paramString)
  {
    Preconditions.checkNotNull(paramString);
    String str1 = String.valueOf(String.valueOf(paramString));
    String str2 = 1 + str1.length() + str1 + ".";
    ImmutableSet.Builder localBuilder = ImmutableSet.builder();
    Iterator localIterator = getTopLevelClasses().iterator();
    while (localIterator.hasNext())
    {
      ClassInfo localClassInfo = (ClassInfo)localIterator.next();
      if (localClassInfo.getName().startsWith(str2))
        localBuilder.add(localClassInfo);
    }
    return localBuilder.build();
  }

  @Beta
  public static final class ClassInfo extends ClassPath.ResourceInfo
  {
    private final String className;

    ClassInfo(String paramString, ClassLoader paramClassLoader)
    {
      super(paramClassLoader);
      this.className = ClassPath.getClassName(paramString);
    }

    public String getName()
    {
      return this.className;
    }

    public String getPackageName()
    {
      return Reflection.getPackageName(this.className);
    }

    public String getSimpleName()
    {
      int i = this.className.lastIndexOf('$');
      if (i != -1)
      {
        String str2 = this.className.substring(i + 1);
        return CharMatcher.DIGIT.trimLeadingFrom(str2);
      }
      String str1 = getPackageName();
      if (str1.isEmpty())
        return this.className;
      return this.className.substring(1 + str1.length());
    }

    public Class<?> load()
    {
      try
      {
        Class localClass = this.loader.loadClass(this.className);
        return localClass;
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        throw new IllegalStateException(localClassNotFoundException);
      }
    }

    public String toString()
    {
      return this.className;
    }
  }

  @Beta
  public static class ResourceInfo
  {
    final ClassLoader loader;
    private final String resourceName;

    ResourceInfo(String paramString, ClassLoader paramClassLoader)
    {
      this.resourceName = ((String)Preconditions.checkNotNull(paramString));
      this.loader = ((ClassLoader)Preconditions.checkNotNull(paramClassLoader));
    }

    static ResourceInfo of(String paramString, ClassLoader paramClassLoader)
    {
      if (paramString.endsWith(".class"))
        return new ClassPath.ClassInfo(paramString, paramClassLoader);
      return new ResourceInfo(paramString, paramClassLoader);
    }

    public boolean equals(Object paramObject)
    {
      boolean bool1 = paramObject instanceof ResourceInfo;
      boolean bool2 = false;
      if (bool1)
      {
        ResourceInfo localResourceInfo = (ResourceInfo)paramObject;
        boolean bool3 = this.resourceName.equals(localResourceInfo.resourceName);
        bool2 = false;
        if (bool3)
        {
          ClassLoader localClassLoader1 = this.loader;
          ClassLoader localClassLoader2 = localResourceInfo.loader;
          bool2 = false;
          if (localClassLoader1 == localClassLoader2)
            bool2 = true;
        }
      }
      return bool2;
    }

    public final String getResourceName()
    {
      return this.resourceName;
    }

    public int hashCode()
    {
      return this.resourceName.hashCode();
    }

    public String toString()
    {
      return this.resourceName;
    }

    public final URL url()
    {
      URL localURL = this.loader.getResource(this.resourceName);
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = this.resourceName;
      return (URL)Preconditions.checkNotNull(localURL, "Failed to load resource: %s", arrayOfObject);
    }
  }

  @VisibleForTesting
  static final class Scanner
  {
    private final ImmutableSortedSet.Builder<ClassPath.ResourceInfo> resources = new ImmutableSortedSet.Builder(Ordering.usingToString());
    private final Set<URI> scannedUris = Sets.newHashSet();

    @VisibleForTesting
    static URI getClassPathEntry(File paramFile, String paramString)
      throws URISyntaxException
    {
      URI localURI = new URI(paramString);
      if (localURI.isAbsolute())
        return localURI;
      return new File(paramFile.getParentFile(), paramString.replace('/', File.separatorChar)).toURI();
    }

    @VisibleForTesting
    static ImmutableSet<URI> getClassPathFromManifest(File paramFile, @Nullable Manifest paramManifest)
    {
      if (paramManifest == null)
        return ImmutableSet.of();
      ImmutableSet.Builder localBuilder = ImmutableSet.builder();
      String str1 = paramManifest.getMainAttributes().getValue(Attributes.Name.CLASS_PATH.toString());
      if (str1 != null)
      {
        Iterator localIterator = ClassPath.CLASS_PATH_ATTRIBUTE_SEPARATOR.split(str1).iterator();
        Logger localLogger;
        String str3;
        while (true)
        {
          if (!localIterator.hasNext())
            break label139;
          String str2 = (String)localIterator.next();
          try
          {
            URI localURI = getClassPathEntry(paramFile, str2);
            localBuilder.add(localURI);
          }
          catch (URISyntaxException localURISyntaxException)
          {
            localLogger = ClassPath.logger;
            str3 = String.valueOf(str2);
            if (str3.length() == 0);
          }
        }
        for (String str4 = "Invalid Class-Path entry: ".concat(str3); ; str4 = new String("Invalid Class-Path entry: "))
        {
          localLogger.warning(str4);
          break;
        }
      }
      label139: return localBuilder.build();
    }

    private void scanDirectory(File paramFile, ClassLoader paramClassLoader)
      throws IOException
    {
      scanDirectory(paramFile, paramClassLoader, "", ImmutableSet.of());
    }

    private void scanDirectory(File paramFile, ClassLoader paramClassLoader, String paramString, ImmutableSet<File> paramImmutableSet)
      throws IOException
    {
      File localFile1 = paramFile.getCanonicalFile();
      if (paramImmutableSet.contains(localFile1))
        return;
      File[] arrayOfFile = paramFile.listFiles();
      if (arrayOfFile == null)
      {
        Logger localLogger = ClassPath.logger;
        String str7 = String.valueOf(String.valueOf(paramFile));
        localLogger.warning(22 + str7.length() + "Cannot read directory " + str7);
        return;
      }
      ImmutableSet localImmutableSet = ImmutableSet.builder().addAll(paramImmutableSet).add(localFile1).build();
      int i = arrayOfFile.length;
      int j = 0;
      label102: String str1;
      if (j < i)
      {
        File localFile2 = arrayOfFile[j];
        str1 = localFile2.getName();
        if (!localFile2.isDirectory())
          break label203;
        String str5 = String.valueOf(String.valueOf(paramString));
        String str6 = String.valueOf(String.valueOf(str1));
        scanDirectory(localFile2, paramClassLoader, 1 + str5.length() + str6.length() + str5 + str6 + "/", localImmutableSet);
      }
      label272: 
      while (true)
      {
        j++;
        break label102;
        break;
        label203: String str2 = String.valueOf(paramString);
        String str3 = String.valueOf(str1);
        if (str3.length() != 0);
        for (String str4 = str2.concat(str3); ; str4 = new String(str2))
        {
          if (str4.equals("META-INF/MANIFEST.MF"))
            break label272;
          this.resources.add(ClassPath.ResourceInfo.of(str4, paramClassLoader));
          break;
        }
      }
    }

    // ERROR //
    private void scanJar(File paramFile, ClassLoader paramClassLoader)
      throws IOException
    {
      // Byte code:
      //   0: new 228\011java/util/jar/JarFile
      //   3: dup
      //   4: aload_1
      //   5: invokespecial 231\011java/util/jar/JarFile:<init>\011(Ljava/io/File;)V
      //   8: astore_3
      //   9: aload_1
      //   10: aload_3
      //   11: invokevirtual 235\011java/util/jar/JarFile:getManifest\011()Ljava/util/jar/Manifest;
      //   14: invokestatic 237\011com/google/common/reflect/ClassPath$Scanner:getClassPathFromManifest\011(Ljava/io/File;Ljava/util/jar/Manifest;)Lcom/google/common/collect/ImmutableSet;
      //   17: invokevirtual 238\011com/google/common/collect/ImmutableSet:iterator\011()Ljava/util/Iterator;
      //   20: astore 6
      //   22: aload 6
      //   24: invokeinterface 130 1 0
      //   29: ifeq +33 -> 62
      //   32: aload_0
      //   33: aload 6
      //   35: invokeinterface 134 1 0
      //   40: checkcast 42\011java/net/URI
      //   43: aload_2
      //   44: invokevirtual 242\011com/google/common/reflect/ClassPath$Scanner:scan\011(Ljava/net/URI;Ljava/lang/ClassLoader;)V
      //   47: goto -25 -> 22
      //   50: astore 4
      //   52: aload_3
      //   53: invokevirtual 245\011java/util/jar/JarFile:close\011()V
      //   56: aload 4
      //   58: athrow
      //   59: astore 11
      //   61: return
      //   62: aload_3
      //   63: invokevirtual 249\011java/util/jar/JarFile:entries\011()Ljava/util/Enumeration;
      //   66: astore 7
      //   68: aload 7
      //   70: invokeinterface 254 1 0
      //   75: ifeq +56 -> 131
      //   78: aload 7
      //   80: invokeinterface 257 1 0
      //   85: checkcast 259\011java/util/jar/JarEntry
      //   88: astore 9
      //   90: aload 9
      //   92: invokevirtual 260\011java/util/jar/JarEntry:isDirectory\011()Z
      //   95: ifne -27 -> 68
      //   98: aload 9
      //   100: invokevirtual 261\011java/util/jar/JarEntry:getName\011()Ljava/lang/String;
      //   103: ldc 214
      //   105: invokevirtual 217\011java/lang/String:equals\011(Ljava/lang/Object;)Z
      //   108: ifne -40 -> 68
      //   111: aload_0
      //   112: getfield 28\011com/google/common/reflect/ClassPath$Scanner:resources\011Lcom/google/common/collect/ImmutableSortedSet$Builder;
      //   115: aload 9
      //   117: invokevirtual 261\011java/util/jar/JarEntry:getName\011()Ljava/lang/String;
      //   120: aload_2
      //   121: invokestatic 222\011com/google/common/reflect/ClassPath$ResourceInfo:of\011(Ljava/lang/String;Ljava/lang/ClassLoader;)Lcom/google/common/reflect/ClassPath$ResourceInfo;
      //   124: invokevirtual 225\011com/google/common/collect/ImmutableSortedSet$Builder:add\011(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSortedSet$Builder;
      //   127: pop
      //   128: goto -60 -> 68
      //   131: aload_3
      //   132: invokevirtual 245\011java/util/jar/JarFile:close\011()V
      //   135: return
      //   136: astore 8
      //   138: return
      //   139: astore 5
      //   141: goto -85 -> 56
      //
      // Exception table:
      //   from\011to\011target\011type
      //   9\01122\01150\011finally
      //   22\01147\01150\011finally
      //   62\01168\01150\011finally
      //   68\011128\01150\011finally
      //   0\0119\01159\011java/io/IOException
      //   131\011135\011136\011java/io/IOException
      //   52\01156\011139\011java/io/IOException
    }

    ImmutableSortedSet<ClassPath.ResourceInfo> getResources()
    {
      return this.resources.build();
    }

    void scan(URI paramURI, ClassLoader paramClassLoader)
      throws IOException
    {
      if ((paramURI.getScheme().equals("file")) && (this.scannedUris.add(paramURI)))
        scanFrom(new File(paramURI), paramClassLoader);
    }

    @VisibleForTesting
    void scanFrom(File paramFile, ClassLoader paramClassLoader)
      throws IOException
    {
      if (!paramFile.exists())
        return;
      if (paramFile.isDirectory())
      {
        scanDirectory(paramFile, paramClassLoader);
        return;
      }
      scanJar(paramFile, paramClassLoader);
    }
  }
}