package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.UUIDConverter;
import java.nio.ByteBuffer;
import java.util.UUID;

public class CencSampleEncryptionInformationGroupEntry extends GroupEntry
{
  public static final String TYPE = "seig";
  private boolean isEncrypted;
  private byte ivSize;
  private UUID kid;

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    CencSampleEncryptionInformationGroupEntry localCencSampleEncryptionInformationGroupEntry;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localCencSampleEncryptionInformationGroupEntry = (CencSampleEncryptionInformationGroupEntry)paramObject;
      if (this.isEncrypted != localCencSampleEncryptionInformationGroupEntry.isEncrypted)
        return false;
      if (this.ivSize != localCencSampleEncryptionInformationGroupEntry.ivSize)
        return false;
      if (this.kid == null)
        break;
    }
    while (this.kid.equals(localCencSampleEncryptionInformationGroupEntry.kid));
    while (true)
    {
      return false;
      if (localCencSampleEncryptionInformationGroupEntry.kid == null)
        break;
    }
  }

  public ByteBuffer get()
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(20);
    int i;
    if (this.isEncrypted)
    {
      i = 1;
      IsoTypeWriter.writeUInt24(localByteBuffer, i);
      if (!this.isEncrypted)
        break label59;
      IsoTypeWriter.writeUInt8(localByteBuffer, this.ivSize);
      localByteBuffer.put(UUIDConverter.convert(this.kid));
    }
    while (true)
    {
      localByteBuffer.rewind();
      return localByteBuffer;
      i = 0;
      break;
      label59: localByteBuffer.put(new byte[17]);
    }
  }

  public byte getIvSize()
  {
    return this.ivSize;
  }

  public UUID getKid()
  {
    return this.kid;
  }

  public String getType()
  {
    return "seig";
  }

  public int hashCode()
  {
    int i;
    int j;
    if (this.isEncrypted)
    {
      i = 7;
      j = 31 * (i * 31 + this.ivSize);
      if (this.kid == null)
        break label48;
    }
    label48: for (int k = this.kid.hashCode(); ; k = 0)
    {
      return j + k;
      i = 19;
      break;
    }
  }

  public boolean isEncrypted()
  {
    return this.isEncrypted;
  }

  public void parse(ByteBuffer paramByteBuffer)
  {
    int i = 1;
    if (IsoTypeReader.readUInt24(paramByteBuffer) == i);
    while (true)
    {
      this.isEncrypted = i;
      this.ivSize = ((byte)IsoTypeReader.readUInt8(paramByteBuffer));
      byte[] arrayOfByte = new byte[16];
      paramByteBuffer.get(arrayOfByte);
      this.kid = UUIDConverter.convert(arrayOfByte);
      return;
      i = 0;
    }
  }

  public void setEncrypted(boolean paramBoolean)
  {
    this.isEncrypted = paramBoolean;
  }

  public void setIvSize(int paramInt)
  {
    this.ivSize = ((byte)paramInt);
  }

  public void setKid(UUID paramUUID)
  {
    this.kid = paramUUID;
  }

  public String toString()
  {
    return "CencSampleEncryptionInformationGroupEntry{isEncrypted=" + this.isEncrypted + ", ivSize=" + this.ivSize + ", kid=" + this.kid + '}';
  }
}