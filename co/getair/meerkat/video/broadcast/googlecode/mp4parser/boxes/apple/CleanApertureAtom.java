package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class CleanApertureAtom extends AbstractFullBox
{
  public static final String TYPE = "clef";
  double height;
  double width;

  public CleanApertureAtom()
  {
    super("clef");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.width = IsoTypeReader.readFixedPoint1616(paramByteBuffer);
    this.height = IsoTypeReader.readFixedPoint1616(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.width);
    IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.height);
  }

  protected long getContentSize()
  {
    return 12L;
  }

  public double getHeight()
  {
    return this.height;
  }

  public double getWidth()
  {
    return this.width;
  }

  public void setHeight(double paramDouble)
  {
    this.height = paramDouble;
  }

  public void setWidth(double paramDouble)
  {
    this.width = paramDouble;
  }
}