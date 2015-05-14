package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping;

import co.getair.meerkat.video.broadcast.coremedia.iso.Hex;
import java.nio.ByteBuffer;

public class UnknownEntry extends GroupEntry
{
  private ByteBuffer content;
  private String type;

  public UnknownEntry(String paramString)
  {
    this.type = paramString;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    UnknownEntry localUnknownEntry;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localUnknownEntry = (UnknownEntry)paramObject;
      if (this.content == null)
        break;
    }
    while (this.content.equals(localUnknownEntry.content));
    while (true)
    {
      return false;
      if (localUnknownEntry.content == null)
        break;
    }
  }

  public ByteBuffer get()
  {
    return this.content.duplicate();
  }

  public ByteBuffer getContent()
  {
    return this.content;
  }

  public String getType()
  {
    return this.type;
  }

  public int hashCode()
  {
    if (this.content != null)
      return this.content.hashCode();
    return 0;
  }

  public void parse(ByteBuffer paramByteBuffer)
  {
    this.content = ((ByteBuffer)paramByteBuffer.duplicate().rewind());
  }

  public void setContent(ByteBuffer paramByteBuffer)
  {
    this.content = ((ByteBuffer)paramByteBuffer.duplicate().rewind());
  }

  public String toString()
  {
    ByteBuffer localByteBuffer = this.content.duplicate();
    localByteBuffer.rewind();
    byte[] arrayOfByte = new byte[localByteBuffer.limit()];
    localByteBuffer.get(arrayOfByte);
    return "UnknownEntry{content=" + Hex.encodeHex(arrayOfByte) + '}';
  }
}