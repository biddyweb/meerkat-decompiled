package retrofit.mime;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class MimeUtil
{
  private static final Pattern CHARSET = Pattern.compile("\\Wcharset=([^\\s;]+)", 2);

  public static String parseCharset(String paramString)
  {
    Matcher localMatcher = CHARSET.matcher(paramString);
    if (localMatcher.find())
      return localMatcher.group(1).replaceAll("[\"\\\\]", "");
    return "UTF-8";
  }
}