package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class TierInfoBox extends AbstractBox
{
  public static final String TYPE = "tiri";
  int constantFrameRate;
  int discardable;
  int frameRate;
  int levelIndication;
  int profileIndication;
  int profile_compatibility;
  int reserved1 = 0;
  int reserved2 = 0;
  int tierID;
  int visualHeight;
  int visualWidth;

  public TierInfoBox()
  {
    super("tiri");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.tierID = IsoTypeReader.readUInt16(paramByteBuffer);
    this.profileIndication = IsoTypeReader.readUInt8(paramByteBuffer);
    this.profile_compatibility = IsoTypeReader.readUInt8(paramByteBuffer);
    this.levelIndication = IsoTypeReader.readUInt8(paramByteBuffer);
    this.reserved1 = IsoTypeReader.readUInt8(paramByteBuffer);
    this.visualWidth = IsoTypeReader.readUInt16(paramByteBuffer);
    this.visualHeight = IsoTypeReader.readUInt16(paramByteBuffer);
    int i = IsoTypeReader.readUInt8(paramByteBuffer);
    this.discardable = ((i & 0xC0) >> 6);
    this.constantFrameRate = ((i & 0x30) >> 4);
    this.reserved2 = (i & 0xF);
    this.frameRate = IsoTypeReader.readUInt16(paramByteBuffer);
  }

  public int getConstantFrameRate()
  {
    return this.constantFrameRate;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.tierID);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.profileIndication);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.profile_compatibility);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.levelIndication);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.reserved1);
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.visualWidth);
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.visualHeight);
    IsoTypeWriter.writeUInt8(paramByteBuffer, (this.discardable << 6) + (this.constantFrameRate << 4) + this.reserved2);
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.frameRate);
  }

  protected long getContentSize()
  {
    return 13L;
  }

  public int getDiscardable()
  {
    return this.discardable;
  }

  public int getFrameRate()
  {
    return this.frameRate;
  }

  public int getLevelIndication()
  {
    return this.levelIndication;
  }

  public int getProfileIndication()
  {
    return this.profileIndication;
  }

  public int getProfile_compatibility()
  {
    return this.profile_compatibility;
  }

  public int getReserved1()
  {
    return this.reserved1;
  }

  public int getReserved2()
  {
    return this.reserved2;
  }

  public int getTierID()
  {
    return this.tierID;
  }

  public int getVisualHeight()
  {
    return this.visualHeight;
  }

  public int getVisualWidth()
  {
    return this.visualWidth;
  }

  public void setConstantFrameRate(int paramInt)
  {
    this.constantFrameRate = paramInt;
  }

  public void setDiscardable(int paramInt)
  {
    this.discardable = paramInt;
  }

  public void setFrameRate(int paramInt)
  {
    this.frameRate = paramInt;
  }

  public void setLevelIndication(int paramInt)
  {
    this.levelIndication = paramInt;
  }

  public void setProfileIndication(int paramInt)
  {
    this.profileIndication = paramInt;
  }

  public void setProfile_compatibility(int paramInt)
  {
    this.profile_compatibility = paramInt;
  }

  public void setReserved1(int paramInt)
  {
    this.reserved1 = paramInt;
  }

  public void setReserved2(int paramInt)
  {
    this.reserved2 = paramInt;
  }

  public void setTierID(int paramInt)
  {
    this.tierID = paramInt;
  }

  public void setVisualHeight(int paramInt)
  {
    this.visualHeight = paramInt;
  }

  public void setVisualWidth(int paramInt)
  {
    this.visualWidth = paramInt;
  }
}