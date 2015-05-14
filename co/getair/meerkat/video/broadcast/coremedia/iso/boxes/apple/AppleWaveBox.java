package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.apple;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;

public final class AppleWaveBox extends AbstractContainerBox
{
  public static final String TYPE = "wave";

  public AppleWaveBox()
  {
    super("wave");
  }
}