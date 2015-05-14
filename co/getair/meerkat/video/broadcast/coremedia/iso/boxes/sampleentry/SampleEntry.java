package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;

public abstract interface SampleEntry extends Box
{
  public abstract int getDataReferenceIndex();

  public abstract void setDataReferenceIndex(int paramInt);
}