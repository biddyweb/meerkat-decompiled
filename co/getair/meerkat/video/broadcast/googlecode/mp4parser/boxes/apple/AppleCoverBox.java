package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import java.nio.ByteBuffer;

public class AppleCoverBox extends AppleDataBox
{
  private static final int IMAGE_TYPE_JPG = 13;
  private static final int IMAGE_TYPE_PNG = 14;
  private byte[] data;

  public AppleCoverBox()
  {
    super("covr", 1);
  }

  private void setImageData(byte[] paramArrayOfByte, int paramInt)
  {
    this.data = paramArrayOfByte;
    this.dataType = paramInt;
  }

  public byte[] getCoverData()
  {
    return this.data;
  }

  protected int getDataLength()
  {
    return this.data.length;
  }

  protected void parseData(ByteBuffer paramByteBuffer)
  {
    this.data = new byte[paramByteBuffer.limit()];
    paramByteBuffer.get(this.data);
  }

  public void setJpg(byte[] paramArrayOfByte)
  {
    setImageData(paramArrayOfByte, 13);
  }

  public void setPng(byte[] paramArrayOfByte)
  {
    setImageData(paramArrayOfByte, 14);
  }

  protected byte[] writeData()
  {
    return this.data;
  }
}