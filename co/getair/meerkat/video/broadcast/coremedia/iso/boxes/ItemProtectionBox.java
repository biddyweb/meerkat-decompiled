package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.List;

public class ItemProtectionBox extends AbstractContainerBox
  implements FullBox
{
  public static final String TYPE = "ipro";
  private int flags;
  private int version;

  public ItemProtectionBox()
  {
    super("ipro");
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    paramWritableByteChannel.write(getHeader());
    ByteBuffer localByteBuffer = ByteBuffer.allocate(6);
    IsoTypeWriter.writeUInt8(localByteBuffer, this.version);
    IsoTypeWriter.writeUInt24(localByteBuffer, this.flags);
    IsoTypeWriter.writeUInt16(localByteBuffer, getBoxes().size());
    paramWritableByteChannel.write((ByteBuffer)localByteBuffer.rewind());
    writeContainer(paramWritableByteChannel);
  }

  public int getFlags()
  {
    return this.flags;
  }

  public SchemeInformationBox getItemProtectionScheme()
  {
    if (!getBoxes(SchemeInformationBox.class).isEmpty())
      return (SchemeInformationBox)getBoxes(SchemeInformationBox.class).get(0);
    return null;
  }

  public long getSize()
  {
    long l1 = getContainerSize();
    long l2 = l1 + 6L;
    if ((this.largeBox) || (l1 + 6L >= 4294967296L));
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
    ByteBuffer localByteBuffer = ByteBuffer.allocate(6);
    paramDataSource.read(localByteBuffer);
    localByteBuffer.rewind();
    this.version = IsoTypeReader.readUInt8(localByteBuffer);
    this.flags = IsoTypeReader.readUInt24(localByteBuffer);
    initContainer(paramDataSource, paramLong - 6L, paramBoxParser);
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