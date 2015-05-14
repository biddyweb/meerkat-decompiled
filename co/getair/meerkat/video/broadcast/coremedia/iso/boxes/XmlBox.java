package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class XmlBox extends AbstractFullBox
{
  public static final String TYPE = "xml ";
  String xml = "";

  public XmlBox()
  {
    super("xml ");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.xml = IsoTypeReader.readString(paramByteBuffer, paramByteBuffer.remaining());
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    paramByteBuffer.put(Utf8.convert(this.xml));
  }

  protected long getContentSize()
  {
    return 4 + Utf8.utf8StringLengthInBytes(this.xml);
  }

  public String getXml()
  {
    return this.xml;
  }

  public void setXml(String paramString)
  {
    this.xml = paramString;
  }

  public String toString()
  {
    return "XmlBox{xml='" + this.xml + '\'' + '}';
  }
}