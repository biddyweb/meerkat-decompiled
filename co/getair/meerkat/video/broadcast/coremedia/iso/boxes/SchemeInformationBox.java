package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;

public class SchemeInformationBox extends AbstractContainerBox
{
  public static final String TYPE = "schi";

  public SchemeInformationBox()
  {
    super("schi");
  }
}