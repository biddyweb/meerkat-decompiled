package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class SchemeTypeBox extends AbstractFullBox
{
  public static final String TYPE = "schm";
  String schemeType = "    ";
  String schemeUri = null;
  long schemeVersion;

  static
  {
    if (!SchemeTypeBox.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  public SchemeTypeBox()
  {
    super("schm");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.schemeType = IsoTypeReader.read4cc(paramByteBuffer);
    this.schemeVersion = IsoTypeReader.readUInt32(paramByteBuffer);
    if ((0x1 & getFlags()) == 1)
      this.schemeUri = IsoTypeReader.readString(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    paramByteBuffer.put(IsoFile.fourCCtoBytes(this.schemeType));
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.schemeVersion);
    if ((0x1 & getFlags()) == 1)
      paramByteBuffer.put(Utf8.convert(this.schemeUri));
  }

  protected long getContentSize()
  {
    if ((0x1 & getFlags()) == 1);
    for (int i = 1 + Utf8.utf8StringLengthInBytes(this.schemeUri); ; i = 0)
      return i + 12;
  }

  public String getSchemeType()
  {
    return this.schemeType;
  }

  public String getSchemeUri()
  {
    return this.schemeUri;
  }

  public long getSchemeVersion()
  {
    return this.schemeVersion;
  }

  public void setSchemeType(String paramString)
  {
    assert ((paramString != null) && (paramString.length() == 4)) : "SchemeType may not be null or not 4 bytes long";
    this.schemeType = paramString;
  }

  public void setSchemeUri(String paramString)
  {
    this.schemeUri = paramString;
  }

  public void setSchemeVersion(int paramInt)
  {
    this.schemeVersion = paramInt;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("Schema Type Box[");
    localStringBuilder.append("schemeUri=").append(this.schemeUri).append("; ");
    localStringBuilder.append("schemeType=").append(this.schemeType).append("; ");
    localStringBuilder.append("schemeVersion=").append(this.schemeVersion).append("; ");
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}