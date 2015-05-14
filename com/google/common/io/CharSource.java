package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Lists;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nullable;

public abstract class CharSource
{
  public static CharSource concat(Iterable<? extends CharSource> paramIterable)
  {
    return new CharSource.ConcatenatedCharSource(paramIterable);
  }

  public static CharSource concat(Iterator<? extends CharSource> paramIterator)
  {
    return concat(ImmutableList.copyOf(paramIterator));
  }

  public static CharSource concat(CharSource[] paramArrayOfCharSource)
  {
    return concat(ImmutableList.copyOf(paramArrayOfCharSource));
  }

  public static CharSource empty()
  {
    return CharSource.EmptyCharSource.access$000();
  }

  public static CharSource wrap(CharSequence paramCharSequence)
  {
    return new CharSource.CharSequenceCharSource(paramCharSequence);
  }

  public long copyTo(CharSink paramCharSink)
    throws IOException
  {
    Preconditions.checkNotNull(paramCharSink);
    Closer localCloser = Closer.create();
    try
    {
      long l = CharStreams.copy((Reader)localCloser.register(openStream()), (Writer)localCloser.register(paramCharSink.openStream()));
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

  public long copyTo(Appendable paramAppendable)
    throws IOException
  {
    Preconditions.checkNotNull(paramAppendable);
    Closer localCloser = Closer.create();
    try
    {
      long l = CharStreams.copy((Reader)localCloser.register(openStream()), paramAppendable);
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

  public boolean isEmpty()
    throws IOException
  {
    Closer localCloser = Closer.create();
    try
    {
      int i = ((Reader)localCloser.register(openStream())).read();
      if (i == -1);
      for (boolean bool = true; ; bool = false)
        return bool;
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

  public BufferedReader openBufferedStream()
    throws IOException
  {
    Reader localReader = openStream();
    if ((localReader instanceof BufferedReader))
      return (BufferedReader)localReader;
    return new BufferedReader(localReader);
  }

  public abstract Reader openStream()
    throws IOException;

  public String read()
    throws IOException
  {
    Closer localCloser = Closer.create();
    try
    {
      String str = CharStreams.toString((Reader)localCloser.register(openStream()));
      return str;
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

  @Nullable
  public String readFirstLine()
    throws IOException
  {
    Closer localCloser = Closer.create();
    try
    {
      String str = ((BufferedReader)localCloser.register(openBufferedStream())).readLine();
      return str;
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

  public ImmutableList<String> readLines()
    throws IOException
  {
    Closer localCloser = Closer.create();
    ArrayList localArrayList;
    try
    {
      BufferedReader localBufferedReader = (BufferedReader)localCloser.register(openBufferedStream());
      localArrayList = Lists.newArrayList();
      while (true)
      {
        String str = localBufferedReader.readLine();
        if (str == null)
          break;
        localArrayList.add(str);
      }
    }
    catch (Throwable localThrowable)
    {
      throw localCloser.rethrow(localThrowable);
    }
    finally
    {
      localCloser.close();
    }
    ImmutableList localImmutableList = ImmutableList.copyOf(localArrayList);
    localCloser.close();
    return localImmutableList;
  }

  @Beta
  public <T> T readLines(LineProcessor<T> paramLineProcessor)
    throws IOException
  {
    Preconditions.checkNotNull(paramLineProcessor);
    Closer localCloser = Closer.create();
    try
    {
      Object localObject2 = CharStreams.readLines((Reader)localCloser.register(openStream()), paramLineProcessor);
      return localObject2;
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
}