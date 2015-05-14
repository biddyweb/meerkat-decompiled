package co.getair.meerkat.video.broadcast.mp4writer;

public class ByteHelper
{
  public static final String HEXES = "0123456789ABCDEF";

  public static String getHex(byte[] paramArrayOfByte)
  {
    StringBuilder localStringBuilder = new StringBuilder(2 * paramArrayOfByte.length);
    int i = paramArrayOfByte.length;
    for (int j = 0; j < i; j++)
    {
      int k = paramArrayOfByte[j];
      localStringBuilder.append("0123456789ABCDEF".charAt((k & 0xF0) >> 4)).append("0123456789ABCDEF".charAt(k & 0xF));
    }
    return localStringBuilder.toString();
  }
}