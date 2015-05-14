package co.getair.meerkat.video.broadcast.mp4writer;

import android.util.Log;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.FileTypeBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Movie;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.ByteBufferByteChannel;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.LinkedList;
import java.util.List;

public class BoxWriter
{
  private static final String TAG = "BoxWriter";

  public static byte[] getBytes(Box paramBox)
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate((int)paramBox.getSize());
    ByteBufferByteChannel localByteBufferByteChannel = new ByteBufferByteChannel(localByteBuffer);
    try
    {
      paramBox.getBox(localByteBufferByteChannel);
      localByteBufferByteChannel.close();
      return localByteBuffer.array();
    }
    catch (IOException localIOException)
    {
      while (true)
        Log.e("BoxWriter", " Couldnt write box ", localIOException);
    }
  }

  public static List<Box> getFirstChunk(MediaTrackChunk paramMediaTrackChunk1, long[] paramArrayOfLong, MediaTrackChunk paramMediaTrackChunk2, byte[] paramArrayOfByte)
  {
    return MoovBuilder.createFirstMp4Chunk(paramMediaTrackChunk1, paramArrayOfLong, paramMediaTrackChunk2, paramArrayOfByte);
  }

  public static List<Box> getFirstChunkFromTestRecording(String paramString)
  {
    try
    {
      List localList = new IsoFile(paramString).getBoxes();
      return localList;
    }
    catch (IOException localIOException)
    {
      Log.e("BoxWriter", "Error reading first chunk", localIOException);
    }
    return null;
  }

  public static List<Box> getFragment(MediaTrackChunk paramMediaTrackChunk1, long[] paramArrayOfLong, MediaTrackChunk paramMediaTrackChunk2, byte[] paramArrayOfByte, int paramInt, long paramLong)
  {
    return ChunkBuilder.createFragment(paramMediaTrackChunk1, paramArrayOfLong, paramMediaTrackChunk2, paramArrayOfByte, paramInt, paramLong);
  }

  public static Box getFtyp()
  {
    LinkedList localLinkedList = new LinkedList();
    localLinkedList.add("mp41");
    localLinkedList.add("mp42");
    localLinkedList.add("isom");
    return new FileTypeBox("mp42", 0L, localLinkedList);
  }

  public static byte[] getFtypBytes()
  {
    return getBytes(getFtyp());
  }

  public static long getTrackDuration(Movie paramMovie, Track paramTrack)
  {
    return paramTrack.getDuration() * paramMovie.getTimescale() / paramTrack.getTrackMetaData().getTimescale();
  }
}