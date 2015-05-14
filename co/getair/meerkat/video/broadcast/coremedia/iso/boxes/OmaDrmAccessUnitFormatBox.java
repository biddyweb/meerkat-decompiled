package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public final class OmaDrmAccessUnitFormatBox extends AbstractFullBox
{
  public static final String TYPE = "odaf";
  private byte allBits;
  private int initVectorLength;
  private int keyIndicatorLength;
  private boolean selectiveEncryption;

  public OmaDrmAccessUnitFormatBox()
  {
    super("odaf");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.allBits = ((byte)IsoTypeReader.readUInt8(paramByteBuffer));
    if ((0x80 & this.allBits) == 128);
    for (boolean bool = true; ; bool = false)
    {
      this.selectiveEncryption = bool;
      this.keyIndicatorLength = IsoTypeReader.readUInt8(paramByteBuffer);
      this.initVectorLength = IsoTypeReader.readUInt8(paramByteBuffer);
      return;
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.allBits);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.keyIndicatorLength);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.initVectorLength);
  }

  protected long getContentSize()
  {
    return 7L;
  }

  public int getInitVectorLength()
  {
    return this.initVectorLength;
  }

  public int getKeyIndicatorLength()
  {
    return this.keyIndicatorLength;
  }

  public boolean isSelectiveEncryption()
  {
    return this.selectiveEncryption;
  }

  public void setAllBits(byte paramByte)
  {
    this.allBits = paramByte;
    if ((paramByte & 0x80) == 128);
    for (boolean bool = true; ; bool = false)
    {
      this.selectiveEncryption = bool;
      return;
    }
  }

  public void setInitVectorLength(int paramInt)
  {
    this.initVectorLength = paramInt;
  }

  public void setKeyIndicatorLength(int paramInt)
  {
    this.keyIndicatorLength = paramInt;
  }
}