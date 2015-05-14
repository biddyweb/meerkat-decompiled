package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.builder;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Movie;

public abstract interface Mp4Builder
{
  public abstract Container build(Movie paramMovie);
}