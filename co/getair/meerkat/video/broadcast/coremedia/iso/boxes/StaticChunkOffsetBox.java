package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;

public class StaticChunkOffsetBox extends ChunkOffsetBox
{
  public static final String TYPE = "stco";
  private long[] chunkOffsets = new long[0];

  public StaticChunkOffsetBox()
  {
    super("stco");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    int i = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
    this.chunkOffsets = new long[i];
    for (int j = 0; j < i; j++)
      this.chunkOffsets[j] = IsoTypeReader.readUInt32(paramByteBuffer);
  }

  public long[] getChunkOffsets()
  {
    return this.chunkOffsets;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.chunkOffsets.length);
    long[] arrayOfLong = this.chunkOffsets;
    int i = arrayOfLong.length;
    for (int j = 0; j < i; j++)
      IsoTypeWriter.writeUInt32(paramByteBuffer, arrayOfLong[j]);
  }

  protected long getContentSize()
  {
    return 8 + 4 * this.chunkOffsets.length;
  }

  public void setChunkOffsets(long[] paramArrayOfLong)
  {
    this.chunkOffsets = paramArrayOfLong;
  }
}