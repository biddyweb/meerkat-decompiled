package co.getair.meerkat.video.broadcast.googlecode.mp4parser;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.Hex;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.annotations.DoNotParseDetail;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Logger;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Path;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public abstract class AbstractBox
  implements Box
{
  private static Logger LOG;
  private ByteBuffer content;
  long contentStartPosition;
  DataSource dataSource;
  private ByteBuffer deadBytes = null;
  boolean isParsed;
  boolean isRead;
  long memMapSize = -1L;
  long offset;
  private Container parent;
  protected String type;
  private byte[] userType;

  static
  {
    if (!AbstractBox.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      LOG = Logger.getLogger(AbstractBox.class);
      return;
    }
  }

  protected AbstractBox(String paramString)
  {
    this.type = paramString;
    this.isRead = true;
    this.isParsed = true;
  }

  protected AbstractBox(String paramString, byte[] paramArrayOfByte)
  {
    this.type = paramString;
    this.userType = paramArrayOfByte;
    this.isRead = true;
    this.isParsed = true;
  }

  private void getHeader(ByteBuffer paramByteBuffer)
  {
    if (isSmallBox())
    {
      IsoTypeWriter.writeUInt32(paramByteBuffer, getSize());
      paramByteBuffer.put(IsoFile.fourCCtoBytes(getType()));
    }
    while (true)
    {
      if ("uuid".equals(getType()))
        paramByteBuffer.put(getUserType());
      return;
      IsoTypeWriter.writeUInt32(paramByteBuffer, 1L);
      paramByteBuffer.put(IsoFile.fourCCtoBytes(getType()));
      IsoTypeWriter.writeUInt64(paramByteBuffer, getSize());
    }
  }

  private boolean isSmallBox()
  {
    int i = 8;
    if ("uuid".equals(getType()))
      i += 16;
    if (this.isRead)
      if (this.isParsed)
      {
        l = getContentSize();
        if (this.deadBytes != null)
        {
          j = this.deadBytes.limit();
          if (l + j + i >= 4294967296L)
            break label76;
        }
      }
    label76: 
    while (this.memMapSize + i < 4294967296L)
    {
      do
      {
        while (true)
        {
          long l;
          return true;
          int j = 0;
        }
        return false;
      }
      while (i + this.content.limit() < 4294967296L);
      return false;
    }
    return false;
  }

  private void readContent()
  {
    try
    {
      boolean bool = this.isRead;
      if (!bool);
      try
      {
        LOG.logDebug("mem mapping " + getType());
        this.content = this.dataSource.map(this.contentStartPosition, this.memMapSize);
        this.isRead = true;
        return;
      }
      catch (IOException localIOException)
      {
        throw new RuntimeException(localIOException);
      }
    }
    finally
    {
    }
  }

  private boolean verify(ByteBuffer paramByteBuffer)
  {
    long l = getContentSize();
    if (this.deadBytes != null);
    ByteBuffer localByteBuffer;
    for (int i = this.deadBytes.limit(); ; i = 0)
    {
      localByteBuffer = ByteBuffer.allocate(CastUtils.l2i(l + i));
      getContent(localByteBuffer);
      if (this.deadBytes == null)
        break;
      this.deadBytes.rewind();
      while (this.deadBytes.remaining() > 0)
        localByteBuffer.put(this.deadBytes);
    }
    paramByteBuffer.rewind();
    localByteBuffer.rewind();
    if (paramByteBuffer.remaining() != localByteBuffer.remaining())
    {
      System.err.print(getType() + ": remaining differs " + paramByteBuffer.remaining() + " vs. " + localByteBuffer.remaining());
      LOG.logError(getType() + ": remaining differs " + paramByteBuffer.remaining() + " vs. " + localByteBuffer.remaining());
      return false;
    }
    int j = paramByteBuffer.position();
    int k = -1 + paramByteBuffer.limit();
    for (int m = -1 + localByteBuffer.limit(); k >= j; m--)
    {
      byte b1 = paramByteBuffer.get(k);
      byte b2 = localByteBuffer.get(m);
      if (b1 != b2)
      {
        Logger localLogger = LOG;
        Object[] arrayOfObject = new Object[4];
        arrayOfObject[0] = getType();
        arrayOfObject[1] = Integer.valueOf(k);
        arrayOfObject[2] = Byte.valueOf(b1);
        arrayOfObject[3] = Byte.valueOf(b2);
        localLogger.logError(String.format("%s: buffers differ at %d: %2X/%2X", arrayOfObject));
        byte[] arrayOfByte1 = new byte[paramByteBuffer.remaining()];
        byte[] arrayOfByte2 = new byte[localByteBuffer.remaining()];
        paramByteBuffer.get(arrayOfByte1);
        localByteBuffer.get(arrayOfByte2);
        System.err.println("original      : " + Hex.encodeHex(arrayOfByte1, 4));
        System.err.println("reconstructed : " + Hex.encodeHex(arrayOfByte2, 4));
        return false;
      }
      k--;
    }
    return true;
  }

  protected abstract void _parseDetails(ByteBuffer paramByteBuffer);

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    int i = 8;
    int j = 16;
    if (this.isRead)
    {
      if (this.isParsed)
      {
        ByteBuffer localByteBuffer3 = ByteBuffer.allocate(CastUtils.l2i(getSize()));
        getHeader(localByteBuffer3);
        getContent(localByteBuffer3);
        if (this.deadBytes != null)
        {
          this.deadBytes.rewind();
          while (this.deadBytes.remaining() > 0)
            localByteBuffer3.put(this.deadBytes);
        }
        paramWritableByteChannel.write((ByteBuffer)localByteBuffer3.rewind());
        return;
      }
      if (isSmallBox())
        if (!"uuid".equals(getType()))
          break label170;
      while (true)
      {
        ByteBuffer localByteBuffer2 = ByteBuffer.allocate(i + j);
        getHeader(localByteBuffer2);
        paramWritableByteChannel.write((ByteBuffer)localByteBuffer2.rewind());
        paramWritableByteChannel.write((ByteBuffer)this.content.position(0));
        return;
        i = j;
        break;
        label170: j = 0;
      }
    }
    if (isSmallBox())
      if (!"uuid".equals(getType()))
        break label248;
    while (true)
    {
      ByteBuffer localByteBuffer1 = ByteBuffer.allocate(i + j);
      getHeader(localByteBuffer1);
      paramWritableByteChannel.write((ByteBuffer)localByteBuffer1.rewind());
      this.dataSource.transferTo(this.contentStartPosition, this.memMapSize, paramWritableByteChannel);
      return;
      i = j;
      break;
      label248: j = 0;
    }
  }

  protected abstract void getContent(ByteBuffer paramByteBuffer);

  protected abstract long getContentSize();

  public long getOffset()
  {
    return this.offset;
  }

  @DoNotParseDetail
  public Container getParent()
  {
    return this.parent;
  }

  @DoNotParseDetail
  public String getPath()
  {
    return Path.createPath(this);
  }

  public long getSize()
  {
    long l1;
    int i;
    label30: int k;
    label52: long l2;
    int m;
    if (this.isRead)
      if (this.isParsed)
      {
        l1 = getContentSize();
        if (l1 < 4294967288L)
          break label120;
        i = 8;
        int j = i + 8;
        if (!"uuid".equals(getType()))
          break label125;
        k = 16;
        l2 = l1 + (k + j);
        ByteBuffer localByteBuffer = this.deadBytes;
        m = 0;
        if (localByteBuffer != null)
          break label131;
      }
    while (true)
    {
      return l2 + m;
      if (this.content != null);
      for (int n = this.content.limit(); ; n = 0)
      {
        l1 = n;
        break;
      }
      l1 = this.memMapSize;
      break;
      label120: i = 0;
      break label30;
      label125: k = 0;
      break label52;
      label131: m = this.deadBytes.limit();
    }
  }

  @DoNotParseDetail
  public String getType()
  {
    return this.type;
  }

  @DoNotParseDetail
  public byte[] getUserType()
  {
    return this.userType;
  }

  public boolean isParsed()
  {
    return this.isParsed;
  }

  @DoNotParseDetail
  public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    this.contentStartPosition = paramDataSource.position();
    this.offset = (this.contentStartPosition - paramByteBuffer.remaining());
    this.memMapSize = paramLong;
    this.dataSource = paramDataSource;
    paramDataSource.position(paramLong + paramDataSource.position());
    this.isRead = false;
    this.isParsed = false;
  }

  public final void parseDetails()
  {
    try
    {
      readContent();
      LOG.logDebug("parsing details of " + getType());
      if (this.content != null)
      {
        ByteBuffer localByteBuffer = this.content;
        this.isParsed = true;
        localByteBuffer.rewind();
        _parseDetails(localByteBuffer);
        if (localByteBuffer.remaining() > 0)
          this.deadBytes = localByteBuffer.slice();
        this.content = null;
        if ((!$assertionsDisabled) && (!verify(localByteBuffer)))
          throw new AssertionError();
      }
    }
    finally
    {
    }
  }

  protected void setDeadBytes(ByteBuffer paramByteBuffer)
  {
    this.deadBytes = paramByteBuffer;
  }

  @DoNotParseDetail
  public void setParent(Container paramContainer)
  {
    this.parent = paramContainer;
  }
}