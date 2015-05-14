package com.google.android.exoplayer.text.eia608;

import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.util.ParsableBitArray;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.nio.ByteBuffer;
import java.util.ArrayList;

public class Eia608Parser
{
  private static final int[] BASIC_CHARACTER_SET = { 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 225, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 233, 93, 237, 243, 250, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 231, 247, 209, 241, 9632 };
  private static final int COUNTRY_CODE = 181;
  private static final int PAYLOAD_TYPE_CC = 4;
  private static final int PROVIDER_CODE = 49;
  private static final int[] SPECIAL_CHARACTER_SET = { 174, 176, 189, 191, 8482, 162, 163, 9834, 224, 32, 232, 226, 234, 238, 244, 251 };
  private static final int USER_DATA_TYPE_CODE = 3;
  private static final int USER_ID = 1195456820;
  private final ArrayList<ClosedCaption> captions = new ArrayList();
  private final ParsableBitArray seiBuffer = new ParsableBitArray();
  private final StringBuilder stringBuilder = new StringBuilder();

  private static char getChar(byte paramByte)
  {
    int i = -32 + (paramByte & 0x7F);
    return (char)BASIC_CHARACTER_SET[i];
  }

  private static char getSpecialChar(byte paramByte)
  {
    int i = paramByte & 0xF;
    return (char)SPECIAL_CHARACTER_SET[i];
  }

  public static boolean inspectSeiMessage(int paramInt1, int paramInt2, ParsableByteArray paramParsableByteArray)
  {
    if ((paramInt1 != 4) || (paramInt2 < 8));
    int j;
    int k;
    int m;
    int n;
    do
    {
      return false;
      int i = paramParsableByteArray.getPosition();
      j = paramParsableByteArray.readUnsignedByte();
      k = paramParsableByteArray.readUnsignedShort();
      m = paramParsableByteArray.readInt();
      n = paramParsableByteArray.readUnsignedByte();
      paramParsableByteArray.setPosition(i);
    }
    while ((j != 181) || (k != 49) || (m != 1195456820) || (n != 3));
    return true;
  }

  boolean canParse(String paramString)
  {
    return paramString.equals("application/eia-608");
  }

  ClosedCaptionList parse(SampleHolder paramSampleHolder)
  {
    if (paramSampleHolder.size < 10)
      return null;
    this.captions.clear();
    this.stringBuilder.setLength(0);
    this.seiBuffer.reset(paramSampleHolder.data.array());
    this.seiBuffer.skipBits(67);
    int i = this.seiBuffer.readBits(5);
    this.seiBuffer.skipBits(8);
    int j = 0;
    if (j < i)
    {
      this.seiBuffer.skipBits(5);
      if (!this.seiBuffer.readBit())
        this.seiBuffer.skipBits(18);
      while (true)
      {
        j++;
        break;
        if (this.seiBuffer.readBits(2) != 0)
        {
          this.seiBuffer.skipBits(16);
        }
        else
        {
          this.seiBuffer.skipBits(1);
          byte b1 = (byte)this.seiBuffer.readBits(7);
          this.seiBuffer.skipBits(1);
          byte b2 = (byte)this.seiBuffer.readBits(7);
          if ((b1 != 0) || (b2 != 0))
            if ((b1 == 17) && ((b2 & 0x70) == 48))
            {
              this.stringBuilder.append(getSpecialChar(b2));
            }
            else if (b1 < 32)
            {
              if (this.stringBuilder.length() > 0)
              {
                this.captions.add(new ClosedCaptionText(this.stringBuilder.toString()));
                this.stringBuilder.setLength(0);
              }
              this.captions.add(new ClosedCaptionCtrl(b1, b2));
            }
            else
            {
              this.stringBuilder.append(getChar(b1));
              if (b2 != 0)
                this.stringBuilder.append(getChar(b2));
            }
        }
      }
    }
    if (this.stringBuilder.length() > 0)
      this.captions.add(new ClosedCaptionText(this.stringBuilder.toString()));
    if (this.captions.isEmpty())
      return null;
    ClosedCaption[] arrayOfClosedCaption = new ClosedCaption[this.captions.size()];
    this.captions.toArray(arrayOfClosedCaption);
    return new ClosedCaptionList(paramSampleHolder.timeUs, paramSampleHolder.decodeOnly, arrayOfClosedCaption);
  }
}