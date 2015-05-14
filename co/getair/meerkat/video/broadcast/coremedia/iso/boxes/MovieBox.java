package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;
import java.util.Iterator;
import java.util.List;

public class MovieBox extends AbstractContainerBox
{
  public static final String TYPE = "moov";

  public MovieBox()
  {
    super("moov");
  }

  public MovieHeaderBox getMovieHeaderBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof MovieHeaderBox))
        return (MovieHeaderBox)localBox;
    }
    return null;
  }

  public int getTrackCount()
  {
    return getBoxes(TrackBox.class).size();
  }

  public long[] getTrackNumbers()
  {
    List localList = getBoxes(TrackBox.class);
    long[] arrayOfLong = new long[localList.size()];
    for (int i = 0; i < localList.size(); i++)
      arrayOfLong[i] = ((TrackBox)localList.get(i)).getTrackHeaderBox().getTrackId();
    return arrayOfLong;
  }
}