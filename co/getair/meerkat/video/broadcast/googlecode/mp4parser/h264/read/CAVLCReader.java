package co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.read;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.BTree;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.CharCache;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.Debug;
import java.io.IOException;
import java.io.InputStream;

public class CAVLCReader extends BitstreamReader
{
  public CAVLCReader(InputStream paramInputStream)
    throws IOException
  {
    super(paramInputStream);
  }

  private int readUE()
    throws IOException
  {
    for (int i = 0; read1Bit() == 0; i++);
    int j = 0;
    if (i > 0)
      j = (int)(readNBit(i) + (-1 + (1 << i)));
    return j;
  }

  private void trace(String paramString1, String paramString2)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    String str = String.valueOf(bitsRead - this.debugBits.length());
    int i = 8 - str.length();
    localStringBuilder.append("@" + str);
    for (int j = 0; j < i; j++)
      localStringBuilder.append(' ');
    localStringBuilder.append(paramString1);
    int k = 100 - localStringBuilder.length() - this.debugBits.length();
    for (int m = 0; m < k; m++)
      localStringBuilder.append(' ');
    localStringBuilder.append(this.debugBits);
    localStringBuilder.append(" (" + paramString2 + ")");
    this.debugBits.clear();
    Debug.println(localStringBuilder.toString());
  }

  public byte[] read(int paramInt)
    throws IOException
  {
    byte[] arrayOfByte = new byte[paramInt];
    for (int i = 0; i < paramInt; i++)
      arrayOfByte[i] = ((byte)readByte());
    return arrayOfByte;
  }

  public boolean readAE()
  {
    throw new UnsupportedOperationException("Stan");
  }

  public int readAEI()
  {
    throw new UnsupportedOperationException("Stan");
  }

  public boolean readBool(String paramString)
    throws IOException
  {
    boolean bool;
    if (read1Bit() == 0)
    {
      bool = false;
      if (!bool)
        break label29;
    }
    label29: for (String str = "1"; ; str = "0")
    {
      trace(paramString, str);
      return bool;
      bool = true;
      break;
    }
  }

  public Object readCE(BTree paramBTree, String paramString)
    throws IOException
  {
    Object localObject;
    do
    {
      paramBTree = paramBTree.down(read1Bit());
      if (paramBTree == null)
        throw new RuntimeException("Illegal code");
      localObject = paramBTree.getValue();
    }
    while (localObject == null);
    trace(paramString, localObject.toString());
    return localObject;
  }

  public int readME(String paramString)
    throws IOException
  {
    return readUE(paramString);
  }

  public long readNBit(int paramInt, String paramString)
    throws IOException
  {
    long l = readNBit(paramInt);
    trace(paramString, String.valueOf(l));
    return l;
  }

  public int readSE(String paramString)
    throws IOException
  {
    int i = readUE();
    int j = (-1 + ((i & 0x1) << 1)) * ((i >> 1) + (i & 0x1));
    trace(paramString, String.valueOf(j));
    return j;
  }

  public int readTE(int paramInt)
    throws IOException
  {
    if (paramInt > 1)
      return readUE();
    return 0x1 & (0xFFFFFFFF ^ read1Bit());
  }

  public void readTrailingBits()
    throws IOException
  {
    read1Bit();
    readRemainingByte();
  }

  public int readU(int paramInt, String paramString)
    throws IOException
  {
    return (int)readNBit(paramInt, paramString);
  }

  public int readUE(String paramString)
    throws IOException
  {
    int i = readUE();
    trace(paramString, String.valueOf(i));
    return i;
  }

  public int readZeroBitCount(String paramString)
    throws IOException
  {
    for (int i = 0; read1Bit() == 0; i++);
    trace(paramString, String.valueOf(i));
    return i;
  }
}