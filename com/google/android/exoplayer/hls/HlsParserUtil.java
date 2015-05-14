package com.google.android.exoplayer.hls;

import com.google.android.exoplayer.ParserException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

class HlsParserUtil
{
  public static double parseDoubleAttr(String paramString1, Pattern paramPattern, String paramString2)
    throws ParserException
  {
    return Double.parseDouble(parseStringAttr(paramString1, paramPattern, paramString2));
  }

  public static int parseIntAttr(String paramString1, Pattern paramPattern, String paramString2)
    throws ParserException
  {
    return Integer.parseInt(parseStringAttr(paramString1, paramPattern, paramString2));
  }

  public static String parseOptionalStringAttr(String paramString, Pattern paramPattern)
  {
    Matcher localMatcher = paramPattern.matcher(paramString);
    if ((localMatcher.find()) && (localMatcher.groupCount() == 1))
      return localMatcher.group(1);
    return null;
  }

  public static String parseStringAttr(String paramString1, Pattern paramPattern, String paramString2)
    throws ParserException
  {
    Matcher localMatcher = paramPattern.matcher(paramString1);
    if ((localMatcher.find()) && (localMatcher.groupCount() == 1))
      return localMatcher.group(1);
    throw new ParserException(String.format("Couldn't match %s tag in %s", new Object[] { paramString2, paramString1 }));
  }
}