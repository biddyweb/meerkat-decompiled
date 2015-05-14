package android.support.multidex;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.zip.CRC32;
import java.util.zip.ZipException;

final class ZipUtil
{
  private static final int BUFFER_SIZE = 16384;
  private static final int ENDHDR = 22;
  private static final int ENDSIG = 101010256;

  static long computeCrcOfCentralDir(RandomAccessFile paramRandomAccessFile, CentralDirectory paramCentralDirectory)
    throws IOException
  {
    CRC32 localCRC32 = new CRC32();
    long l = paramCentralDirectory.size;
    paramRandomAccessFile.seek(paramCentralDirectory.offset);
    int i = (int)Math.min(16384L, l);
    byte[] arrayOfByte = new byte[16384];
    for (int j = paramRandomAccessFile.read(arrayOfByte, 0, i); ; j = paramRandomAccessFile.read(arrayOfByte, 0, (int)Math.min(16384L, l)))
      if (j != -1)
      {
        localCRC32.update(arrayOfByte, 0, j);
        l -= j;
        if (l != 0L);
      }
      else
      {
        return localCRC32.getValue();
      }
  }

  static CentralDirectory findCentralDirectory(RandomAccessFile paramRandomAccessFile)
    throws IOException, ZipException
  {
    long l1 = paramRandomAccessFile.length() - 22L;
    if (l1 < 0L)
      throw new ZipException("File too short to be a zip file: " + paramRandomAccessFile.length());
    long l2 = l1 - 65536L;
    if (l2 < 0L)
      l2 = 0L;
    int i = Integer.reverseBytes(101010256);
    do
    {
      paramRandomAccessFile.seek(l1);
      if (paramRandomAccessFile.readInt() == i)
      {
        paramRandomAccessFile.skipBytes(2);
        paramRandomAccessFile.skipBytes(2);
        paramRandomAccessFile.skipBytes(2);
        paramRandomAccessFile.skipBytes(2);
        CentralDirectory localCentralDirectory = new CentralDirectory();
        localCentralDirectory.size = (0xFFFFFFFF & Integer.reverseBytes(paramRandomAccessFile.readInt()));
        localCentralDirectory.offset = (0xFFFFFFFF & Integer.reverseBytes(paramRandomAccessFile.readInt()));
        return localCentralDirectory;
      }
      l1 -= 1L;
    }
    while (l1 >= l2);
    throw new ZipException("End Of Central Directory signature not found");
  }

  static long getZipCrc(File paramFile)
    throws IOException
  {
    RandomAccessFile localRandomAccessFile = new RandomAccessFile(paramFile, "r");
    try
    {
      long l = computeCrcOfCentralDir(localRandomAccessFile, findCentralDirectory(localRandomAccessFile));
      return l;
    }
    finally
    {
      localRandomAccessFile.close();
    }
  }

  static class CentralDirectory
  {
    long offset;
    long size;
  }
}