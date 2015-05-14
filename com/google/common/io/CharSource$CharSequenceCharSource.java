package com.google.common.io;

import com.google.common.base.Ascii;
import com.google.common.base.Preconditions;
import com.google.common.base.Splitter;
import com.google.common.collect.AbstractIterator;
import com.google.common.collect.ImmutableList;
import java.io.IOException;
import java.io.Reader;
import java.util.Iterator;
import java.util.regex.Pattern;

class CharSource$CharSequenceCharSource extends CharSource
{
  private static final Splitter LINE_SPLITTER = Splitter.on(Pattern.compile("\r\n|\n|\r"));
  private final CharSequence seq;

  protected CharSource$CharSequenceCharSource(CharSequence paramCharSequence)
  {
    this.seq = ((CharSequence)Preconditions.checkNotNull(paramCharSequence));
  }

  private Iterable<String> lines()
  {
    return new Iterable()
    {
      public Iterator<String> iterator()
      {
        return new AbstractIterator()
        {
          Iterator<String> lines = CharSource.CharSequenceCharSource.LINE_SPLITTER.split(CharSource.CharSequenceCharSource.this.seq).iterator();

          protected String computeNext()
          {
            if (this.lines.hasNext())
            {
              String str = (String)this.lines.next();
              if ((this.lines.hasNext()) || (!str.isEmpty()))
                return str;
            }
            return (String)endOfData();
          }
        };
      }
    };
  }

  public boolean isEmpty()
  {
    return this.seq.length() == 0;
  }

  public Reader openStream()
  {
    return new CharSequenceReader(this.seq);
  }

  public String read()
  {
    return this.seq.toString();
  }

  public String readFirstLine()
  {
    Iterator localIterator = lines().iterator();
    if (localIterator.hasNext())
      return (String)localIterator.next();
    return null;
  }

  public ImmutableList<String> readLines()
  {
    return ImmutableList.copyOf(lines());
  }

  public <T> T readLines(LineProcessor<T> paramLineProcessor)
    throws IOException
  {
    Iterator localIterator = lines().iterator();
    while ((localIterator.hasNext()) && (paramLineProcessor.processLine((String)localIterator.next())));
    return paramLineProcessor.getResult();
  }

  public String toString()
  {
    String str = String.valueOf(String.valueOf(Ascii.truncate(this.seq, 30, "...")));
    return 17 + str.length() + "CharSource.wrap(" + str + ")";
  }
}