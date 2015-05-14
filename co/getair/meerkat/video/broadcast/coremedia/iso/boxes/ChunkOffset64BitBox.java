package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;

public class ChunkOffset64BitBox extends ChunkOffsetBox
{
  public static final String TYPE = "co64";
  private long[] chunkOffsets;

  public ChunkOffset64BitBox()
  {
    super("co64");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    int i = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
    this.chunkOffsets = new long[i];
    for (int j = 0; j < i; j++)
      this.chunkOffsets[j] = IsoTypeReader.readUInt64(paramByteBuffer);
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
      IsoTypeWriter.writeUInt64(paramByteBuffer, arrayOfLong[j]);
  }

  protected long getContentSize()
  {
    return 8 + 8 * this.chunkOffsets.length;
  }

  public void setChunkOffsets(long[] paramArrayOfLong)
  {
    this.chunkOffsets = paramArrayOfLong;
  }
}