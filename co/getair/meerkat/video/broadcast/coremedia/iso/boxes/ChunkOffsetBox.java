package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;

public abstract class ChunkOffsetBox extends AbstractFullBox
{
  public ChunkOffsetBox(String paramString)
  {
    super(paramString);
  }

  public abstract long[] getChunkOffsets();

  public abstract void setChunkOffsets(long[] paramArrayOfLong);

  public String toString()
  {
    return getClass().getSimpleName() + "[entryCount=" + getChunkOffsets().length + "]";
  }
}