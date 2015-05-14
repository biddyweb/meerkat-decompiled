package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReaderVariable;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriterVariable;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class ItemLocationBox extends AbstractFullBox
{
  public static final String TYPE = "iloc";
  public int baseOffsetSize = 8;
  public int indexSize = 0;
  public List<Item> items = new LinkedList();
  public int lengthSize = 8;
  public int offsetSize = 8;

  public ItemLocationBox()
  {
    super("iloc");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    int i = IsoTypeReader.readUInt8(paramByteBuffer);
    this.offsetSize = (i >>> 4);
    this.lengthSize = (i & 0xF);
    int j = IsoTypeReader.readUInt8(paramByteBuffer);
    this.baseOffsetSize = (j >>> 4);
    if (getVersion() == 1)
      this.indexSize = (j & 0xF);
    int k = IsoTypeReader.readUInt16(paramByteBuffer);
    for (int m = 0; m < k; m++)
      this.items.add(new Item(paramByteBuffer));
  }

  public Extent createExtent(long paramLong1, long paramLong2, long paramLong3)
  {
    return new Extent(paramLong1, paramLong2, paramLong3);
  }

  Extent createExtent(ByteBuffer paramByteBuffer)
  {
    return new Extent(paramByteBuffer);
  }

  public Item createItem(int paramInt1, int paramInt2, int paramInt3, long paramLong, List<Extent> paramList)
  {
    return new Item(paramInt1, paramInt2, paramInt3, paramLong, paramList);
  }

  Item createItem(ByteBuffer paramByteBuffer)
  {
    return new Item(paramByteBuffer);
  }

  public int getBaseOffsetSize()
  {
    return this.baseOffsetSize;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.offsetSize << 4 | this.lengthSize);
    if (getVersion() == 1)
      IsoTypeWriter.writeUInt8(paramByteBuffer, this.baseOffsetSize << 4 | this.indexSize);
    while (true)
    {
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.items.size());
      Iterator localIterator = this.items.iterator();
      while (localIterator.hasNext())
        ((Item)localIterator.next()).getContent(paramByteBuffer);
      IsoTypeWriter.writeUInt8(paramByteBuffer, this.baseOffsetSize << 4);
    }
  }

  protected long getContentSize()
  {
    long l = 8L;
    Iterator localIterator = this.items.iterator();
    while (localIterator.hasNext())
      l += ((Item)localIterator.next()).getSize();
    return l;
  }

  public int getIndexSize()
  {
    return this.indexSize;
  }

  public List<Item> getItems()
  {
    return this.items;
  }

  public int getLengthSize()
  {
    return this.lengthSize;
  }

  public int getOffsetSize()
  {
    return this.offsetSize;
  }

  public void setBaseOffsetSize(int paramInt)
  {
    this.baseOffsetSize = paramInt;
  }

  public void setIndexSize(int paramInt)
  {
    this.indexSize = paramInt;
  }

  public void setItems(List<Item> paramList)
  {
    this.items = paramList;
  }

  public void setLengthSize(int paramInt)
  {
    this.lengthSize = paramInt;
  }

  public void setOffsetSize(int paramInt)
  {
    this.offsetSize = paramInt;
  }

  public class Extent
  {
    public long extentIndex;
    public long extentLength;
    public long extentOffset;

    public Extent(long arg2, long arg4, long arg6)
    {
      this.extentOffset = ???;
      Object localObject1;
      this.extentLength = localObject1;
      Object localObject2;
      this.extentIndex = localObject2;
    }

    public Extent(ByteBuffer arg2)
    {
      ByteBuffer localByteBuffer;
      if ((ItemLocationBox.this.getVersion() == 1) && (ItemLocationBox.this.indexSize > 0))
        this.extentIndex = IsoTypeReaderVariable.read(localByteBuffer, ItemLocationBox.this.indexSize);
      this.extentOffset = IsoTypeReaderVariable.read(localByteBuffer, ItemLocationBox.this.offsetSize);
      this.extentLength = IsoTypeReaderVariable.read(localByteBuffer, ItemLocationBox.this.lengthSize);
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      Extent localExtent;
      do
      {
        return true;
        if ((paramObject == null) || (getClass() != paramObject.getClass()))
          return false;
        localExtent = (Extent)paramObject;
        if (this.extentIndex != localExtent.extentIndex)
          return false;
        if (this.extentLength != localExtent.extentLength)
          return false;
      }
      while (this.extentOffset == localExtent.extentOffset);
      return false;
    }

    public void getContent(ByteBuffer paramByteBuffer)
    {
      if ((ItemLocationBox.this.getVersion() == 1) && (ItemLocationBox.this.indexSize > 0))
        IsoTypeWriterVariable.write(this.extentIndex, paramByteBuffer, ItemLocationBox.this.indexSize);
      IsoTypeWriterVariable.write(this.extentOffset, paramByteBuffer, ItemLocationBox.this.offsetSize);
      IsoTypeWriterVariable.write(this.extentLength, paramByteBuffer, ItemLocationBox.this.lengthSize);
    }

    public int getSize()
    {
      if (ItemLocationBox.this.indexSize > 0);
      for (int i = ItemLocationBox.this.indexSize; ; i = 0)
        return i + ItemLocationBox.this.offsetSize + ItemLocationBox.this.lengthSize;
    }

    public int hashCode()
    {
      return 31 * (31 * (int)(this.extentOffset ^ this.extentOffset >>> 32) + (int)(this.extentLength ^ this.extentLength >>> 32)) + (int)(this.extentIndex ^ this.extentIndex >>> 32);
    }

    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append("Extent");
      localStringBuilder.append("{extentOffset=").append(this.extentOffset);
      localStringBuilder.append(", extentLength=").append(this.extentLength);
      localStringBuilder.append(", extentIndex=").append(this.extentIndex);
      localStringBuilder.append('}');
      return localStringBuilder.toString();
    }
  }

  public class Item
  {
    public long baseOffset;
    public int constructionMethod;
    public int dataReferenceIndex;
    public List<ItemLocationBox.Extent> extents = new LinkedList();
    public int itemId;

    public Item(int paramInt1, int paramLong, long arg4, List<ItemLocationBox.Extent> arg6)
    {
      this.itemId = paramInt1;
      this.constructionMethod = paramLong;
      this.dataReferenceIndex = ???;
      this.baseOffset = paramList;
      Object localObject;
      this.extents = localObject;
    }

    public Item(ByteBuffer arg2)
    {
      ByteBuffer localByteBuffer;
      this.itemId = IsoTypeReader.readUInt16(localByteBuffer);
      if (ItemLocationBox.this.getVersion() == 1)
        this.constructionMethod = (0xF & IsoTypeReader.readUInt16(localByteBuffer));
      this.dataReferenceIndex = IsoTypeReader.readUInt16(localByteBuffer);
      if (ItemLocationBox.this.baseOffsetSize > 0);
      for (this.baseOffset = IsoTypeReaderVariable.read(localByteBuffer, ItemLocationBox.this.baseOffsetSize); ; this.baseOffset = 0L)
      {
        int i = IsoTypeReader.readUInt16(localByteBuffer);
        for (int j = 0; j < i; j++)
          this.extents.add(new ItemLocationBox.Extent(ItemLocationBox.this, localByteBuffer));
      }
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      Item localItem;
      do
      {
        return true;
        if ((paramObject == null) || (getClass() != paramObject.getClass()))
          return false;
        localItem = (Item)paramObject;
        if (this.baseOffset != localItem.baseOffset)
          return false;
        if (this.constructionMethod != localItem.constructionMethod)
          return false;
        if (this.dataReferenceIndex != localItem.dataReferenceIndex)
          return false;
        if (this.itemId != localItem.itemId)
          return false;
        if (this.extents == null)
          break;
      }
      while (this.extents.equals(localItem.extents));
      while (true)
      {
        return false;
        if (localItem.extents == null)
          break;
      }
    }

    public void getContent(ByteBuffer paramByteBuffer)
    {
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.itemId);
      if (ItemLocationBox.this.getVersion() == 1)
        IsoTypeWriter.writeUInt16(paramByteBuffer, this.constructionMethod);
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.dataReferenceIndex);
      if (ItemLocationBox.this.baseOffsetSize > 0)
        IsoTypeWriterVariable.write(this.baseOffset, paramByteBuffer, ItemLocationBox.this.baseOffsetSize);
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.extents.size());
      Iterator localIterator = this.extents.iterator();
      while (localIterator.hasNext())
        ((ItemLocationBox.Extent)localIterator.next()).getContent(paramByteBuffer);
    }

    public int getSize()
    {
      int i = 2;
      if (ItemLocationBox.this.getVersion() == 1)
        i += 2;
      int j = 2 + (i + 2 + ItemLocationBox.this.baseOffsetSize);
      Iterator localIterator = this.extents.iterator();
      while (localIterator.hasNext())
        j += ((ItemLocationBox.Extent)localIterator.next()).getSize();
      return j;
    }

    public int hashCode()
    {
      int i = 31 * (31 * (31 * (31 * this.itemId + this.constructionMethod) + this.dataReferenceIndex) + (int)(this.baseOffset ^ this.baseOffset >>> 32));
      if (this.extents != null);
      for (int j = this.extents.hashCode(); ; j = 0)
        return i + j;
    }

    public void setBaseOffset(long paramLong)
    {
      this.baseOffset = paramLong;
    }

    public String toString()
    {
      return "Item{baseOffset=" + this.baseOffset + ", itemId=" + this.itemId + ", constructionMethod=" + this.constructionMethod + ", dataReferenceIndex=" + this.dataReferenceIndex + ", extents=" + this.extents + '}';
    }
  }
}