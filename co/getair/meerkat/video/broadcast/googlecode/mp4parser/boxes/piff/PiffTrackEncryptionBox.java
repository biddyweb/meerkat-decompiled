package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.piff;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.AbstractTrackEncryptionBox;

public class PiffTrackEncryptionBox extends AbstractTrackEncryptionBox
{
  public PiffTrackEncryptionBox()
  {
    super("uuid");
  }

  public int getFlags()
  {
    return 0;
  }

  public byte[] getUserType()
  {
    return new byte[] { -119, 116, -37, -50, 123, -25, 76, 81, -124, -7, 113, 72, -7, -120, 37, 84 };
  }
}