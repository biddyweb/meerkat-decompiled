package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;

public class EditBox extends AbstractContainerBox
{
  public static final String TYPE = "edts";

  public EditBox()
  {
    super("edts");
  }
}