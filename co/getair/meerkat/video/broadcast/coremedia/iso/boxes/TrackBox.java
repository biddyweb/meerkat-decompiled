package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;
import java.util.Iterator;
import java.util.List;

public class TrackBox extends AbstractContainerBox
{
  public static final String TYPE = "trak";
  private SampleTableBox sampleTableBox;

  public TrackBox()
  {
    super("trak");
  }

  public MediaBox getMediaBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof MediaBox))
        return (MediaBox)localBox;
    }
    return null;
  }

  public SampleTableBox getSampleTableBox()
  {
    if (this.sampleTableBox != null)
      return this.sampleTableBox;
    MediaBox localMediaBox = getMediaBox();
    if (localMediaBox != null)
    {
      MediaInformationBox localMediaInformationBox = localMediaBox.getMediaInformationBox();
      if (localMediaInformationBox != null)
      {
        this.sampleTableBox = localMediaInformationBox.getSampleTableBox();
        return this.sampleTableBox;
      }
    }
    return null;
  }

  public TrackHeaderBox getTrackHeaderBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof TrackHeaderBox))
        return (TrackHeaderBox)localBox;
    }
    return null;
  }

  public void setBoxes(List<Box> paramList)
  {
    super.setBoxes(paramList);
    this.sampleTableBox = null;
  }
}