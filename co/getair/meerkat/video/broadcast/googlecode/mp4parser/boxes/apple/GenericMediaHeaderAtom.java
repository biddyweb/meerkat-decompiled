package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.apple;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;

public class GenericMediaHeaderAtom extends AbstractContainerBox
{
  public static final String TYPE = "gmhd";

  public GenericMediaHeaderAtom()
  {
    super("gmhd");
  }
}