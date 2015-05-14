package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.builder;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.OriginalFormatBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AbstractSampleEntry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AudioSampleEntry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.SampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Movie;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Path;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Logger;

public class SyncSampleIntersectFinderImpl
  implements FragmentIntersectionFinder
{
  private static Logger LOG = Logger.getLogger(SyncSampleIntersectFinderImpl.class.getName());
  private final int minFragmentDurationSeconds;
  private Movie movie;
  private Track referenceTrack;

  public SyncSampleIntersectFinderImpl(Movie paramMovie, Track paramTrack, int paramInt)
  {
    this.movie = paramMovie;
    this.referenceTrack = paramTrack;
    this.minFragmentDurationSeconds = paramInt;
  }

  private static long calculateTracktimesScalingFactor(Movie paramMovie, Track paramTrack)
  {
    long l = 1L;
    Iterator localIterator = paramMovie.getTracks().iterator();
    while (localIterator.hasNext())
    {
      Track localTrack = (Track)localIterator.next();
      if ((localTrack.getHandler().equals(paramTrack.getHandler())) && (localTrack.getTrackMetaData().getTimescale() != paramTrack.getTrackMetaData().getTimescale()))
        l = co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Math.lcm(l, localTrack.getTrackMetaData().getTimescale());
    }
    return l;
  }

  static String getFormat(Track paramTrack)
  {
    AbstractSampleEntry localAbstractSampleEntry = paramTrack.getSampleDescriptionBox().getSampleEntry();
    String str = localAbstractSampleEntry.getType();
    if ((str.equals("encv")) || (str.equals("enca")) || (str.equals("encv")))
      str = ((OriginalFormatBox)Path.getPath(localAbstractSampleEntry, "sinf/frma")).getDataFormat();
    return str;
  }

  public static List<long[]> getSyncSamplesTimestamps(Movie paramMovie, Track paramTrack)
  {
    LinkedList localLinkedList = new LinkedList();
    Iterator localIterator = paramMovie.getTracks().iterator();
    while (localIterator.hasNext())
    {
      Track localTrack = (Track)localIterator.next();
      if (localTrack.getHandler().equals(paramTrack.getHandler()))
      {
        long[] arrayOfLong = localTrack.getSyncSamples();
        if ((arrayOfLong != null) && (arrayOfLong.length > 0))
          localLinkedList.add(getTimes(localTrack, paramMovie));
      }
    }
    return localLinkedList;
  }

  private static long[] getTimes(Track paramTrack, Movie paramMovie)
  {
    long[] arrayOfLong1 = paramTrack.getSyncSamples();
    long[] arrayOfLong2 = new long[arrayOfLong1.length];
    int i = 1;
    long l1 = 0L;
    int j = 0;
    long l2 = calculateTracktimesScalingFactor(paramMovie, paramTrack);
    while (i <= arrayOfLong1[(-1 + arrayOfLong1.length)])
    {
      if (i == arrayOfLong1[j])
      {
        int m = j + 1;
        arrayOfLong2[j] = (l1 * l2);
        j = m;
      }
      long[] arrayOfLong3 = paramTrack.getSampleDurations();
      int k = i + 1;
      l1 += arrayOfLong3[(i - 1)];
      i = k;
    }
    return arrayOfLong2;
  }

  public long[] getCommonIndices(long[] paramArrayOfLong1, long[] paramArrayOfLong2, long paramLong, long[][] paramArrayOfLong)
  {
    LinkedList localLinkedList1 = new LinkedList();
    LinkedList localLinkedList2 = new LinkedList();
    for (int i = 0; i < paramArrayOfLong2.length; i++)
    {
      int n = 1;
      int i1 = paramArrayOfLong.length;
      int i2 = 0;
      if (i2 < i1)
      {
        if (Arrays.binarySearch(paramArrayOfLong[i2], paramArrayOfLong2[i]) >= 0);
        for (int i3 = 1; ; i3 = 0)
        {
          n &= i3;
          i2++;
          break;
        }
      }
      if (n != 0)
      {
        localLinkedList1.add(Long.valueOf(paramArrayOfLong1[i]));
        localLinkedList2.add(Long.valueOf(paramArrayOfLong2[i]));
      }
    }
    if (localLinkedList1.size() < 0.25D * paramArrayOfLong1.length)
    {
      StringBuilder localStringBuilder1 = new StringBuilder().append("");
      Object[] arrayOfObject1 = new Object[1];
      arrayOfObject1[0] = Integer.valueOf(localLinkedList1.size());
      String str1 = String.format("%5d - Common:  [", arrayOfObject1);
      Iterator localIterator3 = localLinkedList1.iterator();
      while (localIterator3.hasNext())
      {
        long l5 = ((Long)localIterator3.next()).longValue();
        StringBuilder localStringBuilder4 = new StringBuilder().append(str1);
        Object[] arrayOfObject4 = new Object[1];
        arrayOfObject4[0] = Long.valueOf(l5);
        str1 = String.format("%10d,", arrayOfObject4);
      }
      String str2 = str1 + "]";
      LOG.warning(str2);
      StringBuilder localStringBuilder2 = new StringBuilder().append("");
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = Integer.valueOf(paramArrayOfLong1.length);
      String str3 = String.format("%5d - In    :  [", arrayOfObject2);
      int k = paramArrayOfLong1.length;
      for (int m = 0; m < k; m++)
      {
        long l4 = paramArrayOfLong1[m];
        StringBuilder localStringBuilder3 = new StringBuilder().append(str3);
        Object[] arrayOfObject3 = new Object[1];
        arrayOfObject3[0] = Long.valueOf(l4);
        str3 = String.format("%10d,", arrayOfObject3);
      }
      String str4 = str3 + "]";
      LOG.warning(str4);
      LOG.warning("There are less than 25% of common sync samples in the given track.");
      throw new RuntimeException("There are less than 25% of common sync samples in the given track.");
    }
    if (localLinkedList1.size() < 0.5D * paramArrayOfLong1.length)
      LOG.fine("There are less than 50% of common sync samples in the given track. This is implausible but I'm ok to continue.");
    while (true)
    {
      localLinkedList3 = new LinkedList();
      if (this.minFragmentDurationSeconds <= 0)
        break;
      long l1 = -1L;
      Iterator localIterator1 = localLinkedList1.iterator();
      Iterator localIterator2 = localLinkedList2.iterator();
      while ((localIterator1.hasNext()) && (localIterator2.hasNext()))
      {
        long l2 = ((Long)localIterator1.next()).longValue();
        long l3 = ((Long)localIterator2.next()).longValue();
        if ((l1 == -1L) || ((l3 - l1) / paramLong >= this.minFragmentDurationSeconds))
        {
          localLinkedList3.add(Long.valueOf(l2));
          l1 = l3;
        }
      }
      if (localLinkedList1.size() < paramArrayOfLong1.length)
        LOG.finest("Common SyncSample positions vs. this tracks SyncSample positions: " + localLinkedList1.size() + " vs. " + paramArrayOfLong1.length);
    }
    LinkedList localLinkedList3 = localLinkedList1;
    long[] arrayOfLong = new long[localLinkedList3.size()];
    for (int j = 0; j < arrayOfLong.length; j++)
      arrayOfLong[j] = ((Long)localLinkedList3.get(j)).longValue();
    return arrayOfLong;
  }

  public long[] sampleNumbers(Track paramTrack)
  {
    long[] arrayOfLong2;
    if ("vide".equals(paramTrack.getHandler()))
      if ((paramTrack.getSyncSamples() != null) && (paramTrack.getSyncSamples().length > 0))
      {
        List localList = getSyncSamplesTimestamps(this.movie, paramTrack);
        arrayOfLong2 = getCommonIndices(paramTrack.getSyncSamples(), getTimes(paramTrack, this.movie), paramTrack.getTrackMetaData().getTimescale(), (long[][])localList.toArray(new long[localList.size()][]));
      }
    while (true)
    {
      return arrayOfLong2;
      throw new RuntimeException("Video Tracks need sync samples. Only tracks other than video may have no sync samples.");
      if ("soun".equals(paramTrack.getHandler()))
      {
        if (this.referenceTrack == null)
        {
          Iterator localIterator3 = this.movie.getTracks().iterator();
          while (localIterator3.hasNext())
          {
            Track localTrack3 = (Track)localIterator3.next();
            if ((localTrack3.getSyncSamples() != null) && ("vide".equals(localTrack3.getHandler())) && (localTrack3.getSyncSamples().length > 0))
              this.referenceTrack = localTrack3;
          }
        }
        if (this.referenceTrack != null)
        {
          long[] arrayOfLong3 = sampleNumbers(this.referenceTrack);
          int k = this.referenceTrack.getSamples().size();
          arrayOfLong2 = new long[arrayOfLong3.length];
          long l1 = 192000L;
          Iterator localIterator2 = this.movie.getTracks().iterator();
          while (localIterator2.hasNext())
          {
            Track localTrack2 = (Track)localIterator2.next();
            if (getFormat(paramTrack).equals(getFormat(localTrack2)))
            {
              AudioSampleEntry localAudioSampleEntry2 = (AudioSampleEntry)localTrack2.getSampleDescriptionBox().getSampleEntry();
              if (localAudioSampleEntry2.getSampleRate() < l1)
              {
                l1 = localAudioSampleEntry2.getSampleRate();
                double d3 = localTrack2.getSamples().size() / k;
                long l3 = localTrack2.getSampleDurations()[0];
                for (int n = 0; n < arrayOfLong2.length; n++)
                  arrayOfLong2[n] = (()java.lang.Math.ceil(d3 * (arrayOfLong3[n] - 1L) * l3));
              }
            }
          }
          AudioSampleEntry localAudioSampleEntry1 = (AudioSampleEntry)paramTrack.getSampleDescriptionBox().getSampleEntry();
          long l2 = paramTrack.getSampleDurations()[0];
          double d2 = localAudioSampleEntry1.getSampleRate() / l1;
          if (d2 != java.lang.Math.rint(d2))
            throw new RuntimeException("Sample rates must be a multiple of the lowest sample rate to create a correct file!");
          for (int m = 0; m < arrayOfLong2.length; m++)
            arrayOfLong2[m] = (()(1.0D + d2 * arrayOfLong2[m] / l2));
        }
        else
        {
          throw new RuntimeException("There was absolutely no Track with sync samples. I can't work with that!");
        }
      }
      else
      {
        Iterator localIterator1 = this.movie.getTracks().iterator();
        Track localTrack1;
        do
        {
          if (!localIterator1.hasNext())
            break;
          localTrack1 = (Track)localIterator1.next();
        }
        while ((localTrack1.getSyncSamples() == null) || (localTrack1.getSyncSamples().length <= 0));
        long[] arrayOfLong1 = sampleNumbers(localTrack1);
        int i = localTrack1.getSamples().size();
        arrayOfLong2 = new long[arrayOfLong1.length];
        double d1 = paramTrack.getSamples().size() / i;
        for (int j = 0; j < arrayOfLong2.length; j++)
          arrayOfLong2[j] = (1L + ()java.lang.Math.ceil(d1 * (arrayOfLong1[j] - 1L)));
      }
    }
    throw new RuntimeException("There was absolutely no Track with sync samples. I can't work with that!");
  }
}