package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;

public class SyncSampleBox extends AbstractFullBox
{
  public static final String TYPE = "stss";
  private long[] sampleNumber;

  public SyncSampleBox()
  {
    super("stss");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    int i = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
    this.sampleNumber = new long[i];
    for (int j = 0; j < i; j++)
      this.sampleNumber[j] = IsoTypeReader.readUInt32(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.sampleNumber.length);
    long[] arrayOfLong = this.sampleNumber;
    int i = arrayOfLong.length;
    for (int j = 0; j < i; j++)
      IsoTypeWriter.writeUInt32(paramByteBuffer, arrayOfLong[j]);
  }

  protected long getContentSize()
  {
    return 8 + 4 * this.sampleNumber.length;
  }

  public long[] getSampleNumber()
  {
    return this.sampleNumber;
  }

  public void setSampleNumber(long[] paramArrayOfLong)
  {
    this.sampleNumber = paramArrayOfLong;
  }

  public String toString()
  {
    return "SyncSampleBox[entryCount=" + this.sampleNumber.length + "]";
  }
}