package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MovieFragmentBox extends AbstractContainerBox
{
  public static final String TYPE = "moof";

  public MovieFragmentBox()
  {
    super("moof");
  }

  public DataSource getFileChannel()
  {
    return this.dataSource;
  }

  public List<Long> getSyncSamples(SampleDependencyTypeBox paramSampleDependencyTypeBox)
  {
    ArrayList localArrayList = new ArrayList();
    List localList = paramSampleDependencyTypeBox.getEntries();
    long l = 1L;
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
    {
      if (((SampleDependencyTypeBox.Entry)localIterator.next()).getSampleDependsOn() == 2)
        localArrayList.add(Long.valueOf(l));
      l += 1L;
    }
    return localArrayList;
  }

  public int getTrackCount()
  {
    return getBoxes(TrackFragmentBox.class, false).size();
  }

  public List<TrackFragmentHeaderBox> getTrackFragmentHeaderBoxes()
  {
    return getBoxes(TrackFragmentHeaderBox.class, true);
  }

  public long[] getTrackNumbers()
  {
    List localList = getBoxes(TrackFragmentBox.class, false);
    long[] arrayOfLong = new long[localList.size()];
    for (int i = 0; i < localList.size(); i++)
      arrayOfLong[i] = ((TrackFragmentBox)localList.get(i)).getTrackFragmentHeaderBox().getTrackId();
    return arrayOfLong;
  }

  public List<TrackRunBox> getTrackRunBoxes()
  {
    return getBoxes(TrackRunBox.class, true);
  }
}