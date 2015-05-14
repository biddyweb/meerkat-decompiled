package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;

public class MovieFragmentRandomAccessBox extends AbstractContainerBox
{
  public static final String TYPE = "mfra";

  public MovieFragmentRandomAccessBox()
  {
    super("mfra");
  }
}