package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.dece;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.annotations.DoNotParseDetail;
import java.nio.ByteBuffer;

public class AssetInformationBox extends AbstractFullBox
{
  public static final String TYPE = "ainf";
  String apid = "";
  String profileVersion = "0000";

  static
  {
    if (!AssetInformationBox.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  public AssetInformationBox()
  {
    super("ainf");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.profileVersion = IsoTypeReader.readString(paramByteBuffer, 4);
    this.apid = IsoTypeReader.readString(paramByteBuffer);
  }

  public String getApid()
  {
    return this.apid;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    if (getVersion() == 0)
    {
      paramByteBuffer.put(Utf8.convert(this.profileVersion), 0, 4);
      paramByteBuffer.put(Utf8.convert(this.apid));
      paramByteBuffer.put((byte)0);
      return;
    }
    throw new RuntimeException("Unknown ainf version " + getVersion());
  }

  protected long getContentSize()
  {
    return 9 + Utf8.utf8StringLengthInBytes(this.apid);
  }

  public String getProfileVersion()
  {
    return this.profileVersion;
  }

  @DoNotParseDetail
  public boolean isHidden()
  {
    return (0x1 & getFlags()) == 1;
  }

  public void setApid(String paramString)
  {
    this.apid = paramString;
  }

  @DoNotParseDetail
  public void setHidden(boolean paramBoolean)
  {
    int i = getFlags();
    if ((paramBoolean ^ isHidden()))
    {
      if (paramBoolean)
        setFlags(i | 0x1);
    }
    else
      return;
    setFlags(0xFFFFFE & i);
  }

  public void setProfileVersion(String paramString)
  {
    assert ((paramString != null) && (paramString.length() == 4));
    this.profileVersion = paramString;
  }
}