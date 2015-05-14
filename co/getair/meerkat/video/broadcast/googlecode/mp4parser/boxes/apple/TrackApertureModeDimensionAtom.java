package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;

public class TrackApertureModeDimensionAtom extends AbstractContainerBox
{
  public static final String TYPE = "tapt";

  public TrackApertureModeDimensionAtom()
  {
    super("tapt");
  }
}