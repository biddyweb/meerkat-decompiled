package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.annotations.DoNotParseDetail;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;

public abstract class Utf8AppleDataBox extends AppleDataBox
{
  String value;

  protected Utf8AppleDataBox(String paramString)
  {
    super(paramString, 1);
  }

  protected int getDataLength()
  {
    return this.value.getBytes(Charset.forName("UTF-8")).length;
  }

  public String getValue()
  {
    if (!isParsed())
      parseDetails();
    return this.value;
  }

  protected void parseData(ByteBuffer paramByteBuffer)
  {
    this.value = IsoTypeReader.readString(paramByteBuffer, paramByteBuffer.remaining());
  }

  public void setValue(String paramString)
  {
    this.value = paramString;
  }

  @DoNotParseDetail
  public byte[] writeData()
  {
    return Utf8.convert(this.value);
  }
}