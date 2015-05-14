package com.google.android.exoplayer.smoothstreaming;

import android.net.Uri;
import android.util.Base64;
import android.util.Pair;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.CodecSpecificDataUtil;
import com.google.android.exoplayer.util.ManifestParser;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class SmoothStreamingManifestParser
  implements ManifestParser<SmoothStreamingManifest>
{
  private final XmlPullParserFactory xmlParserFactory;

  public SmoothStreamingManifestParser()
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

  public SmoothStreamingManifest parse(InputStream paramInputStream, String paramString1, String paramString2, Uri paramUri)
    throws IOException, ParserException
  {
    try
    {
      XmlPullParser localXmlPullParser = this.xmlParserFactory.newPullParser();
      localXmlPullParser.setInput(paramInputStream, paramString1);
      SmoothStreamingManifest localSmoothStreamingManifest = (SmoothStreamingManifest)new SmoothStreamMediaParser(null, paramUri).parse(localXmlPullParser);
      return localSmoothStreamingManifest;
    }
    catch (XmlPullParserException localXmlPullParserException)
    {
      throw new ParserException(localXmlPullParserException);
    }
  }

  private static abstract class ElementParser
  {
    private final Uri baseUri;
    private final List<Pair<String, Object>> normalizedAttributes;
    private final ElementParser parent;
    private final String tag;

    public ElementParser(ElementParser paramElementParser, Uri paramUri, String paramString)
    {
      this.parent = paramElementParser;
      this.baseUri = paramUri;
      this.tag = paramString;
      this.normalizedAttributes = new LinkedList();
    }

    private ElementParser newChildParser(ElementParser paramElementParser, String paramString, Uri paramUri)
    {
      if ("QualityLevel".equals(paramString))
        return new SmoothStreamingManifestParser.TrackElementParser(paramElementParser, paramUri);
      if ("Protection".equals(paramString))
        return new SmoothStreamingManifestParser.ProtectionElementParser(paramElementParser, paramUri);
      if ("StreamIndex".equals(paramString))
        return new SmoothStreamingManifestParser.StreamElementParser(paramElementParser, paramUri);
      return null;
    }

    protected void addChild(Object paramObject)
    {
    }

    protected abstract Object build();

    protected final Object getNormalizedAttribute(String paramString)
    {
      for (int i = 0; i < this.normalizedAttributes.size(); i++)
      {
        Pair localPair = (Pair)this.normalizedAttributes.get(i);
        if (((String)localPair.first).equals(paramString))
          return localPair.second;
      }
      if (this.parent == null)
        return null;
      return this.parent.getNormalizedAttribute(paramString);
    }

    protected boolean handleChildInline(String paramString)
    {
      return false;
    }

    public final Object parse(XmlPullParser paramXmlPullParser)
      throws XmlPullParserException, IOException, ParserException
    {
      int i = 0;
      int j = 0;
      switch (paramXmlPullParser.getEventType())
      {
      default:
      case 2:
      case 4:
      case 3:
        label177: String str1;
        do
        {
          while (true)
          {
            paramXmlPullParser.next();
            break;
            String str2 = paramXmlPullParser.getName();
            if (this.tag.equals(str2))
            {
              i = 1;
              parseStartTag(paramXmlPullParser);
            }
            else if (i != 0)
            {
              if (j > 0)
              {
                j++;
              }
              else if (handleChildInline(str2))
              {
                parseStartTag(paramXmlPullParser);
              }
              else
              {
                ElementParser localElementParser = newChildParser(this, str2, this.baseUri);
                if (localElementParser == null)
                {
                  j = 1;
                }
                else
                {
                  addChild(localElementParser.parse(paramXmlPullParser));
                  continue;
                  if ((i != 0) && (j == 0))
                  {
                    parseText(paramXmlPullParser);
                    continue;
                    if (i != 0)
                    {
                      if (j <= 0)
                        break label177;
                      j--;
                    }
                  }
                }
              }
            }
          }
          str1 = paramXmlPullParser.getName();
          parseEndTag(paramXmlPullParser);
        }
        while (handleChildInline(str1));
        return build();
      case 1:
      }
      return null;
    }

    protected final boolean parseBoolean(XmlPullParser paramXmlPullParser, String paramString, boolean paramBoolean)
    {
      String str = paramXmlPullParser.getAttributeValue(null, paramString);
      if (str != null)
        paramBoolean = Boolean.parseBoolean(str);
      return paramBoolean;
    }

    protected void parseEndTag(XmlPullParser paramXmlPullParser)
      throws ParserException
    {
    }

    protected final int parseInt(XmlPullParser paramXmlPullParser, String paramString, int paramInt)
      throws ParserException
    {
      String str = paramXmlPullParser.getAttributeValue(null, paramString);
      if (str != null);
      try
      {
        int i = Integer.parseInt(str);
        paramInt = i;
        return paramInt;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        throw new ParserException(localNumberFormatException);
      }
    }

    protected final long parseLong(XmlPullParser paramXmlPullParser, String paramString, long paramLong)
      throws ParserException
    {
      String str = paramXmlPullParser.getAttributeValue(null, paramString);
      if (str != null);
      try
      {
        long l = Long.parseLong(str);
        paramLong = l;
        return paramLong;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        throw new ParserException(localNumberFormatException);
      }
    }

    protected final int parseRequiredInt(XmlPullParser paramXmlPullParser, String paramString)
      throws ParserException
    {
      String str = paramXmlPullParser.getAttributeValue(null, paramString);
      if (str != null)
        try
        {
          int i = Integer.parseInt(str);
          return i;
        }
        catch (NumberFormatException localNumberFormatException)
        {
          throw new ParserException(localNumberFormatException);
        }
      throw new SmoothStreamingManifestParser.MissingFieldException(paramString);
    }

    protected final long parseRequiredLong(XmlPullParser paramXmlPullParser, String paramString)
      throws ParserException
    {
      String str = paramXmlPullParser.getAttributeValue(null, paramString);
      if (str != null)
        try
        {
          long l = Long.parseLong(str);
          return l;
        }
        catch (NumberFormatException localNumberFormatException)
        {
          throw new ParserException(localNumberFormatException);
        }
      throw new SmoothStreamingManifestParser.MissingFieldException(paramString);
    }

    protected final String parseRequiredString(XmlPullParser paramXmlPullParser, String paramString)
      throws SmoothStreamingManifestParser.MissingFieldException
    {
      String str = paramXmlPullParser.getAttributeValue(null, paramString);
      if (str != null)
        return str;
      throw new SmoothStreamingManifestParser.MissingFieldException(paramString);
    }

    protected void parseStartTag(XmlPullParser paramXmlPullParser)
      throws ParserException
    {
    }

    protected void parseText(XmlPullParser paramXmlPullParser)
      throws ParserException
    {
    }

    protected final void putNormalizedAttribute(String paramString, Object paramObject)
    {
      this.normalizedAttributes.add(Pair.create(paramString, paramObject));
    }
  }

  public static class MissingFieldException extends ParserException
  {
    public MissingFieldException(String paramString)
    {
      super();
    }
  }

  private static class ProtectionElementParser extends SmoothStreamingManifestParser.ElementParser
  {
    public static final String KEY_SYSTEM_ID = "SystemID";
    public static final String TAG = "Protection";
    public static final String TAG_PROTECTION_HEADER = "ProtectionHeader";
    private boolean inProtectionHeader;
    private byte[] initData;
    private UUID uuid;

    public ProtectionElementParser(SmoothStreamingManifestParser.ElementParser paramElementParser, Uri paramUri)
    {
      super(paramUri, "Protection");
    }

    public Object build()
    {
      return new SmoothStreamingManifest.ProtectionElement(this.uuid, this.initData);
    }

    public boolean handleChildInline(String paramString)
    {
      return "ProtectionHeader".equals(paramString);
    }

    public void parseEndTag(XmlPullParser paramXmlPullParser)
    {
      if ("ProtectionHeader".equals(paramXmlPullParser.getName()))
        this.inProtectionHeader = false;
    }

    public void parseStartTag(XmlPullParser paramXmlPullParser)
    {
      if ("ProtectionHeader".equals(paramXmlPullParser.getName()))
      {
        this.inProtectionHeader = true;
        this.uuid = UUID.fromString(paramXmlPullParser.getAttributeValue(null, "SystemID"));
      }
    }

    public void parseText(XmlPullParser paramXmlPullParser)
    {
      if (this.inProtectionHeader)
        this.initData = Base64.decode(paramXmlPullParser.getText(), 0);
    }
  }

  private static class SmoothStreamMediaParser extends SmoothStreamingManifestParser.ElementParser
  {
    private static final String KEY_DURATION = "Duration";
    private static final String KEY_DVR_WINDOW_LENGTH = "DVRWindowLength";
    private static final String KEY_IS_LIVE = "IsLive";
    private static final String KEY_LOOKAHEAD_COUNT = "LookaheadCount";
    private static final String KEY_MAJOR_VERSION = "MajorVersion";
    private static final String KEY_MINOR_VERSION = "MinorVersion";
    private static final String KEY_TIME_SCALE = "TimeScale";
    public static final String TAG = "SmoothStreamingMedia";
    private long duration;
    private long dvrWindowLength;
    private boolean isLive;
    private int lookAheadCount = -1;
    private int majorVersion;
    private int minorVersion;
    private SmoothStreamingManifest.ProtectionElement protectionElement = null;
    private List<SmoothStreamingManifest.StreamElement> streamElements = new LinkedList();
    private long timescale;

    public SmoothStreamMediaParser(SmoothStreamingManifestParser.ElementParser paramElementParser, Uri paramUri)
    {
      super(paramUri, "SmoothStreamingMedia");
    }

    public void addChild(Object paramObject)
    {
      if ((paramObject instanceof SmoothStreamingManifest.StreamElement))
        this.streamElements.add((SmoothStreamingManifest.StreamElement)paramObject);
      while (!(paramObject instanceof SmoothStreamingManifest.ProtectionElement))
        return;
      if (this.protectionElement == null);
      for (boolean bool = true; ; bool = false)
      {
        Assertions.checkState(bool);
        this.protectionElement = ((SmoothStreamingManifest.ProtectionElement)paramObject);
        return;
      }
    }

    public Object build()
    {
      SmoothStreamingManifest.StreamElement[] arrayOfStreamElement = new SmoothStreamingManifest.StreamElement[this.streamElements.size()];
      this.streamElements.toArray(arrayOfStreamElement);
      return new SmoothStreamingManifest(this.majorVersion, this.minorVersion, this.timescale, this.duration, this.dvrWindowLength, this.lookAheadCount, this.isLive, this.protectionElement, arrayOfStreamElement);
    }

    public void parseStartTag(XmlPullParser paramXmlPullParser)
      throws ParserException
    {
      this.majorVersion = parseRequiredInt(paramXmlPullParser, "MajorVersion");
      this.minorVersion = parseRequiredInt(paramXmlPullParser, "MinorVersion");
      this.timescale = parseLong(paramXmlPullParser, "TimeScale", 10000000L);
      this.duration = parseRequiredLong(paramXmlPullParser, "Duration");
      this.dvrWindowLength = parseLong(paramXmlPullParser, "DVRWindowLength", 0L);
      this.lookAheadCount = parseInt(paramXmlPullParser, "LookaheadCount", -1);
      this.isLive = parseBoolean(paramXmlPullParser, "IsLive", false);
      putNormalizedAttribute("TimeScale", Long.valueOf(this.timescale));
    }
  }

  private static class StreamElementParser extends SmoothStreamingManifestParser.ElementParser
  {
    private static final String KEY_DISPLAY_HEIGHT = "DisplayHeight";
    private static final String KEY_DISPLAY_WIDTH = "DisplayWidth";
    private static final String KEY_FRAGMENT_DURATION = "d";
    private static final String KEY_FRAGMENT_REPEAT_COUNT = "r";
    private static final String KEY_FRAGMENT_START_TIME = "t";
    private static final String KEY_LANGUAGE = "Language";
    private static final String KEY_MAX_HEIGHT = "MaxHeight";
    private static final String KEY_MAX_WIDTH = "MaxWidth";
    private static final String KEY_NAME = "Name";
    private static final String KEY_QUALITY_LEVELS = "QualityLevels";
    private static final String KEY_SUB_TYPE = "Subtype";
    private static final String KEY_TIME_SCALE = "TimeScale";
    private static final String KEY_TYPE = "Type";
    private static final String KEY_TYPE_AUDIO = "audio";
    private static final String KEY_TYPE_TEXT = "text";
    private static final String KEY_TYPE_VIDEO = "video";
    private static final String KEY_URL = "Url";
    public static final String TAG = "StreamIndex";
    private static final String TAG_STREAM_FRAGMENT = "c";
    private final Uri baseUri;
    private int displayHeight;
    private int displayWidth;
    private String language;
    private long lastChunkDuration;
    private int maxHeight;
    private int maxWidth;
    private String name;
    private int qualityLevels;
    private ArrayList<Long> startTimes;
    private String subType;
    private long timescale;
    private final List<SmoothStreamingManifest.TrackElement> tracks;
    private int type;
    private String url;

    public StreamElementParser(SmoothStreamingManifestParser.ElementParser paramElementParser, Uri paramUri)
    {
      super(paramUri, "StreamIndex");
      this.baseUri = paramUri;
      this.tracks = new LinkedList();
    }

    private void parseStreamElementStartTag(XmlPullParser paramXmlPullParser)
      throws ParserException
    {
      this.type = parseType(paramXmlPullParser);
      putNormalizedAttribute("Type", Integer.valueOf(this.type));
      if (this.type == 2);
      for (this.subType = parseRequiredString(paramXmlPullParser, "Subtype"); ; this.subType = paramXmlPullParser.getAttributeValue(null, "Subtype"))
      {
        this.name = paramXmlPullParser.getAttributeValue(null, "Name");
        this.qualityLevels = parseInt(paramXmlPullParser, "QualityLevels", -1);
        this.url = parseRequiredString(paramXmlPullParser, "Url");
        this.maxWidth = parseInt(paramXmlPullParser, "MaxWidth", -1);
        this.maxHeight = parseInt(paramXmlPullParser, "MaxHeight", -1);
        this.displayWidth = parseInt(paramXmlPullParser, "DisplayWidth", -1);
        this.displayHeight = parseInt(paramXmlPullParser, "DisplayHeight", -1);
        this.language = paramXmlPullParser.getAttributeValue(null, "Language");
        this.timescale = parseInt(paramXmlPullParser, "TimeScale", -1);
        if (this.timescale == -1L)
          this.timescale = ((Long)getNormalizedAttribute("TimeScale")).longValue();
        this.startTimes = new ArrayList();
        return;
      }
    }

    private void parseStreamFragmentStartTag(XmlPullParser paramXmlPullParser)
      throws ParserException
    {
      int i = this.startTimes.size();
      long l1 = parseLong(paramXmlPullParser, "t", -1L);
      if (l1 == -1L)
        if (i != 0)
          break label102;
      int j;
      long l2;
      for (l1 = 0L; ; l1 = ((Long)this.startTimes.get(i - 1)).longValue() + this.lastChunkDuration)
      {
        j = i + 1;
        this.startTimes.add(Long.valueOf(l1));
        this.lastChunkDuration = parseLong(paramXmlPullParser, "d", -1L);
        l2 = parseLong(paramXmlPullParser, "r", 1L);
        if ((l2 <= 1L) || (this.lastChunkDuration != -1L))
          break label148;
        throw new ParserException("Repeated chunk with unspecified duration");
        label102: if (this.lastChunkDuration == -1L)
          break;
      }
      throw new ParserException("Unable to infer start time");
      label148: for (int k = 1; k < l2; k++)
      {
        j++;
        this.startTimes.add(Long.valueOf(l1 + this.lastChunkDuration * k));
      }
    }

    private int parseType(XmlPullParser paramXmlPullParser)
      throws ParserException
    {
      String str = paramXmlPullParser.getAttributeValue(null, "Type");
      if (str != null)
      {
        if ("audio".equalsIgnoreCase(str))
          return 0;
        if ("video".equalsIgnoreCase(str))
          return 1;
        if ("text".equalsIgnoreCase(str))
          return 2;
        throw new ParserException("Invalid key value[" + str + "]");
      }
      throw new SmoothStreamingManifestParser.MissingFieldException("Type");
    }

    public void addChild(Object paramObject)
    {
      if ((paramObject instanceof SmoothStreamingManifest.TrackElement))
        this.tracks.add((SmoothStreamingManifest.TrackElement)paramObject);
    }

    public Object build()
    {
      SmoothStreamingManifest.TrackElement[] arrayOfTrackElement = new SmoothStreamingManifest.TrackElement[this.tracks.size()];
      this.tracks.toArray(arrayOfTrackElement);
      return new SmoothStreamingManifest.StreamElement(this.baseUri, this.url, this.type, this.subType, this.timescale, this.name, this.qualityLevels, this.maxWidth, this.maxHeight, this.displayWidth, this.displayHeight, this.language, arrayOfTrackElement, this.startTimes, this.lastChunkDuration);
    }

    public boolean handleChildInline(String paramString)
    {
      return "c".equals(paramString);
    }

    public void parseStartTag(XmlPullParser paramXmlPullParser)
      throws ParserException
    {
      if ("c".equals(paramXmlPullParser.getName()))
      {
        parseStreamFragmentStartTag(paramXmlPullParser);
        return;
      }
      parseStreamElementStartTag(paramXmlPullParser);
    }
  }

  private static class TrackElementParser extends SmoothStreamingManifestParser.ElementParser
  {
    private static final String KEY_AUDIO_TAG = "AudioTag";
    private static final String KEY_BITRATE = "Bitrate";
    private static final String KEY_BITS_PER_SAMPLE = "BitsPerSample";
    private static final String KEY_CHANNELS = "Channels";
    private static final String KEY_CODEC_PRIVATE_DATA = "CodecPrivateData";
    private static final String KEY_FOUR_CC = "FourCC";
    private static final String KEY_INDEX = "Index";
    private static final String KEY_MAX_HEIGHT = "MaxHeight";
    private static final String KEY_MAX_WIDTH = "MaxWidth";
    private static final String KEY_NAL_UNIT_LENGTH_FIELD = "NALUnitLengthField";
    private static final String KEY_PACKET_SIZE = "PacketSize";
    private static final String KEY_SAMPLING_RATE = "SamplingRate";
    private static final String KEY_TYPE = "Type";
    public static final String TAG = "QualityLevel";
    private int audioTag;
    private int bitPerSample;
    private int bitrate;
    private int channels;
    private String content;
    private final List<byte[]> csd = new LinkedList();
    private int index;
    private int level;
    private int maxHeight;
    private int maxWidth;
    private String mimeType;
    private int nalUnitLengthField;
    private int packetSize;
    private int profile;
    private int samplingRate;

    public TrackElementParser(SmoothStreamingManifestParser.ElementParser paramElementParser, Uri paramUri)
    {
      super(paramUri, "QualityLevel");
    }

    private static String fourCCToMimeType(String paramString)
    {
      if ((paramString.equalsIgnoreCase("H264")) || (paramString.equalsIgnoreCase("X264")) || (paramString.equalsIgnoreCase("AVC1")) || (paramString.equalsIgnoreCase("DAVC")))
        return "video/avc";
      if ((paramString.equalsIgnoreCase("AAC")) || (paramString.equalsIgnoreCase("AACL")) || (paramString.equalsIgnoreCase("AACH")) || (paramString.equalsIgnoreCase("AACP")))
        return "audio/mp4a-latm";
      if (paramString.equalsIgnoreCase("TTML"))
        return "application/ttml+xml";
      return null;
    }

    private static byte[] hexStringToByteArray(String paramString)
    {
      byte[] arrayOfByte = new byte[paramString.length() / 2];
      for (int i = 0; i < arrayOfByte.length; i++)
      {
        int j = i * 2;
        arrayOfByte[i] = ((byte)((Character.digit(paramString.charAt(j), 16) << 4) + Character.digit(paramString.charAt(j + 1), 16)));
      }
      return arrayOfByte;
    }

    public Object build()
    {
      Object localObject = (byte[][])null;
      if (!this.csd.isEmpty())
      {
        localObject = new byte[this.csd.size()][];
        this.csd.toArray((Object[])localObject);
      }
      return new SmoothStreamingManifest.TrackElement(this.index, this.bitrate, this.mimeType, (byte[][])localObject, this.profile, this.level, this.maxWidth, this.maxHeight, this.samplingRate, this.channels, this.packetSize, this.audioTag, this.bitPerSample, this.nalUnitLengthField, this.content);
    }

    public void parseStartTag(XmlPullParser paramXmlPullParser)
      throws ParserException
    {
      int i = ((Integer)getNormalizedAttribute("Type")).intValue();
      this.content = null;
      this.index = parseInt(paramXmlPullParser, "Index", -1);
      this.bitrate = parseRequiredInt(paramXmlPullParser, "Bitrate");
      this.nalUnitLengthField = parseInt(paramXmlPullParser, "NALUnitLengthField", 4);
      label153: byte[][] arrayOfByte1;
      if (i == 1)
      {
        this.maxHeight = parseRequiredInt(paramXmlPullParser, "MaxHeight");
        this.maxWidth = parseRequiredInt(paramXmlPullParser, "MaxWidth");
        this.mimeType = fourCCToMimeType(parseRequiredString(paramXmlPullParser, "FourCC"));
        if (i != 0)
          break label265;
        this.samplingRate = parseRequiredInt(paramXmlPullParser, "SamplingRate");
        this.channels = parseRequiredInt(paramXmlPullParser, "Channels");
        this.bitPerSample = parseRequiredInt(paramXmlPullParser, "BitsPerSample");
        this.packetSize = parseRequiredInt(paramXmlPullParser, "PacketSize");
        this.audioTag = parseRequiredInt(paramXmlPullParser, "AudioTag");
        String str3 = paramXmlPullParser.getAttributeValue(null, "CodecPrivateData");
        if ((str3 != null) && (str3.length() > 0))
        {
          byte[] arrayOfByte = hexStringToByteArray(str3);
          arrayOfByte1 = CodecSpecificDataUtil.splitNalUnits(arrayOfByte);
          if (arrayOfByte1 != null)
            break label293;
          this.csd.add(arrayOfByte);
        }
      }
      while (true)
      {
        return;
        this.maxHeight = -1;
        this.maxWidth = -1;
        String str1 = paramXmlPullParser.getAttributeValue(null, "FourCC");
        String str2;
        if (str1 != null)
          str2 = fourCCToMimeType(str1);
        while (true)
        {
          this.mimeType = str2;
          break;
          if (i == 0)
            str2 = "audio/mp4a-latm";
          else
            str2 = null;
        }
        label265: this.samplingRate = -1;
        this.channels = -1;
        this.bitPerSample = -1;
        this.packetSize = -1;
        this.audioTag = -1;
        break label153;
        label293: for (int j = 0; j < arrayOfByte1.length; j++)
        {
          Pair localPair = CodecSpecificDataUtil.parseSpsNalUnit(arrayOfByte1[j]);
          if (localPair != null)
          {
            this.profile = ((Integer)localPair.first).intValue();
            this.level = ((Integer)localPair.second).intValue();
          }
          this.csd.add(arrayOfByte1[j]);
        }
      }
    }

    public void parseText(XmlPullParser paramXmlPullParser)
    {
      this.content = paramXmlPullParser.getText();
    }
  }
}