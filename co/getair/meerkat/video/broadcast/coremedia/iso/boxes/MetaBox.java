package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public class MetaBox extends AbstractContainerBox
{
  public static final String TYPE = "meta";
  private int flags;
  private int version;

  public MetaBox()
  {
    super("meta");
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    paramWritableByteChannel.write(getHeader());
    ByteBuffer localByteBuffer = ByteBuffer.allocate(4);
    writeVersionAndFlags(localByteBuffer);
    paramWritableByteChannel.write((ByteBuffer)localByteBuffer.rewind());
    writeContainer(paramWritableByteChannel);
  }

  public int getFlags()
  {
    return this.flags;
  }

  public long getSize()
  {
    long l1 = getContainerSize();
    long l2 = l1 + 4L;
    if ((this.largeBox) || (l1 + 4L >= 4294967296L));
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
    ByteBuffer localByteBuffer = ByteBuffer.allocate(4);
    paramDataSource.read(localByteBuffer);
    parseVersionAndFlags((ByteBuffer)localByteBuffer.rewind());
    initContainer(paramDataSource, paramLong - 4L, paramBoxParser);
  }

  protected final long parseVersionAndFlags(ByteBuffer paramByteBuffer)
  {
    this.version = IsoTypeReader.readUInt8(paramByteBuffer);
    this.flags = IsoTypeReader.readUInt24(paramByteBuffer);
    return 4L;
  }

  public void setFlags(int paramInt)
  {
    this.flags = paramInt;
  }

  public void setVersion(int paramInt)
  {
    this.version = paramInt;
  }

  protected final void writeVersionAndFlags(ByteBuffer paramByteBuffer)
  {
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.version);
    IsoTypeWriter.writeUInt24(paramByteBuffer, this.flags);
  }
}