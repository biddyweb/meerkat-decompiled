package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.AbstractTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.SampleImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.adobe.ActionMessageFormat0SampleEntryBox;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

public class Amf0Track extends AbstractTrack
{
  SortedMap<Long, byte[]> rawSamples = new TreeMap()
  {
  };
  private TrackMetaData trackMetaData = new TrackMetaData();

  public Amf0Track(Map<Long, byte[]> paramMap)
  {
    super("amf0");
    this.rawSamples = new TreeMap(paramMap);
    this.trackMetaData.setCreationTime(new Date());
    this.trackMetaData.setModificationTime(new Date());
    this.trackMetaData.setTimescale(1000L);
    this.trackMetaData.setLanguage("eng");
  }

  public void close()
    throws IOException
  {
  }

  public List<CompositionTimeToSample.Entry> getCompositionTimeEntries()
  {
    return null;
  }

  public String getHandler()
  {
    return "data";
  }

  public List<SampleDependencyTypeBox.Entry> getSampleDependencies()
  {
    return null;
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    SampleDescriptionBox localSampleDescriptionBox = new SampleDescriptionBox();
    ActionMessageFormat0SampleEntryBox localActionMessageFormat0SampleEntryBox = new ActionMessageFormat0SampleEntryBox();
    localActionMessageFormat0SampleEntryBox.setDataReferenceIndex(1);
    localSampleDescriptionBox.addBox(localActionMessageFormat0SampleEntryBox);
    return localSampleDescriptionBox;
  }

  public long[] getSampleDurations()
  {
    LinkedList localLinkedList = new LinkedList(this.rawSamples.keySet());
    Collections.sort(localLinkedList);
    long[] arrayOfLong = new long[localLinkedList.size()];
    for (int i = 0; i < localLinkedList.size(); i++)
      arrayOfLong[i] = (((Long)localLinkedList.get(i)).longValue() - 0L);
    return arrayOfLong;
  }

  public List<Sample> getSamples()
  {
    LinkedList localLinkedList = new LinkedList();
    Iterator localIterator = this.rawSamples.values().iterator();
    while (localIterator.hasNext())
      localLinkedList.add(new SampleImpl(ByteBuffer.wrap((byte[])localIterator.next())));
    return localLinkedList;
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
    return this.trackMetaData;
  }
}