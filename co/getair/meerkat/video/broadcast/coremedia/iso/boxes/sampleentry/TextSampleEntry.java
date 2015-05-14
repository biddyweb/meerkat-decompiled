package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.Arrays;

public class TextSampleEntry extends AbstractSampleEntry
{
  public static final String TYPE1 = "tx3g";
  public static final String TYPE_ENCRYPTED = "enct";
  private int[] backgroundColorRgba = new int[4];
  private BoxRecord boxRecord = new BoxRecord();
  private long displayFlags;
  private int horizontalJustification;
  private StyleRecord styleRecord = new StyleRecord();
  private int verticalJustification;

  public TextSampleEntry()
  {
    super("tx3g");
  }

  public TextSampleEntry(String paramString)
  {
    super(paramString);
  }

  public int[] getBackgroundColorRgba()
  {
    return this.backgroundColorRgba;
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    paramWritableByteChannel.write(getHeader());
    ByteBuffer localByteBuffer = ByteBuffer.allocate(38);
    localByteBuffer.position(6);
    IsoTypeWriter.writeUInt16(localByteBuffer, this.dataReferenceIndex);
    IsoTypeWriter.writeUInt32(localByteBuffer, this.displayFlags);
    IsoTypeWriter.writeUInt8(localByteBuffer, this.horizontalJustification);
    IsoTypeWriter.writeUInt8(localByteBuffer, this.verticalJustification);
    IsoTypeWriter.writeUInt8(localByteBuffer, this.backgroundColorRgba[0]);
    IsoTypeWriter.writeUInt8(localByteBuffer, this.backgroundColorRgba[1]);
    IsoTypeWriter.writeUInt8(localByteBuffer, this.backgroundColorRgba[2]);
    IsoTypeWriter.writeUInt8(localByteBuffer, this.backgroundColorRgba[3]);
    this.boxRecord.getContent(localByteBuffer);
    this.styleRecord.getContent(localByteBuffer);
    paramWritableByteChannel.write((ByteBuffer)localByteBuffer.rewind());
    writeContainer(paramWritableByteChannel);
  }

  public BoxRecord getBoxRecord()
  {
    return this.boxRecord;
  }

  public int getHorizontalJustification()
  {
    return this.horizontalJustification;
  }

  public long getSize()
  {
    long l1 = getContainerSize();
    long l2 = l1 + 38L;
    if ((this.largeBox) || (l1 + 38L >= 4294967296L));
    for (int i = 16; ; i = 8)
      return l2 + i;
  }

  public StyleRecord getStyleRecord()
  {
    return this.styleRecord;
  }

  public int getVerticalJustification()
  {
    return this.verticalJustification;
  }

  public boolean isContinuousKaraoke()
  {
    return (0x800 & this.displayFlags) == 2048L;
  }

  public boolean isFillTextRegion()
  {
    return (0x40000 & this.displayFlags) == 262144L;
  }

  public boolean isScrollDirection()
  {
    return (0x180 & this.displayFlags) == 384L;
  }

  public boolean isScrollIn()
  {
    return (0x20 & this.displayFlags) == 32L;
  }

  public boolean isScrollOut()
  {
    return (0x40 & this.displayFlags) == 64L;
  }

  public boolean isWriteTextVertically()
  {
    return (0x20000 & this.displayFlags) == 131072L;
  }

