package com.google.android.exoplayer.dash.mpd;

import android.net.Uri;
import android.text.TextUtils;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.chunk.Format;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.ManifestParser;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import org.xml.sax.helpers.DefaultHandler;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class MediaPresentationDescriptionParser extends DefaultHandler
  implements ManifestParser<MediaPresentationDescription>
{
  private final XmlPullParserFactory xmlParserFactory;

  public MediaPresentationDescriptionParser()
  {
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

  private int checkAdaptationSetTypeConsistency(int paramInt1, int paramInt2)
  {
    if (paramInt1 == -1)
      paramInt1 = paramInt2;
    while (paramInt2 == -1)
      return paramInt1;
    if (paramInt1 == paramInt2);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      return paramInt1;
    }
  }

  protected static boolean isEndTag(XmlPullParser paramXmlPullParser, String paramString)
    throws XmlPullParserException
  {
    return (paramXmlPullParser.getEventType() == 3) && (paramString.equals(paramXmlPullParser.getName()));
  }

  protected static boolean isStartTag(XmlPullParser paramXmlPullParser)
    throws XmlPullParserException
  {
    return paramXmlPullParser.getEventType() == 2;
  }

  protected static boolean isStartTag(XmlPullParser paramXmlPullParser, String paramString)
    throws XmlPullParserException
  {
    return (paramXmlPullParser.getEventType() == 2) && (paramString.equals(paramXmlPullParser.getName()));
  }

  protected static Uri parseBaseUrl(XmlPullParser paramXmlPullParser, Uri paramUri)
    throws XmlPullParserException, IOException
  {
    paramXmlPullParser.next();
    String str = paramXmlPullParser.getText();
    Uri localUri = Uri.parse(str);
    if (!localUri.isAbsolute())
      localUri = Uri.withAppendedPath(paramUri, str);
    return localUri;
  }

  protected static long parseDateTime(XmlPullParser paramXmlPullParser, String paramString, long paramLong)
    throws ParseException
  {
    String str = paramXmlPullParser.getAttributeValue(null, paramString);
    if (str == null)
      return paramLong;
    return Util.parseXsDateTime(str);
  }

  protected static long parseDuration(XmlPullParser paramXmlPullParser, String paramString, long paramLong)
  {
    String str = paramXmlPullParser.getAttributeValue(null, paramString);
    if (str == null)
      return paramLong;
    return Util.parseXsDuration(str);
  }

  protected static int parseInt(XmlPullParser paramXmlPullParser, String paramString)
  {
    return parseInt(paramXmlPullParser, paramString, -1);
  }

  protected static int parseInt(XmlPullParser paramXmlPullParser, String paramString, int paramInt)
  {
    String str = paramXmlPullParser.getAttributeValue(null, paramString);
    if (str == null)
      return paramInt;
    return Integer.parseInt(str);
  }

  protected static long parseLong(XmlPullParser paramXmlPullParser, String paramString)
  {
    return parseLong(paramXmlPullParser, paramString, -1L);
  }

  protected static long parseLong(XmlPullParser paramXmlPullParser, String paramString, long paramLong)
  {
    String str = paramXmlPullParser.getAttributeValue(null, paramString);
    if (str == null)
      return paramLong;
    return Long.parseLong(str);
  }

  protected static String parseString(XmlPullParser paramXmlPullParser, String paramString1, String paramString2)
  {
    String str = paramXmlPullParser.getAttributeValue(null, paramString1);
    if (str == null)
      return paramString2;
    return str;
  }

  protected AdaptationSet buildAdaptationSet(int paramInt1, int paramInt2, List<Representation> paramList, List<ContentProtection> paramList1)
  {
    return new AdaptationSet(paramInt1, paramInt2, paramList, paramList1);
  }

  protected ContentProtection buildContentProtection(String paramString)
  {
    return new ContentProtection(paramString, null, null);
  }

  protected Format buildFormat(String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, String paramString3, String paramString4)
  {
    return new Format(paramString1, paramString2, paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramString3, paramString4);
  }

  protected MediaPresentationDescription buildMediaPresentationDescription(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean, long paramLong4, long paramLong5, UtcTimingElement paramUtcTimingElement, List<Period> paramList)
  {
    return new MediaPresentationDescription(paramLong1, paramLong2, paramLong3, paramBoolean, paramLong4, paramLong5, paramUtcTimingElement, paramList);
  }

  protected Period buildPeriod(String paramString, long paramLong1, long paramLong2, List<AdaptationSet> paramList)
  {
    return new Period(paramString, paramLong1, paramLong2, paramList);
  }

  protected RangedUri buildRangedUri(Uri paramUri, String paramString, long paramLong1, long paramLong2)
  {
    return new RangedUri(paramUri, paramString, paramLong1, paramLong2);
  }

  protected Representation buildRepresentation(long paramLong1, long paramLong2, String paramString, int paramInt, Format paramFormat, SegmentBase paramSegmentBase)
  {
    return Representation.newInstance(paramLong1, paramLong2, paramString, paramInt, paramFormat, paramSegmentBase);
  }

  protected SegmentBase.SegmentList buildSegmentList(RangedUri paramRangedUri, long paramLong1, long paramLong2, long paramLong3, int paramInt, long paramLong4, List<SegmentBase.SegmentTimelineElement> paramList, List<RangedUri> paramList1)
  {
    return new SegmentBase.SegmentList(paramRangedUri, paramLong1, paramLong2, paramLong3, paramInt, paramLong4, paramList, paramList1);
  }

  protected SegmentBase.SegmentTemplate buildSegmentTemplate(RangedUri paramRangedUri, long paramLong1, long paramLong2, long paramLong3, int paramInt, long paramLong4, List<SegmentBase.SegmentTimelineElement> paramList, UrlTemplate paramUrlTemplate1, UrlTemplate paramUrlTemplate2, Uri paramUri)
  {
    return new SegmentBase.SegmentTemplate(paramRangedUri, paramLong1, paramLong2, paramLong3, paramInt, paramLong4, paramList, paramUrlTemplate1, paramUrlTemplate2, paramUri);
  }

  protected SegmentBase.SegmentTimelineElement buildSegmentTimelineElement(long paramLong1, long paramLong2)
  {
    return new SegmentBase.SegmentTimelineElement(paramLong1, paramLong2);
  }

  protected SegmentBase.SingleSegmentBase buildSingleSegmentBase(RangedUri paramRangedUri, long paramLong1, long paramLong2, Uri paramUri, long paramLong3, long paramLong4)
  {
    return new SegmentBase.SingleSegmentBase(paramRangedUri, paramLong1, paramLong2, paramUri, paramLong3, paramLong4);
  }

  protected UtcTimingElement buildUtcTimingElement(String paramString1, String paramString2)
  {
    return new UtcTimingElement(paramString1, paramString2);
  }

  public MediaPresentationDescription parse(InputStream paramInputStream, String paramString1, String paramString2, Uri paramUri)
    throws IOException, ParserException
  {
    try
    {
      localXmlPullParser = this.xmlParserFactory.newPullParser();
      localXmlPullParser.setInput(paramInputStream, paramString1);
      if ((localXmlPullParser.next() != 2) || (!"MPD".equals(localXmlPullParser.getName())))
        throw new ParserException("inputStream does not contain a valid media presentation description");
    }
    catch (XmlPullParserException localXmlPullParserException)
    {
      XmlPullParser localXmlPullParser;
      throw new ParserException(localXmlPullParserException);
      MediaPresentationDescription localMediaPresentationDescription = parseMediaPresentationDescription(localXmlPullParser, paramString2, paramUri);
      return localMediaPresentationDescription;
    }
    catch (ParseException localParseException)
    {
      throw new ParserException(localParseException);
    }
  }

  protected AdaptationSet parseAdaptationSet(XmlPullParser paramXmlPullParser, String paramString, Uri paramUri, long paramLong1, long paramLong2, SegmentBase paramSegmentBase)
    throws XmlPullParserException, IOException
  {
    String str1 = paramXmlPullParser.getAttributeValue(null, "mimeType");
    String str2 = paramXmlPullParser.getAttributeValue(null, "lang");
    int i = parseAdaptationSetTypeFromMimeType(str1);
    int j = -1;
    ContentProtectionsBuilder localContentProtectionsBuilder = new ContentProtectionsBuilder();
    ArrayList localArrayList1 = new ArrayList();
    while (true)
    {
      paramXmlPullParser.next();
      if (isStartTag(paramXmlPullParser, "BaseURL"))
        paramUri = parseBaseUrl(paramXmlPullParser, paramUri);
      while (isEndTag(paramXmlPullParser, "AdaptationSet"))
      {
        ArrayList localArrayList2 = localContentProtectionsBuilder.build();
        return buildAdaptationSet(j, i, localArrayList1, localArrayList2);
        if (isStartTag(paramXmlPullParser, "ContentProtection"))
        {
          localContentProtectionsBuilder.addAdaptationSetProtection(parseContentProtection(paramXmlPullParser));
        }
        else if (isStartTag(paramXmlPullParser, "ContentComponent"))
        {
          j = Integer.parseInt(paramXmlPullParser.getAttributeValue(null, "id"));
          int m = parseAdaptationSetType(paramXmlPullParser.getAttributeValue(null, "contentType"));
          i = checkAdaptationSetTypeConsistency(i, m);
        }
        else if (isStartTag(paramXmlPullParser, "Representation"))
        {
          Representation localRepresentation = parseRepresentation(paramXmlPullParser, paramString, paramUri, paramLong1, paramLong2, str1, str2, paramSegmentBase, localContentProtectionsBuilder);
          localContentProtectionsBuilder.endRepresentation();
          int k = parseAdaptationSetTypeFromMimeType(localRepresentation.format.mimeType);
          i = checkAdaptationSetTypeConsistency(i, k);
          localArrayList1.add(localRepresentation);
        }
        else if (isStartTag(paramXmlPullParser, "SegmentBase"))
        {
          SegmentBase.SingleSegmentBase localSingleSegmentBase = (SegmentBase.SingleSegmentBase)paramSegmentBase;
          paramSegmentBase = parseSegmentBase(paramXmlPullParser, paramUri, localSingleSegmentBase);
        }
        else if (isStartTag(paramXmlPullParser, "SegmentList"))
        {
          SegmentBase.SegmentList localSegmentList = (SegmentBase.SegmentList)paramSegmentBase;
          paramSegmentBase = parseSegmentList(paramXmlPullParser, paramUri, localSegmentList, paramLong2);
        }
        else if (isStartTag(paramXmlPullParser, "SegmentTemplate"))
        {
          SegmentBase.SegmentTemplate localSegmentTemplate = (SegmentBase.SegmentTemplate)paramSegmentBase;
          paramSegmentBase = parseSegmentTemplate(paramXmlPullParser, paramUri, localSegmentTemplate, paramLong2);
        }
        else if (isStartTag(paramXmlPullParser))
        {
          parseAdaptationSetChild(paramXmlPullParser);
        }
      }
    }
  }

  protected void parseAdaptationSetChild(XmlPullParser paramXmlPullParser)
    throws XmlPullParserException, IOException
  {
  }

  protected int parseAdaptationSetType(String paramString)
  {
    if (TextUtils.isEmpty(paramString));
    do
    {
      return -1;
      if ("audio".equals(paramString))
        return 1;
      if ("video".equals(paramString))
        return 0;
    }
    while (!"text".equals(paramString));
    return 2;
  }

  protected int parseAdaptationSetTypeFromMimeType(String paramString)
  {
    if (TextUtils.isEmpty(paramString));
    do
    {
      return -1;
      if (MimeTypes.isAudio(paramString))
        return 1;
      if (MimeTypes.isVideo(paramString))
        return 0;
    }
    while ((!MimeTypes.isText(paramString)) && (!MimeTypes.isTtml(paramString)));
    return 2;
  }

  protected ContentProtection parseContentProtection(XmlPullParser paramXmlPullParser)
    throws XmlPullParserException, IOException
  {
    return buildContentProtection(paramXmlPullParser.getAttributeValue(null, "schemeIdUri"));
  }

  protected RangedUri parseInitialization(XmlPullParser paramXmlPullParser, Uri paramUri)
  {
    return parseRangedUrl(paramXmlPullParser, paramUri, "sourceURL", "range");
  }

  protected MediaPresentationDescription parseMediaPresentationDescription(XmlPullParser paramXmlPullParser, String paramString, Uri paramUri)
    throws XmlPullParserException, IOException, ParseException
  {
    long l1 = parseDateTime(paramXmlPullParser, "availabilityStartTime", -1L);
    long l2 = parseDuration(paramXmlPullParser, "mediaPresentationDuration", -1L);
    long l3 = parseDuration(paramXmlPullParser, "minBufferTime", -1L);
    String str = paramXmlPullParser.getAttributeValue(null, "type");
    boolean bool;
    long l4;
    label80: long l5;
    label97: UtcTimingElement localUtcTimingElement;
    ArrayList localArrayList;
    if (str != null)
    {
      bool = str.equals("dynamic");
      if (!bool)
        break label167;
      l4 = parseDuration(paramXmlPullParser, "minimumUpdatePeriod", -1L);
      if (!bool)
        break label175;
      l5 = parseDuration(paramXmlPullParser, "timeShiftBufferDepth", -1L);
      localUtcTimingElement = null;
      localArrayList = new ArrayList();
    }
    label167: label175: label231: 
    while (true)
    {
      paramXmlPullParser.next();
      if (isStartTag(paramXmlPullParser, "BaseURL"))
        paramUri = parseBaseUrl(paramXmlPullParser, paramUri);
      while (true)
      {
        if (!isEndTag(paramXmlPullParser, "MPD"))
          break label231;
        return buildMediaPresentationDescription(l1, l2, l3, bool, l4, l5, localUtcTimingElement, localArrayList);
        bool = false;
        break;
        l4 = -1L;
        break label80;
        l5 = -1L;
        break label97;
        if (isStartTag(paramXmlPullParser, "UTCTiming"))
          localUtcTimingElement = parseUtcTiming(paramXmlPullParser);
        else if (isStartTag(paramXmlPullParser, "Period"))
          localArrayList.add(parsePeriod(paramXmlPullParser, paramString, paramUri, l2));
      }
    }
  }

  protected Period parsePeriod(XmlPullParser paramXmlPullParser, String paramString, Uri paramUri, long paramLong)
    throws XmlPullParserException, IOException
  {
    String str = paramXmlPullParser.getAttributeValue(null, "id");
    long l1 = parseDuration(paramXmlPullParser, "start", 0L);
    long l2 = parseDuration(paramXmlPullParser, "duration", paramLong);
    Object localObject = null;
    ArrayList localArrayList = new ArrayList();
    while (true)
    {
      paramXmlPullParser.next();
      if (isStartTag(paramXmlPullParser, "BaseURL"))
        paramUri = parseBaseUrl(paramXmlPullParser, paramUri);
      while (isEndTag(paramXmlPullParser, "Period"))
      {
        return buildPeriod(str, l1, l2, localArrayList);
        if (isStartTag(paramXmlPullParser, "AdaptationSet"))
          localArrayList.add(parseAdaptationSet(paramXmlPullParser, paramString, paramUri, l1, l2, (SegmentBase)localObject));
        else if (isStartTag(paramXmlPullParser, "SegmentBase"))
          localObject = parseSegmentBase(paramXmlPullParser, paramUri, null);
        else if (isStartTag(paramXmlPullParser, "SegmentList"))
          localObject = parseSegmentList(paramXmlPullParser, paramUri, null, l2);
        else if (isStartTag(paramXmlPullParser, "SegmentTemplate"))
          localObject = parseSegmentTemplate(paramXmlPullParser, paramUri, null, l2);
      }
    }
  }

  protected RangedUri parseRangedUrl(XmlPullParser paramXmlPullParser, Uri paramUri, String paramString1, String paramString2)
  {
    String str1 = paramXmlPullParser.getAttributeValue(null, paramString1);
    long l1 = 0L;
    long l2 = -1L;
    String str2 = paramXmlPullParser.getAttributeValue(null, paramString2);
    if (str2 != null)
    {
      String[] arrayOfString = str2.split("-");
      l1 = Long.parseLong(arrayOfString[0]);
      l2 = 1L + (Long.parseLong(arrayOfString[1]) - l1);
    }
    return buildRangedUri(paramUri, str1, l1, l2);
  }

  protected Representation parseRepresentation(XmlPullParser paramXmlPullParser, String paramString1, Uri paramUri, long paramLong1, long paramLong2, String paramString2, String paramString3, SegmentBase paramSegmentBase, ContentProtectionsBuilder paramContentProtectionsBuilder)
    throws XmlPullParserException, IOException
  {
    String str1 = paramXmlPullParser.getAttributeValue(null, "id");
    int i = parseInt(paramXmlPullParser, "bandwidth");
    int j = parseInt(paramXmlPullParser, "audioSamplingRate");
    int k = parseInt(paramXmlPullParser, "width");
    int m = parseInt(paramXmlPullParser, "height");
    String str2 = parseString(paramXmlPullParser, "mimeType", paramString2);
    String str3 = parseString(paramXmlPullParser, "codecs", null);
    int i1;
    for (int n = -1; ; n = i1)
    {
      paramXmlPullParser.next();
      Format localFormat;
      if (isStartTag(paramXmlPullParser, "BaseURL"))
      {
        paramUri = parseBaseUrl(paramXmlPullParser, paramUri);
        i1 = n;
        if (!isEndTag(paramXmlPullParser, "Representation"))
          continue;
        localFormat = buildFormat(str1, str2, k, m, i1, j, i, paramString3, str3);
        if (paramSegmentBase == null)
          break label316;
      }
      label316: for (Object localObject = paramSegmentBase; ; localObject = new SegmentBase.SingleSegmentBase(paramUri))
      {
        return buildRepresentation(paramLong1, paramLong2, paramString1, -1, localFormat, (SegmentBase)localObject);
        if (isStartTag(paramXmlPullParser, "AudioChannelConfiguration"))
        {
          i1 = Integer.parseInt(paramXmlPullParser.getAttributeValue(null, "value"));
          break;
        }
        if (isStartTag(paramXmlPullParser, "SegmentBase"))
        {
          SegmentBase.SingleSegmentBase localSingleSegmentBase = (SegmentBase.SingleSegmentBase)paramSegmentBase;
          paramSegmentBase = parseSegmentBase(paramXmlPullParser, paramUri, localSingleSegmentBase);
          i1 = n;
          break;
        }
        if (isStartTag(paramXmlPullParser, "SegmentList"))
        {
          SegmentBase.SegmentList localSegmentList = (SegmentBase.SegmentList)paramSegmentBase;
          paramSegmentBase = parseSegmentList(paramXmlPullParser, paramUri, localSegmentList, paramLong2);
          i1 = n;
          break;
        }
        if (isStartTag(paramXmlPullParser, "SegmentTemplate"))
        {
          SegmentBase.SegmentTemplate localSegmentTemplate = (SegmentBase.SegmentTemplate)paramSegmentBase;
          paramSegmentBase = parseSegmentTemplate(paramXmlPullParser, paramUri, localSegmentTemplate, paramLong2);
          i1 = n;
          break;
        }
        if (isStartTag(paramXmlPullParser, "ContentProtection"))
          paramContentProtectionsBuilder.addRepresentationProtection(parseContentProtection(paramXmlPullParser));
        i1 = n;
        break;
      }
    }
  }

  protected SegmentBase.SingleSegmentBase parseSegmentBase(XmlPullParser paramXmlPullParser, Uri paramUri, SegmentBase.SingleSegmentBase paramSingleSegmentBase)
    throws XmlPullParserException, IOException
  {
    long l1;
    long l2;
    long l3;
    label31: long l4;
    long l5;
    label52: long l6;
    label62: RangedUri localRangedUri;
    if (paramSingleSegmentBase != null)
    {
      l1 = paramSingleSegmentBase.timescale;
      l2 = parseLong(paramXmlPullParser, "timescale", l1);
      if (paramSingleSegmentBase == null)
        break label179;
      l3 = paramSingleSegmentBase.presentationTimeOffset;
      l4 = parseLong(paramXmlPullParser, "presentationTimeOffset", l3);
      if (paramSingleSegmentBase == null)
        break label185;
      l5 = paramSingleSegmentBase.indexStart;
      if (paramSingleSegmentBase == null)
        break label191;
      l6 = paramSingleSegmentBase.indexLength;
      String str = paramXmlPullParser.getAttributeValue(null, "indexRange");
      if (str != null)
      {
        String[] arrayOfString = str.split("-");
        l5 = Long.parseLong(arrayOfString[0]);
        l6 = 1L + (Long.parseLong(arrayOfString[1]) - l5);
      }
      if (paramSingleSegmentBase == null)
        break label199;
      localRangedUri = paramSingleSegmentBase.initialization;
    }
    while (true)
    {
      paramXmlPullParser.next();
      if (isStartTag(paramXmlPullParser, "Initialization"))
        localRangedUri = parseInitialization(paramXmlPullParser, paramUri);
      if (isEndTag(paramXmlPullParser, "SegmentBase"))
      {
        return buildSingleSegmentBase(localRangedUri, l2, l4, paramUri, l5, l6);
        l1 = 1L;
        break;
        label179: l3 = 0L;
        break label31;
        label185: l5 = 0L;
        break label52;
        label191: l6 = -1L;
        break label62;
        label199: localRangedUri = null;
      }
    }
  }

  protected SegmentBase.SegmentList parseSegmentList(XmlPullParser paramXmlPullParser, Uri paramUri, SegmentBase.SegmentList paramSegmentList, long paramLong)
    throws XmlPullParserException, IOException
  {
    long l1;
    long l2;
    long l3;
    label31: long l4;
    long l5;
    label52: long l6;
    int i;
    label73: int j;
    RangedUri localRangedUri;
    List localList;
    Object localObject;
    if (paramSegmentList != null)
    {
      l1 = paramSegmentList.timescale;
      l2 = parseLong(paramXmlPullParser, "timescale", l1);
      if (paramSegmentList == null)
        break label174;
      l3 = paramSegmentList.presentationTimeOffset;
      l4 = parseLong(paramXmlPullParser, "presentationTimeOffset", l3);
      if (paramSegmentList == null)
        break label180;
      l5 = paramSegmentList.duration;
      l6 = parseLong(paramXmlPullParser, "duration", l5);
      if (paramSegmentList == null)
        break label188;
      i = paramSegmentList.startNumber;
      j = parseInt(paramXmlPullParser, "startNumber", i);
      localRangedUri = null;
      localList = null;
      localObject = null;
      label93: paramXmlPullParser.next();
      if (!isStartTag(paramXmlPullParser, "Initialization"))
        break label194;
      localRangedUri = parseInitialization(paramXmlPullParser, paramUri);
      label118: if (!isEndTag(paramXmlPullParser, "SegmentList"))
        break label253;
      if (paramSegmentList != null)
      {
        if (localRangedUri == null)
          break label255;
        label137: if (localList == null)
          break label264;
        label142: if (localObject == null)
          break label273;
      }
    }
    while (true)
    {
      return buildSegmentList(localRangedUri, l2, l4, paramLong, j, l6, localList, (List)localObject);
      l1 = 1L;
      break;
      label174: l3 = 0L;
      break label31;
      label180: l5 = -1L;
      break label52;
      label188: i = 1;
      break label73;
      label194: if (isStartTag(paramXmlPullParser, "SegmentTimeline"))
      {
        localList = parseSegmentTimeline(paramXmlPullParser);
        break label118;
      }
      if (!isStartTag(paramXmlPullParser, "SegmentURL"))
        break label118;
      if (localObject == null)
        localObject = new ArrayList();
      ((List)localObject).add(parseSegmentUrl(paramXmlPullParser, paramUri));
      break label118;
      label253: break label93;
      label255: localRangedUri = paramSegmentList.initialization;
      break label137;
      label264: localList = paramSegmentList.segmentTimeline;
      break label142;
      label273: localObject = paramSegmentList.mediaSegments;
    }
  }

  protected SegmentBase.SegmentTemplate parseSegmentTemplate(XmlPullParser paramXmlPullParser, Uri paramUri, SegmentBase.SegmentTemplate paramSegmentTemplate, long paramLong)
    throws XmlPullParserException, IOException
  {
    long l1;
    long l2;
    long l3;
    label31: long l4;
    long l5;
    label52: long l6;
    int i;
    label73: int j;
    UrlTemplate localUrlTemplate1;
    label94: UrlTemplate localUrlTemplate2;
    UrlTemplate localUrlTemplate3;
    label116: UrlTemplate localUrlTemplate4;
    RangedUri localRangedUri;
    List localList;
    if (paramSegmentTemplate != null)
    {
      l1 = paramSegmentTemplate.timescale;
      l2 = parseLong(paramXmlPullParser, "timescale", l1);
      if (paramSegmentTemplate == null)
        break label213;
      l3 = paramSegmentTemplate.presentationTimeOffset;
      l4 = parseLong(paramXmlPullParser, "presentationTimeOffset", l3);
      if (paramSegmentTemplate == null)
        break label219;
      l5 = paramSegmentTemplate.duration;
      l6 = parseLong(paramXmlPullParser, "duration", l5);
      if (paramSegmentTemplate == null)
        break label227;
      i = paramSegmentTemplate.startNumber;
      j = parseInt(paramXmlPullParser, "startNumber", i);
      if (paramSegmentTemplate == null)
        break label233;
      localUrlTemplate1 = paramSegmentTemplate.mediaTemplate;
      localUrlTemplate2 = parseUrlTemplate(paramXmlPullParser, "media", localUrlTemplate1);
      if (paramSegmentTemplate == null)
        break label239;
      localUrlTemplate3 = paramSegmentTemplate.initializationTemplate;
      localUrlTemplate4 = parseUrlTemplate(paramXmlPullParser, "initialization", localUrlTemplate3);
      localRangedUri = null;
      localList = null;
      label134: paramXmlPullParser.next();
      if (!isStartTag(paramXmlPullParser, "Initialization"))
        break label245;
      localRangedUri = parseInitialization(paramXmlPullParser, paramUri);
      label159: if (!isEndTag(paramXmlPullParser, "SegmentTemplate"))
        break label263;
      if (paramSegmentTemplate != null)
      {
        if (localRangedUri == null)
          break label265;
        label178: if (localList == null)
          break label274;
      }
    }
    while (true)
    {
      return buildSegmentTemplate(localRangedUri, l2, l4, paramLong, j, l6, localList, localUrlTemplate4, localUrlTemplate2, paramUri);
      l1 = 1L;
      break;
      label213: l3 = 0L;
      break label31;
      label219: l5 = -1L;
      break label52;
      label227: i = 1;
      break label73;
      label233: localUrlTemplate1 = null;
      break label94;
      label239: localUrlTemplate3 = null;
      break label116;
      label245: if (!isStartTag(paramXmlPullParser, "SegmentTimeline"))
        break label159;
      localList = parseSegmentTimeline(paramXmlPullParser);
      break label159;
      label263: break label134;
      label265: localRangedUri = paramSegmentTemplate.initialization;
      break label178;
      label274: localList = paramSegmentTemplate.segmentTimeline;
    }
  }

  protected List<SegmentBase.SegmentTimelineElement> parseSegmentTimeline(XmlPullParser paramXmlPullParser)
    throws XmlPullParserException, IOException
  {
    ArrayList localArrayList = new ArrayList();
    long l1 = 0L;
    do
    {
      paramXmlPullParser.next();
      if (isStartTag(paramXmlPullParser, "S"))
      {
        l1 = parseLong(paramXmlPullParser, "t", l1);
        long l2 = parseLong(paramXmlPullParser, "d");
        int i = 1 + parseInt(paramXmlPullParser, "r", 0);
        for (int j = 0; j < i; j++)
        {
          localArrayList.add(buildSegmentTimelineElement(l1, l2));
          l1 += l2;
        }
      }
    }
    while (!isEndTag(paramXmlPullParser, "SegmentTimeline"));
    return localArrayList;
  }

  protected RangedUri parseSegmentUrl(XmlPullParser paramXmlPullParser, Uri paramUri)
  {
    return parseRangedUrl(paramXmlPullParser, paramUri, "media", "mediaRange");
  }

  protected UrlTemplate parseUrlTemplate(XmlPullParser paramXmlPullParser, String paramString, UrlTemplate paramUrlTemplate)
  {
    String str = paramXmlPullParser.getAttributeValue(null, paramString);
    if (str != null)
      paramUrlTemplate = UrlTemplate.compile(str);
    return paramUrlTemplate;
  }

  protected UtcTimingElement parseUtcTiming(XmlPullParser paramXmlPullParser)
  {
    return buildUtcTimingElement(paramXmlPullParser.getAttributeValue(null, "schemeIdUri"), paramXmlPullParser.getAttributeValue(null, "value"));
  }

  protected static final class ContentProtectionsBuilder
    implements Comparator<ContentProtection>
  {
    private ArrayList<ContentProtection> adaptationSetProtections;
    private ArrayList<ContentProtection> currentRepresentationProtections;
    private ArrayList<ContentProtection> representationProtections;
    private boolean representationProtectionsSet;

    private void maybeAddContentProtection(List<ContentProtection> paramList, ContentProtection paramContentProtection)
    {
      if (!paramList.contains(paramContentProtection))
      {
        int i = 0;
        if (i < paramList.size())
        {
          if (!((ContentProtection)paramList.get(i)).schemeUriId.equals(paramContentProtection.schemeUriId));
          for (boolean bool = true; ; bool = false)
          {
            Assertions.checkState(bool);
            i++;
            break;
          }
        }
        paramList.add(paramContentProtection);
      }
    }

    public void addAdaptationSetProtection(ContentProtection paramContentProtection)
    {
      if (this.adaptationSetProtections == null)
        this.adaptationSetProtections = new ArrayList();
      maybeAddContentProtection(this.adaptationSetProtections, paramContentProtection);
    }

    public void addRepresentationProtection(ContentProtection paramContentProtection)
    {
      if (this.currentRepresentationProtections == null)
        this.currentRepresentationProtections = new ArrayList();
      maybeAddContentProtection(this.currentRepresentationProtections, paramContentProtection);
    }

    public ArrayList<ContentProtection> build()
    {
      if (this.adaptationSetProtections == null)
        return this.representationProtections;
      if (this.representationProtections == null)
        return this.adaptationSetProtections;
      for (int i = 0; i < this.representationProtections.size(); i++)
        maybeAddContentProtection(this.adaptationSetProtections, (ContentProtection)this.representationProtections.get(i));
      return this.adaptationSetProtections;
    }

    public int compare(ContentProtection paramContentProtection1, ContentProtection paramContentProtection2)
    {
      return paramContentProtection1.schemeUriId.compareTo(paramContentProtection2.schemeUriId);
    }

    public void endRepresentation()
    {
      boolean bool = true;
      if (!this.representationProtectionsSet)
      {
        if (this.currentRepresentationProtections != null)
          Collections.sort(this.currentRepresentationProtections, this);
        this.representationProtections = this.currentRepresentationProtections;
        this.representationProtectionsSet = bool;
      }
      while (true)
      {
        this.currentRepresentationProtections = null;
        return;
        if (this.currentRepresentationProtections == null)
        {
          if (this.representationProtections == null);
          while (true)
          {
            Assertions.checkState(bool);
            break;
            bool = false;
          }
        }
        Collections.sort(this.currentRepresentationProtections, this);
        Assertions.checkState(this.currentRepresentationProtections.equals(this.representationProtections));
      }
    }
  }
}