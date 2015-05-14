package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;
import java.util.Iterator;
import java.util.List;

public class MediaInformationBox extends AbstractContainerBox
{
  public static final String TYPE = "minf";

  public MediaInformationBox()
  {
    super("minf");
  }

  public AbstractMediaHeaderBox getMediaHeaderBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof AbstractMediaHeaderBox))
        return (AbstractMediaHeaderBox)localBox;
    }
    return null;
  }

  public SampleTableBox getSampleTableBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof SampleTableBox))
        return (SampleTableBox)localBox;
    }
    return null;
  }
}