package vijay.expirabledisklrucache.cache.utils;

import java.io.IOException;

public abstract interface ByteProcessor<T>
{
  public abstract T getResult();

  public abstract boolean processBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException;
}