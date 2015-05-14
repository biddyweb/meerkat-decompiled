package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;

public class SampleSizeBox extends AbstractFullBox
{
  public static final String TYPE = "stsz";
  int sampleCount;
  private long sampleSize;
  private long[] sampleSizes = new long[0];

  public SampleSizeBox()
  {
    super("stsz");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.sampleSize = IsoTypeReader.readUInt32(paramByteBuffer);
    this.sampleCount = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
    if (this.sampleSize == 0L)
    {
      this.sampleSizes = new long[this.sampleCount];
      for (int i = 0; i < this.sampleCount; i++)
        this.sampleSizes[i] = IsoTypeReader.readUInt32(paramByteBuffer);
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.sampleSize);
    if (this.sampleSize == 0L)
    {
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.sampleSizes.length);
      long[] arrayOfLong = this.sampleSizes;
      int i = arrayOfLong.length;
      for (int j = 0; j < i; j++)
        IsoTypeWriter.writeUInt32(paramByteBuffer, arrayOfLong[j]);
    }
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.sampleCount);
  }

  protected long getContentSize()
  {
    if (this.sampleSize == 0L);
    for (int i = 4 * this.sampleSizes.length; ; i = 0)
      return i + 12;
  }

  public long getSampleCount()
  {
    if (this.sampleSize > 0L)
      return this.sampleCount;
    return this.sampleSizes.length;
  }

  public long getSampleSize()
  {
    return this.sampleSize;
  }

  public long getSampleSizeAtIndex(int paramInt)
  {
    if (this.sampleSize > 0L)
      return this.sampleSize;
    return this.sampleSizes[paramInt];
  }

  public long[] getSampleSizes()
  {
    return this.sampleSizes;
  }

  public void setSampleSize(long paramLong)
  {
    this.sampleSize = paramLong;
  }

  public void setSampleSizes(long[] paramArrayOfLong)
  {
    this.sampleSizes = paramArrayOfLong;
  }

  public String toString()
  {
    return "SampleSizeBox[sampleSize=" + getSampleSize() + ";sampleCount=" + getSampleCount() + "]";
  }
}