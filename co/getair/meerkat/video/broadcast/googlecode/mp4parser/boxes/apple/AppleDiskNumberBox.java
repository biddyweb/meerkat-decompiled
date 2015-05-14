package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import java.nio.ByteBuffer;

public class AppleDiskNumberBox extends AppleDataBox
{
  int a;
  short b;

  public AppleDiskNumberBox()
  {
    super("disk", 0);
  }

  public int getA()
  {
    return this.a;
  }

  public short getB()
  {
    return this.b;
  }

  protected int getDataLength()
  {
    return 6;
  }

  protected void parseData(ByteBuffer paramByteBuffer)
  {
    this.a = paramByteBuffer.getInt();
    this.b = paramByteBuffer.getShort();
  }

  public void setA(int paramInt)
  {
    this.a = paramInt;
  }

  public void setB(short paramShort)
  {
    this.b = paramShort;
  }

  protected byte[] writeData()
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(6);
    localByteBuffer.putInt(this.a);
    localByteBuffer.putShort(this.b);
    return localByteBuffer.array();
  }
}