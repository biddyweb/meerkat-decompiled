package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.builder;

import java.nio.ByteBuffer;
import java.nio.MappedByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ByteBufferHelper
{
  public static List<ByteBuffer> mergeAdjacentBuffers(List<ByteBuffer> paramList)
  {
    ArrayList localArrayList = new ArrayList(paramList.size());
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      ByteBuffer localByteBuffer1 = (ByteBuffer)localIterator.next();
      int i = -1 + localArrayList.size();
      if ((i >= 0) && (localByteBuffer1.hasArray()) && (((ByteBuffer)localArrayList.get(i)).hasArray()) && (localByteBuffer1.array() == ((ByteBuffer)localArrayList.get(i)).array()) && (((ByteBuffer)localArrayList.get(i)).arrayOffset() + ((ByteBuffer)localArrayList.get(i)).limit() == localByteBuffer1.arrayOffset()))
      {
        ByteBuffer localByteBuffer3 = (ByteBuffer)localArrayList.remove(i);
        localArrayList.add(ByteBuffer.wrap(localByteBuffer1.array(), localByteBuffer3.arrayOffset(), localByteBuffer3.limit() + localByteBuffer1.limit()).slice());
      }
      else if ((i >= 0) && ((localByteBuffer1 instanceof MappedByteBuffer)) && ((localArrayList.get(i) instanceof MappedByteBuffer)) && (((ByteBuffer)localArrayList.get(i)).limit() == ((ByteBuffer)localArrayList.get(i)).capacity() - localByteBuffer1.capacity()))
      {
        ByteBuffer localByteBuffer2 = (ByteBuffer)localArrayList.get(i);
        localByteBuffer2.limit(localByteBuffer1.limit() + localByteBuffer2.limit());
      }
      else
      {
        localByteBuffer1.reset();
        localArrayList.add(localByteBuffer1);
      }
    }
    return localArrayList;
  }
}