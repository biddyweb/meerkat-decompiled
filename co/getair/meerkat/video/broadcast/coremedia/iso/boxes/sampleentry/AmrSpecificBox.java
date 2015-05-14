package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class AmrSpecificBox extends AbstractBox
{
  public static final String TYPE = "damr";
  private int decoderVersion;
  private int framesPerSample;
  private int modeChangePeriod;
  private int modeSet;
  private String vendor;

  public AmrSpecificBox()
  {
    super("damr");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    byte[] arrayOfByte = new byte[4];
    paramByteBuffer.get(arrayOfByte);
    this.vendor = IsoFile.bytesToFourCC(arrayOfByte);
    this.decoderVersion = IsoTypeReader.readUInt8(paramByteBuffer);
    this.modeSet = IsoTypeReader.readUInt16(paramByteBuffer);
    this.modeChangePeriod = IsoTypeReader.readUInt8(paramByteBuffer);
    this.framesPerSample = IsoTypeReader.readUInt8(paramByteBuffer);
  }

  public void getContent(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.put(IsoFile.fourCCtoBytes(this.vendor));
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.decoderVersion);
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.modeSet);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.modeChangePeriod);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.framesPerSample);
  }

  protected long getContentSize()
  {
    return 9L;
  }

  public int getDecoderVersion()
  {
    return this.decoderVersion;
  }

  public int getFramesPerSample()
  {
    return this.framesPerSample;
  }

  public int getModeChangePeriod()
  {
    return this.modeChangePeriod;
  }

  public int getModeSet()
  {
    return this.modeSet;
  }

  public String getVendor()
  {
    return this.vendor;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("AmrSpecificBox[vendor=").append(getVendor());
    localStringBuilder.append(";decoderVersion=").append(getDecoderVersion());
    localStringBuilder.append(";modeSet=").append(getModeSet());
    localStringBuilder.append(";modeChangePeriod=").append(getModeChangePeriod());
    localStringBuilder.append(";framesPerSample=").append(getFramesPerSample());
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}