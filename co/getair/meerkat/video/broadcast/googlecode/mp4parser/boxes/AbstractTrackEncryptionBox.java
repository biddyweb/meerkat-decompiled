package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.UUID;

public abstract class AbstractTrackEncryptionBox extends AbstractFullBox
{
  int defaultAlgorithmId;
  int defaultIvSize;
  byte[] default_KID;

  protected AbstractTrackEncryptionBox(String paramString)
  {
    super(paramString);
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.defaultAlgorithmId = IsoTypeReader.readUInt24(paramByteBuffer);
    this.defaultIvSize = IsoTypeReader.readUInt8(paramByteBuffer);
    this.default_KID = new byte[16];
    paramByteBuffer.get(this.default_KID);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    AbstractTrackEncryptionBox localAbstractTrackEncryptionBox;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localAbstractTrackEncryptionBox = (AbstractTrackEncryptionBox)paramObject;
      if (this.defaultAlgorithmId != localAbstractTrackEncryptionBox.defaultAlgorithmId)
        return false;
      if (this.defaultIvSize != localAbstractTrackEncryptionBox.defaultIvSize)
        return false;
    }
    while (Arrays.equals(this.default_KID, localAbstractTrackEncryptionBox.default_KID));
    return false;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt24(paramByteBuffer, this.defaultAlgorithmId);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.defaultIvSize);
    paramByteBuffer.put(this.default_KID);
  }

  protected long getContentSize()
  {
    return 24L;
  }

  public int getDefaultAlgorithmId()
  {
    return this.defaultAlgorithmId;
  }

  public int getDefaultIvSize()
  {
    return this.defaultIvSize;
  }

  public UUID getDefault_KID()
  {
    ByteBuffer localByteBuffer = ByteBuffer.wrap(this.default_KID);
    localByteBuffer.order(ByteOrder.BIG_ENDIAN);
    return new UUID(localByteBuffer.getLong(), localByteBuffer.getLong());
  }

  public int hashCode()
  {
    int i = 31 * (31 * this.defaultAlgorithmId + this.defaultIvSize);
    if (this.default_KID != null);
    for (int j = Arrays.hashCode(this.default_KID); ; j = 0)
      return i + j;
  }

  public void setDefaultAlgorithmId(int paramInt)
  {
    this.defaultAlgorithmId = paramInt;
  }

  public void setDefaultIvSize(int paramInt)
  {
    this.defaultIvSize = paramInt;
  }

  public void setDefault_KID(UUID paramUUID)
  {
    ByteBuffer localByteBuffer = ByteBuffer.wrap(new byte[16]);
    localByteBuffer.putLong(paramUUID.getMostSignificantBits());
    localByteBuffer.putLong(paramUUID.getLeastSignificantBits());
    this.default_KID = localByteBuffer.array();
  }
}