package co.getair.meerkat.video.broadcast.mp4parser.iso23009.part1;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class EventMessageBox extends AbstractFullBox
{
  public static final String TYPE = "emsg";
  long eventDuration;
  long id;
  byte[] messageData;
  long presentationTimeDelta;
  String schemeIdUri;
  long timescale;
  String value;

  public EventMessageBox()
  {
    super("emsg");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.schemeIdUri = IsoTypeReader.readString(paramByteBuffer);
    this.value = IsoTypeReader.readString(paramByteBuffer);
    this.timescale = IsoTypeReader.readUInt32(paramByteBuffer);
    this.presentationTimeDelta = IsoTypeReader.readUInt32(paramByteBuffer);
    this.eventDuration = IsoTypeReader.readUInt32(paramByteBuffer);
    this.id = IsoTypeReader.readUInt32(paramByteBuffer);
    this.messageData = new byte[paramByteBuffer.remaining()];
    paramByteBuffer.get(this.messageData);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUtf8String(paramByteBuffer, this.schemeIdUri);
    IsoTypeWriter.writeUtf8String(paramByteBuffer, this.value);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.timescale);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.presentationTimeDelta);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.eventDuration);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.id);
    paramByteBuffer.put(this.messageData);
  }

  protected long getContentSize()
  {
    return 22 + Utf8.utf8StringLengthInBytes(this.schemeIdUri) + Utf8.utf8StringLengthInBytes(this.value) + this.messageData.length;
  }

  public long getEventDuration()
  {
    return this.eventDuration;
  }

  public long getId()
  {
    return this.id;
  }

  public byte[] getMessageData()
  {
    return this.messageData;
  }

  public long getPresentationTimeDelta()
  {
    return this.presentationTimeDelta;
  }

  public String getSchemeIdUri()
  {
    return this.schemeIdUri;
  }

  public long getTimescale()
  {
    return this.timescale;
  }

  public String getValue()
  {
    return this.value;
  }

  public void setEventDuration(long paramLong)
  {
    this.eventDuration = paramLong;
  }

  public void setId(long paramLong)
  {
    this.id = paramLong;
  }

  public void setMessageData(byte[] paramArrayOfByte)
  {
    this.messageData = paramArrayOfByte;
  }

  public void setPresentationTimeDelta(long paramLong)
  {
    this.presentationTimeDelta = paramLong;
  }

  public void setSchemeIdUri(String paramString)
  {
    this.schemeIdUri = paramString;
  }

  public void setTimescale(long paramLong)
  {
    this.timescale = paramLong;
  }

  public void setValue(String paramString)
  {
    this.value = paramString;
  }
}