package co.getair.meerkat.video.broadcast.googlecode.mp4parser;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.FullBox;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.List;
import java.util.logging.Logger;

public abstract class FullContainerBox extends AbstractContainerBox
  implements FullBox
{
  private static Logger LOG = Logger.getLogger(FullContainerBox.class.getName());
  private int flags;
  private int version;

  public FullContainerBox(String paramString)
  {
    super(paramString);
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    super.getBox(paramWritableByteChannel);
  }

  public <T extends Box> List<T> getBoxes(Class<T> paramClass)
  {
    return getBoxes(paramClass, false);
  }

  public int getFlags()
  {
    return this.flags;
  }

  protected ByteBuffer getHeader()
  {
    ByteBuffer localByteBuffer;
    if ((this.largeBox) || (getSize() >= 4294967296L))
    {
      byte[] arrayOfByte1 = new byte[20];
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
      arrayOfByte1[16] = 0;
      arrayOfByte1[17] = 0;
      arrayOfByte1[18] = 0;
      arrayOfByte1[19] = 0;
      localByteBuffer = ByteBuffer.wrap(arrayOfByte1);
      localByteBuffer.position(8);
      IsoTypeWriter.writeUInt64(localByteBuffer, getSize());
      writeVersionAndFlags(localByteBuffer);
    }
    while (true)
    {
      localByteBuffer.rewind();
      return localByteBuffer;
      byte[] arrayOfByte2 = new byte[12];
      arrayOfByte2[0] = 0;
      arrayOfByte2[1] = 0;
      arrayOfByte2[2] = 0;
      arrayOfByte2[3] = 0;
      arrayOfByte2[4] = this.type.getBytes()[0];
      arrayOfByte2[5] = this.type.getBytes()[1];
      arrayOfByte2[6] = this.type.getBytes()[2];
      arrayOfByte2[7] = this.type.getBytes()[3];
      arrayOfByte2[8] = 0;
      arrayOfByte2[9] = 0;
      arrayOfByte2[10] = 0;
      arrayOfByte2[11] = 0;
      localByteBuffer = ByteBuffer.wrap(arrayOfByte2);
      IsoTypeWriter.writeUInt32(localByteBuffer, getSize());
      localByteBuffer.position(8);
      writeVersionAndFlags(localByteBuffer);
    }
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
    super.parse(paramDataSource, paramByteBuffer, paramLong, paramBoxParser);
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

  public String toString()
  {
    return getClass().getSimpleName() + "[childBoxes]";
  }

  protected final void writeVersionAndFlags(ByteBuffer paramByteBuffer)
  {
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.version);
    IsoTypeWriter.writeUInt24(paramByteBuffer, this.flags);
  }
}