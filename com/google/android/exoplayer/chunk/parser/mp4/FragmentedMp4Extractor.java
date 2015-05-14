package com.google.android.exoplayer.chunk.parser.mp4;

import android.annotation.SuppressLint;
import com.google.android.exoplayer.CryptoInfo;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.chunk.parser.Extractor;
import com.google.android.exoplayer.chunk.parser.SegmentIndex;
import com.google.android.exoplayer.mp4.Atom;
import com.google.android.exoplayer.mp4.Atom.ContainerAtom;
import com.google.android.exoplayer.mp4.Atom.LeafAtom;
import com.google.android.exoplayer.mp4.CommonMp4AtomParsers;
import com.google.android.exoplayer.mp4.Mp4Util;
import com.google.android.exoplayer.mp4.Track;
import com.google.android.exoplayer.upstream.NonBlockingInputStream;
import com.google.android.exoplayer.util.ParsableByteArray;
import com.google.android.exoplayer.util.Util;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Stack;
import java.util.UUID;

public final class FragmentedMp4Extractor
  implements Extractor
{
  private static final Set<Integer> CONTAINER_TYPES = Collections.unmodifiableSet(localHashSet2);
  private static final Set<Integer> PARSED_ATOMS;
  private static final byte[] PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE = { -94, 57, 79, 82, 90, -101, 79, 20, -94, 68, 108, 66, 124, 100, -115, -12 };
  private static final int READ_TERMINATING_RESULTS = 39;
  private static final int STATE_READING_ATOM_HEADER = 0;
  private static final int STATE_READING_ATOM_PAYLOAD = 1;
  private static final int STATE_READING_ENCRYPTION_DATA = 2;
  private static final int STATE_READING_SAMPLE = 3;
  public static final int WORKAROUND_EVERY_VIDEO_FRAME_IS_SYNC_FRAME = 1;
  private int atomBytesRead;
  private ParsableByteArray atomData;
  private final ParsableByteArray atomHeader;
  private int atomSize;
  private int atomType;
  private final Stack<Atom.ContainerAtom> containerAtoms;
  private final byte[] extendedTypeScratch;
  private DefaultSampleValues extendsDefaults;
  private final TrackFragment fragmentRun;
  private int lastSyncSampleIndex;
  private int parserState;
  private int pendingSeekSyncSampleIndex;
  private int pendingSeekTimeMs;
  private final HashMap<UUID, byte[]> psshData;
  private int rootAtomBytesRead;
  private int sampleIndex;
  private SegmentIndex segmentIndex;
  private Track track;
  private final int workaroundFlags;

  static
  {
    HashSet localHashSet1 = new HashSet();
    localHashSet1.add(Integer.valueOf(Atom.TYPE_avc1));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_avc3));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_esds));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_hdlr));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_mdat));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_mdhd));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_moof));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_moov));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_mp4a));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_mvhd));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_sidx));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_stsd));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_tfdt));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_tfhd));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_tkhd));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_traf));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_trak));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_trex));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_trun));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_mvex));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_mdia));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_minf));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_stbl));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_pssh));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_saiz));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_uuid));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_senc));
    localHashSet1.add(Integer.valueOf(Atom.TYPE_pasp));
    PARSED_ATOMS = Collections.unmodifiableSet(localHashSet1);
    HashSet localHashSet2 = new HashSet();
    localHashSet2.add(Integer.valueOf(Atom.TYPE_moov));
    localHashSet2.add(Integer.valueOf(Atom.TYPE_trak));
    localHashSet2.add(Integer.valueOf(Atom.TYPE_mdia));
    localHashSet2.add(Integer.valueOf(Atom.TYPE_minf));
    localHashSet2.add(Integer.valueOf(Atom.TYPE_stbl));
    localHashSet2.add(Integer.valueOf(Atom.TYPE_avcC));
    localHashSet2.add(Integer.valueOf(Atom.TYPE_moof));
    localHashSet2.add(Integer.valueOf(Atom.TYPE_traf));
    localHashSet2.add(Integer.valueOf(Atom.TYPE_mvex));
  }

  public FragmentedMp4Extractor()
  {
    this(0);
  }

  public FragmentedMp4Extractor(int paramInt)
  {
    this.workaroundFlags = paramInt;
    this.parserState = 0;
    this.atomHeader = new ParsableByteArray(8);
    this.extendedTypeScratch = new byte[16];
    this.containerAtoms = new Stack();
    this.fragmentRun = new TrackFragment();
    this.psshData = new HashMap();
  }

  private void enterState(int paramInt)
  {
    switch (paramInt)
    {
    default:
    case 0:
    }
    while (true)
    {
      this.parserState = paramInt;
      return;
      this.atomBytesRead = 0;
      if (this.containerAtoms.isEmpty())
        this.rootAtomBytesRead = 0;
    }
  }

  private int onContainerAtomRead(Atom.ContainerAtom paramContainerAtom)
  {
    if (paramContainerAtom.type == Atom.TYPE_moov)
    {
      onMoovContainerAtomRead(paramContainerAtom);
      return 8;
    }
    if (paramContainerAtom.type == Atom.TYPE_moof)
      onMoofContainerAtomRead(paramContainerAtom);
    while (true)
    {
      return 0;
      if (!this.containerAtoms.isEmpty())
        ((Atom.ContainerAtom)this.containerAtoms.peek()).add(paramContainerAtom);
    }
  }

  private int onLeafAtomRead(Atom.LeafAtom paramLeafAtom)
  {
    if (!this.containerAtoms.isEmpty())
      ((Atom.ContainerAtom)this.containerAtoms.peek()).add(paramLeafAtom);
    while (paramLeafAtom.type != Atom.TYPE_sidx)
      return 0;
    this.segmentIndex = parseSidx(paramLeafAtom.data);
    return 16;
  }

  private void onMoofContainerAtomRead(Atom.ContainerAtom paramContainerAtom)
  {
    this.fragmentRun.reset();
    parseMoof(this.track, this.extendsDefaults, paramContainerAtom, this.fragmentRun, this.workaroundFlags, this.extendedTypeScratch);
    this.sampleIndex = 0;
    this.lastSyncSampleIndex = 0;
    this.pendingSeekSyncSampleIndex = 0;
    if (this.pendingSeekTimeMs != 0)
    {
      for (int i = 0; i < this.fragmentRun.length; i++)
        if ((this.fragmentRun.sampleIsSyncFrameTable[i] != 0) && (this.fragmentRun.getSamplePresentationTime(i) <= this.pendingSeekTimeMs))
          this.pendingSeekSyncSampleIndex = i;
      this.pendingSeekTimeMs = 0;
    }
  }

  private void onMoovContainerAtomRead(Atom.ContainerAtom paramContainerAtom)
  {
    List localList = paramContainerAtom.leafChildren;
    int i = localList.size();
    for (int j = 0; j < i; j++)
    {
      Atom.LeafAtom localLeafAtom = (Atom.LeafAtom)localList.get(j);
      if (localLeafAtom.type == Atom.TYPE_pssh)
      {
        ParsableByteArray localParsableByteArray = localLeafAtom.data;
        localParsableByteArray.setPosition(12);
        UUID localUUID = new UUID(localParsableByteArray.readLong(), localParsableByteArray.readLong());
        int k = localParsableByteArray.readInt();
        byte[] arrayOfByte = new byte[k];
        localParsableByteArray.readBytes(arrayOfByte, 0, k);
        this.psshData.put(localUUID, arrayOfByte);
      }
    }
    this.extendsDefaults = parseTrex(paramContainerAtom.getContainerAtomOfType(Atom.TYPE_mvex).getLeafAtomOfType(Atom.TYPE_trex).data);
    this.track = CommonMp4AtomParsers.parseTrak(paramContainerAtom.getContainerAtomOfType(Atom.TYPE_trak), paramContainerAtom.getLeafAtomOfType(Atom.TYPE_mvhd));
  }

  private static void parseMoof(Track paramTrack, DefaultSampleValues paramDefaultSampleValues, Atom.ContainerAtom paramContainerAtom, TrackFragment paramTrackFragment, int paramInt, byte[] paramArrayOfByte)
  {
    parseTraf(paramTrack, paramDefaultSampleValues, paramContainerAtom.getContainerAtomOfType(Atom.TYPE_traf), paramTrackFragment, paramInt, paramArrayOfByte);
  }

  private static void parseSaiz(TrackEncryptionBox paramTrackEncryptionBox, ParsableByteArray paramParsableByteArray, TrackFragment paramTrackFragment)
  {
    int i = paramTrackEncryptionBox.initializationVectorSize;
    paramParsableByteArray.setPosition(8);
    if ((0x1 & Mp4Util.parseFullAtomFlags(paramParsableByteArray.readInt())) == 1)
      paramParsableByteArray.skip(8);
    int j = paramParsableByteArray.readUnsignedByte();
    int k = paramParsableByteArray.readUnsignedIntToInt();
    if (k != paramTrackFragment.length)
      throw new IllegalStateException("Length mismatch: " + k + ", " + paramTrackFragment.length);
    int m = 0;
    if (j == 0)
    {
      boolean[] arrayOfBoolean = paramTrackFragment.sampleHasSubsampleEncryptionTable;
      int n = 0;
      if (n < k)
      {
        int i1 = paramParsableByteArray.readUnsignedByte();
        m += i1;
        if (i1 > i);
        for (int i2 = 1; ; i2 = 0)
        {
          arrayOfBoolean[n] = i2;
          n++;
          break;
        }
      }
    }
    else
    {
      if (j <= i)
        break label195;
    }
    label195: for (boolean bool = true; ; bool = false)
    {
      m = 0 + j * k;
      Arrays.fill(paramTrackFragment.sampleHasSubsampleEncryptionTable, 0, k, bool);
      paramTrackFragment.initEncryptionData(m);
      return;
    }
  }

  private static void parseSenc(ParsableByteArray paramParsableByteArray, int paramInt, TrackFragment paramTrackFragment)
  {
    paramParsableByteArray.setPosition(paramInt + 8);
    int i = Mp4Util.parseFullAtomFlags(paramParsableByteArray.readInt());
    if ((i & 0x1) != 0)
      throw new IllegalStateException("Overriding TrackEncryptionBox parameters is unsupported");
    if ((i & 0x2) != 0);
    int j;
    for (boolean bool = true; ; bool = false)
    {
      j = paramParsableByteArray.readUnsignedIntToInt();
      if (j == paramTrackFragment.length)
        break;
      throw new IllegalStateException("Length mismatch: " + j + ", " + paramTrackFragment.length);
    }
    Arrays.fill(paramTrackFragment.sampleHasSubsampleEncryptionTable, 0, j, bool);
    paramTrackFragment.initEncryptionData(paramParsableByteArray.bytesLeft());
    paramTrackFragment.fillEncryptionData(paramParsableByteArray);
  }

  private static void parseSenc(ParsableByteArray paramParsableByteArray, TrackFragment paramTrackFragment)
  {
    parseSenc(paramParsableByteArray, 0, paramTrackFragment);
  }

  private static SegmentIndex parseSidx(ParsableByteArray paramParsableByteArray)
  {
    paramParsableByteArray.setPosition(8);
    int i = Mp4Util.parseFullAtomVersion(paramParsableByteArray.readInt());
    paramParsableByteArray.skip(4);
    long l1 = paramParsableByteArray.readUnsignedInt();
    long l2;
    long l3;
    int j;
    int[] arrayOfInt;
    long[] arrayOfLong1;
    long[] arrayOfLong2;
    long[] arrayOfLong3;
    long l4;
    long l5;
    long l6;
    if (i == 0)
    {
      l2 = paramParsableByteArray.readUnsignedInt();
      l3 = paramParsableByteArray.readUnsignedInt();
      paramParsableByteArray.skip(2);
      j = paramParsableByteArray.readUnsignedShort();
      arrayOfInt = new int[j];
      arrayOfLong1 = new long[j];
      arrayOfLong2 = new long[j];
      arrayOfLong3 = new long[j];
      l4 = l3;
      l5 = l2;
      l6 = Util.scaleLargeTimestamp(l5, 1000000L, l1);
    }
    for (int k = 0; ; k++)
    {
      if (k >= j)
        break label229;
      int m = paramParsableByteArray.readInt();
      if ((0x80000000 & m) != 0)
      {
        throw new IllegalStateException("Unhandled indirect reference");
        l2 = paramParsableByteArray.readUnsignedLongToLong();
        l3 = paramParsableByteArray.readUnsignedLongToLong();
        break;
      }
      long l7 = paramParsableByteArray.readUnsignedInt();
      arrayOfInt[k] = (0x7FFFFFFF & m);
      arrayOfLong1[k] = l4;
      arrayOfLong3[k] = l6;
      l5 += l7;
      l6 = Util.scaleLargeTimestamp(l5, 1000000L, l1);
      arrayOfLong2[k] = (l6 - arrayOfLong3[k]);
      paramParsableByteArray.skip(4);
      l4 += arrayOfInt[k];
    }
    label229: return new SegmentIndex(paramParsableByteArray.limit(), arrayOfInt, arrayOfLong1, arrayOfLong2, arrayOfLong3);
  }

  private static long parseTfdt(ParsableByteArray paramParsableByteArray)
  {
    paramParsableByteArray.setPosition(8);
    if (Mp4Util.parseFullAtomVersion(paramParsableByteArray.readInt()) == 1)
      return paramParsableByteArray.readUnsignedLongToLong();
    return paramParsableByteArray.readUnsignedInt();
  }

  private static DefaultSampleValues parseTfhd(DefaultSampleValues paramDefaultSampleValues, ParsableByteArray paramParsableByteArray)
  {
    paramParsableByteArray.setPosition(8);
    int i = Mp4Util.parseFullAtomFlags(paramParsableByteArray.readInt());
    paramParsableByteArray.skip(4);
    if ((i & 0x1) != 0)
      paramParsableByteArray.skip(8);
    int j;
    int k;
    label57: int m;
    if ((i & 0x2) != 0)
    {
      j = -1 + paramParsableByteArray.readUnsignedIntToInt();
      if ((i & 0x8) == 0)
        break label106;
      k = paramParsableByteArray.readUnsignedIntToInt();
      if ((i & 0x10) == 0)
        break label115;
      m = paramParsableByteArray.readUnsignedIntToInt();
      label70: if ((i & 0x20) == 0)
        break label124;
    }
    label106: label115: label124: for (int n = paramParsableByteArray.readUnsignedIntToInt(); ; n = paramDefaultSampleValues.flags)
    {
      return new DefaultSampleValues(j, k, m, n);
      j = paramDefaultSampleValues.sampleDescriptionIndex;
      break;
      k = paramDefaultSampleValues.duration;
      break label57;
      m = paramDefaultSampleValues.size;
      break label70;
    }
  }

  private static void parseTraf(Track paramTrack, DefaultSampleValues paramDefaultSampleValues, Atom.ContainerAtom paramContainerAtom, TrackFragment paramTrackFragment, int paramInt, byte[] paramArrayOfByte)
  {
    if (paramContainerAtom.getLeafAtomOfType(Atom.TYPE_tfdt) == null);
    for (long l = 0L; ; l = parseTfdt(paramContainerAtom.getLeafAtomOfType(Atom.TYPE_tfdt).data))
    {
      DefaultSampleValues localDefaultSampleValues = parseTfhd(paramDefaultSampleValues, paramContainerAtom.getLeafAtomOfType(Atom.TYPE_tfhd).data);
      paramTrackFragment.sampleDescriptionIndex = localDefaultSampleValues.sampleDescriptionIndex;
      parseTrun(paramTrack, localDefaultSampleValues, l, paramInt, paramContainerAtom.getLeafAtomOfType(Atom.TYPE_trun).data, paramTrackFragment);
      Atom.LeafAtom localLeafAtom1 = paramContainerAtom.getLeafAtomOfType(Atom.TYPE_saiz);
      if (localLeafAtom1 != null)
        parseSaiz(paramTrack.sampleDescriptionEncryptionBoxes[localDefaultSampleValues.sampleDescriptionIndex], localLeafAtom1.data, paramTrackFragment);
      Atom.LeafAtom localLeafAtom2 = paramContainerAtom.getLeafAtomOfType(Atom.TYPE_senc);
      if (localLeafAtom2 != null)
        parseSenc(localLeafAtom2.data, paramTrackFragment);
      int i = paramContainerAtom.leafChildren.size();
      for (int j = 0; j < i; j++)
      {
        Atom.LeafAtom localLeafAtom3 = (Atom.LeafAtom)paramContainerAtom.leafChildren.get(j);
        if (localLeafAtom3.type == Atom.TYPE_uuid)
          parseUuid(localLeafAtom3.data, paramTrackFragment, paramArrayOfByte);
      }
    }
  }

  private static DefaultSampleValues parseTrex(ParsableByteArray paramParsableByteArray)
  {
    paramParsableByteArray.setPosition(16);
    return new DefaultSampleValues(-1 + paramParsableByteArray.readUnsignedIntToInt(), paramParsableByteArray.readUnsignedIntToInt(), paramParsableByteArray.readUnsignedIntToInt(), paramParsableByteArray.readInt());
  }

  private static void parseTrun(Track paramTrack, DefaultSampleValues paramDefaultSampleValues, long paramLong, int paramInt, ParsableByteArray paramParsableByteArray, TrackFragment paramTrackFragment)
  {
    paramParsableByteArray.setPosition(8);
    int i = Mp4Util.parseFullAtomFlags(paramParsableByteArray.readInt());
    int j = paramParsableByteArray.readUnsignedIntToInt();
    if ((i & 0x1) != 0)
      paramParsableByteArray.skip(4);
    int k;
    int n;
    label77: int i1;
    label89: int i2;
    label101: int i3;
    label113: int[] arrayOfInt2;
    boolean[] arrayOfBoolean;
    long l2;
    int i4;
    label178: int i5;
    label181: int i6;
    label200: int i7;
    label212: int i8;
    if ((i & 0x4) != 0)
    {
      k = 1;
      int m = paramDefaultSampleValues.flags;
      if (k != 0)
        m = paramParsableByteArray.readUnsignedIntToInt();
      if ((i & 0x100) == 0)
        break label321;
      n = 1;
      if ((i & 0x200) == 0)
        break label327;
      i1 = 1;
      if ((i & 0x400) == 0)
        break label333;
      i2 = 1;
      if ((i & 0x800) == 0)
        break label339;
      i3 = 1;
      paramTrackFragment.initTables(j);
      int[] arrayOfInt1 = paramTrackFragment.sampleSizeTable;
      arrayOfInt2 = paramTrackFragment.sampleCompositionTimeOffsetTable;
      long[] arrayOfLong = paramTrackFragment.sampleDecodingTimeTable;
      arrayOfBoolean = paramTrackFragment.sampleIsSyncFrameTable;
      long l1 = paramTrack.timescale;
      l2 = paramLong;
      if ((paramTrack.type != 1986618469) || ((paramInt & 0x1) != 1))
        break label345;
      i4 = 1;
      i5 = 0;
      if (i5 >= j)
        return;
      if (n == 0)
        break label351;
      i6 = paramParsableByteArray.readUnsignedIntToInt();
      if (i1 == 0)
        break label360;
      i7 = paramParsableByteArray.readUnsignedIntToInt();
      if ((i5 != 0) || (k == 0))
        break label369;
      i8 = m;
      label226: if (i3 == 0)
        break label393;
      arrayOfInt2[i5] = ((int)(1000 * paramParsableByteArray.readInt() / l1));
      label250: arrayOfLong[i5] = (1000L * l2 / l1);
      arrayOfInt1[i5] = i7;
      if (((0x1 & i8 >> 16) != 0) || ((i4 != 0) && (i5 != 0)))
        break label402;
    }
    label393: label402: for (int i9 = 1; ; i9 = 0)
    {
      arrayOfBoolean[i5] = i9;
      l2 += i6;
      i5++;
      break label181;
      k = 0;
      break;
      label321: n = 0;
      break label77;
      label327: i1 = 0;
      break label89;
      label333: i2 = 0;
      break label101;
      label339: i3 = 0;
      break label113;
      label345: i4 = 0;
      break label178;
      label351: i6 = paramDefaultSampleValues.duration;
      break label200;
      label360: i7 = paramDefaultSampleValues.size;
      break label212;
      label369: if (i2 != 0)
      {
        i8 = paramParsableByteArray.readInt();
        break label226;
      }
      i8 = paramDefaultSampleValues.flags;
      break label226;
      arrayOfInt2[i5] = 0;
      break label250;
    }
  }

  private static void parseUuid(ParsableByteArray paramParsableByteArray, TrackFragment paramTrackFragment, byte[] paramArrayOfByte)
  {
    paramParsableByteArray.setPosition(8);
    paramParsableByteArray.readBytes(paramArrayOfByte, 0, 16);
    if (!Arrays.equals(paramArrayOfByte, PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE))
      return;
    parseSenc(paramParsableByteArray, 16, paramTrackFragment);
  }

  private int readAtomHeader(NonBlockingInputStream paramNonBlockingInputStream)
  {
    int i = 8 - this.atomBytesRead;
    int j = paramNonBlockingInputStream.read(this.atomHeader.data, this.atomBytesRead, i);
    if (j == -1)
      return 2;
    this.rootAtomBytesRead = (j + this.rootAtomBytesRead);
    this.atomBytesRead = (j + this.atomBytesRead);
    if (this.atomBytesRead != 8)
      return 1;
    this.atomHeader.setPosition(0);
    this.atomSize = this.atomHeader.readInt();
    this.atomType = this.atomHeader.readInt();
    if (this.atomType == Atom.TYPE_mdat)
    {
      if (this.fragmentRun.sampleEncryptionDataNeedsFill)
        enterState(2);
      while (true)
      {
        return 0;
        enterState(3);
      }
    }
    Integer localInteger = Integer.valueOf(this.atomType);
    if (PARSED_ATOMS.contains(localInteger))
      if (CONTAINER_TYPES.contains(localInteger))
      {
        enterState(0);
        this.containerAtoms.add(new Atom.ContainerAtom(this.atomType, -8 + (this.rootAtomBytesRead + this.atomSize)));
      }
    while (true)
    {
      return 0;
      this.atomData = new ParsableByteArray(this.atomSize);
      System.arraycopy(this.atomHeader.data, 0, this.atomData.data, 0, 8);
      enterState(1);
      continue;
      this.atomData = null;
      enterState(1);
    }
  }

  private int readAtomPayload(NonBlockingInputStream paramNonBlockingInputStream)
  {
    if (this.atomData != null);
    for (int i = paramNonBlockingInputStream.read(this.atomData.data, this.atomBytesRead, this.atomSize - this.atomBytesRead); i == -1; i = paramNonBlockingInputStream.skip(this.atomSize - this.atomBytesRead))
      return 2;
    this.rootAtomBytesRead = (i + this.rootAtomBytesRead);
    this.atomBytesRead = (i + this.atomBytesRead);
    if (this.atomBytesRead != this.atomSize)
      return 1;
    ParsableByteArray localParsableByteArray = this.atomData;
    int j = 0;
    if (localParsableByteArray != null)
      j = 0x0 | onLeafAtomRead(new Atom.LeafAtom(this.atomType, this.atomData));
    while ((!this.containerAtoms.isEmpty()) && (((Atom.ContainerAtom)this.containerAtoms.peek()).endByteOffset == this.rootAtomBytesRead))
      j |= onContainerAtomRead((Atom.ContainerAtom)this.containerAtoms.pop());
    enterState(0);
    return j;
  }

  private int readEncryptionData(NonBlockingInputStream paramNonBlockingInputStream)
  {
    if (!this.fragmentRun.fillEncryptionData(paramNonBlockingInputStream))
      return 1;
    enterState(3);
    return 0;
  }

  private int readOrSkipSample(NonBlockingInputStream paramNonBlockingInputStream, SampleHolder paramSampleHolder)
  {
    if (this.sampleIndex >= this.fragmentRun.length)
    {
      enterState(0);
      return 0;
    }
    int i = this.fragmentRun.sampleSizeTable[this.sampleIndex];
    if (paramNonBlockingInputStream.getAvailableByteCount() < i)
      return 1;
    if (this.sampleIndex < this.pendingSeekSyncSampleIndex)
      return skipSample(paramNonBlockingInputStream, i);
    return readSample(paramNonBlockingInputStream, i, paramSampleHolder);
  }

  private int readSample(NonBlockingInputStream paramNonBlockingInputStream, int paramInt, SampleHolder paramSampleHolder)
  {
    if (paramSampleHolder == null)
      return 32;
    paramSampleHolder.timeUs = (1000L * this.fragmentRun.getSamplePresentationTime(this.sampleIndex));
    paramSampleHolder.flags = 0;
    if (this.fragmentRun.sampleIsSyncFrameTable[this.sampleIndex] != 0)
    {
      paramSampleHolder.flags = (0x1 | paramSampleHolder.flags);
      this.lastSyncSampleIndex = this.sampleIndex;
    }
    if ((paramSampleHolder.data == null) || (paramSampleHolder.data.capacity() < paramInt))
      paramSampleHolder.replaceBuffer(paramInt);
    if (this.fragmentRun.definesEncryptionData)
      readSampleEncryptionData(this.fragmentRun.sampleEncryptionData, paramSampleHolder);
    ByteBuffer localByteBuffer = paramSampleHolder.data;
    if (localByteBuffer == null)
      paramNonBlockingInputStream.skip(paramInt);
    for (paramSampleHolder.size = 0; ; paramSampleHolder.size = paramInt)
    {
      this.sampleIndex = (1 + this.sampleIndex);
      enterState(3);
      return 4;
      paramNonBlockingInputStream.read(localByteBuffer, paramInt);
      if (this.track.type == 1986618469)
        Mp4Util.replaceLengthPrefixesWithAvcStartCodes(localByteBuffer, paramInt);
    }
  }

  @SuppressLint({"InlinedApi"})
  private void readSampleEncryptionData(ParsableByteArray paramParsableByteArray, SampleHolder paramSampleHolder)
  {
    TrackEncryptionBox localTrackEncryptionBox = this.track.sampleDescriptionEncryptionBoxes[this.fragmentRun.sampleDescriptionIndex];
    byte[] arrayOfByte1 = localTrackEncryptionBox.keyId;
    boolean bool = localTrackEncryptionBox.isEncrypted;
    int i = localTrackEncryptionBox.initializationVectorSize;
    int j = this.fragmentRun.sampleHasSubsampleEncryptionTable[this.sampleIndex];
    byte[] arrayOfByte2 = paramSampleHolder.cryptoInfo.iv;
    if ((arrayOfByte2 == null) || (arrayOfByte2.length != 16))
      arrayOfByte2 = new byte[16];
    paramParsableByteArray.readBytes(arrayOfByte2, 0, i);
    if (j != 0);
    int[] arrayOfInt1;
    int[] arrayOfInt2;
    for (int k = paramParsableByteArray.readUnsignedShort(); ; k = 1)
    {
      arrayOfInt1 = paramSampleHolder.cryptoInfo.numBytesOfClearData;
      if ((arrayOfInt1 == null) || (arrayOfInt1.length < k))
        arrayOfInt1 = new int[k];
      arrayOfInt2 = paramSampleHolder.cryptoInfo.numBytesOfEncryptedData;
      if ((arrayOfInt2 == null) || (arrayOfInt2.length < k))
        arrayOfInt2 = new int[k];
      if (j == 0)
        break;
      for (int n = 0; n < k; n++)
      {
        arrayOfInt1[n] = paramParsableByteArray.readUnsignedShort();
        arrayOfInt2[n] = paramParsableByteArray.readUnsignedIntToInt();
      }
    }
    arrayOfInt1[0] = 0;
    arrayOfInt2[0] = this.fragmentRun.sampleSizeTable[this.sampleIndex];
    CryptoInfo localCryptoInfo = paramSampleHolder.cryptoInfo;
    if (bool);
    for (int m = 1; ; m = 0)
    {
      localCryptoInfo.set(k, arrayOfInt1, arrayOfInt2, arrayOfByte1, arrayOfByte2, m);
      if (bool)
        paramSampleHolder.flags = (0x2 | paramSampleHolder.flags);
      return;
    }
  }

  private int skipSample(NonBlockingInputStream paramNonBlockingInputStream, int paramInt)
  {
    ParsableByteArray localParsableByteArray;
    int j;
    if (this.fragmentRun.definesEncryptionData)
    {
      localParsableByteArray = this.fragmentRun.sampleEncryptionData;
      int i = this.track.sampleDescriptionEncryptionBoxes[this.fragmentRun.sampleDescriptionIndex].initializationVectorSize;
      j = this.fragmentRun.sampleHasSubsampleEncryptionTable[this.sampleIndex];
      localParsableByteArray.skip(i);
      if (j == 0)
        break label112;
    }
    label112: for (int k = localParsableByteArray.readUnsignedShort(); ; k = 1)
    {
      if (j != 0)
        localParsableByteArray.skip(k * 6);
      paramNonBlockingInputStream.skip(paramInt);
      this.sampleIndex = (1 + this.sampleIndex);
      enterState(3);
      return 0;
    }
  }

  public long getDurationUs()
  {
    if (this.track == null)
      return -1L;
    return this.track.durationUs;
  }

  public MediaFormat getFormat()
  {
    if (this.track == null)
      return null;
    return this.track.mediaFormat;
  }

  public SegmentIndex getIndex()
  {
    return this.segmentIndex;
  }

  public Map<UUID, byte[]> getPsshInfo()
  {
    if (this.psshData.isEmpty())
      return null;
    return this.psshData;
  }

  public boolean hasRelativeIndexOffsets()
  {
    return true;
  }

  public int read(NonBlockingInputStream paramNonBlockingInputStream, SampleHolder paramSampleHolder)
    throws ParserException
  {
    int i = 0;
    while ((i & 0x27) == 0)
      try
      {
        switch (this.parserState)
        {
        default:
          i |= readOrSkipSample(paramNonBlockingInputStream, paramSampleHolder);
          break;
        case 0:
          i |= readAtomHeader(paramNonBlockingInputStream);
          break;
        case 1:
          i |= readAtomPayload(paramNonBlockingInputStream);
          break;
        case 2:
          int j = readEncryptionData(paramNonBlockingInputStream);
          i |= j;
        }
      }
      catch (Exception localException)
      {
        throw new ParserException(localException);
      }
    return i;
  }

  public boolean seekTo(long paramLong, boolean paramBoolean)
  {
    this.pendingSeekTimeMs = ((int)(paramLong / 1000L));
    if ((paramBoolean) && (this.fragmentRun != null) && (this.fragmentRun.length > 0) && (this.pendingSeekTimeMs >= this.fragmentRun.getSamplePresentationTime(0)) && (this.pendingSeekTimeMs <= this.fragmentRun.getSamplePresentationTime(-1 + this.fragmentRun.length)))
    {
      int i = 0;
      int j = 0;
      for (int k = 0; k < this.fragmentRun.length; k++)
        if (this.fragmentRun.getSamplePresentationTime(k) <= this.pendingSeekTimeMs)
        {
          if (this.fragmentRun.sampleIsSyncFrameTable[k] != 0)
            j = k;
          i = k;
        }
      if ((j == this.lastSyncSampleIndex) && (i >= this.sampleIndex))
      {
        this.pendingSeekTimeMs = 0;
        return false;
      }
    }
    this.containerAtoms.clear();
    enterState(0);
    return true;
  }

  public void setTrack(Track paramTrack)
  {
    this.extendsDefaults = new DefaultSampleValues(0, 0, 0, 0);
    this.track = paramTrack;
  }
}