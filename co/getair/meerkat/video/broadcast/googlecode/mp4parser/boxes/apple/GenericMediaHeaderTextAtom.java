package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class GenericMediaHeaderTextAtom extends AbstractBox
{
  public static final String TYPE = "text";
  int unknown_1 = 65536;
  int unknown_2;
  int unknown_3;
  int unknown_4;
  int unknown_5 = 65536;
  int unknown_6;
  int unknown_7;
  int unknown_8;
  int unknown_9 = 1073741824;

  public GenericMediaHeaderTextAtom()
  {
    super("text");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.unknown_1 = paramByteBuffer.getInt();
    this.unknown_2 = paramByteBuffer.getInt();
    this.unknown_3 = paramByteBuffer.getInt();
    this.unknown_4 = paramByteBuffer.getInt();
    this.unknown_5 = paramByteBuffer.getInt();
    this.unknown_6 = paramByteBuffer.getInt();
    this.unknown_7 = paramByteBuffer.getInt();
    this.unknown_8 = paramByteBuffer.getInt();
    this.unknown_9 = paramByteBuffer.getInt();
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.putInt(this.unknown_1);
    paramByteBuffer.putInt(this.unknown_2);
    paramByteBuffer.putInt(this.unknown_3);
    paramByteBuffer.putInt(this.unknown_4);
    paramByteBuffer.putInt(this.unknown_5);
    paramByteBuffer.putInt(this.unknown_6);
    paramByteBuffer.putInt(this.unknown_7);
    paramByteBuffer.putInt(this.unknown_8);
    paramByteBuffer.putInt(this.unknown_9);
  }

  protected long getContentSize()
  {
    return 36L;
  }

  public int getUnknown_1()
  {
    return this.unknown_1;
  }

  public int getUnknown_2()
  {
    return this.unknown_2;
  }

  public int getUnknown_3()
  {
    return this.unknown_3;
  }

  public int getUnknown_4()
  {
    return this.unknown_4;
  }

  public int getUnknown_5()
  {
    return this.unknown_5;
  }

  public int getUnknown_6()
  {
    return this.unknown_6;
  }

  public int getUnknown_7()
  {
    return this.unknown_7;
  }

  public int getUnknown_8()
  {
    return this.unknown_8;
  }

  public int getUnknown_9()
  {
    return this.unknown_9;
  }

  public void setUnknown_1(int paramInt)
  {
    this.unknown_1 = paramInt;
  }

  public void setUnknown_2(int paramInt)
  {
    this.unknown_2 = paramInt;
  }

  public void setUnknown_3(int paramInt)
  {
    this.unknown_3 = paramInt;
  }

  public void setUnknown_4(int paramInt)
  {
    this.unknown_4 = paramInt;
  }

  public void setUnknown_5(int paramInt)
  {
    this.unknown_5 = paramInt;
  }

  public void setUnknown_6(int paramInt)
  {
    this.unknown_6 = paramInt;
  }

  public void setUnknown_7(int paramInt)
  {
    this.unknown_7 = paramInt;
  }

  public void setUnknown_8(int paramInt)
  {
    this.unknown_8 = paramInt;
  }

  public void setUnknown_9(int paramInt)
  {
    this.unknown_9 = paramInt;
  }
}