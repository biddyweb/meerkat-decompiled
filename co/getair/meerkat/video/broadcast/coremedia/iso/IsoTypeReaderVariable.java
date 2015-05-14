package co.getair.meerkat.video.broadcast.coremedia.iso;

import java.nio.ByteBuffer;

public final class IsoTypeReaderVariable
{
  public static long read(ByteBuffer paramByteBuffer, int paramInt)
  {
    switch (paramInt)
    {
    case 5:
    case 6:
    case 7:
    default:
      throw new RuntimeException("I don't know how to read " + paramInt + " bytes");
    case 1:
      return IsoTypeReader.readUInt8(paramByteBuffer);
    case 2:
      return IsoTypeReader.readUInt16(paramByteBuffer);
    case 3:
      return IsoTypeReader.readUInt24(paramByteBuffer);
    case 4:
      return IsoTypeReader.readUInt32(paramByteBuffer);
    case 8:
    }
    return IsoTypeReader.readUInt64(paramByteBuffer);
  }
}