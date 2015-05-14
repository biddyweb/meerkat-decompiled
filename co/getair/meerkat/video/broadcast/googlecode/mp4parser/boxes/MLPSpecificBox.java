package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitWriterBuffer;
import java.nio.ByteBuffer;

public class MLPSpecificBox extends AbstractBox
{
  public static final String TYPE = "dmlp";
  int format_info;
  int peak_data_rate;
  int reserved;
  int reserved2;

  public MLPSpecificBox()
  {
    super("dmlp");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    BitReaderBuffer localBitReaderBuffer = new BitReaderBuffer(paramByteBuffer);
    this.format_info = localBitReaderBuffer.readBits(32);
    this.peak_data_rate = localBitReaderBuffer.readBits(15);
    this.reserved = localBitReaderBuffer.readBits(1);
    this.reserved2 = localBitReaderBuffer.readBits(32);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    BitWriterBuffer localBitWriterBuffer = new BitWriterBuffer(paramByteBuffer);
    localBitWriterBuffer.writeBits(this.format_info, 32);
    localBitWriterBuffer.writeBits(this.peak_data_rate, 15);
    localBitWriterBuffer.writeBits(this.reserved, 1);
    localBitWriterBuffer.writeBits(this.reserved2, 32);
  }

  protected long getContentSize()
  {
    return 10L;
  }

  public int getFormat_info()
  {
    return this.format_info;
  }

  public int getPeak_data_rate()
  {
    return this.peak_data_rate;
  }

  public int getReserved()
  {
    return this.reserved;
  }

  public int getReserved2()
  {
    return this.reserved2;
  }

  public void setFormat_info(int paramInt)
  {
    this.format_info = paramInt;
  }

  public void setPeak_data_rate(int paramInt)
  {
    this.peak_data_rate = paramInt;
  }

  public void setReserved(int paramInt)
  {
    this.reserved = paramInt;
  }

  public void setReserved2(int paramInt)
  {
    this.reserved2 = paramInt;
  }
}