package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.container.mp4;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MovieBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MovieHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SchemeTypeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackHeaderBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.FileDataSourceImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.CencMp4TrackImplImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Movie;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Mp4TrackImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Path;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class MovieCreator
{
  public static Movie build(DataSource paramDataSource)
    throws IOException
  {
    IsoFile localIsoFile = new IsoFile(paramDataSource);
    Movie localMovie = new Movie();
    Iterator localIterator = localIsoFile.getMovieBox().getBoxes(TrackBox.class).iterator();
    while (localIterator.hasNext())
    {
      TrackBox localTrackBox = (TrackBox)localIterator.next();
      SchemeTypeBox localSchemeTypeBox = (SchemeTypeBox)Path.getPath(localTrackBox, "mdia[0]/minf[0]/stbl[0]/stsd[0]/enc.[0]/sinf[0]/schm[0]");
      if ((localSchemeTypeBox != null) && ((localSchemeTypeBox.getSchemeType().equals("cenc")) || (localSchemeTypeBox.getSchemeType().equals("cbc1"))))
        localMovie.addTrack(new CencMp4TrackImplImpl(paramDataSource.toString() + "[" + localTrackBox.getTrackHeaderBox().getTrackId() + "]", localTrackBox, new IsoFile[0]));
      else
        localMovie.addTrack(new Mp4TrackImpl(paramDataSource.toString() + "[" + localTrackBox.getTrackHeaderBox().getTrackId() + "]", localTrackBox, new IsoFile[0]));
    }
    localMovie.setMatrix(localIsoFile.getMovieBox().getMovieHeaderBox().getMatrix());
    return localMovie;
  }

  public static Movie build(String paramString)
    throws IOException
  {
    return build(new FileDataSourceImpl(new File(paramString)));
  }
}