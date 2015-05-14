package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.DateHelper;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Matrix;
import java.nio.ByteBuffer;
import java.util.Date;

public class MovieHeaderBox extends AbstractFullBox
{
  public static final String TYPE = "mvhd";
  private Date creationTime;
  private int currentTime;
  private long duration;
  private Matrix matrix = Matrix.ROTATE_0;
  private Date modificationTime;
  private long nextTrackId;
  private int posterTime;
  private int previewDuration;
  private int previewTime;
  private double rate = 1.0D;
  private int selectionDuration;
  private int selectionTime;
  private long timescale;
  private float volume = 1.0F;

  public MovieHeaderBox()
  {
    super("mvhd");
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
      this.rate = IsoTypeReader.readFixedPoint1616(paramByteBuffer);
      this.volume = IsoTypeReader.readFixedPoint88(paramByteBuffer);
      IsoTypeReader.readUInt16(paramByteBuffer);
      IsoTypeReader.readUInt32(paramByteBuffer);
      IsoTypeReader.readUInt32(paramByteBuffer);
      this.matrix = Matrix.fromByteBuffer(paramByteBuffer);
      this.previewTime = paramByteBuffer.getInt();
      this.previewDuration = paramByteBuffer.getInt();
      this.posterTime = paramByteBuffer.getInt();
      this.selectionTime = paramByteBuffer.getInt();
      this.selectionDuration = paramByteBuffer.getInt();
      this.currentTime = paramByteBuffer.getInt();
      this.nextTrackId = IsoTypeReader.readUInt32(paramByteBuffer);
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
      IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.rate);
      IsoTypeWriter.writeFixedPoint88(paramByteBuffer, this.volume);
      IsoTypeWriter.writeUInt16(paramByteBuffer, 0);
      IsoTypeWriter.writeUInt32(paramByteBuffer, 0L);
      IsoTypeWriter.writeUInt32(paramByteBuffer, 0L);
      this.matrix.getContent(paramByteBuffer);
      paramByteBuffer.putInt(this.previewTime);
      paramByteBuffer.putInt(this.previewDuration);
      paramByteBuffer.putInt(this.posterTime);
      paramByteBuffer.putInt(this.selectionTime);
      paramByteBuffer.putInt(this.selectionDuration);
      paramByteBuffer.putInt(this.currentTime);
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.nextTrackId);
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
      return l + 80L;
  }

  public Date getCreationTime()
  {
    return this.creationTime;
  }

  public int getCurrentTime()
  {
    return this.currentTime;
  }

  public long getDuration()
  {
    return this.duration;
  }

  public Matrix getMatrix()
  {
    return this.matrix;
  }

  public Date getModificationTime()
  {
    return this.modificationTime;
  }

  public long getNextTrackId()
  {
    return this.nextTrackId;
  }

  public int getPosterTime()
  {
    return this.posterTime;
  }

  public int getPreviewDuration()
  {
    return this.previewDuration;
  }

  public int getPreviewTime()
  {
    return this.previewTime;
  }

  public double getRate()
  {
    return this.rate;
  }

  public int getSelectionDuration()
  {
    return this.selectionDuration;
  }

  public int getSelectionTime()
  {
    return this.selectionTime;
  }

  public long getTimescale()
  {
    return this.timescale;
  }

  public float getVolume()
  {
    return this.volume;
  }

  public void setCreationTime(Date paramDate)
  {
    this.creationTime = paramDate;
    if (DateHelper.convert(paramDate) >= 4294967296L)
      setVersion(1);
  }

  public void setCurrentTime(int paramInt)
  {
    this.currentTime = paramInt;
  }

  public void setDuration(long paramLong)
  {
    this.duration = paramLong;
    if (paramLong >= 4294967296L)
      setVersion(1);
  }

  public void setMatrix(Matrix paramMatrix)
  {
    this.matrix = paramMatrix;
  }

  public void setModificationTime(Date paramDate)
  {
    this.modificationTime = paramDate;
    if (DateHelper.convert(paramDate) >= 4294967296L)
      setVersion(1);
  }

  public void setNextTrackId(long paramLong)
  {
    this.nextTrackId = paramLong;
  }

  public void setPosterTime(int paramInt)
  {
    this.posterTime = paramInt;
  }

  public void setPreviewDuration(int paramInt)
  {
    this.previewDuration = paramInt;
  }

  public void setPreviewTime(int paramInt)
  {
    this.previewTime = paramInt;
  }

  public void setRate(double paramDouble)
  {
    this.rate = paramDouble;
  }

  public void setSelectionDuration(int paramInt)
  {
    this.selectionDuration = paramInt;
  }

  public void setSelectionTime(int paramInt)
  {
    this.selectionTime = paramInt;
  }

  public void setTimescale(long paramLong)
  {
    this.timescale = paramLong;
  }

  public void setVolume(float paramFloat)
  {
    this.volume = paramFloat;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("MovieHeaderBox[");
    localStringBuilder.append("creationTime=").append(getCreationTime());
    localStringBuilder.append(";");
    localStringBuilder.append("modificationTime=").append(getModificationTime());
    localStringBuilder.append(";");
    localStringBuilder.append("timescale=").append(getTimescale());
    localStringBuilder.append(";");
    localStringBuilder.append("duration=").append(getDuration());
    localStringBuilder.append(";");
    localStringBuilder.append("rate=").append(getRate());
    localStringBuilder.append(";");
    localStringBuilder.append("volume=").append(getVolume());
    localStringBuilder.append(";");
    localStringBuilder.append("matrix=").append(this.matrix);
    localStringBuilder.append(";");
    localStringBuilder.append("nextTrackId=").append(getNextTrackId());
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}