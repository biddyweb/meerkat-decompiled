package com.google.common.io;

import com.google.common.annotations.Beta;
import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Splitter;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.Lists;
import com.google.common.collect.TreeTraverser;
import com.google.common.hash.HashCode;
import com.google.common.hash.HashFunction;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.RandomAccessFile;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileChannel.MapMode;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

@Beta
public final class Files
{
  private static final TreeTraverser<File> FILE_TREE_TRAVERSER = new TreeTraverser()
  {
    public Iterable<File> children(File paramAnonymousFile)
    {
      if (paramAnonymousFile.isDirectory())
      {
        File[] arrayOfFile = paramAnonymousFile.listFiles();
        if (arrayOfFile != null)
          return Collections.unmodifiableList(Arrays.asList(arrayOfFile));
      }
      return Collections.emptyList();
    }

    public String toString()
    {
      return "Files.fileTreeTraverser()";
    }
  };
  private static final int TEMP_DIR_ATTEMPTS = 10000;

  public static void append(CharSequence paramCharSequence, File paramFile, Charset paramCharset)
    throws IOException
  {
    write(paramCharSequence, paramFile, paramCharset, true);
  }

  public static ByteSink asByteSink(File paramFile, FileWriteMode[] paramArrayOfFileWriteMode)
  {
    return new FileByteSink(paramFile, paramArrayOfFileWriteMode, null);
  }

  public static ByteSource asByteSource(File paramFile)
  {
    return new FileByteSource(paramFile, null);
  }

  public static CharSink asCharSink(File paramFile, Charset paramCharset, FileWriteMode[] paramArrayOfFileWriteMode)
  {
    return asByteSink(paramFile, paramArrayOfFileWriteMode).asCharSink(paramCharset);
  }

  public static CharSource asCharSource(File paramFile, Charset paramCharset)
  {
    return asByteSource(paramFile).asCharSource(paramCharset);
  }

