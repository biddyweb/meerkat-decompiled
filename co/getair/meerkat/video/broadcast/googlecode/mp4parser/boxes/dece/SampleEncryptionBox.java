package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.dece;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.AbstractSampleEncryptionBox;

public class SampleEncryptionBox extends AbstractSampleEncryptionBox
{
  public static final String TYPE = "senc";

  public SampleEncryptionBox()
  {
    super("senc");
  }
}