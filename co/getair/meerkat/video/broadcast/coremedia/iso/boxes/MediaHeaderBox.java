package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.DateHelper;
import java.nio.ByteBuffer;
import java.util.Date;

public class MediaHeaderBox extends AbstractFullBox
{
  public static final String TYPE = "mdhd";
  private Date creationTime = new Date();
  private long duration;
  private String language = "eng";
  private Date modificationTime = new Date();
  private long timescale;

  public MediaHeaderBox()
  {
    super("mdhd");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    if (getVersion() == 1)
    {
      this.creationTime = DateHelper.convert(IsoTypeReader.readUInt64(paramByteBuffer));
      this.modificationTime = DateHelper.convert(IsoTypeReader.readUInt64(paramByteBuffer));
      this.timescale = IsoTypeReader.readUInt32(paramByteBuffer);
    }
    for (this.duration = IsoTypeReader.readUInt64(paramByteBuffer); ; this.duration = IsoTypeReader.readUInt32(paramByteBuffer))
    {
      this.language = IsoTypeReader.readIso639(paramByteBuffer);
      IsoTypeReader.readUInt16(paramByteBuffer);
      return;
      this.creationTime = DateHelper.convert(IsoTypeReader.readUInt32(paramByteBuffer));
      this.modificationTime = DateHelper.convert(IsoTypeReader.readUInt32(paramByteBuffer));
      this.timescale = IsoTypeReader.readUInt32(paramByteBuffer);
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    if (getVersion() == 1)
    {
      IsoTypeWriter.writeUInt64(paramByteBuffer, DateHelper.convert(this.creationTime));
      IsoTypeWriter.writeUInt64(paramByteBuffer, DateHelper.convert(this.modificationTime));
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.timescale);
      IsoTypeWriter.writeUInt64(paramByteBuffer, this.duration);
    }
    while (true)
    {
      IsoTypeWriter.writeIso639(paramByteBuffer, this.language);
      IsoTypeWriter.writeUInt16(paramByteBuffer, 0);
      return;
      IsoTypeWriter.writeUInt32(paramByteBuffer, DateHelper.convert(this.creationTime));
      IsoTypeWriter.writeUInt32(paramByteBuffer, DateHelper.convert(this.modificationTime));
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.timescale);
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.duration);
    }
  }

  protected long getContentSize()
  {
    if (getVersion() == 1);
    for (long l = 4L + 28L; ; l = 4L + 16L)
      return 2L + (l + 2L);
  }

  public Date getCreationTime()
  {
    return this.creationTime;
  }

  public long getDuration()
  {
    return this.duration;
  }

  public String getLanguage()
  {
    return this.language;
  }

  public Date getModificationTime()
  {
    return this.modificationTime;
  }

  public long getTimescale()
  {
    return this.timescale;
  }

  public void setCreationTime(Date paramDate)
  {
    this.creationTime = paramDate;
  }

  public void setDuration(long paramLong)
  {
    this.duration = paramLong;
  }

  public void setLanguage(String paramString)
  {
    this.language = paramString;
  }

  public void setModificationTime(Date paramDate)
  {
    this.modificationTime = paramDate;
  }

  public void setTimescale(long paramLong)
  {
    this.timescale = paramLong;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("MediaHeaderBox[");
    localStringBuilder.append("creationTime=").append(getCreationTime());
    localStringBuilder.append(";");
    localStringBuilder.append("modificationTime=").append(getModificationTime());
    localStringBuilder.append(";");
    localStringBuilder.append("timescale=").append(getTimescale());
    localStringBuilder.append(";");
    localStringBuilder.append("duration=").append(getDuration());
    localStringBuilder.append(";");
    localStringBuilder.append("language=").append(getLanguage());
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}