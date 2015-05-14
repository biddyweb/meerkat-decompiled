package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry;
import java.io.Closeable;
import java.util.List;
import java.util.Map;

public abstract interface Track extends Closeable
{
  public abstract List<CompositionTimeToSample.Entry> getCompositionTimeEntries();

  public abstract long getDuration();

  public abstract List<Edit> getEdits();

  public abstract String getHandler();

  public abstract String getName();

  public abstract List<SampleDependencyTypeBox.Entry> getSampleDependencies();

  public abstract SampleDescriptionBox getSampleDescriptionBox();

  public abstract long[] getSampleDurations();

  public abstract Map<GroupEntry, long[]> getSampleGroups();

  public abstract List<Sample> getSamples();

  public abstract SubSampleInformationBox getSubsampleInformationBox();

  public abstract long[] getSyncSamples();

  public abstract TrackMetaData getTrackMetaData();
}