package co.getair.meerkat.video.broadcast.googlecode.mp4parser.util;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Path
{
  static Pattern component;

  static
  {
    if (!Path.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      component = Pattern.compile("(....|\\.\\.)(\\[(.*)\\])?");
      return;
    }
  }

  public static String createPath(Box paramBox)
  {
    return createPath(paramBox, "");
  }

  private static String createPath(Box paramBox, String paramString)
  {
    Container localContainer = paramBox.getParent();
    int i = 0;
    Iterator localIterator = localContainer.getBoxes().iterator();
    while (true)
      if (localIterator.hasNext())
      {
        Box localBox = (Box)localIterator.next();
        if (localBox.getType().equals(paramBox.getType()))
          if (localBox != paramBox);
      }
      else
      {
        StringBuilder localStringBuilder = new StringBuilder();
        Object[] arrayOfObject = new Object[2];
        arrayOfObject[0] = paramBox.getType();
        arrayOfObject[1] = Integer.valueOf(i);
        String str = String.format("/%s[%d]", arrayOfObject) + paramString;
        if ((localContainer instanceof Box))
          str = createPath((Box)localContainer, str);
        return str;
        i++;
      }
  }

  public static <T extends Box> T getPath(Box paramBox, String paramString)
  {
    List localList = getPaths(paramBox, paramString, true);
    if (localList.isEmpty())
      return null;
    return (Box)localList.get(0);
  }

  public static <T extends Box> T getPath(Container paramContainer, String paramString)
  {
    List localList = getPaths(paramContainer, paramString, true);
    if (localList.isEmpty())
      return null;
    return (Box)localList.get(0);
  }

  public static <T extends Box> T getPath(AbstractContainerBox paramAbstractContainerBox, String paramString)
  {
    List localList = getPaths(paramAbstractContainerBox, paramString, true);
    if (localList.isEmpty())
      return null;
    return (Box)localList.get(0);
  }

  public static <T extends Box> List<T> getPaths(Box paramBox, String paramString)
  {
    return getPaths(paramBox, paramString, false);
  }

  private static <T extends Box> List<T> getPaths(Box paramBox, String paramString, boolean paramBoolean)
  {
    return getPaths(paramBox, paramString, paramBoolean);
  }

  public static <T extends Box> List<T> getPaths(Container paramContainer, String paramString)
  {
    return getPaths(paramContainer, paramString, false);
  }

  private static <T extends Box> List<T> getPaths(Container paramContainer, String paramString, boolean paramBoolean)
  {
    return getPaths(paramContainer, paramString, paramBoolean);
  }

  private static <T extends Box> List<T> getPaths(AbstractContainerBox paramAbstractContainerBox, String paramString, boolean paramBoolean)
  {
    return getPaths(paramAbstractContainerBox, paramString, paramBoolean);
  }

  private static <T extends Box> List<T> getPaths(Object paramObject, String paramString, boolean paramBoolean)
  {
    if (paramString.startsWith("/"))
    {
      paramString = paramString.substring(1);
      while ((paramObject instanceof Box))
        paramObject = ((Box)paramObject).getParent();
    }
    for (Object localObject1 = paramObject; ; localObject1 = paramObject)
    {
      Object localObject2;
      if (paramString.length() == 0)
        if ((localObject1 instanceof Box))
          localObject2 = Collections.singletonList((Box)localObject1);
      String str1;
      label182: int i;
      do
      {
        String str2;
        String str3;
        int j;
        Iterator localIterator;
        while (!localIterator.hasNext())
        {
          return localObject2;
          throw new RuntimeException("Result of path expression seems to be the root container. This is not allowed!");
          if (paramString.contains("/"))
          {
            str2 = paramString.substring(1 + paramString.indexOf('/'));
            str1 = paramString.substring(0, paramString.indexOf('/'));
          }
          Matcher localMatcher;
          while (true)
          {
            localMatcher = component.matcher(str1);
            if (!localMatcher.matches())
              break label335;
            str3 = localMatcher.group(1);
            if (!"..".equals(str3))
              break label182;
            if (!(localObject1 instanceof Box))
              break;
            return getPaths(((Box)localObject1).getParent(), str2, paramBoolean);
            str1 = paramString;
            str2 = "";
          }
          return Collections.emptyList();
          if (!(localObject1 instanceof Container))
            break;
          i = -1;
          if (localMatcher.group(2) != null)
            i = Integer.parseInt(localMatcher.group(3));
          localObject2 = new LinkedList();
          j = 0;
          localIterator = ((Container)localObject1).getBoxes().iterator();
        }
        Box localBox = (Box)localIterator.next();
        if (localBox.getType().matches(str3))
        {
          if ((i == -1) || (i == j))
            ((List)localObject2).addAll(getPaths(localBox, str2, paramBoolean));
          j++;
        }
      }
      while (((!paramBoolean) && (i < 0)) || (((List)localObject2).isEmpty()));
      return localObject2;
      return Collections.emptyList();
      label335: throw new RuntimeException(str1 + " is invalid path.");
    }
  }

  public static boolean isContained(Box paramBox, String paramString)
  {
    assert (paramString.startsWith("/")) : "Absolute path required";
    return getPaths(paramBox, paramString).contains(paramBox);
  }
}