  public static void copy(File paramFile1, File paramFile2)
    throws IOException
  {
    if (!paramFile1.equals(paramFile2));
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool, "Source %s and destination %s must be different", new Object[] { paramFile1, paramFile2 });
      asByteSource(paramFile1).copyTo(asByteSink(paramFile2, new FileWriteMode[0]));
      return;
    }
  }

  public static void copy(File paramFile, OutputStream paramOutputStream)
    throws IOException
  {
    asByteSource(paramFile).copyTo(paramOutputStream);
  }

  public static void copy(File paramFile, Charset paramCharset, Appendable paramAppendable)
    throws IOException
  {
    asCharSource(paramFile, paramCharset).copyTo(paramAppendable);
  }

  public static void createParentDirs(File paramFile)
    throws IOException
  {
    Preconditions.checkNotNull(paramFile);
    File localFile = paramFile.getCanonicalFile().getParentFile();
    if (localFile == null);
    do
    {
      return;
      localFile.mkdirs();
    }
    while (localFile.isDirectory());
    String str = String.valueOf(String.valueOf(paramFile));
    throw new IOException(39 + str.length() + "Unable to create parent directories of " + str);
  }

  public static File createTempDir()
  {
    File localFile1 = new File(System.getProperty("java.io.tmpdir"));
    long l = System.currentTimeMillis();
    String str1 = 21 + l + "-";
    for (int i = 0; i < 10000; i++)
    {
      String str5 = String.valueOf(String.valueOf(str1));
      File localFile2 = new File(localFile1, 11 + str5.length() + str5 + i);
      if (localFile2.mkdir())
        return localFile2;
    }
    String str2 = String.valueOf(String.valueOf("Failed to create directory within 10000 attempts (tried "));
    String str3 = String.valueOf(String.valueOf(str1));
    String str4 = String.valueOf(String.valueOf(str1));
    throw new IllegalStateException(17 + str2.length() + str3.length() + str4.length() + str2 + str3 + "0 to " + str4 + 9999 + ")");
  }

  public static boolean equal(File paramFile1, File paramFile2)
    throws IOException
  {
    Preconditions.checkNotNull(paramFile1);
    Preconditions.checkNotNull(paramFile2);
    if ((paramFile1 == paramFile2) || (paramFile1.equals(paramFile2)))
      return true;
    long l1 = paramFile1.length();
    long l2 = paramFile2.length();
    if ((l1 != 0L) && (l2 != 0L) && (l1 != l2))
      return false;
    return asByteSource(paramFile1).contentEquals(asByteSource(paramFile2));
  }

  public static TreeTraverser<File> fileTreeTraverser()
  {
    return FILE_TREE_TRAVERSER;
  }

  public static String getFileExtension(String paramString)
  {
    Preconditions.checkNotNull(paramString);
    String str = new File(paramString).getName();
    int i = str.lastIndexOf('.');
    if (i == -1)
      return "";
    return str.substring(i + 1);
  }

  public static String getNameWithoutExtension(String paramString)
  {
    Preconditions.checkNotNull(paramString);
    String str = new File(paramString).getName();
    int i = str.lastIndexOf('.');
    if (i == -1)
      return str;
    return str.substring(0, i);
  }

  public static HashCode hash(File paramFile, HashFunction paramHashFunction)
    throws IOException
  {
    return asByteSource(paramFile).hash(paramHashFunction);
  }

  public static Predicate<File> isDirectory()
  {
    return FilePredicate.IS_DIRECTORY;
  }

  public static Predicate<File> isFile()
  {
    return FilePredicate.IS_FILE;
  }

  public static MappedByteBuffer map(File paramFile)
    throws IOException
  {
    Preconditions.checkNotNull(paramFile);
    return map(paramFile, FileChannel.MapMode.READ_ONLY);
  }

  public static MappedByteBuffer map(File paramFile, FileChannel.MapMode paramMapMode)
    throws IOException
  {
    Preconditions.checkNotNull(paramFile);
    Preconditions.checkNotNull(paramMapMode);
    if (!paramFile.exists())
      throw new FileNotFoundException(paramFile.toString());
    return map(paramFile, paramMapMode, paramFile.length());
  }

  public static MappedByteBuffer map(File paramFile, FileChannel.MapMode paramMapMode, long paramLong)
    throws FileNotFoundException, IOException
  {
    Preconditions.checkNotNull(paramFile);
    Preconditions.checkNotNull(paramMapMode);
    Closer localCloser = Closer.create();
    try
    {
      if (paramMapMode == FileChannel.MapMode.READ_ONLY);
      for (String str = "r"; ; str = "rw")
      {
        MappedByteBuffer localMappedByteBuffer = map((RandomAccessFile)localCloser.register(new RandomAccessFile(paramFile, str)), paramMapMode, paramLong);
        return localMappedByteBuffer;
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
  }

  private static MappedByteBuffer map(RandomAccessFile paramRandomAccessFile, FileChannel.MapMode paramMapMode, long paramLong)
    throws IOException
  {
    Closer localCloser = Closer.create();
    try
    {
      MappedByteBuffer localMappedByteBuffer = ((FileChannel)localCloser.register(paramRandomAccessFile.getChannel())).map(paramMapMode, 0L, paramLong);
      return localMappedByteBuffer;
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

  private static FileWriteMode[] modes(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      FileWriteMode[] arrayOfFileWriteMode = new FileWriteMode[1];
      arrayOfFileWriteMode[0] = FileWriteMode.APPEND;
      return arrayOfFileWriteMode;
    }
    return new FileWriteMode[0];
  }

  public static void move(File paramFile1, File paramFile2)
    throws IOException
  {
    Preconditions.checkNotNull(paramFile1);
    Preconditions.checkNotNull(paramFile2);
    if (!paramFile1.equals(paramFile2));
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool, "Source %s and destination %s must be different", new Object[] { paramFile1, paramFile2 });
      if (paramFile1.renameTo(paramFile2))
        return;
      copy(paramFile1, paramFile2);
      if (paramFile1.delete())
        return;
      if (paramFile2.delete())
        break;
      String str2 = String.valueOf(String.valueOf(paramFile2));
      throw new IOException(17 + str2.length() + "Unable to delete " + str2);
    }
    String str1 = String.valueOf(String.valueOf(paramFile1));
    throw new IOException(17 + str1.length() + "Unable to delete " + str1);
  }

  public static BufferedReader newReader(File paramFile, Charset paramCharset)
    throws FileNotFoundException
  {
    Preconditions.checkNotNull(paramFile);
    Preconditions.checkNotNull(paramCharset);
    return new BufferedReader(new InputStreamReader(new FileInputStream(paramFile), paramCharset));
  }

  public static BufferedWriter newWriter(File paramFile, Charset paramCharset)
    throws FileNotFoundException
  {
    Preconditions.checkNotNull(paramFile);
    Preconditions.checkNotNull(paramCharset);
    return new BufferedWriter(new OutputStreamWriter(new FileOutputStream(paramFile), paramCharset));
  }

  public static <T> T readBytes(File paramFile, ByteProcessor<T> paramByteProcessor)
    throws IOException
  {
    return asByteSource(paramFile).read(paramByteProcessor);
  }

  static byte[] readFile(InputStream paramInputStream, long paramLong)
    throws IOException
  {
    if (paramLong > 2147483647L)
      throw new OutOfMemoryError(68 + "file is too large to fit in a byte array: " + paramLong + " bytes");
    if (paramLong == 0L)
      return ByteStreams.toByteArray(paramInputStream);
    return ByteStreams.toByteArray(paramInputStream, (int)paramLong);
  }

  public static String readFirstLine(File paramFile, Charset paramCharset)
    throws IOException
  {
    return asCharSource(paramFile, paramCharset).readFirstLine();
  }

  public static <T> T readLines(File paramFile, Charset paramCharset, LineProcessor<T> paramLineProcessor)
    throws IOException
  {
    return asCharSource(paramFile, paramCharset).readLines(paramLineProcessor);
  }

  public static List<String> readLines(File paramFile, Charset paramCharset)
    throws IOException
  {
    return (List)readLines(paramFile, paramCharset, new LineProcessor()
    {
      final List<String> result = Lists.newArrayList();

      public List<String> getResult()
      {
        return this.result;
      }

      public boolean processLine(String paramAnonymousString)
      {
        this.result.add(paramAnonymousString);
        return true;
      }
    });
  }

  public static String simplifyPath(String paramString)
  {
    Preconditions.checkNotNull(paramString);
    String str1;
    if (paramString.length() == 0)
      str1 = ".";
    label239: 
    do
    {
      return str1;
      Iterable localIterable = Splitter.on('/').omitEmptyStrings().split(paramString);
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = localIterable.iterator();
      while (localIterator.hasNext())
      {
        String str3 = (String)localIterator.next();
        if (!str3.equals("."))
          if (str3.equals(".."))
          {
            if ((localArrayList.size() > 0) && (!((String)localArrayList.get(-1 + localArrayList.size())).equals("..")))
              localArrayList.remove(-1 + localArrayList.size());
            else
              localArrayList.add("..");
          }
          else
            localArrayList.add(str3);
      }
      str1 = Joiner.on('/').join(localArrayList);
      if (paramString.charAt(0) == '/')
      {
        String str2 = String.valueOf(str1);
        if (str2.length() == 0)
          break label239;
        str1 = "/".concat(str2);
      }
      while (str1.startsWith("/../"))
      {
        str1 = str1.substring(3);
        continue;
        str1 = new String("/");
      }
      if (str1.equals("/.."))
        return "/";
    }
    while (!"".equals(str1));
    return ".";
  }

  public static byte[] toByteArray(File paramFile)
    throws IOException
  {
    return asByteSource(paramFile).read();
  }

  public static String toString(File paramFile, Charset paramCharset)
    throws IOException
  {
    return asCharSource(paramFile, paramCharset).read();
  }

  public static void touch(File paramFile)
    throws IOException
  {
    Preconditions.checkNotNull(paramFile);
    if ((!paramFile.createNewFile()) && (!paramFile.setLastModified(System.currentTimeMillis())))
    {
      String str = String.valueOf(String.valueOf(paramFile));
      throw new IOException(38 + str.length() + "Unable to update modification time of " + str);
    }
  }

  public static void write(CharSequence paramCharSequence, File paramFile, Charset paramCharset)
    throws IOException
  {
    asCharSink(paramFile, paramCharset, new FileWriteMode[0]).write(paramCharSequence);
  }

  private static void write(CharSequence paramCharSequence, File paramFile, Charset paramCharset, boolean paramBoolean)
    throws IOException
  {
    asCharSink(paramFile, paramCharset, modes(paramBoolean)).write(paramCharSequence);
  }

  public static void write(byte[] paramArrayOfByte, File paramFile)
    throws IOException
  {
    asByteSink(paramFile, new FileWriteMode[0]).write(paramArrayOfByte);
  }

  private static final class FileByteSink extends ByteSink
  {
    private final File file;
    private final ImmutableSet<FileWriteMode> modes;

    private FileByteSink(File paramFile, FileWriteMode[] paramArrayOfFileWriteMode)
    {
      this.file = ((File)Preconditions.checkNotNull(paramFile));
      this.modes = ImmutableSet.copyOf(paramArrayOfFileWriteMode);
    }

    public FileOutputStream openStream()
      throws IOException
    {
      return new FileOutputStream(this.file, this.modes.contains(FileWriteMode.APPEND));
    }

    public String toString()
    {
      String str1 = String.valueOf(String.valueOf(this.file));
      String str2 = String.valueOf(String.valueOf(this.modes));
      return 20 + str1.length() + str2.length() + "Files.asByteSink(" + str1 + ", " + str2 + ")";
    }
  }

  private static final class FileByteSource extends ByteSource
  {
    private final File file;

    private FileByteSource(File paramFile)
    {
      this.file = ((File)Preconditions.checkNotNull(paramFile));
    }

    public FileInputStream openStream()
      throws IOException
    {
      return new FileInputStream(this.file);
    }

    public byte[] read()
      throws IOException
    {
      Closer localCloser = Closer.create();
      try
      {
        FileInputStream localFileInputStream = (FileInputStream)localCloser.register(openStream());
        byte[] arrayOfByte = Files.readFile(localFileInputStream, localFileInputStream.getChannel().size());
        return arrayOfByte;
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

    public long size()
      throws IOException
    {
      if (!this.file.isFile())
        throw new FileNotFoundException(this.file.toString());
      return this.file.length();
    }

    public String toString()
    {
      String str = String.valueOf(String.valueOf(this.file));
      return 20 + str.length() + "Files.asByteSource(" + str + ")";
    }
  }

  private static abstract enum FilePredicate
    implements Predicate<File>
  {
    static
    {
      FilePredicate[] arrayOfFilePredicate = new FilePredicate[2];
      arrayOfFilePredicate[0] = IS_DIRECTORY;
      arrayOfFilePredicate[1] = IS_FILE;
    }
  }
}