package com.google.android.exoplayer.util;

import android.annotation.SuppressLint;
import android.util.Pair;
import java.util.ArrayList;
import java.util.List;

public final class CodecSpecificDataUtil
{
  private static final int[] AUDIO_SPECIFIC_CONFIG_CHANNEL_COUNT_TABLE = { 0, 1, 2, 3, 4, 5, 6, 8 };
  private static final int[] AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE;
  private static final byte[] NAL_START_CODE = { 0, 0, 0, 1 };
  private static final int SPS_NAL_UNIT_TYPE = 7;

  static
  {
    AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE = new int[] { 96000, 88200, 64000, 48000, 44100, 32000, 24000, 22050, 16000, 12000, 11025, 8000, 7350 };
  }

  public static byte[] buildAudioSpecificConfig(int paramInt1, int paramInt2)
  {
    int i = -1;
    for (int j = 0; j < AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE.length; j++)
      if (paramInt1 == AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE[j])
        i = j;
    int k = -1;
    for (int m = 0; m < AUDIO_SPECIFIC_CONFIG_CHANNEL_COUNT_TABLE.length; m++)
      if (paramInt2 == AUDIO_SPECIFIC_CONFIG_CHANNEL_COUNT_TABLE[m])
        k = m;
    byte[] arrayOfByte = new byte[2];
    arrayOfByte[0] = ((byte)(0x10 | i >> 1));
    arrayOfByte[1] = ((byte)((i & 0x1) << 7 | k << 3));
    return arrayOfByte;
  }

  public static byte[] buildAudioSpecificConfig(int paramInt1, int paramInt2, int paramInt3)
  {
    byte[] arrayOfByte = new byte[2];
    arrayOfByte[0] = ((byte)(0xF8 & paramInt1 << 3 | 0x7 & paramInt2 >> 1));
    arrayOfByte[1] = ((byte)(0x80 & paramInt2 << 7 | 0x78 & paramInt3 << 3));
    return arrayOfByte;
  }

  public static byte[] buildNalUnit(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    byte[] arrayOfByte = new byte[paramInt2 + NAL_START_CODE.length];
    System.arraycopy(NAL_START_CODE, 0, arrayOfByte, 0, NAL_START_CODE.length);
    System.arraycopy(paramArrayOfByte, paramInt1, arrayOfByte, NAL_START_CODE.length, paramInt2);
    return arrayOfByte;
  }

  private static int findNalStartCode(byte[] paramArrayOfByte, int paramInt)
  {
    int i = paramArrayOfByte.length - NAL_START_CODE.length;
    for (int j = paramInt; j <= i; j++)
      if (isNalStartCode(paramArrayOfByte, j))
        return j;
    return -1;
  }

  private static boolean isNalStartCode(byte[] paramArrayOfByte, int paramInt)
  {
    if (paramArrayOfByte.length - paramInt <= NAL_START_CODE.length)
      return false;
    for (int i = 0; ; i++)
    {
      if (i >= NAL_START_CODE.length)
        break label42;
      if (paramArrayOfByte[(paramInt + i)] != NAL_START_CODE[i])
        break;
    }
    label42: return true;
  }

  public static Pair<Integer, Integer> parseAudioSpecificConfig(byte[] paramArrayOfByte)
  {
    boolean bool1 = true;
    int i = 0x1F & paramArrayOfByte[0] >> 3;
    boolean bool2;
    int j;
    if ((i == 5) || (i == 29))
    {
      bool2 = bool1;
      j = (0x7 & paramArrayOfByte[bool2]) << 1 | 0x1 & paramArrayOfByte[(bool2 + true)] >> 7;
      if (j >= 13)
        break label95;
    }
    while (true)
    {
      Assertions.checkState(bool1);
      int k = AUDIO_SPECIFIC_CONFIG_SAMPLING_RATE_TABLE[j];
      int m = 0xF & paramArrayOfByte[(bool2 + true)] >> 3;
      return Pair.create(Integer.valueOf(k), Integer.valueOf(m));
      bool2 = false;
      break;
      label95: bool1 = false;
    }
  }

  @SuppressLint({"InlinedApi"})
  private static int parseAvcLevel(byte[] paramArrayOfByte)
  {
    int i = 8;
    switch (0xFF & paramArrayOfByte[i])
    {
    default:
      i = 0;
    case 12:
      return i;
    case 9:
      return 2;
    case 10:
      return 1;
    case 11:
      return 4;
    case 13:
      return 16;
    case 20:
      return 32;
    case 21:
      return 64;
    case 22:
      return 128;
    case 30:
      return 256;
    case 31:
      return 512;
    case 32:
      return 1024;
    case 40:
      return 2048;
    case 41:
      return 4096;
    case 42:
      return 8192;
    case 50:
      return 16384;
    case 51:
    }
    return 32768;
  }

  @SuppressLint({"InlinedApi"})
  private static int parseAvcProfile(byte[] paramArrayOfByte)
  {
    switch (0xFF & paramArrayOfByte[6])
    {
    default:
      return 0;
    case 66:
      return 1;
    case 77:
      return 2;
    case 88:
      return 4;
    case 100:
      return 8;
    case 110:
      return 16;
    case 122:
      return 32;
    case 244:
    }
    return 64;
  }

  public static Pair<Integer, Integer> parseSpsNalUnit(byte[] paramArrayOfByte)
  {
    if ((isNalStartCode(paramArrayOfByte, 0)) && (paramArrayOfByte.length == 8) && ((0x1F & paramArrayOfByte[5]) == 7))
      return Pair.create(Integer.valueOf(parseAvcProfile(paramArrayOfByte)), Integer.valueOf(parseAvcLevel(paramArrayOfByte)));
    return null;
  }

  public static byte[][] splitNalUnits(byte[] paramArrayOfByte)
  {
    if (!isNalStartCode(paramArrayOfByte, 0))
      return (byte[][])null;
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    do
    {
      localArrayList.add(Integer.valueOf(i));
      i = findNalStartCode(paramArrayOfByte, i + NAL_START_CODE.length);
    }
    while (i != -1);
    byte[][] arrayOfByte = new byte[localArrayList.size()][];
    int j = 0;
    if (j < localArrayList.size())
    {
      int k = ((Integer)localArrayList.get(j)).intValue();
      if (j < -1 + localArrayList.size());
      for (int m = ((Integer)localArrayList.get(j + 1)).intValue(); ; m = paramArrayOfByte.length)
      {
        byte[] arrayOfByte1 = new byte[m - k];
        System.arraycopy(paramArrayOfByte, k, arrayOfByte1, 0, arrayOfByte1.length);
        arrayOfByte[j] = arrayOfByte1;
        j++;
        break;
      }
    }
    return arrayOfByte;
  }
}