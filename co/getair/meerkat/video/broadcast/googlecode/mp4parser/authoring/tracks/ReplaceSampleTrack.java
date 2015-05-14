package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.AbstractTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.SampleImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.AbstractList;
import java.util.List;

public class ReplaceSampleTrack extends AbstractTrack
{
  Track origTrack;
  private Sample sampleContent;
  private long sampleNumber;
  private List<Sample> samples;

  public ReplaceSampleTrack(Track paramTrack, long paramLong, ByteBuffer paramByteBuffer)
  {
    super("replace(" + paramTrack.getName() + ")");
    this.origTrack = paramTrack;
    this.sampleNumber = paramLong;
    this.sampleContent = new SampleImpl(paramByteBuffer);
    this.samples = new ReplaceASingleEntryList(null);
  }

  public void close()
    throws IOException
  {
    this.origTrack.close();
  }

  public List<CompositionTimeToSample.Entry> getCompositionTimeEntries()
  {
    return this.origTrack.getCompositionTimeEntries();
  }

  public String getHandler()
  {
    return this.origTrack.getHandler();
  }

  public List<SampleDependencyTypeBox.Entry> getSampleDependencies()
  {
    return this.origTrack.getSampleDependencies();
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return this.origTrack.getSampleDescriptionBox();
  }

  public long[] getSampleDurations()
  {
    try
    {
      long[] arrayOfLong = this.origTrack.getSampleDurations();
      return arrayOfLong;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public List<Sample> getSamples()
  {
    return this.samples;
  }

  public SubSampleInformationBox getSubsampleInformationBox()
  {
    return this.origTrack.getSubsampleInformationBox();
  }

  public long[] getSyncSamples()
  {
    try
    {
      long[] arrayOfLong = this.origTrack.getSyncSamples();
      return arrayOfLong;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.origTrack.getTrackMetaData();
  }

  private class ReplaceASingleEntryList extends AbstractList<Sample>
  {
    private ReplaceASingleEntryList()
    {
    }

    public Sample get(int paramInt)
    {
      if (ReplaceSampleTrack.this.sampleNumber == paramInt)
        return ReplaceSampleTrack.this.sampleContent;
      return (Sample)ReplaceSampleTrack.this.origTrack.getSamples().get(paramInt);
    }

    public int size()
    {
      return ReplaceSampleTrack.this.origTrack.getSamples().size();
    }
  }
}