package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class HandlerBox extends AbstractFullBox
{
  public static final String TYPE = "hdlr";
  public static final Map<String, String> readableTypes = Collections.unmodifiableMap(localHashMap);
  private long a;
  private long b;
  private long c;
  private String handlerType;
  private String name = null;
  private long shouldBeZeroButAppleWritesHereSomeValue;
  private boolean zeroTerm = true;

  static
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("odsm", "ObjectDescriptorStream - defined in ISO/IEC JTC1/SC29/WG11 - CODING OF MOVING PICTURES AND AUDIO");
    localHashMap.put("crsm", "ClockReferenceStream - defined in ISO/IEC JTC1/SC29/WG11 - CODING OF MOVING PICTURES AND AUDIO");
    localHashMap.put("sdsm", "SceneDescriptionStream - defined in ISO/IEC JTC1/SC29/WG11 - CODING OF MOVING PICTURES AND AUDIO");
    localHashMap.put("m7sm", "MPEG7Stream - defined in ISO/IEC JTC1/SC29/WG11 - CODING OF MOVING PICTURES AND AUDIO");
    localHashMap.put("ocsm", "ObjectContentInfoStream - defined in ISO/IEC JTC1/SC29/WG11 - CODING OF MOVING PICTURES AND AUDIO");
    localHashMap.put("ipsm", "IPMP Stream - defined in ISO/IEC JTC1/SC29/WG11 - CODING OF MOVING PICTURES AND AUDIO");
    localHashMap.put("mjsm", "MPEG-J Stream - defined in ISO/IEC JTC1/SC29/WG11 - CODING OF MOVING PICTURES AND AUDIO");
    localHashMap.put("mdir", "Apple Meta Data iTunes Reader");
    localHashMap.put("mp7b", "MPEG-7 binary XML");
    localHashMap.put("mp7t", "MPEG-7 XML");
    localHashMap.put("vide", "Video Track");
    localHashMap.put("soun", "Sound Track");
    localHashMap.put("hint", "Hint Track");
    localHashMap.put("appl", "Apple specific");
    localHashMap.put("meta", "Timed Metadata track - defined in ISO/IEC JTC1/SC29/WG11 - CODING OF MOVING PICTURES AND AUDIO");
  }

  public HandlerBox()
  {
    super("hdlr");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.shouldBeZeroButAppleWritesHereSomeValue = IsoTypeReader.readUInt32(paramByteBuffer);
    this.handlerType = IsoTypeReader.read4cc(paramByteBuffer);
    this.a = IsoTypeReader.readUInt32(paramByteBuffer);
    this.b = IsoTypeReader.readUInt32(paramByteBuffer);
    this.c = IsoTypeReader.readUInt32(paramByteBuffer);
    if (paramByteBuffer.remaining() > 0)
    {
      this.name = IsoTypeReader.readString(paramByteBuffer, paramByteBuffer.remaining());
      if (this.name.endsWith(""))
      {
        this.name = this.name.substring(0, -1 + this.name.length());
        this.zeroTerm = true;
        return;
      }
      this.zeroTerm = false;
      return;
    }
    this.zeroTerm = false;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.shouldBeZeroButAppleWritesHereSomeValue);
    paramByteBuffer.put(IsoFile.fourCCtoBytes(this.handlerType));
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.a);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.b);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.c);
    if (this.name != null)
      paramByteBuffer.put(Utf8.convert(this.name));
    if (this.zeroTerm)
      paramByteBuffer.put((byte)0);
  }

  protected long getContentSize()
  {
    if (this.zeroTerm)
      return 25 + Utf8.utf8StringLengthInBytes(this.name);
    return 24 + Utf8.utf8StringLengthInBytes(this.name);
  }

  public String getHandlerType()
  {
    return this.handlerType;
  }

  public String getHumanReadableTrackType()
  {
    if (readableTypes.get(this.handlerType) != null)
      return (String)readableTypes.get(this.handlerType);
    return "Unknown Handler Type";
  }

  public String getName()
  {
    return this.name;
  }

  public void setHandlerType(String paramString)
  {
    this.handlerType = paramString;
  }

  public void setName(String paramString)
  {
    this.name = paramString;
  }

  public String toString()
  {
    return "HandlerBox[handlerType=" + getHandlerType() + ";name=" + getName() + "]";
  }
}