package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public abstract interface Sample
{
  public abstract ByteBuffer asByteBuffer();

  public abstract long getSize();

  public abstract void writeTo(WritableByteChannel paramWritableByteChannel)
    throws IOException;
}