package co.getair.meerkat.video.broadcast.coremedia.iso;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import java.io.EOFException;
import java.io.IOException;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.util.logging.Logger;

public abstract class AbstractBoxParser
  implements BoxParser
{
  private static Logger LOG = Logger.getLogger(AbstractBoxParser.class.getName());
  ThreadLocal<ByteBuffer> header = new ThreadLocal()
  {
    protected ByteBuffer initialValue()
    {
      return ByteBuffer.allocate(32);
    }
  };

  public abstract Box createBox(String paramString1, byte[] paramArrayOfByte, String paramString2);

  public Box parseBox(DataSource paramDataSource, Container paramContainer)
    throws IOException
  {
    long l1 = paramDataSource.position();
    ((ByteBuffer)this.header.get()).rewind().limit(8);
    int i = 0;
    while (true)
    {
      int j = paramDataSource.read((ByteBuffer)this.header.get());
      if (j == 8)
        break;
      if (j < 0)
      {
        paramDataSource.position(l1);
        throw new EOFException();
      }
      i += j;
    }
    ((ByteBuffer)this.header.get()).rewind();
    long l2 = IsoTypeReader.readUInt32((ByteBuffer)this.header.get());
    if ((l2 < 8L) && (l2 > 1L))
    {
      LOG.severe("Plausibility check failed: size < 8 (size = " + l2 + "). Stop parsing!");
      return null;
    }
    String str1 = IsoTypeReader.read4cc((ByteBuffer)this.header.get());
    long l3;
    if (l2 == 1L)
    {
      ((ByteBuffer)this.header.get()).limit(16);
      paramDataSource.read((ByteBuffer)this.header.get());
      ((ByteBuffer)this.header.get()).position(8);
      l3 = IsoTypeReader.readUInt64((ByteBuffer)this.header.get()) - 16L;
    }
    byte[] arrayOfByte;
    while (true)
    {
      boolean bool = "uuid".equals(str1);
      arrayOfByte = null;
      if (!bool)
        break label452;
      ((ByteBuffer)this.header.get()).limit(16 + ((ByteBuffer)this.header.get()).limit());
      paramDataSource.read((ByteBuffer)this.header.get());
      arrayOfByte = new byte[16];
      for (int k = -16 + ((ByteBuffer)this.header.get()).position(); k < ((ByteBuffer)this.header.get()).position(); k++)
        arrayOfByte[(k - (-16 + ((ByteBuffer)this.header.get()).position()))] = ((ByteBuffer)this.header.get()).get(k);
      if (l2 == 0L)
      {
        l3 = paramDataSource.size() - paramDataSource.position();
        (l3 + 8L);
      }
      else
      {
        l3 = l2 - 8L;
      }
    }
    l3 -= 16L;
    label452: if ((paramContainer instanceof Box));
    for (String str2 = ((Box)paramContainer).getType(); ; str2 = "")
    {
      Box localBox = createBox(str1, arrayOfByte, str2);
      localBox.setParent(paramContainer);
      ((ByteBuffer)this.header.get()).rewind();
      localBox.parse(paramDataSource, (ByteBuffer)this.header.get(), l3, this);
      return localBox;
    }
  }
}