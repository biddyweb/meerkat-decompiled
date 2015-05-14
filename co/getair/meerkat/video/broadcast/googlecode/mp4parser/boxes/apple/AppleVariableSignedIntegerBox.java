package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReaderVariable;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriterVariable;
import java.nio.ByteBuffer;

public abstract class AppleVariableSignedIntegerBox extends AppleDataBox
{
  int intLength = 1;
  long value;

  protected AppleVariableSignedIntegerBox(String paramString)
  {
    super(paramString, 15);
  }

  protected int getDataLength()
  {
    return this.intLength;
  }

  public int getIntLength()
  {
    return this.intLength;
  }

  public long getValue()
  {
    if (!isParsed())
      parseDetails();
    return this.value;
  }

  protected void parseData(ByteBuffer paramByteBuffer)
  {
    int i = paramByteBuffer.remaining();
    this.value = IsoTypeReaderVariable.read(paramByteBuffer, i);
    this.intLength = i;
  }

  public void setIntLength(int paramInt)
  {
    this.intLength = paramInt;
  }

  public void setValue(long paramLong)
  {
    if ((paramLong <= 127L) && (paramLong > -128L))
      this.intLength = 1;
    while (true)
    {
      this.value = paramLong;
      return;
      if ((paramLong <= 32767L) && (paramLong > -32768L) && (this.intLength < 2))
        this.intLength = 2;
      else if ((paramLong <= 8388607L) && (paramLong > -8388608L) && (this.intLength < 3))
        this.intLength = 3;
      else
        this.intLength = 4;
    }
  }

  protected byte[] writeData()
  {
    int i = getDataLength();
    ByteBuffer localByteBuffer = ByteBuffer.wrap(new byte[i]);
    IsoTypeWriterVariable.write(this.value, localByteBuffer, i);
    return localByteBuffer.array();
  }
}