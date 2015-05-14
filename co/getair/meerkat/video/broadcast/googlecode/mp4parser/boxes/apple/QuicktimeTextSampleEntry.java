package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AbstractSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.List;

public class QuicktimeTextSampleEntry extends AbstractSampleEntry
{
  public static final String TYPE = "text";
  int backgroundB;
  int backgroundG;
  int backgroundR;
  int dataReferenceIndex;
  long defaultTextBox;
  int displayFlags;
  short fontFace;
  String fontName = "";
  short fontNumber;
  int foregroundB = 65535;
  int foregroundG = 65535;
  int foregroundR = 65535;
  long reserved1;
  byte reserved2;
  short reserved3;
  int textJustification;

  public QuicktimeTextSampleEntry()
  {
    super("text");
  }

  public void addBox(Box paramBox)
  {
    throw new RuntimeException("QuicktimeTextSampleEntries may not have child boxes");
  }

  public int getBackgroundB()
  {
    return this.backgroundB;
  }

  public int getBackgroundG()
  {
    return this.backgroundG;
  }

  public int getBackgroundR()
  {
    return this.backgroundR;
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    paramWritableByteChannel.write(getHeader());
    if (this.fontName != null);
    for (int i = this.fontName.length(); ; i = 0)
    {
      ByteBuffer localByteBuffer = ByteBuffer.allocate(i + 52);
      localByteBuffer.position(6);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.dataReferenceIndex);
      localByteBuffer.putInt(this.displayFlags);
      localByteBuffer.putInt(this.textJustification);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.backgroundR);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.backgroundG);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.backgroundB);
      IsoTypeWriter.writeUInt64(localByteBuffer, this.defaultTextBox);
      IsoTypeWriter.writeUInt64(localByteBuffer, this.reserved1);
      localByteBuffer.putShort(this.fontNumber);
      localByteBuffer.putShort(this.fontFace);
      localByteBuffer.put(this.reserved2);
      localByteBuffer.putShort(this.reserved3);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.foregroundR);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.foregroundG);
      IsoTypeWriter.writeUInt16(localByteBuffer, this.foregroundB);
      if (this.fontName != null)
      {
        IsoTypeWriter.writeUInt8(localByteBuffer, this.fontName.length());
        localByteBuffer.put(this.fontName.getBytes());
      }
      paramWritableByteChannel.write((ByteBuffer)localByteBuffer.rewind());
      return;
    }
  }

  public long getDefaultTextBox()
  {
    return this.defaultTextBox;
  }

  public int getDisplayFlags()
  {
    return this.displayFlags;
  }

  public short getFontFace()
  {
    return this.fontFace;
  }

  public String getFontName()
  {
    return this.fontName;
  }

  public short getFontNumber()
  {
    return this.fontNumber;
  }

  public int getForegroundB()
  {
    return this.foregroundB;
  }

  public int getForegroundG()
  {
    return this.foregroundG;
  }

  public int getForegroundR()
  {
    return this.foregroundR;
  }

  public long getReserved1()
  {
    return this.reserved1;
  }

  public byte getReserved2()
  {
    return this.reserved2;
  }

  public short getReserved3()
  {
    return this.reserved3;
  }

  public long getSize()
  {
    long l1 = 52L + getContainerSize();
    int i;
    long l2;
    if (this.fontName != null)
    {
      i = this.fontName.length();
      l2 = l1 + i;
      if ((!this.largeBox) && (8L + l2 < 4294967296L))
        break label66;
    }
    label66: for (int j = 16; ; j = 8)
    {
      return l2 + j;
      i = 0;
      break;
    }
  }

  public int getTextJustification()
  {
    return this.textJustification;
  }

  public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(CastUtils.l2i(paramLong));
    paramDataSource.read(localByteBuffer);
    localByteBuffer.position(6);
    this.dataReferenceIndex = IsoTypeReader.readUInt16(localByteBuffer);
    this.displayFlags = localByteBuffer.getInt();
    this.textJustification = localByteBuffer.getInt();
    this.backgroundR = IsoTypeReader.readUInt16(localByteBuffer);
    this.backgroundG = IsoTypeReader.readUInt16(localByteBuffer);
    this.backgroundB = IsoTypeReader.readUInt16(localByteBuffer);
    this.defaultTextBox = IsoTypeReader.readUInt64(localByteBuffer);
    this.reserved1 = IsoTypeReader.readUInt64(localByteBuffer);
    this.fontNumber = localByteBuffer.getShort();
    this.fontFace = localByteBuffer.getShort();
    this.reserved2 = localByteBuffer.get();
    this.reserved3 = localByteBuffer.getShort();
    this.foregroundR = IsoTypeReader.readUInt16(localByteBuffer);
    this.foregroundG = IsoTypeReader.readUInt16(localByteBuffer);
    this.foregroundB = IsoTypeReader.readUInt16(localByteBuffer);
    if (localByteBuffer.remaining() > 0)
    {
      byte[] arrayOfByte = new byte[IsoTypeReader.readUInt8(localByteBuffer)];
      localByteBuffer.get(arrayOfByte);
      this.fontName = new String(arrayOfByte);
      return;
    }
    this.fontName = null;
  }

  public void setBackgroundB(int paramInt)
  {
    this.backgroundB = paramInt;
  }

  public void setBackgroundG(int paramInt)
  {
    this.backgroundG = paramInt;
  }

  public void setBackgroundR(int paramInt)
  {
    this.backgroundR = paramInt;
  }

  public void setBoxes(List<Box> paramList)
  {
    throw new RuntimeException("QuicktimeTextSampleEntries may not have child boxes");
  }

  public void setDefaultTextBox(long paramLong)
  {
    this.defaultTextBox = paramLong;
  }

  public void setDisplayFlags(int paramInt)
  {
    this.displayFlags = paramInt;
  }

  public void setFontFace(short paramShort)
  {
    this.fontFace = paramShort;
  }

  public void setFontName(String paramString)
  {
    this.fontName = paramString;
  }

  public void setFontNumber(short paramShort)
  {
    this.fontNumber = paramShort;
  }

  public void setForegroundB(int paramInt)
  {
    this.foregroundB = paramInt;
  }

  public void setForegroundG(int paramInt)
  {
    this.foregroundG = paramInt;
  }

  public void setForegroundR(int paramInt)
  {
    this.foregroundR = paramInt;
  }

  public void setReserved1(long paramLong)
  {
    this.reserved1 = paramLong;
  }

  public void setReserved2(byte paramByte)
  {
    this.reserved2 = paramByte;
  }

  public void setReserved3(short paramShort)
  {
    this.reserved3 = paramShort;
  }

  public void setTextJustification(int paramInt)
  {
    this.textJustification = paramInt;
  }
}