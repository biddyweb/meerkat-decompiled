package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.builder;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import java.util.Map;

public class StaticFragmentIntersectionFinderImpl
  implements FragmentIntersectionFinder
{
  Map<Track, long[]> sampleNumbers;

  public StaticFragmentIntersectionFinderImpl(Map<Track, long[]> paramMap)
  {
    this.sampleNumbers = paramMap;
  }

  public long[] sampleNumbers(Track paramTrack)
  {
    return (long[])this.sampleNumbers.get(paramTrack);
  }
}