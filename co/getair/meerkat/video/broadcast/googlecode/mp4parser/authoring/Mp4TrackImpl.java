package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.EditListBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.EditListBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.HandlerBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MediaBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MediaInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MovieHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleTableBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox.SubSampleEntry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SyncSampleBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TimeToSampleBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TimeToSampleBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieExtendsBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieFragmentBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.SampleFlags;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackExtendsBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackFragmentBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackFragmentHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackRunBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackRunBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.mdat.SampleList;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.BasicContainer;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.SampleGroupDescriptionBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.SampleToGroupBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.SampleToGroupBox.Entry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Path;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Mp4TrackImpl extends AbstractTrack
{
  private List<CompositionTimeToSample.Entry> compositionTimeEntries;
  private long[] decodingTimes;
  IsoFile[] fragments;
  private String handler;
  private List<SampleDependencyTypeBox.Entry> sampleDependencies;
  private SampleDescriptionBox sampleDescriptionBox;
  private List<Sample> samples;
  private SubSampleInformationBox subSampleInformationBox = null;
  private long[] syncSamples = new long[0];
  TrackBox trackBox;
  private TrackMetaData trackMetaData = new TrackMetaData();

  public Mp4TrackImpl(String paramString, TrackBox paramTrackBox, IsoFile[] paramArrayOfIsoFile)
  {
    super(paramString);
    long l1 = paramTrackBox.getTrackHeaderBox().getTrackId();
    this.samples = new SampleList(paramTrackBox, paramArrayOfIsoFile);
    SampleTableBox localSampleTableBox = paramTrackBox.getMediaBox().getMediaInformationBox().getSampleTableBox();
    this.handler = paramTrackBox.getMediaBox().getHandlerBox().getHandlerType();
    ArrayList localArrayList1 = new ArrayList();
    this.compositionTimeEntries = new ArrayList();
    this.sampleDependencies = new ArrayList();
    localArrayList1.addAll(localSampleTableBox.getTimeToSampleBox().getEntries());
    if (localSampleTableBox.getCompositionTimeToSample() != null)
      this.compositionTimeEntries.addAll(localSampleTableBox.getCompositionTimeToSample().getEntries());
    if (localSampleTableBox.getSampleDependencyTypeBox() != null)
      this.sampleDependencies.addAll(localSampleTableBox.getSampleDependencyTypeBox().getEntries());
    if (localSampleTableBox.getSyncSampleBox() != null)
      this.syncSamples = localSampleTableBox.getSyncSampleBox().getSampleNumber();
    this.subSampleInformationBox = ((SubSampleInformationBox)Path.getPath(localSampleTableBox, "subs"));
    ArrayList localArrayList2 = new ArrayList();
    localArrayList2.addAll(((Box)paramTrackBox.getParent()).getParent().getBoxes(MovieFragmentBox.class));
    int i = paramArrayOfIsoFile.length;
    for (int j = 0; j < i; j++)
      localArrayList2.addAll(paramArrayOfIsoFile[j].getBoxes(MovieFragmentBox.class));
    this.sampleDescriptionBox = localSampleTableBox.getSampleDescriptionBox();
    List localList = paramTrackBox.getParent().getBoxes(MovieExtendsBox.class);
    if (localList.size() > 0)
    {
      Iterator localIterator2 = localList.iterator();
      label323: if (localIterator2.hasNext())
      {
        Iterator localIterator5 = ((MovieExtendsBox)localIterator2.next()).getBoxes(TrackExtendsBox.class).iterator();
        while (true)
        {
          if (!localIterator5.hasNext())
            break label323;
          TrackExtendsBox localTrackExtendsBox = (TrackExtendsBox)localIterator5.next();
          if (localTrackExtendsBox.getTrackId() != l1)
            break;
          if (Path.getPaths(((Box)paramTrackBox.getParent()).getParent(), "/moof/traf/subs").size() > 0)
            this.subSampleInformationBox = new SubSampleInformationBox();
          LinkedList localLinkedList = new LinkedList();
          long l2 = 1L;
          Iterator localIterator6 = localArrayList2.iterator();
          TrackFragmentBox localTrackFragmentBox2;
          do
          {
            Iterator localIterator8;
            while (!localIterator8.hasNext())
            {
              if (!localIterator6.hasNext())
                break;
              localIterator8 = ((MovieFragmentBox)localIterator6.next()).getBoxes(TrackFragmentBox.class).iterator();
            }
            localTrackFragmentBox2 = (TrackFragmentBox)localIterator8.next();
          }
          while (localTrackFragmentBox2.getTrackFragmentHeaderBox().getTrackId() != l1);
          SubSampleInformationBox localSubSampleInformationBox = (SubSampleInformationBox)Path.getPath(localTrackFragmentBox2, "subs");
          if (localSubSampleInformationBox != null)
          {
            long l3 = l2 - 0 - 1L;
            Iterator localIterator11 = localSubSampleInformationBox.getEntries().iterator();
            if (localIterator11.hasNext())
            {
              SubSampleInformationBox.SubSampleEntry localSubSampleEntry1 = (SubSampleInformationBox.SubSampleEntry)localIterator11.next();
              SubSampleInformationBox.SubSampleEntry localSubSampleEntry2 = new SubSampleInformationBox.SubSampleEntry();
              localSubSampleEntry2.getSubsampleEntries().addAll(localSubSampleEntry1.getSubsampleEntries());
              if (l3 != 0L)
              {
                localSubSampleEntry2.setSampleDelta(l3 + localSubSampleEntry1.getSampleDelta());
                l3 = 0L;
              }
              while (true)
              {
                this.subSampleInformationBox.getEntries().add(localSubSampleEntry2);
                break;
                localSubSampleEntry2.setSampleDelta(localSubSampleEntry1.getSampleDelta());
              }
            }
          }
          Iterator localIterator9 = localTrackFragmentBox2.getBoxes(TrackRunBox.class).iterator();
          TrackRunBox localTrackRunBox;
          TrackFragmentHeaderBox localTrackFragmentHeaderBox;
          int n;
          label716: label890: SampleFlags localSampleFlags;
          if (localIterator9.hasNext())
          {
            localTrackRunBox = (TrackRunBox)localIterator9.next();
            localTrackFragmentHeaderBox = ((TrackFragmentBox)localTrackRunBox.getParent()).getTrackFragmentHeaderBox();
            n = 1;
            Iterator localIterator10 = localTrackRunBox.getEntries().iterator();
            if (localIterator10.hasNext())
            {
              TrackRunBox.Entry localEntry1 = (TrackRunBox.Entry)localIterator10.next();
              if (!localTrackRunBox.isSampleDurationPresent())
                break label979;
              if ((localArrayList1.size() != 0) && (((TimeToSampleBox.Entry)localArrayList1.get(-1 + localArrayList1.size())).getDelta() == localEntry1.getSampleDuration()))
                break label943;
              localArrayList1.add(new TimeToSampleBox.Entry(1L, localEntry1.getSampleDuration()));
              if (localTrackRunBox.isSampleCompositionTimeOffsetPresent())
              {
                if ((this.compositionTimeEntries.size() != 0) && (((CompositionTimeToSample.Entry)this.compositionTimeEntries.get(-1 + this.compositionTimeEntries.size())).getOffset() == localEntry1.getSampleCompositionTimeOffset()))
                  break label1035;
                this.compositionTimeEntries.add(new CompositionTimeToSample.Entry(1, CastUtils.l2i(localEntry1.getSampleCompositionTimeOffset())));
              }
              if (!localTrackRunBox.isSampleFlagsPresent())
                break label1075;
              localSampleFlags = localEntry1.getSampleFlags();
            }
          }
          while (true)
          {
            if ((localSampleFlags != null) && (!localSampleFlags.isSampleIsDifferenceSample()))
              localLinkedList.add(Long.valueOf(l2));
            l2 += 1L;
            n = 0;
            break label716;
            break label666;
            break;
            TimeToSampleBox.Entry localEntry3 = (TimeToSampleBox.Entry)localArrayList1.get(-1 + localArrayList1.size());
            localEntry3.setCount(1L + localEntry3.getCount());
            break label808;
            label979: if (localTrackFragmentHeaderBox.hasDefaultSampleDuration())
            {
              localArrayList1.add(new TimeToSampleBox.Entry(1L, localTrackFragmentHeaderBox.getDefaultSampleDuration()));
              break label808;
            }
            localArrayList1.add(new TimeToSampleBox.Entry(1L, localTrackExtendsBox.getDefaultSampleDuration()));
            break label808;
            CompositionTimeToSample.Entry localEntry2 = (CompositionTimeToSample.Entry)this.compositionTimeEntries.get(-1 + this.compositionTimeEntries.size());
            localEntry2.setCount(1 + localEntry2.getCount());
            break label890;
            if ((n != 0) && (localTrackRunBox.isFirstSampleFlagsPresent()))
              localSampleFlags = localTrackRunBox.getFirstSampleFlags();
            else if (localTrackFragmentHeaderBox.hasDefaultSampleFlags())
              localSampleFlags = localTrackFragmentHeaderBox.getDefaultSampleFlags();
            else
              localSampleFlags = localTrackExtendsBox.getDefaultSampleFlags();
          }
          long[] arrayOfLong1 = this.syncSamples;
          this.syncSamples = new long[this.syncSamples.length + localLinkedList.size()];
          System.arraycopy(arrayOfLong1, 0, this.syncSamples, 0, arrayOfLong1.length);
          Iterator localIterator7 = localLinkedList.iterator();
          int m;
          for (int k = arrayOfLong1.length; localIterator7.hasNext(); k = m)
          {
            Long localLong = (Long)localIterator7.next();
            long[] arrayOfLong2 = this.syncSamples;
            m = k + 1;
            arrayOfLong2[k] = localLong.longValue();
          }
        }
      }
      label666: label808: label943: label1075: new ArrayList();
      label1035: new ArrayList();
      Iterator localIterator3 = localArrayList2.iterator();
      while (localIterator3.hasNext())
      {
        Iterator localIterator4 = ((MovieFragmentBox)localIterator3.next()).getBoxes(TrackFragmentBox.class).iterator();
        while (localIterator4.hasNext())
        {
          TrackFragmentBox localTrackFragmentBox1 = (TrackFragmentBox)localIterator4.next();
          if (localTrackFragmentBox1.getTrackFragmentHeaderBox().getTrackId() == l1)
            this.sampleGroups = getSampleGroups(Path.getPaths(localTrackFragmentBox1, "sgpd"), Path.getPaths(localTrackFragmentBox1, "sbgp"), this.sampleGroups);
        }
      }
    }
    this.sampleGroups = getSampleGroups(localSampleTableBox.getBoxes(SampleGroupDescriptionBox.class), localSampleTableBox.getBoxes(SampleToGroupBox.class), this.sampleGroups);
    this.decodingTimes = TimeToSampleBox.blowupTimeToSamples(localArrayList1);
    MediaHeaderBox localMediaHeaderBox = paramTrackBox.getMediaBox().getMediaHeaderBox();
    TrackHeaderBox localTrackHeaderBox = paramTrackBox.getTrackHeaderBox();
    this.trackMetaData.setTrackId(localTrackHeaderBox.getTrackId());
    this.trackMetaData.setCreationTime(localMediaHeaderBox.getCreationTime());
    this.trackMetaData.setLanguage(localMediaHeaderBox.getLanguage());
    this.trackMetaData.setModificationTime(localMediaHeaderBox.getModificationTime());
    this.trackMetaData.setTimescale(localMediaHeaderBox.getTimescale());
    this.trackMetaData.setHeight(localTrackHeaderBox.getHeight());
    this.trackMetaData.setWidth(localTrackHeaderBox.getWidth());
    this.trackMetaData.setLayer(localTrackHeaderBox.getLayer());
    this.trackMetaData.setMatrix(localTrackHeaderBox.getMatrix());
    EditListBox localEditListBox = (EditListBox)Path.getPath(paramTrackBox, "edts/elst");
    MovieHeaderBox localMovieHeaderBox = (MovieHeaderBox)Path.getPath(paramTrackBox, "../mvhd");
    if (localEditListBox != null)
    {
      Iterator localIterator1 = localEditListBox.getEntries().iterator();
      while (localIterator1.hasNext())
      {
        EditListBox.Entry localEntry = (EditListBox.Entry)localIterator1.next();
        this.edits.add(new Edit(localEntry.getMediaTime(), localMediaHeaderBox.getTimescale(), localEntry.getMediaRate(), localEntry.getSegmentDuration() / localMovieHeaderBox.getTimescale()));
      }
    }
  }

  private Map<GroupEntry, long[]> getSampleGroups(List<SampleGroupDescriptionBox> paramList, List<SampleToGroupBox> paramList1, Map<GroupEntry, long[]> paramMap)
  {
    Iterator localIterator1 = paramList.iterator();
    while (localIterator1.hasNext())
    {
      SampleGroupDescriptionBox localSampleGroupDescriptionBox = (SampleGroupDescriptionBox)localIterator1.next();
      int i = 0;
      Iterator localIterator2 = paramList1.iterator();
      while (localIterator2.hasNext())
      {
        SampleToGroupBox localSampleToGroupBox = (SampleToGroupBox)localIterator2.next();
        if (localSampleToGroupBox.getGroupingType().equals(((GroupEntry)localSampleGroupDescriptionBox.getGroupEntries().get(0)).getType()))
        {
          i = 1;
          int j = 0;
          Iterator localIterator3 = localSampleToGroupBox.getEntries().iterator();
          while (localIterator3.hasNext())
          {
            SampleToGroupBox.Entry localEntry = (SampleToGroupBox.Entry)localIterator3.next();
            if (localEntry.getGroupDescriptionIndex() > 0)
            {
              GroupEntry localGroupEntry = (GroupEntry)localSampleGroupDescriptionBox.getGroupEntries().get(-1 + localEntry.getGroupDescriptionIndex());
              long[] arrayOfLong1 = (long[])paramMap.get(localGroupEntry);
              if (arrayOfLong1 == null)
                arrayOfLong1 = new long[0];
              long[] arrayOfLong2 = new long[CastUtils.l2i(localEntry.getSampleCount()) + arrayOfLong1.length];
              System.arraycopy(arrayOfLong1, 0, arrayOfLong2, 0, arrayOfLong1.length);
              for (int k = 0; k < localEntry.getSampleCount(); k++)
                arrayOfLong2[(k + arrayOfLong1.length)] = (j + k);
              paramMap.put(localGroupEntry, arrayOfLong2);
            }
            j = (int)(j + localEntry.getSampleCount());
          }
        }
      }
      if (i == 0)
        throw new RuntimeException("Could not find SampleToGroupBox for " + ((GroupEntry)localSampleGroupDescriptionBox.getGroupEntries().get(0)).getType() + ".");
    }
    return paramMap;
  }

  public void close()
    throws IOException
  {
    Container localContainer = this.trackBox.getParent();
    if ((localContainer instanceof BasicContainer))
      ((BasicContainer)localContainer).close();
    IsoFile[] arrayOfIsoFile = this.fragments;
    int i = arrayOfIsoFile.length;
    for (int j = 0; j < i; j++)
      arrayOfIsoFile[j].close();
  }

  public List<CompositionTimeToSample.Entry> getCompositionTimeEntries()
  {
    return this.compositionTimeEntries;
  }

  public String getHandler()
  {
    return this.handler;
  }

  public List<SampleDependencyTypeBox.Entry> getSampleDependencies()
  {
    return this.sampleDependencies;
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return this.sampleDescriptionBox;
  }

  public long[] getSampleDurations()
  {
    try
    {
      long[] arrayOfLong = this.decodingTimes;
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
    return this.subSampleInformationBox;
  }

  public long[] getSyncSamples()
  {
    if (this.syncSamples.length == this.samples.size())
      return null;
    return this.syncSamples;
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.trackMetaData;
  }
}