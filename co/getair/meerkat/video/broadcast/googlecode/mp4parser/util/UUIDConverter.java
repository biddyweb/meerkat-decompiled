package co.getair.meerkat.video.broadcast.googlecode.mp4parser.util;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.UUID;

public class UUIDConverter
{
  public static UUID convert(byte[] paramArrayOfByte)
  {
    ByteBuffer localByteBuffer = ByteBuffer.wrap(paramArrayOfByte);
    localByteBuffer.order(ByteOrder.BIG_ENDIAN);
    return new UUID(localByteBuffer.getLong(), localByteBuffer.getLong());
  }

  public static byte[] convert(UUID paramUUID)
  {
    long l1 = paramUUID.getMostSignificantBits();
    long l2 = paramUUID.getLeastSignificantBits();
    byte[] arrayOfByte = new byte[16];
    for (int i = 0; i < 8; i++)
      arrayOfByte[i] = ((byte)(int)(l1 >>> 8 * (7 - i)));
    for (int j = 8; j < 16; j++)
      arrayOfByte[j] = ((byte)(int)(l2 >>> 8 * (7 - j)));
    return arrayOfByte;
  }
}