package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;

public class DataInformationBox extends AbstractContainerBox
{
  public static final String TYPE = "dinf";

  public DataInformationBox()
  {
    super("dinf");
  }
}