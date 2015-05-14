package co.getair.meerkat.video.broadcast.googlecode.mp4parser;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public class AbstractContainerBox extends BasicContainer
  implements Box
{
  protected boolean largeBox;
  private long offset;
  Container parent;
  protected String type;

  public AbstractContainerBox(String paramString)
  {
    this.type = paramString;
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    paramWritableByteChannel.write(getHeader());
    writeContainer(paramWritableByteChannel);
  }

  protected ByteBuffer getHeader()
  {
    ByteBuffer localByteBuffer;
    if ((this.largeBox) || (getSize() >= 4294967296L))
    {
      byte[] arrayOfByte1 = new byte[16];
      arrayOfByte1[0] = 0;
      arrayOfByte1[1] = 0;
      arrayOfByte1[2] = 0;
      arrayOfByte1[3] = 1;
      arrayOfByte1[4] = this.type.getBytes()[0];
      arrayOfByte1[5] = this.type.getBytes()[1];
      arrayOfByte1[6] = this.type.getBytes()[2];
      arrayOfByte1[7] = this.type.getBytes()[3];
      arrayOfByte1[8] = 0;
      arrayOfByte1[9] = 0;
      arrayOfByte1[10] = 0;
      arrayOfByte1[11] = 0;
      arrayOfByte1[12] = 0;
      arrayOfByte1[13] = 0;
      arrayOfByte1[14] = 0;
      arrayOfByte1[15] = 0;
      localByteBuffer = ByteBuffer.wrap(arrayOfByte1);
      localByteBuffer.position(8);
      IsoTypeWriter.writeUInt64(localByteBuffer, getSize());
    }
    while (true)
    {
      localByteBuffer.rewind();
      return localByteBuffer;
      byte[] arrayOfByte2 = new byte[8];
      arrayOfByte2[0] = 0;
      arrayOfByte2[1] = 0;
      arrayOfByte2[2] = 0;
      arrayOfByte2[3] = 0;
      arrayOfByte2[4] = this.type.getBytes()[0];
      arrayOfByte2[5] = this.type.getBytes()[1];
      arrayOfByte2[6] = this.type.getBytes()[2];
      arrayOfByte2[7] = this.type.getBytes()[3];
      localByteBuffer = ByteBuffer.wrap(arrayOfByte2);
      IsoTypeWriter.writeUInt32(localByteBuffer, getSize());
    }
  }

  public long getOffset()
  {
    return this.offset;
  }

  public Container getParent()
  {
    return this.parent;
  }

  public long getSize()
  {
    long l = getContainerSize();
    if ((this.largeBox) || (8L + l >= 4294967296L));
    for (int i = 16; ; i = 8)
      return l + i;
  }

  public String getType()
  {
    return this.type;
  }

  public void initContainer(DataSource paramDataSource, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    this.dataSource = paramDataSource;
    this.parsePosition = paramDataSource.position();
    long l = this.parsePosition;
    if ((this.largeBox) || (8L + paramLong >= 4294967296L));
    for (int i = 16; ; i = 8)
    {
      this.startPosition = (l - i);
      paramDataSource.position(paramLong + paramDataSource.position());
      this.endPosition = paramDataSource.position();
      this.boxParser = paramBoxParser;
      return;
    }
  }

  public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    this.offset = (paramDataSource.position() - paramByteBuffer.remaining());
    if (paramByteBuffer.remaining() == 16);
    for (boolean bool = true; ; bool = false)
    {
      this.largeBox = bool;
      initContainer(paramDataSource, paramLong, paramBoxParser);
      return;
    }
  }

  public void setParent(Container paramContainer)
  {
    this.parent = paramContainer;
  }
}