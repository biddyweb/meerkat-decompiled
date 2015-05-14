package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.Arrays;
import java.util.List;

public class MpegSampleEntry extends AbstractSampleEntry
{
  public MpegSampleEntry()
  {
    super("mp4s");
  }

  public MpegSampleEntry(String paramString)
  {
    super(paramString);
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    paramWritableByteChannel.write(getHeader());
    ByteBuffer localByteBuffer = ByteBuffer.allocate(8);
    localByteBuffer.position(6);
    IsoTypeWriter.writeUInt16(localByteBuffer, this.dataReferenceIndex);
    paramWritableByteChannel.write((ByteBuffer)localByteBuffer.rewind());
    writeContainer(paramWritableByteChannel);
  }

  public long getSize()
  {
    long l1 = getContainerSize();
    long l2 = l1 + 8L;
    if ((this.largeBox) || (l1 + 8L >= 4294967296L));
    for (int i = 16; ; i = 8)
      return l2 + i;
  }

  public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(8);
    paramDataSource.read(localByteBuffer);
    localByteBuffer.position(6);
    this.dataReferenceIndex = IsoTypeReader.readUInt16(localByteBuffer);
    initContainer(paramDataSource, paramLong - 8L, paramBoxParser);
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder().append("MpegSampleEntry");
    List[] arrayOfList = new List[1];
    arrayOfList[0] = getBoxes();
    return Arrays.asList(arrayOfList);
  }
}