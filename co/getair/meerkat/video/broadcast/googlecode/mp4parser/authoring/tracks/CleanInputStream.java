package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

public class CleanInputStream extends FilterInputStream
{
  int prev = -1;
  int prevprev = -1;

  public CleanInputStream(InputStream paramInputStream)
  {
    super(paramInputStream);
  }

  public boolean markSupported()
  {
    return false;
  }

  public int read()
    throws IOException
  {
    int i = super.read();
    if ((i == 3) && (this.prevprev == 0) && (this.prev == 0))
    {
      this.prevprev = -1;
      this.prev = -1;
      i = super.read();
    }
    this.prevprev = this.prev;
    this.prev = i;
    return i;
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (paramArrayOfByte == null)
      throw new NullPointerException();
    if ((paramInt1 < 0) || (paramInt2 < 0) || (paramInt2 > paramArrayOfByte.length - paramInt1))
      throw new IndexOutOfBoundsException();
    int j;
    if (paramInt2 == 0)
      j = 0;
    while (true)
    {
      return j;
      int i = read();
      if (i == -1)
        return -1;
      paramArrayOfByte[paramInt1] = ((byte)i);
      j = 1;
      if (j < paramInt2)
        try
        {
          int k = read();
          if (k != -1)
          {
            paramArrayOfByte[(paramInt1 + j)] = ((byte)k);
            j++;
          }
        }
        catch (IOException localIOException)
        {
        }
    }
    return j;
  }
}