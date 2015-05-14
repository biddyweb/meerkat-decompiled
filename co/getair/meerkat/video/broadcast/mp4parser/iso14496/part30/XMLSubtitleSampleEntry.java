package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part30;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AbstractSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public class XMLSubtitleSampleEntry extends AbstractSampleEntry
{
  public static final String TYPE = "stpp";
  private String auxiliaryMimeTypes = "";
  private String namespace = "";
  private String schemaLocation = "";

  public XMLSubtitleSampleEntry()
  {
    super("stpp");
  }

  public String getAuxiliaryMimeTypes()
  {
    return this.auxiliaryMimeTypes;
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    paramWritableByteChannel.write(getHeader());
    ByteBuffer localByteBuffer = ByteBuffer.allocate(3 + (8 + this.namespace.length() + this.schemaLocation.length() + this.auxiliaryMimeTypes.length()));
    localByteBuffer.position(6);
    IsoTypeWriter.writeUInt16(localByteBuffer, this.dataReferenceIndex);
    IsoTypeWriter.writeZeroTermUtf8String(localByteBuffer, this.namespace);
    IsoTypeWriter.writeZeroTermUtf8String(localByteBuffer, this.schemaLocation);
    IsoTypeWriter.writeZeroTermUtf8String(localByteBuffer, this.auxiliaryMimeTypes);
    paramWritableByteChannel.write((ByteBuffer)localByteBuffer.rewind());
    writeContainer(paramWritableByteChannel);
  }

  public String getNamespace()
  {
    return this.namespace;
  }

  public String getSchemaLocation()
  {
    return this.schemaLocation;
  }

  public long getSize()
  {
    long l1 = getContainerSize();
    long l2 = 3 + (8 + this.namespace.length() + this.schemaLocation.length() + this.auxiliaryMimeTypes.length());
    long l3 = l1 + l2;
    if ((this.largeBox) || (8L + (l1 + l2) >= 4294967296L));
    for (int i = 16; ; i = 8)
      return l3 + i;
  }

  public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    ByteBuffer localByteBuffer1 = ByteBuffer.allocate(8);
    paramDataSource.read((ByteBuffer)localByteBuffer1.rewind());
    localByteBuffer1.position(6);
    this.dataReferenceIndex = IsoTypeReader.readUInt16(localByteBuffer1);
    long l = paramDataSource.position();
    ByteBuffer localByteBuffer2 = ByteBuffer.allocate(1024);
    paramDataSource.read((ByteBuffer)localByteBuffer2.rewind());
    this.namespace = IsoTypeReader.readString((ByteBuffer)localByteBuffer2.rewind());
    paramDataSource.position(1L + (l + this.namespace.length()));
    paramDataSource.read((ByteBuffer)localByteBuffer2.rewind());
    this.schemaLocation = IsoTypeReader.readString((ByteBuffer)localByteBuffer2.rewind());
    paramDataSource.position(2L + (l + this.namespace.length() + this.schemaLocation.length()));
    paramDataSource.read((ByteBuffer)localByteBuffer2.rewind());
    this.auxiliaryMimeTypes = IsoTypeReader.readString((ByteBuffer)localByteBuffer2.rewind());
    paramDataSource.position(3L + (l + this.namespace.length() + this.schemaLocation.length() + this.auxiliaryMimeTypes.length()));
    initContainer(paramDataSource, paramLong - (3 + (paramByteBuffer.remaining() + this.namespace.length() + this.schemaLocation.length() + this.auxiliaryMimeTypes.length())), paramBoxParser);
  }

  public void setAuxiliaryMimeTypes(String paramString)
  {
    this.auxiliaryMimeTypes = paramString;
  }

  public void setNamespace(String paramString)
  {
    this.namespace = paramString;
  }

  public void setSchemaLocation(String paramString)
  {
    this.schemaLocation = paramString;
  }
}