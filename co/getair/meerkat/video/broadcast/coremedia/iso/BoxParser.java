package co.getair.meerkat.video.broadcast.coremedia.iso;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import java.io.IOException;

public abstract interface BoxParser
{
  public abstract Box parseBox(DataSource paramDataSource, Container paramContainer)
    throws IOException;
}