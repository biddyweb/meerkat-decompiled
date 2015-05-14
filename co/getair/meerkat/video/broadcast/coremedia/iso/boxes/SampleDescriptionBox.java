package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AbstractSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.Iterator;
import java.util.List;

public class SampleDescriptionBox extends AbstractContainerBox
  implements FullBox
{
  public static final String TYPE = "stsd";
  private int flags;
  private int version;

  public SampleDescriptionBox()
  {
    super("stsd");
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    paramWritableByteChannel.write(getHeader());
    ByteBuffer localByteBuffer = ByteBuffer.allocate(8);
    IsoTypeWriter.writeUInt8(localByteBuffer, this.version);
    IsoTypeWriter.writeUInt24(localByteBuffer, this.flags);
    IsoTypeWriter.writeUInt32(localByteBuffer, getBoxes().size());
    paramWritableByteChannel.write((ByteBuffer)localByteBuffer.rewind());
    writeContainer(paramWritableByteChannel);
  }

  public int getFlags()
  {
    return this.flags;
  }

  public AbstractSampleEntry getSampleEntry()
  {
    Iterator localIterator = getBoxes(AbstractSampleEntry.class).iterator();
    if (localIterator.hasNext())
      return (AbstractSampleEntry)localIterator.next();
    return null;
  }

  public long getSize()
  {
    long l1 = getContainerSize();
    long l2 = l1 + 8L;
    if ((this.largeBox) || (8L + (l1 + 8L) >= 4294967296L));
    for (int i = 16; ; i = 8)
      return l2 + i;
  }

  public int getVersion()
  {
    return this.version;
  }

  public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(8);
    paramDataSource.read(localByteBuffer);
    localByteBuffer.rewind();
    this.version = IsoTypeReader.readUInt8(localByteBuffer);
    this.flags = IsoTypeReader.readUInt24(localByteBuffer);
    initContainer(paramDataSource, paramLong - 8L, paramBoxParser);
  }

  public void setFlags(int paramInt)
  {
    this.flags = paramInt;
  }

  public void setVersion(int paramInt)
  {
    this.version = paramInt;
  }
}