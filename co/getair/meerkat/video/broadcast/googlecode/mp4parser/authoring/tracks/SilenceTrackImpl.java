package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AbstractSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Edit;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.SampleImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class SilenceTrackImpl
  implements Track
{
  long[] decodingTimes;
  String name;
  List<Sample> samples = new LinkedList();
  Track source;

  public SilenceTrackImpl(Track paramTrack, long paramLong)
  {
    this.source = paramTrack;
    this.name = ("" + paramLong + "ms silence");
    if ("mp4a".equals(paramTrack.getSampleDescriptionBox().getSampleEntry().getType()))
    {
      int i = CastUtils.l2i(paramLong * getTrackMetaData().getTimescale() / 1000L / 1024L);
      this.decodingTimes = new long[i];
      Arrays.fill(this.decodingTimes, paramLong * getTrackMetaData().getTimescale() / i / 1000L);
      int k;
      for (int j = i; ; j = k)
      {
        k = j - 1;
        if (j <= 0)
          break;
        this.samples.add(new SampleImpl((ByteBuffer)ByteBuffer.wrap(new byte[] { 33, 16, 4, 96, -116, 28 }).rewind()));
      }
    }
    throw new RuntimeException("Tracks of type " + paramTrack.getClass().getSimpleName() + " are not supported");
  }

  public void close()
    throws IOException
  {
  }

  public List<CompositionTimeToSample.Entry> getCompositionTimeEntries()
  {
    return null;
  }

  public long getDuration()
  {
    long l = 0L;
    long[] arrayOfLong = this.decodingTimes;
    int i = arrayOfLong.length;
    for (int j = 0; j < i; j++)
      l += arrayOfLong[j];
    return l;
  }

  public List<Edit> getEdits()
  {
    return null;
  }

  public String getHandler()
  {
    return this.source.getHandler();
  }

  public String getName()
  {
    return this.name;
  }

  public List<SampleDependencyTypeBox.Entry> getSampleDependencies()
  {
    return null;
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return this.source.getSampleDescriptionBox();
  }

  public long[] getSampleDurations()
  {
    return this.decodingTimes;
  }

  public Map<GroupEntry, long[]> getSampleGroups()
  {
    return this.source.getSampleGroups();
  }

  public List<Sample> getSamples()
  {
    return this.samples;
  }

  public SubSampleInformationBox getSubsampleInformationBox()
  {
    return null;
  }

  public long[] getSyncSamples()
  {
    return null;
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.source.getTrackMetaData();
  }
}