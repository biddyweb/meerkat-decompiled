package com.squareup.mimecraft;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.LinkedHashMap;
import java.util.Map;

public abstract interface Part
{
  public abstract Map<String, String> getHeaders();

  public abstract void writeBodyTo(OutputStream paramOutputStream)
    throws IOException;

  public static class Builder
  {
    private static final int BUFFER_SIZE = 4096;
    private byte[] bodyBytes;
    private File bodyFile;
    private Multipart bodyMultipart;
    private InputStream bodyStream;
    private boolean hasBody = false;
    private String headerDisposition;
    private String headerEncoding;
    private String headerLanguage;
    int headerLength;
    private String headerType;

    private void checkSetBody()
    {
      if (this.hasBody)
        throw new IllegalStateException("Only one body per part.");
      this.hasBody = true;
    }

    public Builder body(Multipart paramMultipart)
    {
      Utils.isNotNull(paramMultipart, "Multipart body must not be null.");
      if (this.headerType != null)
        throw new IllegalStateException("Content type must not be explicitly set for multipart body.");
      checkSetBody();
      this.headerType = null;
      this.bodyMultipart = paramMultipart;
      return this;
    }

    public Builder body(File paramFile)
    {
      Utils.isNotNull(paramFile, "File body must not be null.");
      checkSetBody();
      this.bodyFile = paramFile;
      return this;
    }

    public Builder body(InputStream paramInputStream)
    {
      Utils.isNotNull(paramInputStream, "Stream body must not be null.");
      checkSetBody();
      this.bodyStream = paramInputStream;
      return this;
    }

    public Builder body(String paramString)
    {
      Utils.isNotNull(paramString, "String body must not be null.");
      checkSetBody();
      try
      {
        byte[] arrayOfByte = paramString.getBytes("UTF-8");
        this.bodyBytes = arrayOfByte;
        this.headerLength = arrayOfByte.length;
        return this;
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException)
      {
        throw new IllegalArgumentException("Unable to convert input to UTF-8: " + paramString, localUnsupportedEncodingException);
      }
    }

    public Builder body(byte[] paramArrayOfByte)
    {
      Utils.isNotNull(paramArrayOfByte, "Byte array body must not be null.");
      checkSetBody();
      this.bodyBytes = paramArrayOfByte;
      this.headerLength = paramArrayOfByte.length;
      return this;
    }

    public Part build()
    {
      LinkedHashMap localLinkedHashMap = new LinkedHashMap();
      if (this.headerDisposition != null)
        localLinkedHashMap.put("Content-Disposition", this.headerDisposition);
      if (this.headerType != null)
        localLinkedHashMap.put("Content-Type", this.headerType);
      if (this.headerLength != 0)
        localLinkedHashMap.put("Content-Length", Integer.toString(this.headerLength));
      if (this.headerLanguage != null)
        localLinkedHashMap.put("Content-Language", this.headerLanguage);
      if (this.headerEncoding != null)
        localLinkedHashMap.put("Content-Transfer-Encoding", this.headerEncoding);
      if (this.bodyBytes != null)
        return new BytesPart(localLinkedHashMap, this.bodyBytes);
      if (this.bodyStream != null)
        return new StreamPart(localLinkedHashMap, this.bodyStream, null);
      if (this.bodyFile != null)
        return new FilePart(localLinkedHashMap, this.bodyFile, null);
      if (this.bodyMultipart != null)
      {
        localLinkedHashMap.putAll(this.bodyMultipart.getHeaders());
        return new PartPart(localLinkedHashMap, this.bodyMultipart);
      }
      throw new IllegalStateException("Part required body to be set.");
    }

    public Builder contentDisposition(String paramString)
    {
      Utils.isNotEmpty(paramString, "Disposition must not be empty.");
      Utils.isNull(this.headerDisposition, "Disposition header already set.");
      this.headerDisposition = paramString;
      return this;
    }

    public Builder contentEncoding(String paramString)
    {
      Utils.isNotEmpty(paramString, "Encoding must not be empty.");
      Utils.isNull(this.headerEncoding, "Encoding header already set.");
      this.headerEncoding = paramString;
      return this;
    }

