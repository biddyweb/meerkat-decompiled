package co.getair.meerkat.video.broadcast.coremedia.iso;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.FileDataSourceImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Path;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class BoxReplacer
{
  static
  {
    if (!BoxReplacer.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  public static void replace(Map<String, Box> paramMap, File paramFile)
    throws IOException
  {
    IsoFile localIsoFile = new IsoFile(new FileDataSourceImpl(new RandomAccessFile(paramFile, "r").getChannel()));
    HashMap localHashMap1 = new HashMap();
    HashMap localHashMap2 = new HashMap();
    Iterator localIterator1 = paramMap.entrySet().iterator();
    while (localIterator1.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator1.next();
      Box localBox2 = Path.getPath(localIsoFile, (String)localEntry.getKey());
      localHashMap1.put(Path.createPath(localBox2), localEntry.getValue());
      localHashMap2.put(Path.createPath(localBox2), Long.valueOf(localBox2.getOffset()));
      if ((!$assertionsDisabled) && (localBox2.getSize() != ((Box)localEntry.getValue()).getSize()))
        throw new AssertionError();
    }
    localIsoFile.close();
    FileChannel localFileChannel = new RandomAccessFile(paramFile, "rw").getChannel();
    Iterator localIterator2 = localHashMap1.keySet().iterator();
    while (localIterator2.hasNext())
    {
      String str = (String)localIterator2.next();
      Box localBox1 = (Box)localHashMap1.get(str);
      localFileChannel.position(((Long)localHashMap2.get(str)).longValue());
      localBox1.getBox(localFileChannel);
    }
    localFileChannel.close();
  }
}