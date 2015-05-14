package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.apple;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class AppleDataRateBox extends AbstractFullBox
{
  public static final String TYPE = "rmdr";
  private long dataRate;

  public AppleDataRateBox()
  {
    super("rmdr");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.dataRate = IsoTypeReader.readUInt32(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.dataRate);
  }

  protected long getContentSize()
  {
    return 8L;
  }

  public long getDataRate()
  {
    return this.dataRate;
  }
}