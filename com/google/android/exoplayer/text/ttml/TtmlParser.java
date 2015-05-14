package com.google.android.exoplayer.text.ttml;

import android.util.Log;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.text.Subtitle;
import com.google.android.exoplayer.text.SubtitleParser;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class TtmlParser
  implements SubtitleParser
{
  private static final String ATTR_BEGIN = "begin";
  private static final String ATTR_DURATION = "dur";
  private static final String ATTR_END = "end";
  private static final Pattern CLOCK_TIME = Pattern.compile("^([0-9][0-9]+):([0-9][0-9]):([0-9][0-9])(?:(\\.[0-9]+)|:([0-9][0-9])(?:\\.([0-9]+))?)?$");
  private static final int DEFAULT_FRAMERATE = 30;
  private static final int DEFAULT_SUBFRAMERATE = 1;
  private static final int DEFAULT_TICKRATE = 1;
  private static final Pattern OFFSET_TIME = Pattern.compile("^([0-9]+(?:\\.[0-9]+)?)(h|m|s|ms|f|t)$");
  private static final String TAG = "TtmlParser";
  private final boolean strictParsing;
  private final XmlPullParserFactory xmlParserFactory;

  public TtmlParser()
  {
    this(true);
  }

  public TtmlParser(boolean paramBoolean)
  {
    this.strictParsing = paramBoolean;
    try
    {
      this.xmlParserFactory = XmlPullParserFactory.newInstance();
      return;
    }
    catch (XmlPullParserException localXmlPullParserException)
    {
      throw new RuntimeException("Couldn't create XmlPullParserFactory instance", localXmlPullParserException);
    }
  }

  private static boolean isSupportedTag(String paramString)
  {
    return (paramString.equals("tt")) || (paramString.equals("head")) || (paramString.equals("body")) || (paramString.equals("div")) || (paramString.equals("p")) || (paramString.equals("span")) || (paramString.equals("br")) || (paramString.equals("style")) || (paramString.equals("styling")) || (paramString.equals("layout")) || (paramString.equals("region")) || (paramString.equals("metadata")) || (paramString.equals("smpte:image")) || (paramString.equals("smpte:data")) || (paramString.equals("smpte:information"));
  }

  private TtmlNode parseNode(XmlPullParser paramXmlPullParser, TtmlNode paramTtmlNode)
    throws ParserException
  {
    long l1 = 0L;
    long l2 = -1L;
    long l3 = -1L;
    int i = paramXmlPullParser.getAttributeCount();
    int j = 0;
    if (j < i)
    {
      String str1 = paramXmlPullParser.getAttributeName(j).replaceFirst("^.*:", "");
      String str2 = paramXmlPullParser.getAttributeValue(j);
      if (str1.equals("begin"))
        l2 = parseTimeExpression(str2, 30, 1, 1);
      while (true)
      {
        j++;
        break;
        if (str1.equals("end"))
          l3 = parseTimeExpression(str2, 30, 1, 1);
        else if (str1.equals("dur"))
          l1 = parseTimeExpression(str2, 30, 1, 1);
      }
    }
    if ((paramTtmlNode != null) && (paramTtmlNode.startTimeUs != -1L))
    {
      if (l2 != -1L)
        l2 += paramTtmlNode.startTimeUs;
      if (l3 != -1L)
        l3 += paramTtmlNode.startTimeUs;
    }
    if (l3 == -1L)
      if (l1 <= 0L)
        break label217;
    for (l3 = l2 + l1; ; l3 = paramTtmlNode.endTimeUs)
      label217: 
      do
        return TtmlNode.buildNode(paramXmlPullParser.getName(), l2, l3);
      while ((paramTtmlNode == null) || (paramTtmlNode.endTimeUs == -1L));
  }

  private static long parseTimeExpression(String paramString, int paramInt1, int paramInt2, int paramInt3)
    throws ParserException
  {
    Matcher localMatcher1 = CLOCK_TIME.matcher(paramString);
    if (localMatcher1.matches())
    {
      double d2 = 3600L * Long.parseLong(localMatcher1.group(1)) + 60L * Long.parseLong(localMatcher1.group(2)) + Long.parseLong(localMatcher1.group(3));
      String str2 = localMatcher1.group(4);
      double d3;
      double d5;
      label110: double d6;
      String str4;
      if (str2 != null)
      {
        d3 = Double.parseDouble(str2);
        double d4 = d2 + d3;
        String str3 = localMatcher1.group(5);
        if (str3 == null)
          break label162;
        d5 = Long.parseLong(str3) / paramInt1;
        d6 = d4 + d5;
        str4 = localMatcher1.group(6);
        if (str4 == null)
          break label168;
      }
      label162: label168: for (double d7 = Long.parseLong(str4) / paramInt2 / paramInt1; ; d7 = 0.0D)
      {
        return ()(1000000.0D * (d6 + d7));
        d3 = 0.0D;
        break;
        d5 = 0.0D;
        break label110;
      }
    }
    Matcher localMatcher2 = OFFSET_TIME.matcher(paramString);
    if (localMatcher2.matches())
    {
      double d1 = Double.parseDouble(localMatcher2.group(1));
      String str1 = localMatcher2.group(2);
      if (str1.equals("h"))
        d1 *= 3600.0D;
      while (true)
      {
        return ()(1000000.0D * d1);
        if (str1.equals("m"))
          d1 *= 60.0D;
        else if (!str1.equals("s"))
          if (str1.equals("ms"))
            d1 /= 1000.0D;
          else if (str1.equals("f"))
            d1 /= paramInt1;
          else if (str1.equals("t"))
            d1 /= paramInt3;
      }
    }
    throw new ParserException("Malformed time expression: " + paramString);
  }

  public boolean canParse(String paramString)
  {
    return "application/ttml+xml".equals(paramString);
  }

  public Subtitle parse(InputStream paramInputStream, String paramString, long paramLong)
    throws IOException
  {
    TtmlSubtitle localTtmlSubtitle;
    label292: 
    while (true)
    {
      XmlPullParser localXmlPullParser;
      LinkedList localLinkedList;
      int i;
      int j;
      TtmlNode localTtmlNode1;
      try
      {
        localXmlPullParser = this.xmlParserFactory.newPullParser();
        localXmlPullParser.setInput(paramInputStream, paramString);
        localTtmlSubtitle = null;
        localLinkedList = new LinkedList();
        i = 0;
        j = localXmlPullParser.getEventType();
        if (j == 1)
          break;
        localTtmlNode1 = (TtmlNode)localLinkedList.peekLast();
        if (i != 0)
          break label292;
        String str = localXmlPullParser.getName();
        if (j != 2)
          break label220;
        if (!isSupportedTag(str))
        {
          Log.i("TtmlParser", "Ignoring unsupported tag: " + localXmlPullParser.getName());
          i++;
          localXmlPullParser.next();
          int k = localXmlPullParser.getEventType();
          j = k;
          continue;
        }
        try
        {
          TtmlNode localTtmlNode2 = parseNode(localXmlPullParser, localTtmlNode1);
          localLinkedList.addLast(localTtmlNode2);
          if (localTtmlNode1 == null)
            continue;
          localTtmlNode1.addChild(localTtmlNode2);
        }
        catch (ParserException localParserException)
        {
          if (!this.strictParsing)
            break label203;
        }
        throw localParserException;
      }
      catch (XmlPullParserException localXmlPullParserException)
      {
        throw new ParserException("Unable to parse source", localXmlPullParserException);
      }
      label203: Log.e("TtmlParser", "Suppressing parser error", localParserException);
      i++;
      continue;
      label220: if (j == 4)
      {
        localTtmlNode1.addChild(TtmlNode.buildTextNode(localXmlPullParser.getText()));
      }
      else if (j == 3)
      {
        if (localXmlPullParser.getName().equals("tt"))
          localTtmlSubtitle = new TtmlSubtitle((TtmlNode)localLinkedList.getLast(), paramLong);
        localLinkedList.removeLast();
        continue;
        if (j == 2)
          i++;
        else if (j == 3)
          i--;
      }
    }
    return localTtmlSubtitle;
  }
}