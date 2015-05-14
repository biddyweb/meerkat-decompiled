package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.basemediaformat;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.AvcConfigurationBox;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.AvcDecoderConfigurationRecord;
import java.nio.ByteBuffer;
import java.util.List;

public class AvcNalUnitStorageBox extends AbstractBox
{
  public static final String TYPE = "avcn";
  AvcDecoderConfigurationRecord avcDecoderConfigurationRecord;

  public AvcNalUnitStorageBox()
  {
    super("avcn");
  }

  public AvcNalUnitStorageBox(AvcConfigurationBox paramAvcConfigurationBox)
  {
    super("avcn");
    this.avcDecoderConfigurationRecord = paramAvcConfigurationBox.getavcDecoderConfigurationRecord();
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.avcDecoderConfigurationRecord = new AvcDecoderConfigurationRecord(paramByteBuffer);
  }

  public AvcDecoderConfigurationRecord getAvcDecoderConfigurationRecord()
  {
    return this.avcDecoderConfigurationRecord;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    this.avcDecoderConfigurationRecord.getContent(paramByteBuffer);
  }

  protected long getContentSize()
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

  public List<String> getPictureParameterSetsAsStrings()
  {
    return this.avcDecoderConfigurationRecord.getPictureParameterSetsAsStrings();
  }

  public String[] getSPS()
  {
    return this.avcDecoderConfigurationRecord.getSPS();
  }

  public List<String> getSequenceParameterSetExtsAsStrings()
  {
    return this.avcDecoderConfigurationRecord.getSequenceParameterSetExtsAsStrings();
  }

  public List<String> getSequenceParameterSetsAsStrings()
  {
    return this.avcDecoderConfigurationRecord.getSequenceParameterSetsAsStrings();
  }

  public String toString()
  {
    return "AvcNalUnitStorageBox{SPS=" + this.avcDecoderConfigurationRecord.getSequenceParameterSetsAsStrings() + ",PPS=" + this.avcDecoderConfigurationRecord.getPictureParameterSetsAsStrings() + ",lengthSize=" + (1 + this.avcDecoderConfigurationRecord.lengthSizeMinusOne) + '}';
  }
}