package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.apple;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;

public class AppleItemListBox extends AbstractContainerBox
{
  public static final String TYPE = "ilst";

  public AppleItemListBox()
  {
    super("ilst");
  }
}