  public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(38);
    paramDataSource.read(localByteBuffer);
    localByteBuffer.position(6);
    this.dataReferenceIndex = IsoTypeReader.readUInt16(localByteBuffer);
    this.displayFlags = IsoTypeReader.readUInt32(localByteBuffer);
    this.horizontalJustification = IsoTypeReader.readUInt8(localByteBuffer);
    this.verticalJustification = IsoTypeReader.readUInt8(localByteBuffer);
    this.backgroundColorRgba = new int[4];
    this.backgroundColorRgba[0] = IsoTypeReader.readUInt8(localByteBuffer);
    this.backgroundColorRgba[1] = IsoTypeReader.readUInt8(localByteBuffer);
    this.backgroundColorRgba[2] = IsoTypeReader.readUInt8(localByteBuffer);
    this.backgroundColorRgba[3] = IsoTypeReader.readUInt8(localByteBuffer);
    this.boxRecord = new BoxRecord();
    this.boxRecord.parse(localByteBuffer);
    this.styleRecord = new StyleRecord();
    this.styleRecord.parse(localByteBuffer);
    initContainer(paramDataSource, paramLong - 38L, paramBoxParser);
  }

  public void setBackgroundColorRgba(int[] paramArrayOfInt)
  {
    this.backgroundColorRgba = paramArrayOfInt;
  }

  public void setBoxRecord(BoxRecord paramBoxRecord)
  {
    this.boxRecord = paramBoxRecord;
  }

  public void setContinuousKaraoke(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.displayFlags = (0x800 | this.displayFlags);
      return;
    }
    this.displayFlags = (0xFFFFF7FF & this.displayFlags);
  }

  public void setFillTextRegion(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.displayFlags = (0x40000 | this.displayFlags);
      return;
    }
    this.displayFlags = (0xFFFBFFFF & this.displayFlags);
  }

  public void setHorizontalJustification(int paramInt)
  {
    this.horizontalJustification = paramInt;
  }

  public void setScrollDirection(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.displayFlags = (0x180 | this.displayFlags);
      return;
    }
    this.displayFlags = (0xFFFFFE7F & this.displayFlags);
  }

  public void setScrollIn(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.displayFlags = (0x20 | this.displayFlags);
      return;
    }
    this.displayFlags = (0xFFFFFFDF & this.displayFlags);
  }

  public void setScrollOut(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.displayFlags = (0x40 | this.displayFlags);
      return;
    }
    this.displayFlags = (0xFFFFFFBF & this.displayFlags);
  }

  public void setStyleRecord(StyleRecord paramStyleRecord)
  {
    this.styleRecord = paramStyleRecord;
  }

  public void setType(String paramString)
  {
    this.type = paramString;
  }

  public void setVerticalJustification(int paramInt)
  {
    this.verticalJustification = paramInt;
  }

  public void setWriteTextVertically(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.displayFlags = (0x20000 | this.displayFlags);
      return;
    }
    this.displayFlags = (0xFFFDFFFF & this.displayFlags);
  }

  public String toString()
  {
    return "TextSampleEntry";
  }

  public static class BoxRecord
  {
    int bottom;
    int left;
    int right;
    int top;

    public BoxRecord()
    {
    }

    public BoxRecord(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      this.top = paramInt1;
      this.left = paramInt2;
      this.bottom = paramInt3;
      this.right = paramInt4;
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      BoxRecord localBoxRecord;
      do
      {
        return true;
        if ((paramObject == null) || (getClass() != paramObject.getClass()))
          return false;
        localBoxRecord = (BoxRecord)paramObject;
        if (this.bottom != localBoxRecord.bottom)
          return false;
        if (this.left != localBoxRecord.left)
          return false;
        if (this.right != localBoxRecord.right)
          return false;
      }
      while (this.top == localBoxRecord.top);
      return false;
    }

    public void getContent(ByteBuffer paramByteBuffer)
    {
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.top);
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.left);
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.bottom);
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.right);
    }

    public int getSize()
    {
      return 8;
    }

    public int hashCode()
    {
      return 31 * (31 * (31 * this.top + this.left) + this.bottom) + this.right;
    }

    public void parse(ByteBuffer paramByteBuffer)
    {
      this.top = IsoTypeReader.readUInt16(paramByteBuffer);
      this.left = IsoTypeReader.readUInt16(paramByteBuffer);
      this.bottom = IsoTypeReader.readUInt16(paramByteBuffer);
      this.right = IsoTypeReader.readUInt16(paramByteBuffer);
    }
  }

  public static class StyleRecord
  {
    int endChar;
    int faceStyleFlags;
    int fontId;
    int fontSize;
    int startChar;
    int[] textColor = { 255, 255, 255, 255 };

    public StyleRecord()
    {
    }

    public StyleRecord(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int[] paramArrayOfInt)
    {
      this.startChar = paramInt1;
      this.endChar = paramInt2;
      this.fontId = paramInt3;
      this.faceStyleFlags = paramInt4;
      this.fontSize = paramInt5;
      this.textColor = paramArrayOfInt;
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      StyleRecord localStyleRecord;
      do
      {
        return true;
        if ((paramObject == null) || (getClass() != paramObject.getClass()))
          return false;
        localStyleRecord = (StyleRecord)paramObject;
        if (this.endChar != localStyleRecord.endChar)
          return false;
        if (this.faceStyleFlags != localStyleRecord.faceStyleFlags)
          return false;
        if (this.fontId != localStyleRecord.fontId)
          return false;
        if (this.fontSize != localStyleRecord.fontSize)
          return false;
        if (this.startChar != localStyleRecord.startChar)
          return false;
      }
      while (Arrays.equals(this.textColor, localStyleRecord.textColor));
      return false;
    }

    public void getContent(ByteBuffer paramByteBuffer)
    {
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.startChar);
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.endChar);
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.fontId);
      IsoTypeWriter.writeUInt8(paramByteBuffer, this.faceStyleFlags);
      IsoTypeWriter.writeUInt8(paramByteBuffer, this.fontSize);
      IsoTypeWriter.writeUInt8(paramByteBuffer, this.textColor[0]);
      IsoTypeWriter.writeUInt8(paramByteBuffer, this.textColor[1]);
      IsoTypeWriter.writeUInt8(paramByteBuffer, this.textColor[2]);
      IsoTypeWriter.writeUInt8(paramByteBuffer, this.textColor[3]);
    }

    public int getSize()
    {
      return 12;
    }

    public int hashCode()
    {
      int i = 31 * (31 * (31 * (31 * (31 * this.startChar + this.endChar) + this.fontId) + this.faceStyleFlags) + this.fontSize);
      if (this.textColor != null);
      for (int j = Arrays.hashCode(this.textColor); ; j = 0)
        return i + j;
    }

    public void parse(ByteBuffer paramByteBuffer)
    {
      this.startChar = IsoTypeReader.readUInt16(paramByteBuffer);
      this.endChar = IsoTypeReader.readUInt16(paramByteBuffer);
      this.fontId = IsoTypeReader.readUInt16(paramByteBuffer);
      this.faceStyleFlags = IsoTypeReader.readUInt8(paramByteBuffer);
      this.fontSize = IsoTypeReader.readUInt8(paramByteBuffer);
      this.textColor = new int[4];
      this.textColor[0] = IsoTypeReader.readUInt8(paramByteBuffer);
      this.textColor[1] = IsoTypeReader.readUInt8(paramByteBuffer);
      this.textColor[2] = IsoTypeReader.readUInt8(paramByteBuffer);
      this.textColor[3] = IsoTypeReader.readUInt8(paramByteBuffer);
    }
  }
}