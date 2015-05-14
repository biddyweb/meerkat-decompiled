package co.getair.meerkat.video.broadcast.googlecode.mp4parser;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.FullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.annotations.DoNotParseDetail;
import java.nio.ByteBuffer;

public abstract class AbstractFullBox extends AbstractBox
  implements FullBox
{
  private int flags;
  private int version;

  protected AbstractFullBox(String paramString)
  {
    super(paramString);
  }

  protected AbstractFullBox(String paramString, byte[] paramArrayOfByte)
  {
    super(paramString, paramArrayOfByte);
  }

  @DoNotParseDetail
  public int getFlags()
  {
    if (!this.isParsed)
      parseDetails();
    return this.flags;
  }

  @DoNotParseDetail
  public int getVersion()
  {
    if (!this.isParsed)
      parseDetails();
    return this.version;
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