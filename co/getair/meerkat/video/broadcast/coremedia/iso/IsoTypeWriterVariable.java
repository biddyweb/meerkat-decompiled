package co.getair.meerkat.video.broadcast.coremedia.iso;

import java.nio.ByteBuffer;

public final class IsoTypeWriterVariable
{
  public static void write(long paramLong, ByteBuffer paramByteBuffer, int paramInt)
  {
    switch (paramInt)
    {
    case 5:
    case 6:
    case 7:
    default:
      throw new RuntimeException("I don't know how to read " + paramInt + " bytes");
    case 1:
      IsoTypeWriter.writeUInt8(paramByteBuffer, (int)(0xFF & paramLong));
      return;
    case 2:
      IsoTypeWriter.writeUInt16(paramByteBuffer, (int)(0xFFFF & paramLong));
      return;
    case 3:
      IsoTypeWriter.writeUInt24(paramByteBuffer, (int)(0xFFFFFF & paramLong));
      return;
    case 4:
      IsoTypeWriter.writeUInt32(paramByteBuffer, paramLong);
      return;
    case 8:
    }
    IsoTypeWriter.writeUInt64(paramByteBuffer, paramLong);
  }
}