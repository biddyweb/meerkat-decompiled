package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry;
import java.nio.ByteBuffer;

public class TemporalSubLayerSampleGroup extends GroupEntry
{
  public static final String TYPE = "tsas";
  int i;

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    while ((paramObject != null) && (getClass() == paramObject.getClass()))
      return true;
    return false;
  }

  public ByteBuffer get()
  {
    return ByteBuffer.allocate(0);
  }

  public String getType()
  {
    return "tsas";
  }

  public int hashCode()
  {
    return 41;
  }

  public void parse(ByteBuffer paramByteBuffer)
  {
  }
}