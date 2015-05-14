package com.google.android.exoplayer.chunk.parser.webm;

import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.upstream.NonBlockingInputStream;
import java.nio.ByteBuffer;

abstract interface EbmlReader
{
  public static final int READ_RESULT_CONTINUE = 0;
  public static final int READ_RESULT_END_OF_STREAM = 2;
  public static final int READ_RESULT_NEED_MORE_DATA = 1;
  public static final int TYPE_BINARY = 4;
  public static final int TYPE_FLOAT = 5;
  public static final int TYPE_MASTER = 1;
  public static final int TYPE_STRING = 3;
  public static final int TYPE_UNKNOWN = 0;
  public static final int TYPE_UNSIGNED_INT = 2;

  public abstract long getBytesRead();

  public abstract int read(NonBlockingInputStream paramNonBlockingInputStream)
    throws ParserException;

  public abstract void readBytes(NonBlockingInputStream paramNonBlockingInputStream, ByteBuffer paramByteBuffer, int paramInt);

  public abstract void readBytes(NonBlockingInputStream paramNonBlockingInputStream, byte[] paramArrayOfByte, int paramInt);

  public abstract long readVarint(NonBlockingInputStream paramNonBlockingInputStream);

  public abstract void reset();

  public abstract void setEventHandler(EbmlEventHandler paramEbmlEventHandler);

  public abstract void skipBytes(NonBlockingInputStream paramNonBlockingInputStream, int paramInt);
}