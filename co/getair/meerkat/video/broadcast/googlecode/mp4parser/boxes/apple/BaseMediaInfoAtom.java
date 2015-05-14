package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class BaseMediaInfoAtom extends AbstractFullBox
{
  public static final String TYPE = "gmin";
  short balance;
  short graphicsMode = 64;
  int opColorB = 32768;
  int opColorG = 32768;
  int opColorR = 32768;
  short reserved;

  public BaseMediaInfoAtom()
  {
    super("gmin");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.graphicsMode = paramByteBuffer.getShort();
    this.opColorR = IsoTypeReader.readUInt16(paramByteBuffer);
    this.opColorG = IsoTypeReader.readUInt16(paramByteBuffer);
    this.opColorB = IsoTypeReader.readUInt16(paramByteBuffer);
    this.balance = paramByteBuffer.getShort();
    this.reserved = paramByteBuffer.getShort();
  }

  public short getBalance()
  {
    return this.balance;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    paramByteBuffer.putShort(this.graphicsMode);
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.opColorR);
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.opColorG);
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.opColorB);
    paramByteBuffer.putShort(this.balance);
    paramByteBuffer.putShort(this.reserved);
  }

  protected long getContentSize()
  {
    return 16L;
  }

  public short getGraphicsMode()
  {
    return this.graphicsMode;
  }

  public int getOpColorB()
  {
    return this.opColorB;
  }

  public int getOpColorG()
  {
    return this.opColorG;
  }

  public int getOpColorR()
  {
    return this.opColorR;
  }

  public short getReserved()
  {
    return this.reserved;
  }

  public void setBalance(short paramShort)
  {
    this.balance = paramShort;
  }

  public void setGraphicsMode(short paramShort)
  {
    this.graphicsMode = paramShort;
  }

  public void setOpColorB(int paramInt)
  {
    this.opColorB = paramInt;
  }

  public void setOpColorG(int paramInt)
  {
    this.opColorG = paramInt;
  }

  public void setOpColorR(int paramInt)
  {
    this.opColorR = paramInt;
  }

  public void setReserved(short paramShort)
  {
    this.reserved = paramShort;
  }

  public String toString()
  {
    return "BaseMediaInfoAtom{graphicsMode=" + this.graphicsMode + ", opColorR=" + this.opColorR + ", opColorG=" + this.opColorG + ", opColorB=" + this.opColorB + ", balance=" + this.balance + ", reserved=" + this.reserved + '}';
  }
}