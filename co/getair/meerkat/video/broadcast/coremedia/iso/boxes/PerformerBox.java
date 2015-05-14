package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class PerformerBox extends AbstractFullBox
{
  public static final String TYPE = "perf";
  private String language;
  private String performer;

  public PerformerBox()
  {
    super("perf");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.language = IsoTypeReader.readIso639(paramByteBuffer);
    this.performer = IsoTypeReader.readString(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeIso639(paramByteBuffer, this.language);
    paramByteBuffer.put(Utf8.convert(this.performer));
    paramByteBuffer.put((byte)0);
  }

  protected long getContentSize()
  {
    return 1 + (6 + Utf8.utf8StringLengthInBytes(this.performer));
  }

  public String getLanguage()
  {
    return this.language;
  }

  public String getPerformer()
  {
    return this.performer;
  }

  public void setLanguage(String paramString)
  {
    this.language = paramString;
  }

  public void setPerformer(String paramString)
  {
    this.performer = paramString;
  }

  public String toString()
  {
    return "PerformerBox[language=" + getLanguage() + ";performer=" + getPerformer() + "]";
  }
}