package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public class Ovc1VisualSampleEntryImpl extends AbstractSampleEntry
{
  public static final String TYPE = "ovc1";
  private byte[] vc1Content = new byte[0];

  public Ovc1VisualSampleEntryImpl()
  {
    super("ovc1");
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    paramWritableByteChannel.write(getHeader());
    ByteBuffer localByteBuffer = ByteBuffer.allocate(8);
    localByteBuffer.position(6);
    IsoTypeWriter.writeUInt16(localByteBuffer, this.dataReferenceIndex);
    paramWritableByteChannel.write((ByteBuffer)localByteBuffer.rewind());
    paramWritableByteChannel.write(ByteBuffer.wrap(this.vc1Content));
  }

  public long getSize()
  {
    if ((this.largeBox) || (16 + this.vc1Content.length >= 4294967296L));
    for (long l = 16L; ; l = 8L)
      return 8L + (l + this.vc1Content.length);
  }

  public byte[] getVc1Content()
  {
    return this.vc1Content;
  }

  public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(CastUtils.l2i(paramLong));
    paramDataSource.read(localByteBuffer);
    localByteBuffer.position(6);
    this.dataReferenceIndex = IsoTypeReader.readUInt16(localByteBuffer);
    this.vc1Content = new byte[localByteBuffer.remaining()];
    localByteBuffer.get(this.vc1Content);
  }

  public void setVc1Content(byte[] paramArrayOfByte)
  {
    this.vc1Content = paramArrayOfByte;
  }
}