package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.piff;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.annotations.DoNotParseDetail;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.AbstractSampleEncryptionBox;

public class PiffSampleEncryptionBox extends AbstractSampleEncryptionBox
{
  public PiffSampleEncryptionBox()
  {
    super("uuid");
  }

  public int getAlgorithmId()
  {
    return this.algorithmId;
  }

  public int getIvSize()
  {
    return this.ivSize;
  }

  public byte[] getKid()
  {
    return this.kid;
  }

  public byte[] getUserType()
  {
    return new byte[] { -94, 57, 79, 82, 90, -101, 79, 20, -94, 68, 108, 66, 124, 100, -115, -12 };
  }

  @DoNotParseDetail
  public boolean isOverrideTrackEncryptionBoxParameters()
  {
    return (0x1 & getFlags()) > 0;
  }

  public void setAlgorithmId(int paramInt)
  {
    this.algorithmId = paramInt;
  }

  public void setIvSize(int paramInt)
  {
    this.ivSize = paramInt;
  }

  public void setKid(byte[] paramArrayOfByte)
  {
    this.kid = paramArrayOfByte;
  }

  @DoNotParseDetail
  public void setOverrideTrackEncryptionBoxParameters(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      setFlags(0x1 | getFlags());
      return;
    }
    setFlags(0xFFFFFE & getFlags());
  }
}