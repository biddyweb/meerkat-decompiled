package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping;

import java.nio.ByteBuffer;

public class VisualRandomAccessEntry extends GroupEntry
{
  public static final String TYPE = "rap ";
  private short numLeadingSamples;
  private boolean numLeadingSamplesKnown;

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    VisualRandomAccessEntry localVisualRandomAccessEntry;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localVisualRandomAccessEntry = (VisualRandomAccessEntry)paramObject;
      if (this.numLeadingSamples != localVisualRandomAccessEntry.numLeadingSamples)
        return false;
    }
    while (this.numLeadingSamplesKnown == localVisualRandomAccessEntry.numLeadingSamplesKnown);
    return false;
  }

  public ByteBuffer get()
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(1);
    if (this.numLeadingSamplesKnown);
    for (int i = 128; ; i = 0)
    {
      localByteBuffer.put((byte)(i | 0x7F & this.numLeadingSamples));
      localByteBuffer.rewind();
      return localByteBuffer;
    }
  }

  public short getNumLeadingSamples()
  {
    return this.numLeadingSamples;
  }

  public String getType()
  {
    return "rap ";
  }

  public int hashCode()
  {
    if (this.numLeadingSamplesKnown);
    for (int i = 1; ; i = 0)
      return i * 31 + this.numLeadingSamples;
  }

  public boolean isNumLeadingSamplesKnown()
  {
    return this.numLeadingSamplesKnown;
  }

  public void parse(ByteBuffer paramByteBuffer)
  {
    int i = paramByteBuffer.get();
    if ((i & 0x80) == 128);
    for (boolean bool = true; ; bool = false)
    {
      this.numLeadingSamplesKnown = bool;
      this.numLeadingSamples = ((short)(i & 0x7F));
      return;
    }
  }

  public void setNumLeadingSamples(short paramShort)
  {
    this.numLeadingSamples = paramShort;
  }

  public void setNumLeadingSamplesKnown(boolean paramBoolean)
  {
    this.numLeadingSamplesKnown = paramBoolean;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("VisualRandomAccessEntry");
    localStringBuilder.append("{numLeadingSamplesKnown=").append(this.numLeadingSamplesKnown);
    localStringBuilder.append(", numLeadingSamples=").append(this.numLeadingSamples);
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }
}