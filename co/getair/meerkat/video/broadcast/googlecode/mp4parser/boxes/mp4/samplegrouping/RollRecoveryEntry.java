package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping;

import java.nio.ByteBuffer;

public class RollRecoveryEntry extends GroupEntry
{
  public static final String TYPE = "roll";
  private short rollDistance;

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    RollRecoveryEntry localRollRecoveryEntry;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localRollRecoveryEntry = (RollRecoveryEntry)paramObject;
    }
    while (this.rollDistance == localRollRecoveryEntry.rollDistance);
    return false;
  }

  public ByteBuffer get()
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(2);
    localByteBuffer.putShort(this.rollDistance);
    localByteBuffer.rewind();
    return localByteBuffer;
  }

  public short getRollDistance()
  {
    return this.rollDistance;
  }

  public String getType()
  {
    return "roll";
  }

  public int hashCode()
  {
    return this.rollDistance;
  }

  public void parse(ByteBuffer paramByteBuffer)
  {
    this.rollDistance = paramByteBuffer.getShort();
  }

  public void setRollDistance(short paramShort)
  {
    this.rollDistance = paramShort;
  }
}