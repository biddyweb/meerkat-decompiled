package co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.UUIDConverter;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

public class ProtectionSystemSpecificHeaderBox extends AbstractFullBox
{
  public static byte[] OMA2_SYSTEM_ID;
  public static byte[] PLAYREADY_SYSTEM_ID;
  public static final String TYPE = "pssh";
  byte[] content;
  List<UUID> keyIds = new ArrayList();
  byte[] systemId;

  static
  {
    if (!ProtectionSystemSpecificHeaderBox.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      OMA2_SYSTEM_ID = UUIDConverter.convert(UUID.fromString("A2B55680-6F43-11E0-9A3F-0002A5D5C51B"));
      PLAYREADY_SYSTEM_ID = UUIDConverter.convert(UUID.fromString("9A04F079-9840-4286-AB92-E65BE0885F95"));
      return;
    }
  }

  public ProtectionSystemSpecificHeaderBox()
  {
    super("pssh");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.systemId = new byte[16];
    paramByteBuffer.get(this.systemId);
    if (getVersion() > 0)
    {
      int j;
      for (int i = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer)); ; i = j)
      {
        j = i - 1;
        if (i <= 0)
          break;
        byte[] arrayOfByte = new byte[16];
        paramByteBuffer.get(arrayOfByte);
        this.keyIds.add(UUIDConverter.convert(arrayOfByte));
      }
    }
    long l = IsoTypeReader.readUInt32(paramByteBuffer);
    this.content = new byte[paramByteBuffer.remaining()];
    paramByteBuffer.get(this.content);
    assert (l == this.content.length);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    assert (this.systemId.length == 16);
    paramByteBuffer.put(this.systemId, 0, 16);
    if (getVersion() > 0)
    {
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.keyIds.size());
      Iterator localIterator = this.keyIds.iterator();
      while (localIterator.hasNext())
        paramByteBuffer.put(UUIDConverter.convert((UUID)localIterator.next()));
    }
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.content.length);
    paramByteBuffer.put(this.content);
  }

  public byte[] getContent()
  {
    return this.content;
  }

  protected long getContentSize()
  {
    long l = 24 + this.content.length;
    if (getVersion() > 0)
      l = l + 4L + 16 * this.keyIds.size();
    return l;
  }

  public List<UUID> getKeyIds()
  {
    return this.keyIds;
  }

  public byte[] getSystemId()
  {
    return this.systemId;
  }

  public void setContent(byte[] paramArrayOfByte)
  {
    this.content = paramArrayOfByte;
  }

  public void setKeyIds(List<UUID> paramList)
  {
    this.keyIds = paramList;
  }

  public void setSystemId(byte[] paramArrayOfByte)
  {
    assert (paramArrayOfByte.length == 16);
    this.systemId = paramArrayOfByte;
  }
}