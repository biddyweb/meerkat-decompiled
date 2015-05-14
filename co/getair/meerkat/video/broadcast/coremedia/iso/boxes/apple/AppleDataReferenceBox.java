package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.apple;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;

public class AppleDataReferenceBox extends AbstractFullBox
{
  public static final String TYPE = "rdrf";
  private String dataReference;
  private int dataReferenceSize;
  private String dataReferenceType;

  public AppleDataReferenceBox()
  {
    super("rdrf");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.dataReferenceType = IsoTypeReader.read4cc(paramByteBuffer);
    this.dataReferenceSize = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
    this.dataReference = IsoTypeReader.readString(paramByteBuffer, this.dataReferenceSize);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    paramByteBuffer.put(IsoFile.fourCCtoBytes(this.dataReferenceType));
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.dataReferenceSize);
    paramByteBuffer.put(Utf8.convert(this.dataReference));
  }

  protected long getContentSize()
  {
    return 12 + this.dataReferenceSize;
  }

  public String getDataReference()
  {
    return this.dataReference;
  }

  public long getDataReferenceSize()
  {
    return this.dataReferenceSize;
  }

  public String getDataReferenceType()
  {
    return this.dataReferenceType;
  }
}