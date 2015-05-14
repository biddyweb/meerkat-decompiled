package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public abstract class AbstractSampleEntry extends AbstractContainerBox
  implements SampleEntry
{
  protected int dataReferenceIndex = 1;

  protected AbstractSampleEntry(String paramString)
  {
    super(paramString);
  }

  public abstract void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException;

  public int getDataReferenceIndex()
  {
    return this.dataReferenceIndex;
  }

  public abstract void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
    throws IOException;

  public void setDataReferenceIndex(int paramInt)
  {
    this.dataReferenceIndex = paramInt;
  }
}