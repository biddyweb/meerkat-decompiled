package com.google.android.exoplayer.hls.parser;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.mp4.Mp4Util;
import com.google.android.exoplayer.upstream.BufferPool;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.ParsableBitArray;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class H264Reader extends ElementaryStreamReader
{
  private static final int NAL_UNIT_TYPE_AUD = 9;
  private static final int NAL_UNIT_TYPE_IDR = 5;
  private static final int NAL_UNIT_TYPE_PPS = 8;
  private static final int NAL_UNIT_TYPE_SEI = 6;
  private static final int NAL_UNIT_TYPE_SPS = 7;
  private boolean isKeyframe;
  private final NalUnitTargetBuffer pps;
  private final boolean[] prefixFlags;
  private int scratchEscapeCount;
  private int[] scratchEscapePositions;
  private final NalUnitTargetBuffer sei;
  private final SeiReader seiReader;
  private final NalUnitTargetBuffer sps;

  public H264Reader(BufferPool paramBufferPool, SeiReader paramSeiReader)
  {
    super(paramBufferPool);
    this.seiReader = paramSeiReader;
    this.prefixFlags = new boolean[3];
    this.sps = new NalUnitTargetBuffer(7, 128);
    this.pps = new NalUnitTargetBuffer(8, 128);
    this.sei = new NalUnitTargetBuffer(6, 128);
    this.scratchEscapePositions = new int[10];
  }

  private void feedNalUnitTargetBuffersData(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if (!hasMediaFormat())
    {
      this.sps.appendToNalUnit(paramArrayOfByte, paramInt1, paramInt2);
      this.pps.appendToNalUnit(paramArrayOfByte, paramInt1, paramInt2);
    }
    this.sei.appendToNalUnit(paramArrayOfByte, paramInt1, paramInt2);
  }

  private void feedNalUnitTargetBuffersStart(int paramInt)
  {
    if (!hasMediaFormat())
    {
      this.sps.startNalUnit(paramInt);
      this.pps.startNalUnit(paramInt);
    }
    this.sei.startNalUnit(paramInt);
  }

  private void feedNalUnitTargetEnd(long paramLong, int paramInt)
  {
    this.sps.endNalUnit(paramInt);
    this.pps.endNalUnit(paramInt);
    if (this.sei.endNalUnit(paramInt))
    {
      int i = unescapeStream(this.sei.nalData, this.sei.nalLength);
      this.seiReader.read(this.sei.nalData, 0, i, paramLong);
    }
  }

  private int findNextUnescapeIndex(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    for (int i = paramInt1; i < paramInt2 - 2; i++)
      if ((paramArrayOfByte[i] == 0) && (paramArrayOfByte[(i + 1)] == 0) && (paramArrayOfByte[(i + 2)] == 3))
        return i;
    return paramInt2;
  }

  private void parseMediaFormat(NalUnitTargetBuffer paramNalUnitTargetBuffer1, NalUnitTargetBuffer paramNalUnitTargetBuffer2)
  {
    byte[] arrayOfByte1 = new byte[paramNalUnitTargetBuffer1.nalLength];
    byte[] arrayOfByte2 = new byte[paramNalUnitTargetBuffer2.nalLength];
    System.arraycopy(paramNalUnitTargetBuffer1.nalData, 0, arrayOfByte1, 0, paramNalUnitTargetBuffer1.nalLength);
    System.arraycopy(paramNalUnitTargetBuffer2.nalData, 0, arrayOfByte2, 0, paramNalUnitTargetBuffer2.nalLength);
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(arrayOfByte1);
    localArrayList.add(arrayOfByte2);
    unescapeStream(paramNalUnitTargetBuffer1.nalData, paramNalUnitTargetBuffer1.nalLength);
    ParsableBitArray localParsableBitArray = new ParsableBitArray(paramNalUnitTargetBuffer1.nalData);
    localParsableBitArray.skipBits(32);
    int i = localParsableBitArray.readBits(8);
    localParsableBitArray.skipBits(16);
    localParsableBitArray.readUnsignedExpGolombCodedInt();
    int j = 1;
    if ((i == 100) || (i == 110) || (i == 122) || (i == 244) || (i == 44) || (i == 83) || (i == 86) || (i == 118) || (i == 128) || (i == 138))
    {
      j = localParsableBitArray.readUnsignedExpGolombCodedInt();
      if (j == 3)
        localParsableBitArray.skipBits(1);
      localParsableBitArray.readUnsignedExpGolombCodedInt();
      localParsableBitArray.readUnsignedExpGolombCodedInt();
      localParsableBitArray.skipBits(1);
      if (localParsableBitArray.readBit())
      {
        int i15;
        int i16;
        if (j != 3)
        {
          i15 = 8;
          i16 = 0;
          label261: if (i16 >= i15)
            break label315;
          if (localParsableBitArray.readBit())
            if (i16 >= 6)
              break label308;
        }
        label308: for (int i17 = 16; ; i17 = 64)
        {
          skipScalingList(localParsableBitArray, i17);
          i16++;
          break label261;
          i15 = 12;
          break;
        }
      }
    }
    label315: localParsableBitArray.readUnsignedExpGolombCodedInt();
    long l1 = localParsableBitArray.readUnsignedExpGolombCodedInt();
    boolean bool;
    int i1;
    label387: int i3;
    int i4;
    int i5;
    int i6;
    int i7;
    int i8;
    int i11;
    if (l1 == 0L)
    {
      localParsableBitArray.readUnsignedExpGolombCodedInt();
      localParsableBitArray.readUnsignedExpGolombCodedInt();
      localParsableBitArray.skipBits(1);
      int m = 1 + localParsableBitArray.readUnsignedExpGolombCodedInt();
      int n = 1 + localParsableBitArray.readUnsignedExpGolombCodedInt();
      bool = localParsableBitArray.readBit();
      if (!bool)
        break label585;
      i1 = 1;
      int i2 = n * (2 - i1);
      if (!bool)
        localParsableBitArray.skipBits(1);
      localParsableBitArray.skipBits(1);
      i3 = m * 16;
      i4 = i2 * 16;
      if (localParsableBitArray.readBit())
      {
        i5 = localParsableBitArray.readUnsignedExpGolombCodedInt();
        i6 = localParsableBitArray.readUnsignedExpGolombCodedInt();
        i7 = localParsableBitArray.readUnsignedExpGolombCodedInt();
        i8 = localParsableBitArray.readUnsignedExpGolombCodedInt();
        if (j != 0)
          break label597;
        i11 = 1;
        if (!bool)
          break label591;
      }
    }
    int i13;
    label585: label591: for (int i14 = 1; ; i14 = 0)
    {
      i13 = 2 - i14;
      i3 -= i11 * (i5 + i6);
      i4 -= i13 * (i7 + i8);
      setMediaFormat(MediaFormat.createVideoFormat("video/avc", -1, i3, i4, localArrayList));
      return;
      if (l1 != 1L)
        break;
      localParsableBitArray.skipBits(1);
      localParsableBitArray.readSignedExpGolombCodedInt();
      localParsableBitArray.readSignedExpGolombCodedInt();
      long l2 = localParsableBitArray.readUnsignedExpGolombCodedInt();
      for (int k = 0; k < l2; k++)
        localParsableBitArray.readUnsignedExpGolombCodedInt();
      break;
      i1 = 0;
      break label387;
    }
    label597: int i9;
    label606: int i10;
    if (j == 3)
    {
      i9 = 1;
      if (j != 1)
        break label645;
      i10 = 2;
      label615: i11 = i9;
      if (!bool)
        break label651;
    }
    label645: label651: for (int i12 = 1; ; i12 = 0)
    {
      i13 = i10 * (2 - i12);
      break;
      i9 = 2;
      break label606;
      i10 = 1;
      break label615;
    }
  }

  private void skipScalingList(ParsableBitArray paramParsableBitArray, int paramInt)
  {
    int i = 8;
    int j = 8;
    int k = 0;
    if (k < paramInt)
    {
      if (j != 0)
        j = (256 + (i + paramParsableBitArray.readSignedExpGolombCodedInt())) % 256;
      if (j == 0);
      while (true)
      {
        k++;
        break;
        i = j;
      }
    }
  }

  private int unescapeStream(byte[] paramArrayOfByte, int paramInt)
  {
    int i = 0;
    this.scratchEscapeCount = 0;
    while (i < paramInt)
    {
      i = findNextUnescapeIndex(paramArrayOfByte, i, paramInt);
      if (i < paramInt)
      {
        if (this.scratchEscapePositions.length <= this.scratchEscapeCount)
          this.scratchEscapePositions = Arrays.copyOf(this.scratchEscapePositions, 2 * this.scratchEscapePositions.length);
        int[] arrayOfInt = this.scratchEscapePositions;
        int i2 = this.scratchEscapeCount;
        this.scratchEscapeCount = (i2 + 1);
        arrayOfInt[i2] = i;
        i += 3;
      }
    }
    int j = paramInt - this.scratchEscapeCount;
    int k = 0;
    int m = 0;
    for (int n = 0; n < this.scratchEscapeCount; n++)
    {
      int i1 = this.scratchEscapePositions[n] - k;
      System.arraycopy(paramArrayOfByte, k, paramArrayOfByte, m, i1);
      k += i1 + 3;
      m += i1 + 2;
    }
    System.arraycopy(paramArrayOfByte, k, paramArrayOfByte, m, j - m);
    return j;
  }

  public void consume(ParsableByteArray paramParsableByteArray, long paramLong, boolean paramBoolean)
  {
    if (paramParsableByteArray.bytesLeft() > 0)
    {
      int i = paramParsableByteArray.getPosition();
      int j = paramParsableByteArray.limit();
      byte[] arrayOfByte = paramParsableByteArray.data;
      appendData(paramParsableByteArray, paramParsableByteArray.bytesLeft());
      while (i < j)
      {
        int k = Mp4Util.findNalUnit(arrayOfByte, i, j, this.prefixFlags);
        if (k < j)
        {
          int m = k - i;
          if (m > 0)
            feedNalUnitTargetBuffersData(arrayOfByte, i, k);
          int n = Mp4Util.getNalUnitType(arrayOfByte, k);
          int i1 = k - j;
          if (n == 9)
          {
            if (writingSample())
            {
              if ((this.isKeyframe) && (!hasMediaFormat()) && (this.sps.isCompleted()) && (this.pps.isCompleted()))
                parseMediaFormat(this.sps, this.pps);
              commitSample(this.isKeyframe, i1);
            }
            startSample(paramLong, i1);
            this.isKeyframe = false;
            label183: if (m >= 0)
              break label229;
          }
          label229: for (int i2 = -m; ; i2 = 0)
          {
            feedNalUnitTargetEnd(paramLong, i2);
            feedNalUnitTargetBuffersStart(n);
            i = k + 4;
            break;
            if (n != 5)
              break label183;
            this.isKeyframe = true;
            break label183;
          }
        }
        feedNalUnitTargetBuffersData(arrayOfByte, i, j);
        i = j;
      }
    }
  }

  public void packetFinished()
  {
  }

  private static final class NalUnitTargetBuffer
  {
    private boolean isCompleted;
    private boolean isFilling;
    public byte[] nalData;
    public int nalLength;
    private final int targetType;

    public NalUnitTargetBuffer(int paramInt1, int paramInt2)
    {
      this.targetType = paramInt1;
      this.nalData = new byte[paramInt2 + 4];
      this.nalData[2] = 1;
      this.nalData[3] = ((byte)paramInt1);
    }

    public void appendToNalUnit(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      if (!this.isFilling)
        return;
      int i = paramInt2 - paramInt1;
      if (this.nalData.length < i + this.nalLength)
        this.nalData = Arrays.copyOf(this.nalData, 2 * (i + this.nalLength));
      System.arraycopy(paramArrayOfByte, paramInt1, this.nalData, this.nalLength, i);
      this.nalLength = (i + this.nalLength);
    }

    public boolean endNalUnit(int paramInt)
    {
      if (!this.isFilling)
        return false;
      this.nalLength -= paramInt;
      this.isFilling = false;
      this.isCompleted = true;
      return true;
    }

    public boolean isCompleted()
    {
      return this.isCompleted;
    }

    public void startNalUnit(int paramInt)
    {
      boolean bool1 = true;
      boolean bool2;
      if (!this.isFilling)
      {
        bool2 = bool1;
        Assertions.checkState(bool2);
        if (paramInt != this.targetType)
          break label51;
      }
      while (true)
      {
        this.isFilling = bool1;
        if (this.isFilling)
        {
          this.nalLength = 4;
          this.isCompleted = false;
        }
        return;
        bool2 = false;
        break;
        label51: bool1 = false;
      }
    }
  }
}