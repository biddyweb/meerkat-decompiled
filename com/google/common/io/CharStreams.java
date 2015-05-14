package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.nio.CharBuffer;
import java.util.ArrayList;
import java.util.List;

@Beta
public final class CharStreams
{
  private static final int BUF_SIZE = 2048;

  static Reader asReader(Readable paramReadable)
  {
    Preconditions.checkNotNull(paramReadable);
    if ((paramReadable instanceof Reader))
      return (Reader)paramReadable;
    return new Reader()
    {
      public void close()
        throws IOException
      {
        if ((this.val$readable instanceof Closeable))
          ((Closeable)this.val$readable).close();
      }

      public int read(CharBuffer paramAnonymousCharBuffer)
        throws IOException
      {
        return this.val$readable.read(paramAnonymousCharBuffer);
      }

      public int read(char[] paramAnonymousArrayOfChar, int paramAnonymousInt1, int paramAnonymousInt2)
        throws IOException
      {
        return read(CharBuffer.wrap(paramAnonymousArrayOfChar, paramAnonymousInt1, paramAnonymousInt2));
      }
    };
  }

  public static Writer asWriter(Appendable paramAppendable)
  {
    if ((paramAppendable instanceof Writer))
      return (Writer)paramAppendable;
    return new AppendableWriter(paramAppendable);
  }

  public static long copy(Readable paramReadable, Appendable paramAppendable)
    throws IOException
  {
    Preconditions.checkNotNull(paramReadable);
    Preconditions.checkNotNull(paramAppendable);
    CharBuffer localCharBuffer = CharBuffer.allocate(2048);
    long l = 0L;
    while (paramReadable.read(localCharBuffer) != -1)
    {
      localCharBuffer.flip();
      paramAppendable.append(localCharBuffer);
      l += localCharBuffer.remaining();
      localCharBuffer.clear();
    }
    return l;
  }

  public static Writer nullWriter()
  {
    return NullWriter.INSTANCE;
  }

  public static <T> T readLines(Readable paramReadable, LineProcessor<T> paramLineProcessor)
    throws IOException
  {
    Preconditions.checkNotNull(paramReadable);
    Preconditions.checkNotNull(paramLineProcessor);
    LineReader localLineReader = new LineReader(paramReadable);
    String str;
    do
      str = localLineReader.readLine();
    while ((str != null) && (paramLineProcessor.processLine(str)));
    return paramLineProcessor.getResult();
  }

  public static List<String> readLines(Readable paramReadable)
    throws IOException
  {
    ArrayList localArrayList = new ArrayList();
    LineReader localLineReader = new LineReader(paramReadable);
    while (true)
    {
      String str = localLineReader.readLine();
      if (str == null)
        break;
      localArrayList.add(str);
    }
    return localArrayList;
  }

  public static void skipFully(Reader paramReader, long paramLong)
    throws IOException
  {
    Preconditions.checkNotNull(paramReader);
    while (paramLong > 0L)
    {
      long l = paramReader.skip(paramLong);
      if (l == 0L)
      {
        if (paramReader.read() == -1)
          throw new EOFException();
        paramLong -= 1L;
      }
      else
      {
        paramLong -= l;
      }
    }
  }

  public static String toString(Readable paramReadable)
    throws IOException
  {
    return toStringBuilder(paramReadable).toString();
  }

  private static StringBuilder toStringBuilder(Readable paramReadable)
    throws IOException
  {
    StringBuilder localStringBuilder = new StringBuilder();
    copy(paramReadable, localStringBuilder);
    return localStringBuilder;
  }

  private static final class NullWriter extends Writer
  {
    private static final NullWriter INSTANCE = new NullWriter();

    public Writer append(char paramChar)
    {
      return this;
    }

    public Writer append(CharSequence paramCharSequence)
    {
      Preconditions.checkNotNull(paramCharSequence);
      return this;
    }

    public Writer append(CharSequence paramCharSequence, int paramInt1, int paramInt2)
    {
      Preconditions.checkPositionIndexes(paramInt1, paramInt2, paramCharSequence.length());
      return this;
    }

    public void close()
    {
    }

    public void flush()
    {
    }

    public String toString()
    {
      return "CharStreams.nullWriter()";
    }

    public void write(int paramInt)
    {
    }

    public void write(String paramString)
    {
      Preconditions.checkNotNull(paramString);
    }

    public void write(String paramString, int paramInt1, int paramInt2)
    {
      Preconditions.checkPositionIndexes(paramInt1, paramInt1 + paramInt2, paramString.length());
    }

    public void write(char[] paramArrayOfChar)
    {
      Preconditions.checkNotNull(paramArrayOfChar);
    }

    public void write(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    {
      Preconditions.checkPositionIndexes(paramInt1, paramInt1 + paramInt2, paramArrayOfChar.length);
    }
  }
}