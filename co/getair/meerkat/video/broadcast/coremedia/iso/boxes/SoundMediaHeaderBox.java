package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import java.nio.ByteBuffer;

public class SoundMediaHeaderBox extends AbstractMediaHeaderBox
{
  public static final String TYPE = "smhd";
  private float balance;

  public SoundMediaHeaderBox()
  {
    super("smhd");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.balance = IsoTypeReader.readFixedPoint88(paramByteBuffer);
    IsoTypeReader.readUInt16(paramByteBuffer);
  }

  public float getBalance()
  {
    return this.balance;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeFixedPoint88(paramByteBuffer, this.balance);
    IsoTypeWriter.writeUInt16(paramByteBuffer, 0);
  }

  protected long getContentSize()
  {
    return 8L;
  }

  public String toString()
  {
    return "SoundMediaHeaderBox[balance=" + getBalance() + "]";
  }
}