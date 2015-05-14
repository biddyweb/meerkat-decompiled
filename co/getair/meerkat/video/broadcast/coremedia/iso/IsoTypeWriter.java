package co.getair.meerkat.video.broadcast.coremedia.iso;

import java.nio.ByteBuffer;

public final class IsoTypeWriter
{
  static
  {
    if (!IsoTypeWriter.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  public static void writeFixedPoint0230(ByteBuffer paramByteBuffer, double paramDouble)
  {
    int i = (int)(1073741824.0D * paramDouble);
    paramByteBuffer.put((byte)((0xFF000000 & i) >> 24));
    paramByteBuffer.put((byte)((0xFF0000 & i) >> 16));
    paramByteBuffer.put((byte)((0xFF00 & i) >> 8));
    paramByteBuffer.put((byte)(i & 0xFF));
  }

  public static void writeFixedPoint1616(ByteBuffer paramByteBuffer, double paramDouble)
  {
    int i = (int)(65536.0D * paramDouble);
    paramByteBuffer.put((byte)((0xFF000000 & i) >> 24));
    paramByteBuffer.put((byte)((0xFF0000 & i) >> 16));
    paramByteBuffer.put((byte)((0xFF00 & i) >> 8));
    paramByteBuffer.put((byte)(i & 0xFF));
  }

  public static void writeFixedPoint88(ByteBuffer paramByteBuffer, double paramDouble)
  {
    int i = (short)(int)(256.0D * paramDouble);
    paramByteBuffer.put((byte)((0xFF00 & i) >> 8));
    paramByteBuffer.put((byte)(i & 0xFF));
  }

  public static void writeIso639(ByteBuffer paramByteBuffer, String paramString)
  {
    if (paramString.getBytes().length != 3)
      throw new IllegalArgumentException("\"" + paramString + "\" language string isn't exactly 3 characters long!");
    int i = 0;
    for (int j = 0; j < 3; j++)
      i += (-96 + paramString.getBytes()[j] << 5 * (2 - j));
    writeUInt16(paramByteBuffer, i);
  }

  public static void writePascalUtfString(ByteBuffer paramByteBuffer, String paramString)
  {
    byte[] arrayOfByte = Utf8.convert(paramString);
    assert (arrayOfByte.length < 255);
    writeUInt8(paramByteBuffer, arrayOfByte.length);
    paramByteBuffer.put(arrayOfByte);
  }

  public static void writeUInt16(ByteBuffer paramByteBuffer, int paramInt)
  {
    int i = paramInt & 0xFFFF;
    writeUInt8(paramByteBuffer, i >> 8);
    writeUInt8(paramByteBuffer, i & 0xFF);
  }

  public static void writeUInt16BE(ByteBuffer paramByteBuffer, int paramInt)
  {
    int i = paramInt & 0xFFFF;
    writeUInt8(paramByteBuffer, i & 0xFF);
    writeUInt8(paramByteBuffer, i >> 8);
  }

  public static void writeUInt24(ByteBuffer paramByteBuffer, int paramInt)
  {
    int i = paramInt & 0xFFFFFF;
    writeUInt16(paramByteBuffer, i >> 8);
    writeUInt8(paramByteBuffer, i);
  }

  public static void writeUInt32(ByteBuffer paramByteBuffer, long paramLong)
  {
    assert ((paramLong >= 0L) && (paramLong <= 4294967296L)) : ("The given long is not in the range of uint32 (" + paramLong + ")");
    paramByteBuffer.putInt((int)paramLong);
  }

  public static void writeUInt32BE(ByteBuffer paramByteBuffer, long paramLong)
  {
    assert ((paramLong >= 0L) && (paramLong <= 4294967296L)) : ("The given long is not in the range of uint32 (" + paramLong + ")");
    writeUInt16BE(paramByteBuffer, 0xFFFF & (int)paramLong);
    writeUInt16BE(paramByteBuffer, (int)(0xFFFF & paramLong >> 16));
  }

  public static void writeUInt48(ByteBuffer paramByteBuffer, long paramLong)
  {
    long l = paramLong & 0xFFFFFFFF;
    writeUInt16(paramByteBuffer, (int)(l >> 32));
    writeUInt32(paramByteBuffer, 0xFFFFFFFF & l);
  }

  public static void writeUInt64(ByteBuffer paramByteBuffer, long paramLong)
  {
    assert (paramLong >= 0L) : "The given long is negative";
    paramByteBuffer.putLong(paramLong);
  }

  public static void writeUInt8(ByteBuffer paramByteBuffer, int paramInt)
  {
    paramByteBuffer.put((byte)(paramInt & 0xFF));
  }

  public static void writeUtf8String(ByteBuffer paramByteBuffer, String paramString)
  {
    paramByteBuffer.put(Utf8.convert(paramString));
    writeUInt8(paramByteBuffer, 0);
  }

  public static void writeZeroTermUtf8String(ByteBuffer paramByteBuffer, String paramString)
  {
    paramByteBuffer.put(Utf8.convert(paramString));
    writeUInt8(paramByteBuffer, 0);
  }
}