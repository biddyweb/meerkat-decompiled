package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import java.nio.ByteBuffer;

public class AppleTrackNumberBox extends AppleDataBox
{
  int a;
  int b;

  public AppleTrackNumberBox()
  {
    super("trkn", 0);
  }

  public int getA()
  {
    return this.a;
  }

  public int getB()
  {
    return this.b;
  }

  protected int getDataLength()
  {
    return 8;
  }

  protected void parseData(ByteBuffer paramByteBuffer)
  {
    this.a = paramByteBuffer.getInt();
    this.b = paramByteBuffer.getInt();
  }

  public void setA(int paramInt)
  {
    this.a = paramInt;
  }

  public void setB(int paramInt)
  {
    this.b = paramInt;
  }

  protected byte[] writeData()
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(8);
    localByteBuffer.putInt(this.a);
    localByteBuffer.putInt(this.b);
    return localByteBuffer.array();
  }
}