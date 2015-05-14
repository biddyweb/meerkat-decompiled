package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class FreeBox
  implements Box
{
  public static final String TYPE = "free";
  ByteBuffer data;
  private long offset;
  private Container parent;
  List<Box> replacers = new LinkedList();

  static
  {
    if (!FreeBox.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  public FreeBox()
  {
    this.data = ByteBuffer.wrap(new byte[0]);
  }

  public FreeBox(int paramInt)
  {
    this.data = ByteBuffer.allocate(paramInt);
  }

  public void addAndReplace(Box paramBox)
  {
    this.data.position(CastUtils.l2i(paramBox.getSize()));
    this.data = this.data.slice();
    this.replacers.add(paramBox);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    FreeBox localFreeBox;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localFreeBox = (FreeBox)paramObject;
      if (getData() == null)
        break;
    }
    while (getData().equals(localFreeBox.getData()));
    while (true)
    {
      return false;
      if (localFreeBox.getData() == null)
        break;
    }
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    Iterator localIterator = this.replacers.iterator();
    while (localIterator.hasNext())
      ((Box)localIterator.next()).getBox(paramWritableByteChannel);
    ByteBuffer localByteBuffer = ByteBuffer.allocate(8);
    IsoTypeWriter.writeUInt32(localByteBuffer, 8 + this.data.limit());
    localByteBuffer.put("free".getBytes());
    localByteBuffer.rewind();
    paramWritableByteChannel.write(localByteBuffer);
    localByteBuffer.rewind();
    this.data.rewind();
    paramWritableByteChannel.write(this.data);
    this.data.rewind();
  }

  public ByteBuffer getData()
  {
    if (this.data != null)
      return (ByteBuffer)this.data.duplicate().rewind();
    return null;
  }

  public long getOffset()
  {
    return this.offset;
  }

  public Container getParent()
  {
    return this.parent;
  }

  public long getSize()
  {
    long l = 8L;
    Iterator localIterator = this.replacers.iterator();
    while (localIterator.hasNext())
      l += ((Box)localIterator.next()).getSize();
    return l + this.data.limit();
  }

  public String getType()
  {
    return "free";
  }

  public int hashCode()
  {
    if (this.data != null)
      return this.data.hashCode();
    return 0;
  }

  public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    this.offset = (paramDataSource.position() - paramByteBuffer.remaining());
    if (paramLong > 1048576L)
    {
      this.data = paramDataSource.map(paramDataSource.position(), paramLong);
      paramDataSource.position(paramLong + paramDataSource.position());
      return;
    }
    assert (paramLong < 2147483647L);
    this.data = ByteBuffer.allocate(CastUtils.l2i(paramLong));
    paramDataSource.read(this.data);
  }

  public void setData(ByteBuffer paramByteBuffer)
  {
    this.data = paramByteBuffer;
  }

  public void setParent(Container paramContainer)
  {
    this.parent = paramContainer;
  }
}