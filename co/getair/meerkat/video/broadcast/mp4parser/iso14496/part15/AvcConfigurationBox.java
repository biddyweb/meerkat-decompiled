package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.List;

public final class AvcConfigurationBox extends AbstractBox
{
  public static final String TYPE = "avcC";
  public AvcDecoderConfigurationRecord avcDecoderConfigurationRecord = new AvcDecoderConfigurationRecord();

  public AvcConfigurationBox()
  {
    super("avcC");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.avcDecoderConfigurationRecord = new AvcDecoderConfigurationRecord(paramByteBuffer);
  }

  public int getAvcLevelIndication()
  {
    return this.avcDecoderConfigurationRecord.avcLevelIndication;
  }

  public int getAvcProfileIndication()
  {
    return this.avcDecoderConfigurationRecord.avcProfileIndication;
  }

  public int getBitDepthChromaMinus8()
  {
    return this.avcDecoderConfigurationRecord.bitDepthChromaMinus8;
  }

  public int getBitDepthLumaMinus8()
  {
    return this.avcDecoderConfigurationRecord.bitDepthLumaMinus8;
  }

  public int getChromaFormat()
  {
    return this.avcDecoderConfigurationRecord.chromaFormat;
  }

  public int getConfigurationVersion()
  {
    return this.avcDecoderConfigurationRecord.configurationVersion;
  }

  public void getContent(ByteBuffer paramByteBuffer)
  {
    this.avcDecoderConfigurationRecord.getContent(paramByteBuffer);
  }

  public long getContentSize()
  {
    return this.avcDecoderConfigurationRecord.getContentSize();
  }

  public int getLengthSizeMinusOne()
  {
    return this.avcDecoderConfigurationRecord.lengthSizeMinusOne;
  }

  public String[] getPPS()
  {
    return this.avcDecoderConfigurationRecord.getPPS();
  }

  public List<byte[]> getPictureParameterSets()
  {
    return Collections.unmodifiableList(this.avcDecoderConfigurationRecord.pictureParameterSets);
  }

  public int getProfileCompatibility()
  {
    return this.avcDecoderConfigurationRecord.profileCompatibility;
  }

  public String[] getSPS()
  {
    return this.avcDecoderConfigurationRecord.getSPS();
  }

  public List<byte[]> getSequenceParameterSetExts()
  {
    return this.avcDecoderConfigurationRecord.sequenceParameterSetExts;
  }

  public List<byte[]> getSequenceParameterSets()
  {
    return Collections.unmodifiableList(this.avcDecoderConfigurationRecord.sequenceParameterSets);
  }

  public AvcDecoderConfigurationRecord getavcDecoderConfigurationRecord()
  {
    return this.avcDecoderConfigurationRecord;
  }

  public boolean hasExts()
  {
    return this.avcDecoderConfigurationRecord.hasExts;
  }

  public void setAvcLevelIndication(int paramInt)
  {
    this.avcDecoderConfigurationRecord.avcLevelIndication = paramInt;
  }

  public void setAvcProfileIndication(int paramInt)
  {
    this.avcDecoderConfigurationRecord.avcProfileIndication = paramInt;
  }

  public void setBitDepthChromaMinus8(int paramInt)
  {
    this.avcDecoderConfigurationRecord.bitDepthChromaMinus8 = paramInt;
  }

  public void setBitDepthLumaMinus8(int paramInt)
  {
    this.avcDecoderConfigurationRecord.bitDepthLumaMinus8 = paramInt;
  }

  public void setChromaFormat(int paramInt)
  {
    this.avcDecoderConfigurationRecord.chromaFormat = paramInt;
  }

  public void setConfigurationVersion(int paramInt)
  {
    this.avcDecoderConfigurationRecord.configurationVersion = paramInt;
  }

  public void setHasExts(boolean paramBoolean)
  {
    this.avcDecoderConfigurationRecord.hasExts = paramBoolean;
  }

  public void setLengthSizeMinusOne(int paramInt)
  {
    this.avcDecoderConfigurationRecord.lengthSizeMinusOne = paramInt;
  }

  public void setPictureParameterSets(List<byte[]> paramList)
  {
    this.avcDecoderConfigurationRecord.pictureParameterSets = paramList;
  }

  public void setProfileCompatibility(int paramInt)
  {
    this.avcDecoderConfigurationRecord.profileCompatibility = paramInt;
  }

  public void setSequenceParameterSetExts(List<byte[]> paramList)
  {
    this.avcDecoderConfigurationRecord.sequenceParameterSetExts = paramList;
  }

  public void setSequenceParameterSets(List<byte[]> paramList)
  {
    this.avcDecoderConfigurationRecord.sequenceParameterSets = paramList;
  }

  public String toString()
  {
    return "AvcConfigurationBox{avcDecoderConfigurationRecord=" + this.avcDecoderConfigurationRecord + '}';
  }
}