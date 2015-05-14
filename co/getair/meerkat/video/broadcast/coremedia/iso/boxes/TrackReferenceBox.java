package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;

public class TrackReferenceBox extends AbstractContainerBox
{
  public static final String TYPE = "tref";

  public TrackReferenceBox()
  {
    super("tref");
  }
}