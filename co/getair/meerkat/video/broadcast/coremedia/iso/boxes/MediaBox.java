package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;
import java.util.Iterator;
import java.util.List;

public class MediaBox extends AbstractContainerBox
{
  public static final String TYPE = "mdia";

  public MediaBox()
  {
    super("mdia");
  }

  public HandlerBox getHandlerBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof HandlerBox))
        return (HandlerBox)localBox;
    }
    return null;
  }

  public MediaHeaderBox getMediaHeaderBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof MediaHeaderBox))
        return (MediaHeaderBox)localBox;
    }
    return null;
  }

  public MediaInformationBox getMediaInformationBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof MediaInformationBox))
        return (MediaInformationBox)localBox;
    }
    return null;
  }
}