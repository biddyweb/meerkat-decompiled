package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;
import java.util.List;

public class HevcConfigurationBox extends AbstractBox
{
  public static final String TYPE = "hvcC";
  private HevcDecoderConfigurationRecord hevcDecoderConfigurationRecord = new HevcDecoderConfigurationRecord();

  public HevcConfigurationBox()
  {
    super("hvcC");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.hevcDecoderConfigurationRecord.parse(paramByteBuffer);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    HevcConfigurationBox localHevcConfigurationBox;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localHevcConfigurationBox = (HevcConfigurationBox)paramObject;
      if (this.hevcDecoderConfigurationRecord == null)
        break;
    }
    while (this.hevcDecoderConfigurationRecord.equals(localHevcConfigurationBox.hevcDecoderConfigurationRecord));
    while (true)
    {
      return false;
      if (localHevcConfigurationBox.hevcDecoderConfigurationRecord == null)
        break;
    }
  }

  public List<HevcDecoderConfigurationRecord.Array> getArrays()
  {
    return this.hevcDecoderConfigurationRecord.arrays;
  }

  public int getAvgFrameRate()
  {
    return this.hevcDecoderConfigurationRecord.avgFrameRate;
  }

  public int getBitDepthChromaMinus8()
  {
    return this.hevcDecoderConfigurationRecord.bitDepthChromaMinus8;
  }

  public int getBitDepthLumaMinus8()
  {
    return this.hevcDecoderConfigurationRecord.bitDepthLumaMinus8;
  }

  public int getChromaFormat()
  {
    return this.hevcDecoderConfigurationRecord.chromaFormat;
  }

  public int getConfigurationVersion()
  {
    return this.hevcDecoderConfigurationRecord.configurationVersion;
  }

  public int getConstantFrameRate()
  {
    return this.hevcDecoderConfigurationRecord.constantFrameRate;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    this.hevcDecoderConfigurationRecord.write(paramByteBuffer);
  }

  protected long getContentSize()
  {
    return this.hevcDecoderConfigurationRecord.getSize();
  }

  public long getGeneral_constraint_indicator_flags()
  {
    return this.hevcDecoderConfigurationRecord.general_constraint_indicator_flags;
  }

  public int getGeneral_level_idc()
  {
    return this.hevcDecoderConfigurationRecord.general_level_idc;
  }

  public long getGeneral_profile_compatibility_flags()
  {
    return this.hevcDecoderConfigurationRecord.general_profile_compatibility_flags;
  }

  public int getGeneral_profile_idc()
  {
    return this.hevcDecoderConfigurationRecord.general_profile_idc;
  }

  public int getGeneral_profile_space()
  {
    return this.hevcDecoderConfigurationRecord.general_profile_space;
  }

  public HevcDecoderConfigurationRecord getHevcDecoderConfigurationRecord()
  {
    return this.hevcDecoderConfigurationRecord;
  }

  public int getLengthSizeMinusOne()
  {
    return this.hevcDecoderConfigurationRecord.lengthSizeMinusOne;
  }

  public int getMin_spatial_segmentation_idc()
  {
    return this.hevcDecoderConfigurationRecord.min_spatial_segmentation_idc;
  }

  public int getNumTemporalLayers()
  {
    return this.hevcDecoderConfigurationRecord.numTemporalLayers;
  }

  public int getParallelismType()
  {
    return this.hevcDecoderConfigurationRecord.parallelismType;
  }

  public int hashCode()
  {
    if (this.hevcDecoderConfigurationRecord != null)
      return this.hevcDecoderConfigurationRecord.hashCode();
    return 0;
  }

  public boolean isGeneral_tier_flag()
  {
    return this.hevcDecoderConfigurationRecord.general_tier_flag;
  }

  public boolean isTemporalIdNested()
  {
    return this.hevcDecoderConfigurationRecord.temporalIdNested;
  }

  public void setHevcDecoderConfigurationRecord(HevcDecoderConfigurationRecord paramHevcDecoderConfigurationRecord)
  {
    this.hevcDecoderConfigurationRecord = paramHevcDecoderConfigurationRecord;
  }
}