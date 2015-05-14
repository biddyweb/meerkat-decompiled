package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TimeToSampleBox.Entry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.AbstractTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.ListIterator;

public class CroppedTrack extends AbstractTrack
{
  private int fromSample;
  Track origTrack;
  private int toSample;

  static
  {
    if (!CroppedTrack.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  public CroppedTrack(Track paramTrack, long paramLong1, long paramLong2)
  {
    super("crop(" + paramTrack.getName() + ")");
    this.origTrack = paramTrack;
    assert (paramLong1 <= 2147483647L);
    assert (paramLong2 <= 2147483647L);
    this.fromSample = ((int)paramLong1);
    this.toSample = ((int)paramLong2);
  }

  static List<CompositionTimeToSample.Entry> getCompositionTimeEntries(List<CompositionTimeToSample.Entry> paramList, long paramLong1, long paramLong2)
  {
    if ((paramList != null) && (!paramList.isEmpty()))
    {
      long l1 = 0L;
      ListIterator localListIterator = paramList.listIterator();
      ArrayList localArrayList = new ArrayList();
      CompositionTimeToSample.Entry localEntry;
      while (true)
      {
        localEntry = (CompositionTimeToSample.Entry)localListIterator.next();
        if (l1 + localEntry.getCount() > paramLong1)
          break;
        l1 += localEntry.getCount();
      }
      if (l1 + localEntry.getCount() >= paramLong2)
      {
        localArrayList.add(new CompositionTimeToSample.Entry((int)(paramLong2 - paramLong1), localEntry.getOffset()));
        return localArrayList;
      }
      localArrayList.add(new CompositionTimeToSample.Entry((int)(l1 + localEntry.getCount() - paramLong1), localEntry.getOffset()));
      for (long l2 = l1 + localEntry.getCount(); localListIterator.hasNext(); l2 += localEntry.getCount())
      {
        localEntry = (CompositionTimeToSample.Entry)localListIterator.next();
        if (l2 + localEntry.getCount() >= paramLong2)
          break;
        localArrayList.add(localEntry);
      }
      localArrayList.add(new CompositionTimeToSample.Entry((int)(paramLong2 - l2), localEntry.getOffset()));
      return localArrayList;
    }
    return null;
  }

  static List<TimeToSampleBox.Entry> getDecodingTimeEntries(List<TimeToSampleBox.Entry> paramList, long paramLong1, long paramLong2)
  {
    if ((paramList != null) && (!paramList.isEmpty()))
    {
      long l1 = 0L;
      ListIterator localListIterator = paramList.listIterator();
      LinkedList localLinkedList = new LinkedList();
      TimeToSampleBox.Entry localEntry;
      while (true)
      {
        localEntry = (TimeToSampleBox.Entry)localListIterator.next();
        if (l1 + localEntry.getCount() > paramLong1)
          break;
        l1 += localEntry.getCount();
      }
      if (l1 + localEntry.getCount() >= paramLong2)
      {
        localLinkedList.add(new TimeToSampleBox.Entry(paramLong2 - paramLong1, localEntry.getDelta()));
        return localLinkedList;
      }
      localLinkedList.add(new TimeToSampleBox.Entry(l1 + localEntry.getCount() - paramLong1, localEntry.getDelta()));
      for (long l2 = l1 + localEntry.getCount(); localListIterator.hasNext(); l2 += localEntry.getCount())
      {
        localEntry = (TimeToSampleBox.Entry)localListIterator.next();
        if (l2 + localEntry.getCount() >= paramLong2)
          break;
        localLinkedList.add(localEntry);
      }
      localLinkedList.add(new TimeToSampleBox.Entry(paramLong2 - l2, localEntry.getDelta()));
      return localLinkedList;
    }
    return null;
  }

  public void close()
    throws IOException
  {
    this.origTrack.close();
  }

  public List<CompositionTimeToSample.Entry> getCompositionTimeEntries()
  {
    return getCompositionTimeEntries(this.origTrack.getCompositionTimeEntries(), this.fromSample, this.toSample);
  }

  public String getHandler()
  {
    return this.origTrack.getHandler();
  }

  public List<SampleDependencyTypeBox.Entry> getSampleDependencies()
  {
    if ((this.origTrack.getSampleDependencies() != null) && (!this.origTrack.getSampleDependencies().isEmpty()))
      return this.origTrack.getSampleDependencies().subList(this.fromSample, this.toSample);
    return null;
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return this.origTrack.getSampleDescriptionBox();
  }

  public long[] getSampleDurations()
  {
    try
    {
      long[] arrayOfLong = new long[this.toSample - this.fromSample];
      System.arraycopy(this.origTrack.getSampleDurations(), this.fromSample, arrayOfLong, 0, arrayOfLong.length);
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
    return this.origTrack.getSamples().subList(this.fromSample, this.toSample);
  }

  public SubSampleInformationBox getSubsampleInformationBox()
  {
    return this.origTrack.getSubsampleInformationBox();
  }

  public long[] getSyncSamples()
  {
    try
    {
      if (this.origTrack.getSyncSamples() != null)
      {
        long[] arrayOfLong2 = this.origTrack.getSyncSamples();
        int i = 0;
        int j = arrayOfLong2.length;
        while ((i < arrayOfLong2.length) && (arrayOfLong2[i] < this.fromSample))
          i++;
        while ((j > 0) && (this.toSample < arrayOfLong2[(j - 1)]))
          j--;
        arrayOfLong1 = Arrays.copyOfRange(this.origTrack.getSyncSamples(), i, j);
        for (int k = 0; k < arrayOfLong1.length; k++)
          arrayOfLong1[k] -= this.fromSample;
      }
      long[] arrayOfLong1 = null;
      return arrayOfLong1;
    }
    finally
    {
    }
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.origTrack.getTrackMetaData();
  }
}