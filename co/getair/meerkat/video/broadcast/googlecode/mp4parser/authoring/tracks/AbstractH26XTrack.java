package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.AbstractTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.SampleImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public abstract class AbstractH26XTrack extends AbstractTrack
{
  static int BUFFER = 67107840;
  protected List<CompositionTimeToSample.Entry> ctts = new ArrayList();
  private DataSource dataSource;
  protected long[] decodingTimes;
  protected List<SampleDependencyTypeBox.Entry> sdtp = new ArrayList();
  protected List<Integer> stss = new ArrayList();
  TrackMetaData trackMetaData = new TrackMetaData();

  public AbstractH26XTrack(DataSource paramDataSource)
  {
    super(paramDataSource.toString());
    this.dataSource = paramDataSource;
  }

  static InputStream cleanBuffer(InputStream paramInputStream)
  {
    return new CleanInputStream(paramInputStream);
  }

  protected static byte[] toArray(ByteBuffer paramByteBuffer)
  {
    ByteBuffer localByteBuffer = paramByteBuffer.duplicate();
    byte[] arrayOfByte = new byte[localByteBuffer.remaining()];
    localByteBuffer.get(arrayOfByte, 0, arrayOfByte.length);
    return arrayOfByte;
  }

  public void close()
    throws IOException
  {
    this.dataSource.close();
  }

  protected Sample createSampleObject(List<? extends ByteBuffer> paramList)
  {
    byte[] arrayOfByte = new byte[4 * paramList.size()];
    ByteBuffer localByteBuffer = ByteBuffer.wrap(arrayOfByte);
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
      localByteBuffer.putInt(((ByteBuffer)localIterator.next()).remaining());
    ByteBuffer[] arrayOfByteBuffer = new ByteBuffer[2 * paramList.size()];
    for (int i = 0; i < paramList.size(); i++)
    {
      arrayOfByteBuffer[(i * 2)] = ByteBuffer.wrap(arrayOfByte, i * 4, 4);
      arrayOfByteBuffer[(1 + i * 2)] = ((ByteBuffer)paramList.get(i));
    }
    return new SampleImpl(arrayOfByteBuffer);
  }

  protected ByteBuffer findNextNal(LookAhead paramLookAhead)
    throws IOException
  {
    try
    {
      while (!paramLookAhead.nextThreeEquals001())
        paramLookAhead.discardByte();
      paramLookAhead.discardNext3AndMarkStart();
      while (!paramLookAhead.nextThreeEquals000or001orEof())
        paramLookAhead.discardByte();
      ByteBuffer localByteBuffer = paramLookAhead.getNal();
      return localByteBuffer;
    }
    catch (EOFException localEOFException)
    {
    }
    return null;
  }

  public List<CompositionTimeToSample.Entry> getCompositionTimeEntries()
  {
    return this.ctts;
  }

  public List<SampleDependencyTypeBox.Entry> getSampleDependencies()
  {
    return this.sdtp;
  }

  public long[] getSampleDurations()
  {
    return this.decodingTimes;
  }

  public long[] getSyncSamples()
  {
    long[] arrayOfLong = new long[this.stss.size()];
    for (int i = 0; i < this.stss.size(); i++)
      arrayOfLong[i] = ((Integer)this.stss.get(i)).intValue();
    return arrayOfLong;
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.trackMetaData;
  }

  public void setSampleDurations(long[] paramArrayOfLong)
  {
    this.decodingTimes = paramArrayOfLong;
  }

  public static class LookAhead
  {
    ByteBuffer buffer;
    long bufferStartPos = 0L;
    DataSource dataSource;
    int inBufferPos = 0;
    long start;

    public LookAhead(DataSource paramDataSource)
      throws IOException
    {
      this.dataSource = paramDataSource;
      fillBuffer();
    }

    public void discardByte()
    {
      this.inBufferPos = (1 + this.inBufferPos);
    }

    public void discardNext3AndMarkStart()
    {
      this.inBufferPos = (3 + this.inBufferPos);
      this.start = (this.bufferStartPos + this.inBufferPos);
    }

    public void fillBuffer()
      throws IOException
    {
      this.buffer = this.dataSource.map(this.bufferStartPos, Math.min(this.dataSource.size() - this.bufferStartPos, AbstractH26XTrack.BUFFER));
    }

    public ByteBuffer getNal()
    {
      if (this.start >= this.bufferStartPos)
      {
        this.buffer.position((int)(this.start - this.bufferStartPos));
        ByteBuffer localByteBuffer = this.buffer.slice();
        localByteBuffer.limit((int)(this.inBufferPos - (this.start - this.bufferStartPos)));
        return (ByteBuffer)localByteBuffer;
      }
      throw new RuntimeException("damn! NAL exceeds buffer");
    }

    public boolean nextThreeEquals000or001orEof()
      throws IOException
    {
      if (this.buffer.limit() - this.inBufferPos >= 3)
        if ((this.buffer.get(this.inBufferPos) != 0) || (this.buffer.get(1 + this.inBufferPos) != 0) || ((this.buffer.get(2 + this.inBufferPos) != 0) && (this.buffer.get(2 + this.inBufferPos) != 1)));
      do
      {
        return true;
        return false;
        if (3L + (this.bufferStartPos + this.inBufferPos) <= this.dataSource.size())
          break;
      }
      while (this.bufferStartPos + this.inBufferPos == this.dataSource.size());
      return false;
      this.bufferStartPos = this.start;
      this.inBufferPos = 0;
      fillBuffer();
      return nextThreeEquals000or001orEof();
    }

    public boolean nextThreeEquals001()
      throws IOException
    {
      if (this.buffer.limit() - this.inBufferPos >= 3)
        return (this.buffer.get(this.inBufferPos) == 0) && (this.buffer.get(1 + this.inBufferPos) == 0) && (this.buffer.get(2 + this.inBufferPos) == 1);
      if (3L + (this.bufferStartPos + this.inBufferPos) >= this.dataSource.size())
        throw new EOFException();
      return false;
    }
  }
}