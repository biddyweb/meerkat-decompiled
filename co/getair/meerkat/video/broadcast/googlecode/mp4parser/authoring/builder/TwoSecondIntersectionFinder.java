package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.builder;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Movie;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class TwoSecondIntersectionFinder
  implements FragmentIntersectionFinder
{
  private int fragmentLength = 2;
  private Movie movie;

  public TwoSecondIntersectionFinder(Movie paramMovie, int paramInt)
  {
    this.movie = paramMovie;
    this.fragmentLength = paramInt;
  }

  public long[] sampleNumbers(Track paramTrack)
  {
    double d1 = 0.0D;
    Iterator localIterator = this.movie.getTracks().iterator();
    while (localIterator.hasNext())
    {
      Track localTrack = (Track)localIterator.next();
      double d2 = localTrack.getDuration() / localTrack.getTrackMetaData().getTimescale();
      if (d1 < d2)
        d1 = d2;
    }
    int i = Math.min(-1 + (int)Math.ceil(d1 / this.fragmentLength), paramTrack.getSamples().size());
    if (i < 1)
      i = 1;
    long[] arrayOfLong1 = new long[i];
    Arrays.fill(arrayOfLong1, -1L);
    arrayOfLong1[0] = 1L;
    long l1 = 0L;
    long[] arrayOfLong2 = paramTrack.getSampleDurations();
    int j = arrayOfLong2.length;
    int k = 0;
    int i4;
    for (int m = 0; ; m = i4)
    {
      long l4;
      int i3;
      if (k < j)
      {
        l4 = arrayOfLong2[k];
        i3 = 1 + (int)(l1 / paramTrack.getTrackMetaData().getTimescale() / this.fragmentLength);
        if (i3 < arrayOfLong1.length);
      }
      else
      {
        long l2 = m + 1;
        for (int n = -1 + arrayOfLong1.length; n >= 0; n--)
        {
          if (arrayOfLong1[n] == -1L)
            arrayOfLong1[n] = l2;
          l2 = arrayOfLong1[n];
        }
      }
      i4 = m + 1;
      arrayOfLong1[i3] = (m + 1);
      l1 += l4;
      k++;
    }
    long[] arrayOfLong3 = new long[0];
    int i1 = arrayOfLong1.length;
    for (int i2 = 0; i2 < i1; i2++)
    {
      long l3 = arrayOfLong1[i2];
      if ((arrayOfLong3.length == 0) || (arrayOfLong3[(-1 + arrayOfLong3.length)] != l3))
      {
        arrayOfLong3 = Arrays.copyOf(arrayOfLong3, 1 + arrayOfLong3.length);
        arrayOfLong3[(-1 + arrayOfLong3.length)] = l3;
      }
    }
    return arrayOfLong3;
  }
}