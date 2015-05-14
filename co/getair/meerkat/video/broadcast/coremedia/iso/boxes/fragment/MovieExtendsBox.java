package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;

public class MovieExtendsBox extends AbstractContainerBox
{
  public static final String TYPE = "mvex";

  public MovieExtendsBox()
  {
    super("mvex");
  }
}