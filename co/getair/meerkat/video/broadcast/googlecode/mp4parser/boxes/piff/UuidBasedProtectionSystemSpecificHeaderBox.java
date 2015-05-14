package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.piff;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.UUIDConverter;
import java.nio.ByteBuffer;
import java.util.UUID;

public class UuidBasedProtectionSystemSpecificHeaderBox extends AbstractFullBox
{
  public static byte[] USER_TYPE = { -48, -118, 79, 24, 16, -13, 74, -126, -74, -56, 50, -40, -85, -95, -125, -45 };
  ProtectionSpecificHeader protectionSpecificHeader;
  UUID systemId;

  public UuidBasedProtectionSystemSpecificHeaderBox()
  {
    super("uuid", USER_TYPE);
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    byte[] arrayOfByte = new byte[16];
    paramByteBuffer.get(arrayOfByte);
    this.systemId = UUIDConverter.convert(arrayOfByte);
    CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
    this.protectionSpecificHeader = ProtectionSpecificHeader.createFor(this.systemId, paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt64(paramByteBuffer, this.systemId.getMostSignificantBits());
    IsoTypeWriter.writeUInt64(paramByteBuffer, this.systemId.getLeastSignificantBits());
    ByteBuffer localByteBuffer = this.protectionSpecificHeader.getData();
    localByteBuffer.rewind();
    IsoTypeWriter.writeUInt32(paramByteBuffer, localByteBuffer.limit());
    paramByteBuffer.put(localByteBuffer);
  }

  protected long getContentSize()
  {
    return 24 + this.protectionSpecificHeader.getData().limit();
  }

  public ProtectionSpecificHeader getProtectionSpecificHeader()
  {
    return this.protectionSpecificHeader;
  }

  public String getProtectionSpecificHeaderString()
  {
    return this.protectionSpecificHeader.toString();
  }

  public UUID getSystemId()
  {
    return this.systemId;
  }

  public String getSystemIdString()
  {
    return this.systemId.toString();
  }

  public byte[] getUserType()
  {
    return USER_TYPE;
  }

  public void setProtectionSpecificHeader(ProtectionSpecificHeader paramProtectionSpecificHeader)
  {
    this.protectionSpecificHeader = paramProtectionSpecificHeader;
  }

  public void setSystemId(UUID paramUUID)
  {
    this.systemId = paramUUID;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("UuidBasedProtectionSystemSpecificHeaderBox");
    localStringBuilder.append("{systemId=").append(this.systemId.toString());
    localStringBuilder.append(", dataSize=").append(this.protectionSpecificHeader.getData().limit());
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }
}