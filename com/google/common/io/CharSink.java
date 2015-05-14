package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Iterator;

public abstract class CharSink
{
  public Writer openBufferedStream()
    throws IOException
  {
    Writer localWriter = openStream();
    if ((localWriter instanceof BufferedWriter))
      return (BufferedWriter)localWriter;
    return new BufferedWriter(localWriter);
  }

  public abstract Writer openStream()
    throws IOException;

  public void write(CharSequence paramCharSequence)
    throws IOException
  {
    Preconditions.checkNotNull(paramCharSequence);
    Closer localCloser = Closer.create();
    try
    {
      Writer localWriter = (Writer)localCloser.register(openStream());
      localWriter.append(paramCharSequence);
      localWriter.flush();
      return;
    }
    catch (Throwable localThrowable)
    {
      throw localCloser.rethrow(localThrowable);
    }
    finally
    {
      localCloser.close();
    }
  }

  public long writeFrom(Readable paramReadable)
    throws IOException
  {
    Preconditions.checkNotNull(paramReadable);
    Closer localCloser = Closer.create();
    try
    {
      Writer localWriter = (Writer)localCloser.register(openStream());
      long l = CharStreams.copy(paramReadable, localWriter);
      localWriter.flush();
      return l;
    }
    catch (Throwable localThrowable)
    {
      throw localCloser.rethrow(localThrowable);
    }
    finally
    {
      localCloser.close();
    }
  }

  public void writeLines(Iterable<? extends CharSequence> paramIterable)
    throws IOException
  {
    writeLines(paramIterable, System.getProperty("line.separator"));
  }

  public void writeLines(Iterable<? extends CharSequence> paramIterable, String paramString)
    throws IOException
  {
    Preconditions.checkNotNull(paramIterable);
    Preconditions.checkNotNull(paramString);
    Closer localCloser = Closer.create();
    Writer localWriter;
    try
    {
      localWriter = (Writer)localCloser.register(openBufferedStream());
      Iterator localIterator = paramIterable.iterator();
      while (localIterator.hasNext())
        localWriter.append((CharSequence)localIterator.next()).append(paramString);
    }
    catch (Throwable localThrowable)
    {
      throw localCloser.rethrow(localThrowable);
    }
    finally
    {
      localCloser.close();
    }
    localWriter.flush();
    localCloser.close();
  }
}