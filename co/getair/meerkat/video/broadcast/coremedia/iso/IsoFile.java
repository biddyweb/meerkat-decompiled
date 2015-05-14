package co.getair.meerkat.video.broadcast.coremedia.iso;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MovieBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.BasicContainer;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.FileDataSourceImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.annotations.DoNotParseDetail;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Logger;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.channels.WritableByteChannel;
import java.util.Iterator;
import java.util.List;

@DoNotParseDetail
public class IsoFile extends BasicContainer
  implements Closeable
{
  private static Logger LOG = Logger.getLogger(IsoFile.class);

  public IsoFile(DataSource paramDataSource)
    throws IOException
  {
    this(paramDataSource, new PropertyBoxParserImpl(new String[0]));
  }

  public IsoFile(DataSource paramDataSource, BoxParser paramBoxParser)
    throws IOException
  {
    initContainer(paramDataSource, paramDataSource.size(), paramBoxParser);
  }

  public IsoFile(String paramString)
    throws IOException
  {
    this(new FileDataSourceImpl(new File(paramString)));
  }

  public static String bytesToFourCC(byte[] paramArrayOfByte)
  {
    byte[] arrayOfByte = { 0, 0, 0, 0 };
    if (paramArrayOfByte != null)
      System.arraycopy(paramArrayOfByte, 0, arrayOfByte, 0, Math.min(paramArrayOfByte.length, 4));
    try
    {
      String str = new String(arrayOfByte, "ISO-8859-1");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new Error("Required character encoding is missing", localUnsupportedEncodingException);
    }
  }

  public static byte[] fourCCtoBytes(String paramString)
  {
    byte[] arrayOfByte = new byte[4];
    if (paramString != null)
      for (int i = 0; i < Math.min(4, paramString.length()); i++)
        arrayOfByte[i] = ((byte)paramString.charAt(i));
    return arrayOfByte;
  }

  public void close()
    throws IOException
  {
    this.dataSource.close();
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    writeContainer(paramWritableByteChannel);
  }

  public MovieBox getMovieBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof MovieBox))
        return (MovieBox)localBox;
    }
    return null;
  }

  public long getSize()
  {
    return getContainerSize();
  }

  public String toString()
  {
    return "model(" + this.dataSource.toString() + ")";
  }
}