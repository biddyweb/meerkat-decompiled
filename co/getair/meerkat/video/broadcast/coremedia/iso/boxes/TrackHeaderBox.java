package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.DateHelper;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Matrix;
import java.nio.ByteBuffer;
import java.util.Date;

public class TrackHeaderBox extends AbstractFullBox
{
  public static final String TYPE = "tkhd";
  private int alternateGroup;
  private Date creationTime;
  private long duration;
  private double height;
  private int layer;
  private Matrix matrix = Matrix.ROTATE_0;
  private Date modificationTime;
  private long trackId;
  private float volume;
  private double width;

  public TrackHeaderBox()
  {
    super("tkhd");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    if (getVersion() == 1)
    {
      this.creationTime = DateHelper.convert(IsoTypeReader.readUInt64(paramByteBuffer));
      this.modificationTime = DateHelper.convert(IsoTypeReader.readUInt64(paramByteBuffer));
      this.trackId = IsoTypeReader.readUInt32(paramByteBuffer);
      IsoTypeReader.readUInt32(paramByteBuffer);
      this.duration = paramByteBuffer.getLong();
      if (this.duration < -1L)
        throw new RuntimeException("The tracks duration is bigger than Long.MAX_VALUE");
    }
    else
    {
      this.creationTime = DateHelper.convert(IsoTypeReader.readUInt32(paramByteBuffer));
      this.modificationTime = DateHelper.convert(IsoTypeReader.readUInt32(paramByteBuffer));
      this.trackId = IsoTypeReader.readUInt32(paramByteBuffer);
      IsoTypeReader.readUInt32(paramByteBuffer);
      this.duration = IsoTypeReader.readUInt32(paramByteBuffer);
    }
    IsoTypeReader.readUInt32(paramByteBuffer);
    IsoTypeReader.readUInt32(paramByteBuffer);
    this.layer = IsoTypeReader.readUInt16(paramByteBuffer);
    this.alternateGroup = IsoTypeReader.readUInt16(paramByteBuffer);
    this.volume = IsoTypeReader.readFixedPoint88(paramByteBuffer);
    IsoTypeReader.readUInt16(paramByteBuffer);
    this.matrix = Matrix.fromByteBuffer(paramByteBuffer);
    this.width = IsoTypeReader.readFixedPoint1616(paramByteBuffer);
    this.height = IsoTypeReader.readFixedPoint1616(paramByteBuffer);
  }

  public int getAlternateGroup()
  {
    return this.alternateGroup;
  }

  public void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    if (getVersion() == 1)
    {
      IsoTypeWriter.writeUInt64(paramByteBuffer, DateHelper.convert(this.creationTime));
      IsoTypeWriter.writeUInt64(paramByteBuffer, DateHelper.convert(this.modificationTime));
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.trackId);
      IsoTypeWriter.writeUInt32(paramByteBuffer, 0L);
      IsoTypeWriter.writeUInt64(paramByteBuffer, this.duration);
    }
    while (true)
    {
      IsoTypeWriter.writeUInt32(paramByteBuffer, 0L);
      IsoTypeWriter.writeUInt32(paramByteBuffer, 0L);
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.layer);
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.alternateGroup);
      IsoTypeWriter.writeFixedPoint88(paramByteBuffer, this.volume);
      IsoTypeWriter.writeUInt16(paramByteBuffer, 0);
      this.matrix.getContent(paramByteBuffer);
      IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.width);
      IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.height);
      return;
      IsoTypeWriter.writeUInt32(paramByteBuffer, DateHelper.convert(this.creationTime));
      IsoTypeWriter.writeUInt32(paramByteBuffer, DateHelper.convert(this.modificationTime));
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.trackId);
      IsoTypeWriter.writeUInt32(paramByteBuffer, 0L);
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.duration);
    }
  }

  protected long getContentSize()
  {
    if (getVersion() == 1);
    for (long l = 4L + 32L; ; l = 4L + 20L)
      return l + 60L;
  }

  public Date getCreationTime()
  {
    return this.creationTime;
  }

  public long getDuration()
  {
    return this.duration;
  }

  public double getHeight()
  {
    return this.height;
  }

  public int getLayer()
  {
    return this.layer;
  }

  public Matrix getMatrix()
  {
    return this.matrix;
  }

  public Date getModificationTime()
  {
    return this.modificationTime;
  }

  public long getTrackId()
  {
    return this.trackId;
  }

  public float getVolume()
  {
    return this.volume;
  }

  public double getWidth()
  {
    return this.width;
  }

  public boolean isEnabled()
  {
    return (0x1 & getFlags()) > 0;
  }

  public boolean isInMovie()
  {
    return (0x2 & getFlags()) > 0;
  }

  public boolean isInPoster()
  {
    return (0x8 & getFlags()) > 0;
  }

  public boolean isInPreview()
  {
    return (0x4 & getFlags()) > 0;
  }

  public void setAlternateGroup(int paramInt)
  {
    this.alternateGroup = paramInt;
  }

  public void setCreationTime(Date paramDate)
  {
    this.creationTime = paramDate;
    if (DateHelper.convert(paramDate) >= 4294967296L)
      setVersion(1);
  }

  public void setDuration(long paramLong)
  {
    this.duration = paramLong;
    if (paramLong >= 4294967296L)
      setFlags(1);
  }

  public void setEnabled(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      setFlags(0x1 | getFlags());
      return;
    }
    setFlags(0xFFFFFFFE & getFlags());
  }

  public void setHeight(double paramDouble)
  {
    this.height = paramDouble;
  }

  public void setInMovie(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      setFlags(0x2 | getFlags());
      return;
    }
    setFlags(0xFFFFFFFD & getFlags());
  }

  public void setInPoster(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      setFlags(0x8 | getFlags());
      return;
    }
    setFlags(0xFFFFFFF7 & getFlags());
  }

  public void setInPreview(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      setFlags(0x4 | getFlags());
      return;
    }
    setFlags(0xFFFFFFFB & getFlags());
  }

  public void setLayer(int paramInt)
  {
    this.layer = paramInt;
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

  public void setTrackId(long paramLong)
  {
    this.trackId = paramLong;
  }

  public void setVolume(float paramFloat)
  {
    this.volume = paramFloat;
  }

  public void setWidth(double paramDouble)
  {
    this.width = paramDouble;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("TrackHeaderBox[");
    localStringBuilder.append("creationTime=").append(getCreationTime());
    localStringBuilder.append(";");
    localStringBuilder.append("modificationTime=").append(getModificationTime());
    localStringBuilder.append(";");
    localStringBuilder.append("trackId=").append(getTrackId());
    localStringBuilder.append(";");
    localStringBuilder.append("duration=").append(getDuration());
    localStringBuilder.append(";");
    localStringBuilder.append("layer=").append(getLayer());
    localStringBuilder.append(";");
    localStringBuilder.append("alternateGroup=").append(getAlternateGroup());
    localStringBuilder.append(";");
    localStringBuilder.append("volume=").append(getVolume());
    localStringBuilder.append(";");
    localStringBuilder.append("matrix=").append(this.matrix);
    localStringBuilder.append(";");
    localStringBuilder.append("width=").append(getWidth());
    localStringBuilder.append(";");
    localStringBuilder.append("height=").append(getHeight());
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}