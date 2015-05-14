package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import java.nio.ByteBuffer;

public class VideoMediaHeaderBox extends AbstractMediaHeaderBox
{
  public static final String TYPE = "vmhd";
  private int graphicsmode = 0;
  private int[] opcolor = { 0, 0, 0 };

  public VideoMediaHeaderBox()
  {
    super("vmhd");
    setFlags(1);
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.graphicsmode = IsoTypeReader.readUInt16(paramByteBuffer);
    this.opcolor = new int[3];
    for (int i = 0; i < 3; i++)
      this.opcolor[i] = IsoTypeReader.readUInt16(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.graphicsmode);
    int[] arrayOfInt = this.opcolor;
    int i = arrayOfInt.length;
    for (int j = 0; j < i; j++)
      IsoTypeWriter.writeUInt16(paramByteBuffer, arrayOfInt[j]);
  }

  protected long getContentSize()
  {
    return 12L;
  }

  public int getGraphicsmode()
  {
    return this.graphicsmode;
  }

  public int[] getOpcolor()
  {
    return this.opcolor;
  }

  public void setGraphicsmode(int paramInt)
  {
    this.graphicsmode = paramInt;
  }

  public void setOpcolor(int[] paramArrayOfInt)
  {
    this.opcolor = paramArrayOfInt;
  }

  public String toString()
  {
    return "VideoMediaHeaderBox[graphicsmode=" + getGraphicsmode() + ";opcolor0=" + getOpcolor()[0] + ";opcolor1=" + getOpcolor()[1] + ";opcolor2=" + getOpcolor()[2] + "]";
  }
}