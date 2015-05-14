package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitWriterBuffer;
import java.nio.ByteBuffer;

public class AC3SpecificBox extends AbstractBox
{
  public static final String TYPE = "dac3";
  int acmod;
  int bitRateCode;
  int bsid;
  int bsmod;
  int fscod;
  int lfeon;
  int reserved;

  public AC3SpecificBox()
  {
    super("dac3");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    BitReaderBuffer localBitReaderBuffer = new BitReaderBuffer(paramByteBuffer);
    this.fscod = localBitReaderBuffer.readBits(2);
    this.bsid = localBitReaderBuffer.readBits(5);
    this.bsmod = localBitReaderBuffer.readBits(3);
    this.acmod = localBitReaderBuffer.readBits(3);
    this.lfeon = localBitReaderBuffer.readBits(1);
    this.bitRateCode = localBitReaderBuffer.readBits(5);
    this.reserved = localBitReaderBuffer.readBits(5);
  }

  public int getAcmod()
  {
    return this.acmod;
  }

  public int getBitRateCode()
  {
    return this.bitRateCode;
  }

  public int getBsid()
  {
    return this.bsid;
  }

  public int getBsmod()
  {
    return this.bsmod;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    BitWriterBuffer localBitWriterBuffer = new BitWriterBuffer(paramByteBuffer);
    localBitWriterBuffer.writeBits(this.fscod, 2);
    localBitWriterBuffer.writeBits(this.bsid, 5);
    localBitWriterBuffer.writeBits(this.bsmod, 3);
    localBitWriterBuffer.writeBits(this.acmod, 3);
    localBitWriterBuffer.writeBits(this.lfeon, 1);
    localBitWriterBuffer.writeBits(this.bitRateCode, 5);
    localBitWriterBuffer.writeBits(this.reserved, 5);
  }

  protected long getContentSize()
  {
    return 3L;
  }

  public int getFscod()
  {
    return this.fscod;
  }

  public int getLfeon()
  {
    return this.lfeon;
  }

  public int getReserved()
  {
    return this.reserved;
  }

  public void setAcmod(int paramInt)
  {
    this.acmod = paramInt;
  }

  public void setBitRateCode(int paramInt)
  {
    this.bitRateCode = paramInt;
  }

  public void setBsid(int paramInt)
  {
    this.bsid = paramInt;
  }

  public void setBsmod(int paramInt)
  {
    this.bsmod = paramInt;
  }

  public void setFscod(int paramInt)
  {
    this.fscod = paramInt;
  }

  public void setLfeon(int paramInt)
  {
    this.lfeon = paramInt;
  }

  public void setReserved(int paramInt)
  {
    this.reserved = paramInt;
  }

  public String toString()
  {
    return "AC3SpecificBox{fscod=" + this.fscod + ", bsid=" + this.bsid + ", bsmod=" + this.bsmod + ", acmod=" + this.acmod + ", lfeon=" + this.lfeon + ", bitRateCode=" + this.bitRateCode + ", reserved=" + this.reserved + '}';
  }
}