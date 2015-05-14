package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.Charset;

public abstract class ByteSink
{
  public CharSink asCharSink(Charset paramCharset)
  {
    return new AsCharSink(paramCharset, null);
  }

  public OutputStream openBufferedStream()
    throws IOException
  {
    OutputStream localOutputStream = openStream();
    if ((localOutputStream instanceof BufferedOutputStream))
      return (BufferedOutputStream)localOutputStream;
    return new BufferedOutputStream(localOutputStream);
  }

  public abstract OutputStream openStream()
    throws IOException;

  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    Preconditions.checkNotNull(paramArrayOfByte);
    Closer localCloser = Closer.create();
    try
    {
      OutputStream localOutputStream = (OutputStream)localCloser.register(openStream());
      localOutputStream.write(paramArrayOfByte);
      localOutputStream.flush();
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

  public long writeFrom(InputStream paramInputStream)
    throws IOException
  {
    Preconditions.checkNotNull(paramInputStream);
    Closer localCloser = Closer.create();
    try
    {
      OutputStream localOutputStream = (OutputStream)localCloser.register(openStream());
      long l = ByteStreams.copy(paramInputStream, localOutputStream);
      localOutputStream.flush();
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

  private final class AsCharSink extends CharSink
  {
    private final Charset charset;

    private AsCharSink(Charset arg2)
    {
      Object localObject;
      this.charset = ((Charset)Preconditions.checkNotNull(localObject));
    }

    public Writer openStream()
      throws IOException
    {
      return new OutputStreamWriter(ByteSink.this.openStream(), this.charset);
    }

    public String toString()
    {
      String str1 = String.valueOf(String.valueOf(ByteSink.this.toString()));
      String str2 = String.valueOf(String.valueOf(this.charset));
      return 13 + str1.length() + str2.length() + str1 + ".asCharSink(" + str2 + ")";
    }
  }
}