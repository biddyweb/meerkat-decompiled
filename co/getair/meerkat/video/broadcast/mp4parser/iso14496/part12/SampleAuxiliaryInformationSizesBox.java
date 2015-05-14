package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part12;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;
import java.util.Arrays;

public class SampleAuxiliaryInformationSizesBox extends AbstractFullBox
{
  public static final String TYPE = "saiz";
  private String auxInfoType;
  private String auxInfoTypeParameter;
  private short defaultSampleInfoSize;
  private int sampleCount;
  private short[] sampleInfoSizes = new short[0];

  static
  {
    if (!SampleAuxiliaryInformationSizesBox.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  public SampleAuxiliaryInformationSizesBox()
  {
    super("saiz");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    if ((0x1 & getFlags()) == 1)
    {
      this.auxInfoType = IsoTypeReader.read4cc(paramByteBuffer);
      this.auxInfoTypeParameter = IsoTypeReader.read4cc(paramByteBuffer);
    }
    this.defaultSampleInfoSize = ((short)IsoTypeReader.readUInt8(paramByteBuffer));
    this.sampleCount = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
    if (this.defaultSampleInfoSize == 0)
    {
      this.sampleInfoSizes = new short[this.sampleCount];
      for (int i = 0; i < this.sampleCount; i++)
        this.sampleInfoSizes[i] = ((short)IsoTypeReader.readUInt8(paramByteBuffer));
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
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.defaultSampleInfoSize);
    if (this.defaultSampleInfoSize == 0)
    {
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.sampleInfoSizes.length);
      short[] arrayOfShort = this.sampleInfoSizes;
      int i = arrayOfShort.length;
      for (int j = 0; j < i; j++)
        IsoTypeWriter.writeUInt8(paramByteBuffer, arrayOfShort[j]);
    }
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.sampleCount);
  }

  protected long getContentSize()
  {
    int i = 4;
    if ((0x1 & getFlags()) == 1)
      i += 8;
    int j = i + 5;
    if (this.defaultSampleInfoSize == 0);
    for (int k = this.sampleInfoSizes.length; ; k = 0)
      return j + k;
  }

  public int getDefaultSampleInfoSize()
  {
    return this.defaultSampleInfoSize;
  }

  public int getSampleCount()
  {
    return this.sampleCount;
  }

  public short[] getSampleInfoSizes()
  {
    return Arrays.copyOf(this.sampleInfoSizes, this.sampleInfoSizes.length);
  }

  public short getSize(int paramInt)
  {
    if (getDefaultSampleInfoSize() == 0)
      return this.sampleInfoSizes[paramInt];
    return this.defaultSampleInfoSize;
  }

  public void setAuxInfoType(String paramString)
  {
    this.auxInfoType = paramString;
  }

  public void setAuxInfoTypeParameter(String paramString)
  {
    this.auxInfoTypeParameter = paramString;
  }

  public void setDefaultSampleInfoSize(int paramInt)
  {
    assert (paramInt <= 255);
    this.defaultSampleInfoSize = ((short)paramInt);
  }

  public void setSampleCount(int paramInt)
  {
    this.sampleCount = paramInt;
  }

  public void setSampleInfoSizes(short[] paramArrayOfShort)
  {
    this.sampleInfoSizes = Arrays.copyOf(paramArrayOfShort, paramArrayOfShort.length);
  }

  public String toString()
  {
    return "SampleAuxiliaryInformationSizesBox{defaultSampleInfoSize=" + this.defaultSampleInfoSize + ", sampleCount=" + this.sampleCount + ", auxInfoType='" + this.auxInfoType + '\'' + ", auxInfoTypeParameter='" + this.auxInfoTypeParameter + '\'' + '}';
  }
}