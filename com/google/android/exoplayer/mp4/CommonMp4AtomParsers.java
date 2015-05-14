package com.google.android.exoplayer.mp4;

import android.util.Pair;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.chunk.parser.mp4.TrackEncryptionBox;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.CodecSpecificDataUtil;
import com.google.android.exoplayer.util.ParsableByteArray;
import com.google.android.exoplayer.util.Util;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class CommonMp4AtomParsers
{
  private static final int[] AC3_BITRATES = { 32, 40, 48, 56, 64, 80, 96, 112, 128, 160, 192, 224, 256, 320, 384, 448, 512, 576, 640 };
  private static final int[] AC3_CHANNEL_COUNTS = { 2, 1, 2, 3, 3, 4, 4, 5 };

  private static Ac3Format parseAc3SpecificBoxFromParent(ParsableByteArray paramParsableByteArray, int paramInt)
  {
    paramParsableByteArray.setPosition(paramInt + 8);
    int i;
    switch ((0xC0 & paramParsableByteArray.readUnsignedByte()) >> 6)
    {
    default:
      return null;
    case 0:
      i = 48000;
    case 1:
    case 2:
    }
    while (true)
    {
      int j = paramParsableByteArray.readUnsignedByte();
      int k = AC3_CHANNEL_COUNTS[((j & 0x38) >> 3)];
      if ((j & 0x4) != 0)
        k++;
      return new Ac3Format(k, i, AC3_BITRATES[(((j & 0x3) << 3) + (paramParsableByteArray.readUnsignedByte() >> 5))]);
      i = 44100;
      continue;
      i = 32000;
    }
  }

  private static Pair<MediaFormat, TrackEncryptionBox> parseAudioSampleEntry(ParsableByteArray paramParsableByteArray, int paramInt1, int paramInt2, int paramInt3)
  {
    paramParsableByteArray.setPosition(paramInt2 + 8);
    paramParsableByteArray.skip(16);
    int i = paramParsableByteArray.readUnsignedShort();
    int j = paramParsableByteArray.readUnsignedShort();
    paramParsableByteArray.skip(4);
    int k = paramParsableByteArray.readUnsignedFixedPoint1616();
    int m = -1;
    byte[] arrayOfByte = null;
    TrackEncryptionBox localTrackEncryptionBox = null;
    int n = paramParsableByteArray.getPosition();
    if (n - paramInt2 < paramInt3)
    {
      paramParsableByteArray.setPosition(n);
      int i1 = paramParsableByteArray.getPosition();
      int i2 = paramParsableByteArray.readInt();
      boolean bool;
      label86: int i3;
      if (i2 > 0)
      {
        bool = true;
        Assertions.checkArgument(bool, "childAtomSize should be positive");
        i3 = paramParsableByteArray.readInt();
        if ((paramInt1 != Atom.TYPE_mp4a) && (paramInt1 != Atom.TYPE_enca))
          break label199;
        if (i3 != Atom.TYPE_esds)
          break label178;
        arrayOfByte = parseEsdsFromParent(paramParsableByteArray, i1);
        Pair localPair = CodecSpecificDataUtil.parseAudioSpecificConfig(arrayOfByte);
        k = ((Integer)localPair.first).intValue();
        i = ((Integer)localPair.second).intValue();
      }
      while (true)
      {
        n += i2;
        break;
        bool = false;
        break label86;
        label178: if (i3 == Atom.TYPE_sinf)
        {
          localTrackEncryptionBox = parseSinfFromParent(paramParsableByteArray, i1, i2);
          continue;
          label199: if ((paramInt1 == Atom.TYPE_ac_3) && (i3 == Atom.TYPE_dac3))
          {
            Ac3Format localAc3Format = parseAc3SpecificBoxFromParent(paramParsableByteArray, i1);
            if (localAc3Format != null)
            {
              k = localAc3Format.sampleRate;
              i = localAc3Format.channelCount;
              m = localAc3Format.bitrate;
            }
            localTrackEncryptionBox = null;
          }
          else if ((paramInt1 == Atom.TYPE_ec_3) && (i3 == Atom.TYPE_dec3))
          {
            k = parseEc3SpecificBoxFromParent(paramParsableByteArray, i1);
            localTrackEncryptionBox = null;
          }
        }
      }
    }
    String str;
    if (paramInt1 == Atom.TYPE_ac_3)
    {
      str = "audio/ac3";
      if (arrayOfByte != null)
        break label344;
    }
    label344: for (List localList = null; ; localList = Collections.singletonList(arrayOfByte))
    {
      return Pair.create(MediaFormat.createAudioFormat(str, j, i, k, m, localList), localTrackEncryptionBox);
      if (paramInt1 == Atom.TYPE_ec_3)
      {
        str = "audio/eac3";
        break;
      }
      str = "audio/mp4a-latm";
      break;
    }
  }

  private static List<byte[]> parseAvcCFromParent(ParsableByteArray paramParsableByteArray, int paramInt)
  {
    paramParsableByteArray.setPosition(4 + (paramInt + 8));
    if (1 + (0x3 & paramParsableByteArray.readUnsignedByte()) != 4)
      throw new IllegalStateException();
    ArrayList localArrayList = new ArrayList();
    int i = 0x1F & paramParsableByteArray.readUnsignedByte();
    for (int j = 0; j < i; j++)
      localArrayList.add(Mp4Util.parseChildNalUnit(paramParsableByteArray));
    int k = paramParsableByteArray.readUnsignedByte();
    for (int m = 0; m < k; m++)
      localArrayList.add(Mp4Util.parseChildNalUnit(paramParsableByteArray));
    return localArrayList;
  }

  private static Pair<MediaFormat, TrackEncryptionBox> parseAvcFromParent(ParsableByteArray paramParsableByteArray, int paramInt1, int paramInt2)
  {
    paramParsableByteArray.setPosition(paramInt1 + 8);
    paramParsableByteArray.skip(24);
    int i = paramParsableByteArray.readUnsignedShort();
    int j = paramParsableByteArray.readUnsignedShort();
    float f = 1.0F;
    paramParsableByteArray.skip(50);
    List localList = null;
    Object localObject = null;
    int k = paramParsableByteArray.getPosition();
    int m;
    int n;
    if (k - paramInt1 < paramInt2)
    {
      paramParsableByteArray.setPosition(k);
      m = paramParsableByteArray.getPosition();
      n = paramParsableByteArray.readInt();
      if ((n != 0) || (paramParsableByteArray.getPosition() - paramInt1 != paramInt2));
    }
    else
    {
      return Pair.create(MediaFormat.createVideoFormat("video/avc", -1, i, j, f, localList), localObject);
    }
    boolean bool;
    label114: int i1;
    if (n > 0)
    {
      bool = true;
      Assertions.checkArgument(bool, "childAtomSize should be positive");
      i1 = paramParsableByteArray.readInt();
      if (i1 != Atom.TYPE_avcC)
        break label159;
      localList = parseAvcCFromParent(paramParsableByteArray, m);
    }
    while (true)
    {
      k += n;
      break;
      bool = false;
      break label114;
      label159: if (i1 == Atom.TYPE_sinf)
        localObject = parseSinfFromParent(paramParsableByteArray, m, n);
      else if (i1 == Atom.TYPE_pasp)
        f = parsePaspFromParent(paramParsableByteArray, m);
    }
  }

  private static int parseEc3SpecificBoxFromParent(ParsableByteArray paramParsableByteArray, int paramInt)
  {
    paramParsableByteArray.setPosition(paramInt + 8);
    return 0;
  }

  private static byte[] parseEsdsFromParent(ParsableByteArray paramParsableByteArray, int paramInt)
  {
    paramParsableByteArray.setPosition(4 + (paramInt + 8));
    paramParsableByteArray.skip(1);
    for (int i = paramParsableByteArray.readUnsignedByte(); i > 127; i = paramParsableByteArray.readUnsignedByte());
    paramParsableByteArray.skip(2);
    int j = paramParsableByteArray.readUnsignedByte();
    if ((j & 0x80) != 0)
      paramParsableByteArray.skip(2);
    if ((j & 0x40) != 0)
      paramParsableByteArray.skip(paramParsableByteArray.readUnsignedShort());
    if ((j & 0x20) != 0)
      paramParsableByteArray.skip(2);
    paramParsableByteArray.skip(1);
    for (int k = paramParsableByteArray.readUnsignedByte(); k > 127; k = paramParsableByteArray.readUnsignedByte());
    paramParsableByteArray.skip(13);
    paramParsableByteArray.skip(1);
    int m = paramParsableByteArray.readUnsignedByte();
    for (int n = m & 0x7F; m > 127; n = n << 8 | m & 0x7F)
      m = paramParsableByteArray.readUnsignedByte();
    byte[] arrayOfByte = new byte[n];
    paramParsableByteArray.readBytes(arrayOfByte, 0, n);
    return arrayOfByte;
  }

  private static int parseHdlr(ParsableByteArray paramParsableByteArray)
  {
    paramParsableByteArray.setPosition(16);
    return paramParsableByteArray.readInt();
  }

  private static long parseMdhd(ParsableByteArray paramParsableByteArray)
  {
    int i = 8;
    paramParsableByteArray.setPosition(i);
    if (Mp4Util.parseFullAtomVersion(paramParsableByteArray.readInt()) == 0);
    while (true)
    {
      paramParsableByteArray.skip(i);
      return paramParsableByteArray.readUnsignedInt();
      i = 16;
    }
  }

  private static MediaFormat parseMp4vFromParent(ParsableByteArray paramParsableByteArray, int paramInt1, int paramInt2)
  {
    paramParsableByteArray.setPosition(paramInt1 + 8);
    paramParsableByteArray.skip(24);
    int i = paramParsableByteArray.readUnsignedShort();
    int j = paramParsableByteArray.readUnsignedShort();
    paramParsableByteArray.skip(50);
    ArrayList localArrayList = new ArrayList(1);
    int k = paramParsableByteArray.getPosition();
    if (k - paramInt1 < paramInt2)
    {
      paramParsableByteArray.setPosition(k);
      int m = paramParsableByteArray.getPosition();
      int n = paramParsableByteArray.readInt();
      if (n > 0);
      for (boolean bool = true; ; bool = false)
      {
        Assertions.checkArgument(bool, "childAtomSize should be positive");
        if (paramParsableByteArray.readInt() == Atom.TYPE_esds)
          localArrayList.add(parseEsdsFromParent(paramParsableByteArray, m));
        k += n;
        break;
      }
    }
    return MediaFormat.createVideoFormat("video/mp4v-es", -1, i, j, localArrayList);
  }

  private static long parseMvhd(ParsableByteArray paramParsableByteArray)
  {
    int i = 8;
    paramParsableByteArray.setPosition(i);
    if (Mp4Util.parseFullAtomVersion(paramParsableByteArray.readInt()) == 0);
    while (true)
    {
      paramParsableByteArray.skip(i);
      return paramParsableByteArray.readUnsignedInt();
      i = 16;
    }
  }

  private static float parsePaspFromParent(ParsableByteArray paramParsableByteArray, int paramInt)
  {
    paramParsableByteArray.setPosition(paramInt + 8);
    int i = paramParsableByteArray.readUnsignedIntToInt();
    int j = paramParsableByteArray.readUnsignedIntToInt();
    return i / j;
  }

  private static TrackEncryptionBox parseSchiFromParent(ParsableByteArray paramParsableByteArray, int paramInt1, int paramInt2)
  {
    int i = 1;
    int k = paramInt1 + 8;
    while (k - paramInt1 < paramInt2)
    {
      paramParsableByteArray.setPosition(k);
      int m = paramParsableByteArray.readInt();
      if (paramParsableByteArray.readInt() == Atom.TYPE_tenc)
      {
        paramParsableByteArray.skip(4);
        int n = paramParsableByteArray.readInt();
        if (n >> 8 == i);
        while (true)
        {
          int i1 = n & 0xFF;
          byte[] arrayOfByte = new byte[16];
          paramParsableByteArray.readBytes(arrayOfByte, 0, arrayOfByte.length);
          return new TrackEncryptionBox(i, i1, arrayOfByte);
          int j = 0;
        }
      }
      k += m;
    }
    return null;
  }

  private static TrackEncryptionBox parseSinfFromParent(ParsableByteArray paramParsableByteArray, int paramInt1, int paramInt2)
  {
    int i = paramInt1 + 8;
    TrackEncryptionBox localTrackEncryptionBox = null;
    if (i - paramInt1 < paramInt2)
    {
      paramParsableByteArray.setPosition(i);
      int j = paramParsableByteArray.readInt();
      int k = paramParsableByteArray.readInt();
      if (k == Atom.TYPE_frma)
        paramParsableByteArray.readInt();
      while (true)
      {
        i += j;
        break;
        if (k == Atom.TYPE_schm)
        {
          paramParsableByteArray.skip(4);
          paramParsableByteArray.readInt();
          paramParsableByteArray.readInt();
        }
        else if (k == Atom.TYPE_schi)
        {
          localTrackEncryptionBox = parseSchiFromParent(paramParsableByteArray, i, j);
        }
      }
    }
    return localTrackEncryptionBox;
  }

  public static Mp4TrackSampleTable parseStbl(Track paramTrack, Atom.ContainerAtom paramContainerAtom)
  {
    ParsableByteArray localParsableByteArray1 = paramContainerAtom.getLeafAtomOfType(Atom.TYPE_stsz).data;
    Atom.LeafAtom localLeafAtom1 = paramContainerAtom.getLeafAtomOfType(Atom.TYPE_stco);
    if (localLeafAtom1 == null)
      localLeafAtom1 = paramContainerAtom.getLeafAtomOfType(Atom.TYPE_co64);
    ParsableByteArray localParsableByteArray2 = localLeafAtom1.data;
    ParsableByteArray localParsableByteArray3 = paramContainerAtom.getLeafAtomOfType(Atom.TYPE_stsc).data;
    ParsableByteArray localParsableByteArray4 = paramContainerAtom.getLeafAtomOfType(Atom.TYPE_stts).data;
    Atom.LeafAtom localLeafAtom2 = paramContainerAtom.getLeafAtomOfType(Atom.TYPE_stss);
    ParsableByteArray localParsableByteArray5;
    ParsableByteArray localParsableByteArray6;
    label103: int i;
    int[] arrayOfInt1;
    long[] arrayOfLong1;
    long[] arrayOfLong2;
    int[] arrayOfInt2;
    boolean bool1;
    label187: int i3;
    int i4;
    int i5;
    int i7;
    int i9;
    int i10;
    label301: label329: int i12;
    long l1;
    label380: int i13;
    label386: int i14;
    label411: int i15;
    if (localLeafAtom2 != null)
    {
      localParsableByteArray5 = localLeafAtom2.data;
      Atom.LeafAtom localLeafAtom3 = paramContainerAtom.getLeafAtomOfType(Atom.TYPE_ctts);
      if (localLeafAtom3 == null)
        break label647;
      localParsableByteArray6 = localLeafAtom3.data;
      localParsableByteArray1.setPosition(12);
      i = localParsableByteArray1.readUnsignedIntToInt();
      int j = localParsableByteArray1.readUnsignedIntToInt();
      arrayOfInt1 = new int[j];
      arrayOfLong1 = new long[j];
      arrayOfLong2 = new long[j];
      arrayOfInt2 = new int[j];
      localParsableByteArray2.setPosition(12);
      int k = localParsableByteArray2.readUnsignedIntToInt();
      localParsableByteArray3.setPosition(12);
      int m = -1 + localParsableByteArray3.readUnsignedIntToInt();
      if (localParsableByteArray3.readInt() != 1)
        break label653;
      bool1 = true;
      Assertions.checkState(bool1, "stsc first chunk must be 1");
      int n = localParsableByteArray3.readUnsignedIntToInt();
      localParsableByteArray3.skip(4);
      int i1 = -1;
      if (m > 0)
        i1 = -1 + localParsableByteArray3.readUnsignedIntToInt();
      int i2 = 0;
      i3 = n;
      localParsableByteArray4.setPosition(12);
      i4 = -1 + localParsableByteArray4.readUnsignedIntToInt();
      i5 = localParsableByteArray4.readUnsignedIntToInt();
      int i6 = localParsableByteArray4.readUnsignedIntToInt();
      i7 = 0;
      int i8 = 0;
      i9 = 0;
      i10 = 0;
      if (localParsableByteArray6 != null)
      {
        localParsableByteArray6.setPosition(8);
        if (Mp4Util.parseFullAtomVersion(localParsableByteArray6.readInt()) != 1)
          break label659;
        i7 = 1;
        i9 = -1 + localParsableByteArray6.readUnsignedIntToInt();
        i8 = localParsableByteArray6.readUnsignedIntToInt();
        if (i7 == 0)
          break label665;
        i10 = localParsableByteArray6.readInt();
      }
      int i11 = -1;
      i12 = 0;
      if (localParsableByteArray5 != null)
      {
        localParsableByteArray5.setPosition(12);
        i12 = localParsableByteArray5.readUnsignedIntToInt();
        i11 = -1 + localParsableByteArray5.readUnsignedIntToInt();
      }
      if (localLeafAtom1.type != Atom.TYPE_stco)
        break label675;
      l1 = localParsableByteArray2.readUnsignedInt();
      long l2 = 0L;
      i13 = 0;
      if (i13 >= j)
        break label732;
      arrayOfLong2[i13] = l1;
      if (i != 0)
        break label685;
      i14 = localParsableByteArray1.readUnsignedIntToInt();
      arrayOfInt1[i13] = i14;
      arrayOfLong1[i13] = (l2 + i10);
      if (localParsableByteArray5 != null)
        break label692;
      i15 = 1;
      label437: arrayOfInt2[i13] = i15;
      if (i13 == i11)
      {
        arrayOfInt2[i13] = 1;
        i12--;
        if (i12 > 0)
          i11 = -1 + localParsableByteArray5.readUnsignedIntToInt();
      }
      l2 += i6;
      i5--;
      if ((i5 == 0) && (i4 > 0))
      {
        i5 = localParsableByteArray4.readUnsignedIntToInt();
        i6 = localParsableByteArray4.readUnsignedIntToInt();
        i4--;
      }
      if (localParsableByteArray6 != null)
      {
        i8--;
        if ((i8 == 0) && (i9 > 0))
        {
          i8 = localParsableByteArray6.readUnsignedIntToInt();
          if (i7 == 0)
            break label698;
          i10 = localParsableByteArray6.readInt();
          label549: i9--;
        }
      }
      i3--;
      if (i3 != 0)
        break label718;
      i2++;
      if (i2 < k)
      {
        if (localLeafAtom1.type != Atom.TYPE_stco)
          break label708;
        l1 = localParsableByteArray2.readUnsignedInt();
      }
      label587: if (i2 == i1)
      {
        n = localParsableByteArray3.readUnsignedIntToInt();
        localParsableByteArray3.skip(4);
        m--;
        if (m > 0)
          i1 = -1 + localParsableByteArray3.readUnsignedIntToInt();
      }
      if (i2 < k)
        i3 = n;
    }
    while (true)
    {
      i13++;
      break label386;
      localParsableByteArray5 = null;
      break;
      label647: localParsableByteArray6 = null;
      break label103;
      label653: bool1 = false;
      break label187;
      label659: i7 = 0;
      break label301;
      label665: i10 = localParsableByteArray6.readUnsignedIntToInt();
      break label329;
      label675: l1 = localParsableByteArray2.readUnsignedLongToLong();
      break label380;
      label685: i14 = i;
      break label411;
      label692: i15 = 0;
      break label437;
      label698: i10 = localParsableByteArray6.readUnsignedIntToInt();
      break label549;
      label708: l1 = localParsableByteArray2.readUnsignedLongToLong();
      break label587;
      label718: l1 += arrayOfInt1[i13];
    }
    label732: Util.scaleLargeTimestampsInPlace(arrayOfLong1, 1000000L, paramTrack.timescale);
    boolean bool2;
    boolean bool3;
    label765: boolean bool4;
    label778: boolean bool5;
    if (i12 == 0)
    {
      bool2 = true;
      Assertions.checkArgument(bool2);
      if (i5 != 0)
        break label835;
      bool3 = true;
      Assertions.checkArgument(bool3);
      if (i3 != 0)
        break label841;
      bool4 = true;
      Assertions.checkArgument(bool4);
      if (i4 != 0)
        break label847;
      bool5 = true;
      label791: Assertions.checkArgument(bool5);
      if (i9 != 0)
        break label853;
    }
    label835: label841: label847: label853: for (boolean bool6 = true; ; bool6 = false)
    {
      Assertions.checkArgument(bool6);
      Mp4TrackSampleTable localMp4TrackSampleTable = new Mp4TrackSampleTable(arrayOfLong2, arrayOfInt1, arrayOfLong1, arrayOfInt2);
      return localMp4TrackSampleTable;
      bool2 = false;
      break;
      bool3 = false;
      break label765;
      bool4 = false;
      break label778;
      bool5 = false;
      break label791;
    }
  }

  private static Pair<MediaFormat, TrackEncryptionBox[]> parseStsd(ParsableByteArray paramParsableByteArray)
  {
    paramParsableByteArray.setPosition(12);
    int i = paramParsableByteArray.readInt();
    MediaFormat localMediaFormat = null;
    TrackEncryptionBox[] arrayOfTrackEncryptionBox = new TrackEncryptionBox[i];
    int j = 0;
    if (j < i)
    {
      int k = paramParsableByteArray.getPosition();
      int m = paramParsableByteArray.readInt();
      boolean bool;
      label47: int n;
      if (m > 0)
      {
        bool = true;
        Assertions.checkArgument(bool, "childAtomSize should be positive");
        n = paramParsableByteArray.readInt();
        if ((n != Atom.TYPE_avc1) && (n != Atom.TYPE_avc3) && (n != Atom.TYPE_encv))
          break label136;
        Pair localPair1 = parseAvcFromParent(paramParsableByteArray, k, m);
        localMediaFormat = (MediaFormat)localPair1.first;
        arrayOfTrackEncryptionBox[j] = ((TrackEncryptionBox)localPair1.second);
      }
      while (true)
      {
        paramParsableByteArray.setPosition(k + m);
        j++;
        break;
        bool = false;
        break label47;
        label136: if ((n == Atom.TYPE_mp4a) || (n == Atom.TYPE_enca) || (n == Atom.TYPE_ac_3))
        {
          Pair localPair2 = parseAudioSampleEntry(paramParsableByteArray, n, k, m);
          localMediaFormat = (MediaFormat)localPair2.first;
          arrayOfTrackEncryptionBox[j] = ((TrackEncryptionBox)localPair2.second);
        }
        else if (n == Atom.TYPE_TTML)
        {
          localMediaFormat = MediaFormat.createTtmlFormat();
        }
        else if (n == Atom.TYPE_mp4v)
        {
          localMediaFormat = parseMp4vFromParent(paramParsableByteArray, k, m);
        }
      }
    }
    return Pair.create(localMediaFormat, arrayOfTrackEncryptionBox);
  }

  private static Pair<Integer, Long> parseTkhd(ParsableByteArray paramParsableByteArray)
  {
    int i = 4;
    paramParsableByteArray.setPosition(8);
    int j = Mp4Util.parseFullAtomVersion(paramParsableByteArray.readInt());
    int k;
    int m;
    int n;
    int i1;
    if (j == 0)
    {
      k = 8;
      paramParsableByteArray.skip(k);
      m = paramParsableByteArray.readInt();
      paramParsableByteArray.skip(i);
      n = 1;
      i1 = paramParsableByteArray.getPosition();
      if (j != 0)
        break label113;
    }
    label52: for (int i2 = 0; ; i2++)
      if (i2 < i)
      {
        if (paramParsableByteArray.data[(i1 + i2)] != -1)
          n = 0;
      }
      else
      {
        if (n == 0)
          break label125;
        paramParsableByteArray.skip(i);
        l = -1L;
        return Pair.create(Integer.valueOf(m), Long.valueOf(l));
        k = 16;
        break;
        label113: i = 8;
        break label52;
      }
    label125: if (j == 0);
    for (long l = paramParsableByteArray.readUnsignedInt(); ; l = paramParsableByteArray.readUnsignedLongToLong())
      break;
  }

  public static Track parseTrak(Atom.ContainerAtom paramContainerAtom, Atom.LeafAtom paramLeafAtom)
  {
    Atom.ContainerAtom localContainerAtom1 = paramContainerAtom.getContainerAtomOfType(Atom.TYPE_mdia);
    int i = parseHdlr(localContainerAtom1.getLeafAtomOfType(Atom.TYPE_hdlr).data);
    boolean bool;
    int j;
    long l1;
    long l2;
    if ((i == 1936684398) || (i == 1986618469) || (i == 1952807028) || (i == 1953325924))
    {
      bool = true;
      Assertions.checkState(bool);
      Pair localPair1 = parseTkhd(paramContainerAtom.getLeafAtomOfType(Atom.TYPE_tkhd).data);
      j = ((Integer)localPair1.first).intValue();
      l1 = ((Long)localPair1.second).longValue();
      l2 = parseMvhd(paramLeafAtom.data);
      if (l1 != -1L)
        break label205;
    }
    label205: for (long l3 = -1L; ; l3 = Util.scaleLargeTimestamp(l1, 1000000L, l2))
    {
      Atom.ContainerAtom localContainerAtom2 = localContainerAtom1.getContainerAtomOfType(Atom.TYPE_minf).getContainerAtomOfType(Atom.TYPE_stbl);
      long l4 = parseMdhd(localContainerAtom1.getLeafAtomOfType(Atom.TYPE_mdhd).data);
      Pair localPair2 = parseStsd(localContainerAtom2.getLeafAtomOfType(Atom.TYPE_stsd).data);
      return new Track(j, i, l4, l3, (MediaFormat)localPair2.first, (TrackEncryptionBox[])localPair2.second);
      bool = false;
      break;
    }
  }

  private static final class Ac3Format
  {
    public final int bitrate;
    public final int channelCount;
    public final int sampleRate;

    public Ac3Format(int paramInt1, int paramInt2, int paramInt3)
    {
      this.channelCount = paramInt1;
      this.sampleRate = paramInt2;
      this.bitrate = paramInt3;
    }
  }
}