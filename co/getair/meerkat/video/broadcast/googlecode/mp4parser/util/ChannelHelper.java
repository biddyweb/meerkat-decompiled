package co.getair.meerkat.video.broadcast.googlecode.mp4parser.util;

import java.io.EOFException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.ReadableByteChannel;

public class ChannelHelper
{
  private static ByteBuffer empty = ByteBuffer.allocate(0).asReadOnlyBuffer();

  public static int readFully(ReadableByteChannel paramReadableByteChannel, ByteBuffer paramByteBuffer, int paramInt)
    throws IOException
  {
    int i = 0;
    int j;
    do
    {
      j = paramReadableByteChannel.read(paramByteBuffer);
      if (-1 == j)
        break;
      i += j;
    }
    while (i != paramInt);
    if (j == -1)
      throw new EOFException("End of file. No more boxes.");
    return i;
  }

  public static void readFully(ReadableByteChannel paramReadableByteChannel, ByteBuffer paramByteBuffer)
    throws IOException
  {
    readFully(paramReadableByteChannel, paramByteBuffer, paramByteBuffer.remaining());
  }
}