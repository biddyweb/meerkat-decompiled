package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.mdat;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieExtendsBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.samples.DefaultMp4SampleList;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.samples.FragmentedMp4SampleList;
import java.util.AbstractList;
import java.util.List;

public class SampleList extends AbstractList<Sample>
{
  List<Sample> samples;

  public SampleList(TrackBox paramTrackBox, IsoFile[] paramArrayOfIsoFile)
  {
    Container localContainer = ((Box)paramTrackBox.getParent()).getParent();
    if (paramTrackBox.getParent().getBoxes(MovieExtendsBox.class).isEmpty())
    {
      if (paramArrayOfIsoFile.length > 0)
        throw new RuntimeException("The TrackBox comes from a standard MP4 file. Only use the additionalFragments param if you are dealing with ( fragmented MP4 files AND additional fragments in standalone files )");
      this.samples = new DefaultMp4SampleList(paramTrackBox.getTrackHeaderBox().getTrackId(), localContainer);
      return;
    }
    this.samples = new FragmentedMp4SampleList(paramTrackBox.getTrackHeaderBox().getTrackId(), localContainer, paramArrayOfIsoFile);
  }

  public Sample get(int paramInt)
  {
    return (Sample)this.samples.get(paramInt);
  }

  public int size()
  {
    return this.samples.size();
  }
}