package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@Beta
public final class FileBackedOutputStream extends OutputStream
{
  private File file;
  private final int fileThreshold;
  private MemoryOutput memory;
  private OutputStream out;
  private final boolean resetOnFinalize;
  private final ByteSource source;

  public FileBackedOutputStream(int paramInt)
  {
    this(paramInt, false);
  }

  public FileBackedOutputStream(int paramInt, boolean paramBoolean)
  {
    this.fileThreshold = paramInt;
    this.resetOnFinalize = paramBoolean;
    this.memory = new MemoryOutput(null);
    this.out = this.memory;
    if (paramBoolean)
    {
      this.source = new ByteSource()
      {
        protected void finalize()
        {
          try
          {
            FileBackedOutputStream.this.reset();
            return;
          }
          catch (Throwable localThrowable)
          {
            localThrowable.printStackTrace(System.err);
          }
        }

        public InputStream openStream()
          throws IOException
        {
          return FileBackedOutputStream.this.openInputStream();
        }
      };
      return;
    }
    this.source = new ByteSource()
    {
      public InputStream openStream()
        throws IOException
      {
        return FileBackedOutputStream.this.openInputStream();
      }
    };
  }

  private InputStream openInputStream()
    throws IOException
  {
    try
    {
      if (this.file != null);
      for (Object localObject2 = new FileInputStream(this.file); ; localObject2 = new ByteArrayInputStream(this.memory.getBuffer(), 0, this.memory.getCount()))
        return localObject2;
    }
    finally
    {
    }
  }

  private void update(int paramInt)
    throws IOException
  {
    if ((this.file == null) && (paramInt + this.memory.getCount() > this.fileThreshold))
    {
      File localFile = File.createTempFile("FileBackedOutputStream", null);
      if (this.resetOnFinalize)
        localFile.deleteOnExit();
      FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
      localFileOutputStream.write(this.memory.getBuffer(), 0, this.memory.getCount());
      localFileOutputStream.flush();
      this.out = localFileOutputStream;
      this.file = localFile;
      this.memory = null;
    }
  }

  public ByteSource asByteSource()
  {
    return this.source;
  }

  public void close()
    throws IOException
  {
    try
    {
      this.out.close();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void flush()
    throws IOException
  {
    try
    {
      this.out.flush();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  @VisibleForTesting
  File getFile()
  {
    try
    {
      File localFile = this.file;
      return localFile;
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
    label229: 
    try
    {
      close();
      try
      {
        if (this.memory == null)
        {
          this.memory = new MemoryOutput(null);
          this.out = this.memory;
          if (this.file == null)
            break label229;
          File localFile2 = this.file;
          this.file = null;
          if (localFile2.delete())
            break label229;
          String str2 = String.valueOf(String.valueOf(localFile2));
          throw new IOException(18 + str2.length() + "Could not delete: " + str2);
        }
      }
      finally
      {
      }
      this.memory.reset();
    }
    finally
    {
      if (this.memory == null)
        this.memory = new MemoryOutput(null);
      while (true)
      {
        this.out = this.memory;
        if (this.file == null)
          break;
        File localFile1 = this.file;
        this.file = null;
        if (localFile1.delete())
          break;
        String str1 = String.valueOf(String.valueOf(localFile1));
        throw new IOException(18 + str1.length() + "Could not delete: " + str1);
        this.memory.reset();
      }
    }
  }

  public void write(int paramInt)
    throws IOException
  {
    try
    {
      update(1);
      this.out.write(paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    try
    {
      write(paramArrayOfByte, 0, paramArrayOfByte.length);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    try
    {
      update(paramInt2);
      this.out.write(paramArrayOfByte, paramInt1, paramInt2);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private static class MemoryOutput extends ByteArrayOutputStream
  {
    byte[] getBuffer()
    {
      return this.buf;
    }

    int getCount()
    {
      return this.count;
    }
  }
}