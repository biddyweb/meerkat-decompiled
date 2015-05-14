package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.SampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class TimeCodeBox extends AbstractBox
  implements SampleEntry
{
  public static final String TYPE = "tmcd";
  int dataReferenceIndex;
  long flags;
  int frameDuration;
  int numberOfFrames;
  int reserved1;
  int reserved2;
  byte[] rest = new byte[0];
  int timeScale;

  public TimeCodeBox()
  {
    super("tmcd");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.position(6);
    this.dataReferenceIndex = IsoTypeReader.readUInt16(paramByteBuffer);
    this.reserved1 = paramByteBuffer.getInt();
    this.flags = IsoTypeReader.readUInt32(paramByteBuffer);
    this.timeScale = paramByteBuffer.getInt();
    this.frameDuration = paramByteBuffer.getInt();
    this.numberOfFrames = IsoTypeReader.readUInt8(paramByteBuffer);
    this.reserved2 = IsoTypeReader.readUInt24(paramByteBuffer);
    this.rest = new byte[paramByteBuffer.remaining()];
    paramByteBuffer.get(this.rest);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.put(new byte[] { 0, 0, 0, 0, 0, 0 });
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.dataReferenceIndex);
    paramByteBuffer.putInt(this.reserved1);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.flags);
    paramByteBuffer.putInt(this.timeScale);
    paramByteBuffer.putInt(this.frameDuration);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.numberOfFrames);
    IsoTypeWriter.writeUInt24(paramByteBuffer, this.reserved2);
    paramByteBuffer.put(this.rest);
  }

  protected long getContentSize()
  {
    return 28 + this.rest.length;
  }

  public int getDataReferenceIndex()
  {
    return this.dataReferenceIndex;
  }

  public long getFlags()
  {
    return this.flags;
  }

  public int getFrameDuration()
  {
    return this.frameDuration;
  }

  public int getNumberOfFrames()
  {
    return this.numberOfFrames;
  }

  public int getReserved1()
  {
    return this.reserved1;
  }

  public int getReserved2()
  {
    return this.reserved2;
  }

  public byte[] getRest()
  {
    return this.rest;
  }

  public int getTimeScale()
  {
    return this.timeScale;
  }

  public void setDataReferenceIndex(int paramInt)
  {
    this.dataReferenceIndex = paramInt;
  }

  public void setFlags(long paramLong)
  {
    this.flags = paramLong;
  }

  public void setFrameDuration(int paramInt)
  {
    this.frameDuration = paramInt;
  }

  public void setNumberOfFrames(int paramInt)
  {
    this.numberOfFrames = paramInt;
  }

  public void setReserved1(int paramInt)
  {
    this.reserved1 = paramInt;
  }

  public void setReserved2(int paramInt)
  {
    this.reserved2 = paramInt;
  }

  public void setRest(byte[] paramArrayOfByte)
  {
    this.rest = paramArrayOfByte;
  }

  public void setTimeScale(int paramInt)
  {
    this.timeScale = paramInt;
  }

  public String toString()
  {
    return "TimeCodeBox{timeScale=" + this.timeScale + ", frameDuration=" + this.frameDuration + ", numberOfFrames=" + this.numberOfFrames + ", reserved1=" + this.reserved1 + ", reserved2=" + this.reserved2 + ", flags=" + this.flags + '}';
  }
}