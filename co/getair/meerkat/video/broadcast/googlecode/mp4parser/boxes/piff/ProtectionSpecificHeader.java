package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.piff;

import co.getair.meerkat.video.broadcast.coremedia.iso.Hex;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.contentprotection.GenericHeader;
import java.nio.ByteBuffer;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public abstract class ProtectionSpecificHeader
{
  protected static Map<UUID, Class<? extends ProtectionSpecificHeader>> uuidRegistry = new HashMap();

  public static ProtectionSpecificHeader createFor(UUID paramUUID, ByteBuffer paramByteBuffer)
  {
    Class localClass = (Class)uuidRegistry.get(paramUUID);
    Object localObject = null;
    if (localClass != null);
    try
    {
      localObject = (ProtectionSpecificHeader)localClass.newInstance();
      if (localObject == null)
        localObject = new GenericHeader();
      ((ProtectionSpecificHeader)localObject).parse(paramByteBuffer);
      return localObject;
    }
    catch (InstantiationException localInstantiationException)
    {
      throw new RuntimeException(localInstantiationException);
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new RuntimeException(localIllegalAccessException);
    }
  }

  public boolean equals(Object paramObject)
  {
    throw new RuntimeException("somebody called equals on me but that's not supposed to happen.");
  }

  public abstract ByteBuffer getData();

  public abstract UUID getSystemId();

  public abstract void parse(ByteBuffer paramByteBuffer);

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("ProtectionSpecificHeader");
    localStringBuilder.append("{data=");
    ByteBuffer localByteBuffer = getData().duplicate();
    localByteBuffer.rewind();
    byte[] arrayOfByte = new byte[localByteBuffer.limit()];
    localByteBuffer.get(arrayOfByte);
    localStringBuilder.append(Hex.encodeHex(arrayOfByte));
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }
}