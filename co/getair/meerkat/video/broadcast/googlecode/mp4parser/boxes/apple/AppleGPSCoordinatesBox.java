package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class AppleGPSCoordinatesBox extends AbstractBox
{
  private static final int DEFAULT_LANG = 5575;
  public static final String TYPE = "\u00A9xyz";
  String coords;
  int lang = 5575;

  public AppleGPSCoordinatesBox()
  {
    super("\u00A9xyz");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    int i = paramByteBuffer.getShort();
    this.lang = paramByteBuffer.getShort();
    byte[] arrayOfByte = new byte[i];
    paramByteBuffer.get(arrayOfByte);
    this.coords = Utf8.convert(arrayOfByte);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.putShort((short)this.coords.length());
    paramByteBuffer.putShort((short)this.lang);
    paramByteBuffer.put(Utf8.convert(this.coords));
  }

  protected long getContentSize()
  {
    return 4 + Utf8.utf8StringLengthInBytes(this.coords);
  }

  public String getValue()
  {
    return this.coords;
  }

  public void setValue(String paramString)
  {
    this.lang = 5575;
    this.coords = paramString;
  }

  public String toString()
  {
    return "AppleGPSCoordinatesBox[" + this.coords + "]";
  }
}