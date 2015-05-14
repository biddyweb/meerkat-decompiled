package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class RatingBox extends AbstractFullBox
{
  public static final String TYPE = "rtng";
  private String language;
  private String ratingCriteria;
  private String ratingEntity;
  private String ratingInfo;

  public RatingBox()
  {
    super("rtng");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.ratingEntity = IsoTypeReader.read4cc(paramByteBuffer);
    this.ratingCriteria = IsoTypeReader.read4cc(paramByteBuffer);
    this.language = IsoTypeReader.readIso639(paramByteBuffer);
    this.ratingInfo = IsoTypeReader.readString(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    paramByteBuffer.put(IsoFile.fourCCtoBytes(this.ratingEntity));
    paramByteBuffer.put(IsoFile.fourCCtoBytes(this.ratingCriteria));
    IsoTypeWriter.writeIso639(paramByteBuffer, this.language);
    paramByteBuffer.put(Utf8.convert(this.ratingInfo));
    paramByteBuffer.put((byte)0);
  }

  protected long getContentSize()
  {
    return 15 + Utf8.utf8StringLengthInBytes(this.ratingInfo);
  }

  public String getLanguage()
  {
    return this.language;
  }

  public String getRatingCriteria()
  {
    return this.ratingCriteria;
  }

  public String getRatingEntity()
  {
    return this.ratingEntity;
  }

  public String getRatingInfo()
  {
    return this.ratingInfo;
  }

  public void setLanguage(String paramString)
  {
    this.language = paramString;
  }

  public void setRatingCriteria(String paramString)
  {
    this.ratingCriteria = paramString;
  }

  public void setRatingEntity(String paramString)
  {
    this.ratingEntity = paramString;
  }

  public void setRatingInfo(String paramString)
  {
    this.ratingInfo = paramString;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("RatingBox[language=").append(getLanguage());
    localStringBuilder.append("ratingEntity=").append(getRatingEntity());
    localStringBuilder.append(";ratingCriteria=").append(getRatingCriteria());
    localStringBuilder.append(";language=").append(getLanguage());
    localStringBuilder.append(";ratingInfo=").append(getRatingInfo());
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}