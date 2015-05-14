package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part12;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;

public class SampleAuxiliaryInformationOffsetsBox extends AbstractFullBox
{
  public static final String TYPE = "saio";
  private String auxInfoType;
  private String auxInfoTypeParameter;
  private long[] offsets = new long[0];

  public SampleAuxiliaryInformationOffsetsBox()
  {
    super("saio");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    if ((0x1 & getFlags()) == 1)
    {
      this.auxInfoType = IsoTypeReader.read4cc(paramByteBuffer);
      this.auxInfoTypeParameter = IsoTypeReader.read4cc(paramByteBuffer);
    }
    int i = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
    this.offsets = new long[i];
    int j = 0;
    if (j < i)
    {
      if (getVersion() == 0)
        this.offsets[j] = IsoTypeReader.readUInt32(paramByteBuffer);
      while (true)
      {
        j++;
        break;
        this.offsets[j] = IsoTypeReader.readUInt64(paramByteBuffer);
      }
    }
  }

  public String getAuxInfoType()
  {
    return this.auxInfoType;
  }

  public String getAuxInfoTypeParameter()
  {
    return this.auxInfoTypeParameter;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    if ((0x1 & getFlags()) == 1)
    {
      paramByteBuffer.put(IsoFile.fourCCtoBytes(this.auxInfoType));
      paramByteBuffer.put(IsoFile.fourCCtoBytes(this.auxInfoTypeParameter));
    }
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.offsets.length);
    long[] arrayOfLong = this.offsets;
    int i = arrayOfLong.length;
    int j = 0;
    if (j < i)
    {
      Long localLong = Long.valueOf(arrayOfLong[j]);
      if (getVersion() == 0)
        IsoTypeWriter.writeUInt32(paramByteBuffer, localLong.longValue());
      while (true)
      {
        j++;
        break;
        IsoTypeWriter.writeUInt64(paramByteBuffer, localLong.longValue());
      }
    }
  }

  protected long getContentSize()
  {
    int i;
    int j;
    if (getVersion() == 0)
    {
      i = 4 * this.offsets.length;
      j = i + 8;
      if ((0x1 & getFlags()) != 1)
        break label50;
    }
    label50: for (int k = 8; ; k = 0)
    {
      return k + j;
      i = 8 * this.offsets.length;
      break;
    }
  }

  public long[] getOffsets()
  {
    return this.offsets;
  }

  public void setAuxInfoType(String paramString)
  {
    this.auxInfoType = paramString;
  }

  public void setAuxInfoTypeParameter(String paramString)
  {
    this.auxInfoTypeParameter = paramString;
  }

  public void setOffsets(long[] paramArrayOfLong)
  {
    this.offsets = paramArrayOfLong;
  }
}