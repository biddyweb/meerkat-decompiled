package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping;

import java.nio.ByteBuffer;

public class TemporalLevelEntry extends GroupEntry
{
  public static final String TYPE = "tele";
  private boolean levelIndependentlyDecodable;
  private short reserved;

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    TemporalLevelEntry localTemporalLevelEntry;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localTemporalLevelEntry = (TemporalLevelEntry)paramObject;
      if (this.levelIndependentlyDecodable != localTemporalLevelEntry.levelIndependentlyDecodable)
        return false;
    }
    while (this.reserved == localTemporalLevelEntry.reserved);
    return false;
  }

  public ByteBuffer get()
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(1);
    if (this.levelIndependentlyDecodable);
    for (int i = 128; ; i = 0)
    {
      localByteBuffer.put((byte)i);
      localByteBuffer.rewind();
      return localByteBuffer;
    }
  }

  public String getType()
  {
    return "tele";
  }

  public int hashCode()
  {
    if (this.levelIndependentlyDecodable);
    for (int i = 1; ; i = 0)
      return i * 31 + this.reserved;
  }

  public boolean isLevelIndependentlyDecodable()
  {
    return this.levelIndependentlyDecodable;
  }

  public void parse(ByteBuffer paramByteBuffer)
  {
    if ((0x80 & paramByteBuffer.get()) == 128);
    for (boolean bool = true; ; bool = false)
    {
      this.levelIndependentlyDecodable = bool;
      return;
    }
  }

  public void setLevelIndependentlyDecodable(boolean paramBoolean)
  {
    this.levelIndependentlyDecodable = paramBoolean;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("TemporalLevelEntry");
    localStringBuilder.append("{levelIndependentlyDecodable=").append(this.levelIndependentlyDecodable);
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }
}