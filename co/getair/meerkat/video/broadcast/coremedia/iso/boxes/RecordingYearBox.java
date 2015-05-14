package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class RecordingYearBox extends AbstractFullBox
{
  public static final String TYPE = "yrrc";
  int recordingYear;

  public RecordingYearBox()
  {
    super("yrrc");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.recordingYear = IsoTypeReader.readUInt16(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.recordingYear);
  }

  protected long getContentSize()
  {
    return 6L;
  }

  public int getRecordingYear()
  {
    return this.recordingYear;
  }

  public void setRecordingYear(int paramInt)
  {
    this.recordingYear = paramInt;
  }
}