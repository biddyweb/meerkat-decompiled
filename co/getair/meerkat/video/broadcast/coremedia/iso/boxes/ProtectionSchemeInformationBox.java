package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;

public class ProtectionSchemeInformationBox extends AbstractContainerBox
{
  public static final String TYPE = "sinf";

  public ProtectionSchemeInformationBox()
  {
    super("sinf");
  }
}