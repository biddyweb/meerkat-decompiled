package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReaderVariable;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.OriginalFormatBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.ProtectionSchemeInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SchemeInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SchemeTypeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AbstractSampleEntry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AudioSampleEntry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.MemoryDataSourceImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Edit;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.cenc.CencEncryptingSampleList;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.CencSampleEncryptionInformationGroupEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.RangeStartMap;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.AvcConfigurationBox;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.HevcConfigurationBox;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat.Pair;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.TrackEncryptionBox;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import java.util.UUID;
import javax.crypto.SecretKey;

public class CencEncryptingTrackImpl
  implements CencEncryptedTrack
{
  List<CencSampleAuxiliaryDataFormat> cencSampleAuxiliaryData;
  UUID defaultKeyId;
  boolean dummyIvs = false;
  private final String encryptionAlgo;
  RangeStartMap<Integer, SecretKey> indexToKey;
  Map<UUID, SecretKey> keys = new HashMap();
  Map<GroupEntry, long[]> sampleGroups;
  List<Sample> samples;
  Track source;
  SampleDescriptionBox stsd = null;
  boolean subSampleEncryption = false;

  public CencEncryptingTrackImpl(Track paramTrack, UUID paramUUID, Map<UUID, SecretKey> paramMap, Map<CencSampleEncryptionInformationGroupEntry, long[]> paramMap1, String paramString, boolean paramBoolean)
  {
    this(paramTrack, paramUUID, paramMap, paramMap1, paramString, paramBoolean, false);
  }

  public CencEncryptingTrackImpl(Track paramTrack, UUID paramUUID, Map<UUID, SecretKey> paramMap, Map<CencSampleEncryptionInformationGroupEntry, long[]> paramMap1, String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    this.source = paramTrack;
    this.keys = paramMap;
    this.defaultKeyId = paramUUID;
    this.dummyIvs = paramBoolean1;
    this.encryptionAlgo = paramString;
    this.sampleGroups = new HashMap();
    Iterator localIterator1 = paramTrack.getSampleGroups().entrySet().iterator();
    while (localIterator1.hasNext())
    {
      Map.Entry localEntry2 = (Map.Entry)localIterator1.next();
      if (!(localEntry2.getKey() instanceof CencSampleEncryptionInformationGroupEntry))
        this.sampleGroups.put(localEntry2.getKey(), localEntry2.getValue());
    }
    if (paramMap1 != null)
    {
      Iterator localIterator3 = paramMap1.entrySet().iterator();
      while (localIterator3.hasNext())
      {
        Map.Entry localEntry1 = (Map.Entry)localIterator3.next();
        this.sampleGroups.put(localEntry1.getKey(), localEntry1.getValue());
      }
    }
    HashMap local1 = new HashMap(this.sampleGroups)
    {
      public long[] put(GroupEntry paramAnonymousGroupEntry, long[] paramAnonymousArrayOfLong)
      {
        if ((paramAnonymousGroupEntry instanceof CencSampleEncryptionInformationGroupEntry))
          throw new RuntimeException("Please supply CencSampleEncryptionInformationGroupEntries in the constructor");
        return (long[])super.put(paramAnonymousGroupEntry, paramAnonymousArrayOfLong);
      }
    };
    this.sampleGroups = local1;
    this.samples = paramTrack.getSamples();
    this.cencSampleAuxiliaryData = new ArrayList();
    BigInteger localBigInteger1 = new BigInteger("1");
    byte[] arrayOfByte1 = { 0, 0, 0, 0, 0, 0, 0, 0 };
    if (!paramBoolean1)
      new SecureRandom().nextBytes(arrayOfByte1);
    BigInteger localBigInteger2 = new BigInteger(1, arrayOfByte1);
    ArrayList localArrayList1 = new ArrayList();
    if (paramMap1 != null)
      localArrayList1.addAll(paramMap1.keySet());
    this.indexToKey = new RangeStartMap();
    int i = -1;
    int j = 0;
    if (j < paramTrack.getSamples().size())
    {
      int i6 = 0;
      for (int i7 = 0; ; i7++)
      {
        int i8 = localArrayList1.size();
        if (i7 >= i8)
          break;
        GroupEntry localGroupEntry = (GroupEntry)localArrayList1.get(i7);
        if (Arrays.binarySearch((long[])getSampleGroups().get(localGroupEntry), j) >= 0)
          i6 = i7 + 1;
      }
      if (i != i6)
      {
        if (i6 != 0)
          break label520;
        this.indexToKey.put(Integer.valueOf(j), paramMap.get(paramUUID));
      }
      while (true)
      {
        i = i6;
        j++;
        break;
        label520: if (((CencSampleEncryptionInformationGroupEntry)localArrayList1.get(i6 - 1)).getKid() != null)
        {
          SecretKey localSecretKey = (SecretKey)paramMap.get(((CencSampleEncryptionInformationGroupEntry)localArrayList1.get(i6 - 1)).getKid());
          if (localSecretKey == null)
          {
            RuntimeException localRuntimeException = new RuntimeException("Key " + ((CencSampleEncryptionInformationGroupEntry)localArrayList1.get(i6 - 1)).getKid() + " was not supplied for decryption");
            throw localRuntimeException;
          }
          this.indexToKey.put(Integer.valueOf(j), localSecretKey);
        }
        else
        {
          this.indexToKey.put(Integer.valueOf(j), null);
        }
      }
    }
    List localList = paramTrack.getSampleDescriptionBox().getSampleEntry().getBoxes();
    int k = -1;
    Iterator localIterator2 = localList.iterator();
    while (localIterator2.hasNext())
    {
      Box localBox = (Box)localIterator2.next();
      if ((localBox instanceof AvcConfigurationBox))
      {
        AvcConfigurationBox localAvcConfigurationBox = (AvcConfigurationBox)localBox;
        this.subSampleEncryption = true;
        k = 1 + localAvcConfigurationBox.getLengthSizeMinusOne();
      }
      if ((localBox instanceof HevcConfigurationBox))
      {
        HevcConfigurationBox localHevcConfigurationBox = (HevcConfigurationBox)localBox;
        this.subSampleEncryption = true;
        k = 1 + localHevcConfigurationBox.getLengthSizeMinusOne();
      }
    }
    int m = 0;
    if (m < this.samples.size())
    {
      Sample localSample = (Sample)this.samples.get(m);
      CencSampleAuxiliaryDataFormat localCencSampleAuxiliaryDataFormat = new CencSampleAuxiliaryDataFormat();
      this.cencSampleAuxiliaryData.add(localCencSampleAuxiliaryDataFormat);
      byte[] arrayOfByte2;
      int n;
      label910: int i1;
      label922: int i2;
      label934: ByteBuffer localByteBuffer;
      CencSampleAuxiliaryDataFormat.Pair[] arrayOfPair;
      if (this.indexToKey.get(Integer.valueOf(m)) != null)
      {
        arrayOfByte2 = localBigInteger2.toByteArray();
        byte[] arrayOfByte3 = { 0, 0, 0, 0, 0, 0, 0, 0 };
        if (-8 + arrayOfByte2.length <= 0)
          break label1024;
        n = -8 + arrayOfByte2.length;
        if (8 - arrayOfByte2.length >= 0)
          break label1030;
        i1 = 0;
        if (arrayOfByte2.length <= 8)
          break label1041;
        i2 = 8;
        System.arraycopy(arrayOfByte2, n, arrayOfByte3, i1, i2);
        localCencSampleAuxiliaryDataFormat.iv = arrayOfByte3;
        localByteBuffer = (ByteBuffer)localSample.asByteBuffer().rewind();
        if (this.subSampleEncryption)
        {
          if (!paramBoolean2)
            break label1049;
          arrayOfPair = new CencSampleAuxiliaryDataFormat.Pair[1];
          arrayOfPair[0] = localCencSampleAuxiliaryDataFormat.createPair(localByteBuffer.remaining(), 0L);
        }
      }
      label1024: label1030: label1041: label1049: ArrayList localArrayList2;
      for (localCencSampleAuxiliaryDataFormat.pairs = arrayOfPair; ; localCencSampleAuxiliaryDataFormat.pairs = ((CencSampleAuxiliaryDataFormat.Pair[])localArrayList2.toArray(new CencSampleAuxiliaryDataFormat.Pair[localArrayList2.size()])))
      {
        localBigInteger2 = localBigInteger2.add(localBigInteger1);
        m++;
        break;
        n = 0;
        break label910;
        i1 = 8 - arrayOfByte2.length;
        break label922;
        i2 = arrayOfByte2.length;
        break label934;
        localArrayList2 = new ArrayList(5);
        if (localByteBuffer.remaining() > 0)
        {
          int i3 = CastUtils.l2i(IsoTypeReaderVariable.read(localByteBuffer, k));
          int i4 = i3 + k;
          if (i4 >= 112);
          for (int i5 = 96 + i4 % 16; ; i5 = i4)
          {
            localArrayList2.add(localCencSampleAuxiliaryDataFormat.createPair(i5, i4 - i5));
            localByteBuffer.position(i3 + localByteBuffer.position());
            break;
          }
        }
      }
    }
    System.err.println("");
  }

  public CencEncryptingTrackImpl(Track paramTrack, UUID paramUUID, SecretKey paramSecretKey, boolean paramBoolean)
  {
    this(paramTrack, paramUUID, Collections.singletonMap(paramUUID, paramSecretKey), null, "cenc", paramBoolean);
  }

  public void close()
    throws IOException
  {
    this.source.close();
  }

  public List<CompositionTimeToSample.Entry> getCompositionTimeEntries()
  {
    return this.source.getCompositionTimeEntries();
  }

  public UUID getDefaultKeyId()
  {
    return this.defaultKeyId;
  }

  public long getDuration()
  {
    return this.source.getDuration();
  }

  public List<Edit> getEdits()
  {
    return this.source.getEdits();
  }

  public String getHandler()
  {
    return this.source.getHandler();
  }

  public String getName()
  {
    return "enc(" + this.source.getName() + ")";
  }

  public List<SampleDependencyTypeBox.Entry> getSampleDependencies()
  {
    return this.source.getSampleDependencies();
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    while (true)
    {
      int i;
      int j;
      UUID localUUID;
      try
      {
        ByteArrayOutputStream localByteArrayOutputStream;
        if (this.stsd == null)
          localByteArrayOutputStream = new ByteArrayOutputStream();
        try
        {
          this.source.getSampleDescriptionBox().getBox(Channels.newChannel(localByteArrayOutputStream));
          this.stsd = ((SampleDescriptionBox)new IsoFile(new MemoryDataSourceImpl(localByteArrayOutputStream.toByteArray())).getBoxes().get(0));
          OriginalFormatBox localOriginalFormatBox = new OriginalFormatBox();
          localOriginalFormatBox.setDataFormat(this.stsd.getSampleEntry().getType());
          if ((this.stsd.getSampleEntry() instanceof AudioSampleEntry))
          {
            ((AudioSampleEntry)this.stsd.getSampleEntry()).setType("enca");
            ProtectionSchemeInformationBox localProtectionSchemeInformationBox = new ProtectionSchemeInformationBox();
            localProtectionSchemeInformationBox.addBox(localOriginalFormatBox);
            SchemeTypeBox localSchemeTypeBox = new SchemeTypeBox();
            localSchemeTypeBox.setSchemeType(this.encryptionAlgo);
            localSchemeTypeBox.setSchemeVersion(65536);
            localProtectionSchemeInformationBox.addBox(localSchemeTypeBox);
            SchemeInformationBox localSchemeInformationBox = new SchemeInformationBox();
            TrackEncryptionBox localTrackEncryptionBox = new TrackEncryptionBox();
            if (this.defaultKeyId != null)
              break label378;
            i = 0;
            localTrackEncryptionBox.setDefaultIvSize(i);
            if (this.defaultKeyId != null)
              break label385;
            j = 0;
            localTrackEncryptionBox.setDefaultAlgorithmId(j);
            if (this.defaultKeyId != null)
              break label369;
            localUUID = new UUID(0L, 0L);
            localTrackEncryptionBox.setDefault_KID(localUUID);
            localSchemeInformationBox.addBox(localTrackEncryptionBox);
            localProtectionSchemeInformationBox.addBox(localSchemeInformationBox);
            this.stsd.getSampleEntry().addBox(localProtectionSchemeInformationBox);
            SampleDescriptionBox localSampleDescriptionBox = this.stsd;
            return localSampleDescriptionBox;
          }
        }
        catch (IOException localIOException)
        {
          throw new RuntimeException("Dumping stsd to memory failed");
        }
      }
      finally
      {
      }
      if ((this.stsd.getSampleEntry() instanceof VisualSampleEntry))
      {
        ((VisualSampleEntry)this.stsd.getSampleEntry()).setType("encv");
      }
      else
      {
        throw new RuntimeException("I don't know how to cenc " + this.stsd.getSampleEntry().getType());
        label369: localUUID = this.defaultKeyId;
        continue;
        label378: i = 8;
        continue;
        label385: j = 1;
      }
    }
  }

  public long[] getSampleDurations()
  {
    return this.source.getSampleDurations();
  }

  public List<CencSampleAuxiliaryDataFormat> getSampleEncryptionEntries()
  {
    return this.cencSampleAuxiliaryData;
  }

  public Map<GroupEntry, long[]> getSampleGroups()
  {
    return this.sampleGroups;
  }

  public List<Sample> getSamples()
  {
    return new CencEncryptingSampleList(this.indexToKey, this.source.getSamples(), this.cencSampleAuxiliaryData, this.encryptionAlgo);
  }

  public SubSampleInformationBox getSubsampleInformationBox()
  {
    return this.source.getSubsampleInformationBox();
  }

  public long[] getSyncSamples()
  {
    return this.source.getSyncSamples();
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.source.getTrackMetaData();
  }

  public boolean hasSubSampleEncryption()
  {
    return this.subSampleEncryption;
  }
}