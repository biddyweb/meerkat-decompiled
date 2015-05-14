package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.annotations.DoNotParseDetail;
import java.util.Iterator;
import java.util.List;

public class TrackFragmentBox extends AbstractContainerBox
{
  public static final String TYPE = "traf";

  public TrackFragmentBox()
  {
    super("traf");
  }

  @DoNotParseDetail
  public TrackFragmentHeaderBox getTrackFragmentHeaderBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof TrackFragmentHeaderBox))
        return (TrackFragmentHeaderBox)localBox;
    }
    return null;
  }
}