    public Builder contentLanguage(String paramString)
    {
      Utils.isNotEmpty(paramString, "Language must not be empty.");
      Utils.isNull(this.headerLanguage, "Language header already set.");
      this.headerLanguage = paramString;
      return this;
    }

    public Builder contentLength(int paramInt)
    {
      if (paramInt <= 0)
        throw new IllegalStateException("Length must be greater than zero.");
      Utils.isNotZero(this.headerLength, "Length header already set.");
      this.headerLength = paramInt;
      return this;
    }

    public Builder contentType(String paramString)
    {
      Utils.isNotEmpty(paramString, "Type must not be empty.");
      Utils.isNull(this.headerType, "Type header already set.");
      Utils.isNull(this.bodyMultipart, "Type cannot be set with multipart body.");
      this.headerType = paramString;
      return this;
    }

    static final class BytesPart extends Part.Builder.PartImpl
    {
      private final byte[] contents;

      BytesPart(Map<String, String> paramMap, byte[] paramArrayOfByte)
      {
        super();
        this.contents = paramArrayOfByte;
      }

      public void writeBodyTo(OutputStream paramOutputStream)
        throws IOException
      {
        paramOutputStream.write(this.contents);
      }
    }

    private static final class FilePart extends Part.Builder.PartImpl
    {
      private final byte[] buffer = new byte[4096];
      private final File file;

      private FilePart(Map<String, String> paramMap, File paramFile)
      {
        super();
        this.file = paramFile;
      }

      // ERROR //
      public void writeBodyTo(OutputStream paramOutputStream)
        throws IOException
      {
        // Byte code:
        //   0: aconst_null
        //   1: astore_2
        //   2: new 26\011java/io/FileInputStream
        //   5: dup
        //   6: aload_0
        //   7: getfield 17\011com/squareup/mimecraft/Part$Builder$FilePart:file\011Ljava/io/File;
        //   10: invokespecial 29\011java/io/FileInputStream:<init>\011(Ljava/io/File;)V
        //   13: astore_3
        //   14: aload_3
        //   15: aload_1
        //   16: aload_0
        //   17: getfield 15\011com/squareup/mimecraft/Part$Builder$FilePart:buffer\011[B
        //   20: invokestatic 35\011com/squareup/mimecraft/Utils:copyStream\011(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V
        //   23: aload_3
        //   24: ifnull +7 -> 31
        //   27: aload_3
        //   28: invokevirtual 41\011java/io/InputStream:close\011()V
        //   31: return
        //   32: astore 4
        //   34: aload_2
        //   35: ifnull +7 -> 42
        //   38: aload_2
        //   39: invokevirtual 41\011java/io/InputStream:close\011()V
        //   42: aload 4
        //   44: athrow
        //   45: astore 6
        //   47: return
        //   48: astore 5
        //   50: goto -8 -> 42
        //   53: astore 4
        //   55: aload_3
        //   56: astore_2
        //   57: goto -23 -> 34
        //
        // Exception table:
        //   from\011to\011target\011type
        //   2\01114\01132\011finally
        //   27\01131\01145\011java/io/IOException
        //   38\01142\01148\011java/io/IOException
        //   14\01123\01153\011finally
      }
    }

    private static abstract class PartImpl
      implements Part
    {
      private final Map<String, String> headers;

      protected PartImpl(Map<String, String> paramMap)
      {
        this.headers = paramMap;
      }

      public Map<String, String> getHeaders()
      {
        return this.headers;
      }
    }

    private static final class PartPart extends Part.Builder.PartImpl
    {
      private final Part body;

      protected PartPart(Map<String, String> paramMap, Part paramPart)
      {
        super();
        this.body = paramPart;
      }

      public void writeBodyTo(OutputStream paramOutputStream)
        throws IOException
      {
        this.body.writeBodyTo(paramOutputStream);
      }
    }

    private static final class StreamPart extends Part.Builder.PartImpl
    {
      private final byte[] buffer = new byte[4096];
      private final InputStream in;

      private StreamPart(Map<String, String> paramMap, InputStream paramInputStream)
      {
        super();
        this.in = paramInputStream;
      }

      public void writeBodyTo(OutputStream paramOutputStream)
        throws IOException
      {
        Utils.copyStream(this.in, paramOutputStream, this.buffer);
      }
    }
  }
}