package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.builder;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;

public abstract interface FragmentIntersectionFinder
{
  public abstract long[] sampleNumbers(Track paramTrack);
}