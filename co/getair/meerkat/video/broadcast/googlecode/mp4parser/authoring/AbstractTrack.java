package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public abstract class AbstractTrack
  implements Track
{
  List<Edit> edits = new ArrayList();
  String name;
  Map<GroupEntry, long[]> sampleGroups = new HashMap();

  public AbstractTrack(String paramString)
  {
    this.name = paramString;
  }

  public List<CompositionTimeToSample.Entry> getCompositionTimeEntries()
  {
    return null;
  }

  public long getDuration()
  {
    long l = 0L;
    long[] arrayOfLong = getSampleDurations();
    int i = arrayOfLong.length;
    for (int j = 0; j < i; j++)
      l += arrayOfLong[j];
    return l;
  }

  public List<Edit> getEdits()
  {
    return this.edits;
  }

  public String getName()
  {
    return this.name;
  }

  public List<SampleDependencyTypeBox.Entry> getSampleDependencies()
  {
    return null;
  }

  public Map<GroupEntry, long[]> getSampleGroups()
  {
    return this.sampleGroups;
  }

  public SubSampleInformationBox getSubsampleInformationBox()
  {
    return null;
  }

  public long[] getSyncSamples()
  {
    return null;
  }
}