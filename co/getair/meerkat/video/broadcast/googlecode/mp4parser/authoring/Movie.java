package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Matrix;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class Movie
{
  Matrix matrix = Matrix.ROTATE_0;
  List<Track> tracks = new LinkedList();

  public Movie()
  {
  }

  public Movie(List<Track> paramList)
  {
    this.tracks = paramList;
  }

  public static long gcd(long paramLong1, long paramLong2)
  {
    if (paramLong2 == 0L)
      return paramLong1;
    return gcd(paramLong2, paramLong1 % paramLong2);
  }

  public void addTrack(Track paramTrack)
  {
    if (getTrackByTrackId(paramTrack.getTrackMetaData().getTrackId()) != null)
      paramTrack.getTrackMetaData().setTrackId(getNextTrackId());
    this.tracks.add(paramTrack);
  }

  public Matrix getMatrix()
  {
    return this.matrix;
  }

  public long getNextTrackId()
  {
    long l = 0L;
    Iterator localIterator = this.tracks.iterator();
    while (localIterator.hasNext())
    {
      Track localTrack = (Track)localIterator.next();
      if (l < localTrack.getTrackMetaData().getTrackId())
        l = localTrack.getTrackMetaData().getTrackId();
    }
    return l + 1L;
  }

  public long getTimescale()
  {
    long l = ((Track)getTracks().iterator().next()).getTrackMetaData().getTimescale();
    Iterator localIterator = getTracks().iterator();
    while (localIterator.hasNext())
      l = gcd(((Track)localIterator.next()).getTrackMetaData().getTimescale(), l);
    return l;
  }

  public Track getTrackByTrackId(long paramLong)
  {
    Iterator localIterator = this.tracks.iterator();
    while (localIterator.hasNext())
    {
      Track localTrack = (Track)localIterator.next();
      if (localTrack.getTrackMetaData().getTrackId() == paramLong)
        return localTrack;
    }
    return null;
  }

  public List<Track> getTracks()
  {
    return this.tracks;
  }

  public void setMatrix(Matrix paramMatrix)
  {
    this.matrix = paramMatrix;
  }

  public void setTracks(List<Track> paramList)
  {
    this.tracks = paramList;
  }

  public String toString()
  {
    String str = "Movie{ ";
    Iterator localIterator = this.tracks.iterator();
    while (localIterator.hasNext())
    {
      Track localTrack = (Track)localIterator.next();
      str = str + "track_" + localTrack.getTrackMetaData().getTrackId() + " (" + localTrack.getHandler() + ") ";
    }
    return str + '}';
  }
}