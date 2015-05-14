package co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.write;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.Debug;
import java.io.IOException;
import java.io.OutputStream;

public class CAVLCWriter extends BitstreamWriter
{
  public CAVLCWriter(OutputStream paramOutputStream)
  {
    super(paramOutputStream);
  }

  public void writeBool(boolean paramBoolean, String paramString)
    throws IOException
  {
    Debug.print(paramString + "\t");
    if (paramBoolean);
    for (int i = 1; ; i = 0)
    {
      write1Bit(i);
      Debug.println("\t" + paramBoolean);
      return;
    }
  }

  public void writeNBit(long paramLong, int paramInt, String paramString)
    throws IOException
  {
    Debug.print(paramString + "\t");
    for (int i = 0; i < paramInt; i++)
      write1Bit(0x1 & (int)(paramLong >> -1 + (paramInt - i)));
    Debug.println("\t" + paramLong);
  }

  public void writeSE(int paramInt, String paramString)
    throws IOException
  {
    int i = 1;
    Debug.print(paramString + "\t");
    int j = paramInt << 1;
    int k;
    int m;
    if (paramInt < 0)
    {
      k = -1;
      m = k * j;
      if (paramInt <= 0)
        break label84;
    }
    while (true)
    {
      writeUE(i + m);
      Debug.println("\t" + paramInt);
      return;
      k = i;
      break;
      label84: i = 0;
    }
  }

  public void writeSliceTrailingBits()
  {
    throw new IllegalStateException("todo");
  }

  public void writeTrailingBits()
    throws IOException
  {
    write1Bit(1);
    writeRemainingZero();
    flush();
  }

  public void writeU(int paramInt1, int paramInt2)
    throws IOException
  {
    writeNBit(paramInt1, paramInt2);
  }

  public void writeU(int paramInt1, int paramInt2, String paramString)
    throws IOException
  {
    Debug.print(paramString + "\t");
    writeNBit(paramInt1, paramInt2);
    Debug.println("\t" + paramInt1);
  }

  public void writeUE(int paramInt)
    throws IOException
  {
    int i = 0;
    for (int j = 0; ; j++)
    {
      int k = 0;
      if (j < 15)
      {
        if (paramInt < i + (1 << j))
          k = j;
      }
      else
      {
        writeNBit(0L, k);
        write1Bit(1);
        writeNBit(paramInt - i, k);
        return;
      }
      i += (1 << j);
    }
  }

  public void writeUE(int paramInt, String paramString)
    throws IOException
  {
    Debug.print(paramString + "\t");
    writeUE(paramInt);
    Debug.println("\t" + paramInt);
  }
}