package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.Reader;
import java.nio.CharBuffer;

final class CharSequenceReader extends Reader
{
  private int mark;
  private int pos;
  private CharSequence seq;

  public CharSequenceReader(CharSequence paramCharSequence)
  {
    this.seq = ((CharSequence)Preconditions.checkNotNull(paramCharSequence));
  }

  private void checkOpen()
    throws IOException
  {
    if (this.seq == null)
      throw new IOException("reader closed");
  }

  private boolean hasRemaining()
  {
    return remaining() > 0;
  }

  private int remaining()
  {
    return this.seq.length() - this.pos;
  }

  public void close()
    throws IOException
  {
    try
    {
      this.seq = null;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void mark(int paramInt)
    throws IOException
  {
    boolean bool = true;
    if (paramInt >= 0);
    try
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Integer.valueOf(paramInt);
      Preconditions.checkArgument(bool, "readAheadLimit (%s) may not be negative", arrayOfObject);
      checkOpen();
      this.mark = this.pos;
      return;
      bool = false;
    }
    finally
    {
    }
  }

  public boolean markSupported()
  {
    return true;
  }

  public int read()
    throws IOException
  {
    try
    {
      checkOpen();
      if (hasRemaining())
      {
        CharSequence localCharSequence = this.seq;
        int j = this.pos;
        this.pos = (j + 1);
        int k = localCharSequence.charAt(j);
        i = k;
        return i;
      }
      int i = -1;
    }
    finally
    {
    }
  }

  public int read(CharBuffer paramCharBuffer)
    throws IOException
  {
    try
    {
      Preconditions.checkNotNull(paramCharBuffer);
      checkOpen();
      boolean bool = hasRemaining();
      int i;
      if (!bool)
        i = -1;
      while (true)
      {
        return i;
        i = Math.min(paramCharBuffer.remaining(), remaining());
        for (int j = 0; j < i; j++)
        {
          CharSequence localCharSequence = this.seq;
          int k = this.pos;
          this.pos = (k + 1);
          paramCharBuffer.put(localCharSequence.charAt(k));
        }
      }
    }
    finally
    {
    }
  }

  public int read(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException
  {
    int i = paramInt1 + paramInt2;
    try
    {
      Preconditions.checkPositionIndexes(paramInt1, i, paramArrayOfChar.length);
      checkOpen();
      boolean bool = hasRemaining();
      int j;
      if (!bool)
        j = -1;
      while (true)
      {
        return j;
        j = Math.min(paramInt2, remaining());
        for (int k = 0; k < j; k++)
        {
          int m = paramInt1 + k;
          CharSequence localCharSequence = this.seq;
          int n = this.pos;
          this.pos = (n + 1);
          paramArrayOfChar[m] = localCharSequence.charAt(n);
        }
      }
    }
    finally
    {
    }
  }

  public boolean ready()
    throws IOException
  {
    try
    {
      checkOpen();
      return true;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void reset()
    throws IOException
  {
    try
    {
      checkOpen();
      this.pos = this.mark;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public long skip(long paramLong)
    throws IOException
  {
    boolean bool = true;
    if (paramLong >= 0L);
    try
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Long.valueOf(paramLong);
      Preconditions.checkArgument(bool, "n (%s) may not be negative", arrayOfObject);
      checkOpen();
      int i = (int)Math.min(remaining(), paramLong);
      this.pos = (i + this.pos);
      long l = i;
      return l;
      bool = false;
    }
    finally
    {
    }
  }
}