package com.google.android.exoplayer.mp4;

import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.CodecSpecificDataUtil;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.nio.ByteBuffer;

public final class Mp4Util
{
  public static final int ATOM_HEADER_SIZE = 8;
  public static final int FULL_ATOM_HEADER_SIZE = 12;
  public static final int LONG_ATOM_HEADER_SIZE = 16;
  public static final int LONG_ATOM_SIZE = 1;
  private static final byte[] NAL_START_CODE = { 0, 0, 0, 1 };
  public static final int NO_SAMPLE = -1;
  public static final int NO_TRACK = -1;

  private static void clearPrefixFlags(boolean[] paramArrayOfBoolean)
  {
    paramArrayOfBoolean[0] = false;
    paramArrayOfBoolean[1] = false;
    paramArrayOfBoolean[2] = false;
  }

  public static int findNalUnit(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    return findNalUnit(paramArrayOfByte, paramInt1, paramInt2, null);
  }

  public static int findNalUnit(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3)
  {
    return findNalUnit(paramArrayOfByte, paramInt1, paramInt2, paramInt3, null);
  }

  public static int findNalUnit(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3, boolean[] paramArrayOfBoolean)
  {
    int i = 1;
    int j = paramInt2 - paramInt1;
    if (j >= 0)
    {
      int k = i;
      Assertions.checkState(k);
      if (j != 0)
        break label35;
    }
    label35: 
    do
    {
      return paramInt2;
      int m = 0;
      break;
      if (paramArrayOfBoolean != null)
      {
        if ((paramArrayOfBoolean[0] != 0) && (matchesType(paramArrayOfByte, paramInt1, paramInt3)))
        {
          clearPrefixFlags(paramArrayOfBoolean);
          return paramInt1 - 3;
        }
        if ((j > i) && (paramArrayOfBoolean[i] != 0) && (paramArrayOfByte[paramInt1] == i) && (matchesType(paramArrayOfByte, paramInt1 + 1, paramInt3)))
        {
          clearPrefixFlags(paramArrayOfBoolean);
          return paramInt1 - 2;
        }
        if ((j > 2) && (paramArrayOfBoolean[2] != 0) && (paramArrayOfByte[paramInt1] == 0) && (paramArrayOfByte[(paramInt1 + 1)] == i) && (matchesType(paramArrayOfByte, paramInt1 + 2, paramInt3)))
        {
          clearPrefixFlags(paramArrayOfBoolean);
          return paramInt1 - 1;
        }
      }
      int n = paramInt2 - 1;
      int i1 = paramInt1 + 2;
      if (i1 < n)
      {
        if ((0xFE & paramArrayOfByte[i1]) != 0);
        while (true)
        {
          i1 += 3;
          break;
          if ((paramArrayOfByte[(i1 - 2)] == 0) && (paramArrayOfByte[(i1 - 1)] == 0) && (paramArrayOfByte[i1] == i) && (matchesType(paramArrayOfByte, i1 + 1, paramInt3)))
          {
            if (paramArrayOfBoolean != null)
              clearPrefixFlags(paramArrayOfBoolean);
            return i1 - 2;
          }
          i1 -= 2;
        }
      }
    }
    while (paramArrayOfBoolean == null);
    int i2;
    int i3;
    if (j > 2)
      if ((paramArrayOfByte[(paramInt2 - 3)] == 0) && (paramArrayOfByte[(paramInt2 - 2)] == 0) && (paramArrayOfByte[(paramInt2 - 1)] == i))
      {
        i2 = i;
        paramArrayOfBoolean[0] = i2;
        if (j <= i)
          break label435;
        if ((paramArrayOfByte[(paramInt2 - 2)] != 0) || (paramArrayOfByte[(paramInt2 - 1)] != 0))
          break label429;
        i3 = i;
        label325: paramArrayOfBoolean[i] = i3;
        if (paramArrayOfByte[(paramInt2 - 1)] != 0)
          break label463;
      }
    while (true)
    {
      paramArrayOfBoolean[2] = i;
      return paramInt2;
      i2 = 0;
      break;
      if (j == 2)
      {
        if ((paramArrayOfBoolean[2] != 0) && (paramArrayOfByte[(paramInt2 - 2)] == 0) && (paramArrayOfByte[(paramInt2 - 1)] == i))
        {
          i2 = i;
          break;
        }
        i2 = 0;
        break;
      }
      if ((paramArrayOfBoolean[i] != 0) && (paramArrayOfByte[(paramInt2 - 1)] == i))
      {
        i2 = i;
        break;
      }
      i2 = 0;
      break;
      label429: i3 = 0;
      break label325;
      label435: if ((paramArrayOfBoolean[2] != 0) && (paramArrayOfByte[(paramInt2 - 1)] == 0))
      {
        i3 = i;
        break label325;
      }
      i3 = 0;
      break label325;
      label463: i = 0;
    }
  }

  public static int findNalUnit(byte[] paramArrayOfByte, int paramInt1, int paramInt2, boolean[] paramArrayOfBoolean)
  {
    return findNalUnit(paramArrayOfByte, paramInt1, paramInt2, -1, paramArrayOfBoolean);
  }

  public static int getNalUnitType(byte[] paramArrayOfByte, int paramInt)
  {
    return 0x1F & paramArrayOfByte[(paramInt + 3)];
  }

  private static boolean matchesType(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    return (paramInt2 == -1) || ((0x1F & paramArrayOfByte[paramInt1]) == paramInt2);
  }

  public static byte[] parseChildNalUnit(ParsableByteArray paramParsableByteArray)
  {
    int i = paramParsableByteArray.readUnsignedShort();
    int j = paramParsableByteArray.getPosition();
    paramParsableByteArray.skip(i);
    return CodecSpecificDataUtil.buildNalUnit(paramParsableByteArray.data, j, i);
  }

  public static int parseFullAtomFlags(int paramInt)
  {
    return 0xFFFFFF & paramInt;
  }

  public static int parseFullAtomVersion(int paramInt)
  {
    return 0xFF & paramInt >> 24;
  }

  public static int readUnsignedIntToInt(ByteBuffer paramByteBuffer)
  {
    int i = 0xFF & paramByteBuffer.get();
    for (int j = 1; j < 4; j++)
      i = i << 8 | 0xFF & paramByteBuffer.get();
    if (i < 0)
      throw new IllegalArgumentException("Top bit not zero: " + i);
    return i;
  }

  public static void replaceLengthPrefixesWithAvcStartCodes(ByteBuffer paramByteBuffer, int paramInt)
  {
    int i = paramByteBuffer.position() - paramInt;
    int j = i;
    while (j < i + paramInt)
    {
      paramByteBuffer.position(j);
      int k = readUnsignedIntToInt(paramByteBuffer);
      paramByteBuffer.position(j);
      paramByteBuffer.put(NAL_START_CODE);
      j += k + 4;
    }
    paramByteBuffer.position(i + paramInt);
  }
}