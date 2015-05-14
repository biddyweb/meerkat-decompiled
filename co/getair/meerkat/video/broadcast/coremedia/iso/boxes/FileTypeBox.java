package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.annotations.DoNotParseDetail;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class FileTypeBox extends AbstractBox
{
  public static final String TYPE = "ftyp";
  private List<String> compatibleBrands = Collections.emptyList();
  private String majorBrand;
  private long minorVersion;

  public FileTypeBox()
  {
    super("ftyp");
  }

  public FileTypeBox(String paramString, long paramLong, List<String> paramList)
  {
    super("ftyp");
    this.majorBrand = paramString;
    this.minorVersion = paramLong;
    this.compatibleBrands = paramList;
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.majorBrand = IsoTypeReader.read4cc(paramByteBuffer);
    this.minorVersion = IsoTypeReader.readUInt32(paramByteBuffer);
    int i = paramByteBuffer.remaining() / 4;
    this.compatibleBrands = new LinkedList();
    for (int j = 0; j < i; j++)
      this.compatibleBrands.add(IsoTypeReader.read4cc(paramByteBuffer));
  }

  public List<String> getCompatibleBrands()
  {
    return this.compatibleBrands;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.put(IsoFile.fourCCtoBytes(this.majorBrand));
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.minorVersion);
    Iterator localIterator = this.compatibleBrands.iterator();
    while (localIterator.hasNext())
      paramByteBuffer.put(IsoFile.fourCCtoBytes((String)localIterator.next()));
  }

  protected long getContentSize()
  {
    return 8 + 4 * this.compatibleBrands.size();
  }

  public String getMajorBrand()
  {
    return this.majorBrand;
  }

  public long getMinorVersion()
  {
    return this.minorVersion;
  }

  public void setCompatibleBrands(List<String> paramList)
  {
    this.compatibleBrands = paramList;
  }

  public void setMajorBrand(String paramString)
  {
    this.majorBrand = paramString;
  }

  public void setMinorVersion(long paramLong)
  {
    this.minorVersion = paramLong;
  }

  @DoNotParseDetail
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("FileTypeBox[");
    localStringBuilder.append("majorBrand=").append(getMajorBrand());
    localStringBuilder.append(";");
    localStringBuilder.append("minorVersion=").append(getMinorVersion());
    Iterator localIterator = this.compatibleBrands.iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localStringBuilder.append(";");
      localStringBuilder.append("compatibleBrand=").append(str);
    }
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}