package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.ChunkOffsetBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MovieBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleTableBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleToChunkBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SchemeTypeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieExtendsBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieFragmentBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackFragmentBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackFragmentHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackRunBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks.CencEncryptedTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Path;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part12.SampleAuxiliaryInformationOffsetsBox;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part12.SampleAuxiliaryInformationSizesBox;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat.Pair;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.TrackEncryptionBox;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

public class CencMp4TrackImplImpl extends Mp4TrackImpl
  implements CencEncryptedTrack
{
  private UUID defaultKeyId;
  private List<CencSampleAuxiliaryDataFormat> sampleEncryptionEntries;

  static
  {
    if (!CencMp4TrackImplImpl.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  public CencMp4TrackImplImpl(String paramString, TrackBox paramTrackBox, IsoFile[] paramArrayOfIsoFile)
    throws IOException
  {
    super(paramString, paramTrackBox, paramArrayOfIsoFile);
    SchemeTypeBox localSchemeTypeBox = (SchemeTypeBox)Path.getPath(paramTrackBox, "mdia[0]/minf[0]/stbl[0]/stsd[0]/enc.[0]/sinf[0]/schm[0]");
    assert ((localSchemeTypeBox != null) && ((localSchemeTypeBox.getSchemeType().equals("cenc")) || (localSchemeTypeBox.getSchemeType().equals("cbc1")))) : "Track must be CENC (cenc or cbc1) encrypted";
    this.sampleEncryptionEntries = new ArrayList();
    long l1 = paramTrackBox.getTrackHeaderBox().getTrackId();
    if (paramTrackBox.getParent().getBoxes(MovieExtendsBox.class).size() > 0)
    {
      Iterator localIterator1 = ((Box)paramTrackBox.getParent()).getParent().getBoxes(MovieFragmentBox.class).iterator();
      label130: if (localIterator1.hasNext())
      {
        MovieFragmentBox localMovieFragmentBox = (MovieFragmentBox)localIterator1.next();
        Iterator localIterator2 = localMovieFragmentBox.getBoxes(TrackFragmentBox.class).iterator();
        while (true)
        {
          if (!localIterator2.hasNext())
            break label130;
          TrackFragmentBox localTrackFragmentBox = (TrackFragmentBox)localIterator2.next();
          if (localTrackFragmentBox.getTrackFragmentHeaderBox().getTrackId() != l1)
            break;
          TrackEncryptionBox localTrackEncryptionBox2 = (TrackEncryptionBox)Path.getPath(paramTrackBox, "mdia[0]/minf[0]/stbl[0]/stsd[0]/enc.[0]/sinf[0]/schi[0]/tenc[0]");
          this.defaultKeyId = localTrackEncryptionBox2.getDefault_KID();
          Object localObject;
          if (localTrackFragmentBox.getTrackFragmentHeaderBox().hasBaseDataOffset())
            localObject = ((Box)paramTrackBox.getParent()).getParent();
          SampleAuxiliaryInformationOffsetsBox localSampleAuxiliaryInformationOffsetsBox2;
          SampleAuxiliaryInformationSizesBox localSampleAuxiliaryInformationSizesBox2;
          for (long l6 = localTrackFragmentBox.getTrackFragmentHeaderBox().getBaseDataOffset(); ; l6 = 0L)
          {
            FindSaioSaizPair localFindSaioSaizPair3 = new FindSaioSaizPair(localTrackFragmentBox);
            FindSaioSaizPair localFindSaioSaizPair4 = localFindSaioSaizPair3.invoke();
            localSampleAuxiliaryInformationOffsetsBox2 = localFindSaioSaizPair4.getSaio();
            localSampleAuxiliaryInformationSizesBox2 = localFindSaioSaizPair4.getSaiz();
            if (($assertionsDisabled) || (localSampleAuxiliaryInformationOffsetsBox2 != null))
              break;
            throw new AssertionError();
            localObject = localMovieFragmentBox;
          }
          long[] arrayOfLong2 = localSampleAuxiliaryInformationOffsetsBox2.getOffsets();
          assert (arrayOfLong2.length == localTrackFragmentBox.getBoxes(TrackRunBox.class).size());
          assert (localSampleAuxiliaryInformationSizesBox2 != null);
          List localList = localTrackFragmentBox.getBoxes(TrackRunBox.class);
          int i3 = 0;
          for (int i4 = 0; i4 < arrayOfLong2.length; i4++)
          {
            int i5 = ((TrackRunBox)localList.get(i4)).getEntries().size();
            long l7 = arrayOfLong2[i4];
            long l8 = 0L;
            for (int i6 = i3; ; i6++)
            {
              int i7 = i3 + i5;
              if (i6 >= i7)
                break;
              l8 += localSampleAuxiliaryInformationSizesBox2.getSize(i6);
            }
            ByteBuffer localByteBuffer3 = ((Container)localObject).getByteBuffer(l6 + l7, l8);
            for (int i8 = i3; ; i8++)
            {
              int i9 = i3 + i5;
              if (i8 >= i9)
                break;
              int i10 = localSampleAuxiliaryInformationSizesBox2.getSize(i8);
              this.sampleEncryptionEntries.add(parseCencAuxDataFormat(localTrackEncryptionBox2.getDefaultIvSize(), localByteBuffer3, i10));
            }
            i3 += i5;
          }
        }
      }
    }
    else
    {
      TrackEncryptionBox localTrackEncryptionBox1 = (TrackEncryptionBox)Path.getPath(paramTrackBox, "mdia[0]/minf[0]/stbl[0]/stsd[0]/enc.[0]/sinf[0]/schi[0]/tenc[0]");
      this.defaultKeyId = localTrackEncryptionBox1.getDefault_KID();
      ChunkOffsetBox localChunkOffsetBox = (ChunkOffsetBox)Path.getPath(paramTrackBox, "mdia[0]/minf[0]/stbl[0]/stco[0]");
      if (localChunkOffsetBox == null)
        localChunkOffsetBox = (ChunkOffsetBox)Path.getPath(paramTrackBox, "mdia[0]/minf[0]/stbl[0]/co64[0]");
      long[] arrayOfLong1 = paramTrackBox.getSampleTableBox().getSampleToChunkBox().blowup(localChunkOffsetBox.getChunkOffsets().length);
      FindSaioSaizPair localFindSaioSaizPair1 = new FindSaioSaizPair((Container)Path.getPath(paramTrackBox, "mdia[0]/minf[0]/stbl[0]"));
      FindSaioSaizPair localFindSaioSaizPair2 = localFindSaioSaizPair1.invoke();
      SampleAuxiliaryInformationOffsetsBox localSampleAuxiliaryInformationOffsetsBox1 = localFindSaioSaizPair2.saio;
      SampleAuxiliaryInformationSizesBox localSampleAuxiliaryInformationSizesBox1 = localFindSaioSaizPair2.saiz;
      Container localContainer = ((MovieBox)paramTrackBox.getParent()).getParent();
      if (localSampleAuxiliaryInformationOffsetsBox1.getOffsets().length == 1)
      {
        long l5 = localSampleAuxiliaryInformationOffsetsBox1.getOffsets()[0];
        int n = 0;
        if (localSampleAuxiliaryInformationSizesBox1.getDefaultSampleInfoSize() > 0)
          n = 0 + localSampleAuxiliaryInformationSizesBox1.getSampleCount() * localSampleAuxiliaryInformationSizesBox1.getDefaultSampleInfoSize();
        while (true)
        {
          ByteBuffer localByteBuffer2 = localContainer.getByteBuffer(l5, n);
          for (int i2 = 0; i2 < localSampleAuxiliaryInformationSizesBox1.getSampleCount(); i2++)
            this.sampleEncryptionEntries.add(parseCencAuxDataFormat(localTrackEncryptionBox1.getDefaultIvSize(), localByteBuffer2, localSampleAuxiliaryInformationSizesBox1.getSize(i2)));
          for (int i1 = 0; i1 < localSampleAuxiliaryInformationSizesBox1.getSampleCount(); i1++)
            n += localSampleAuxiliaryInformationSizesBox1.getSampleInfoSizes()[i1];
        }
      }
      if (localSampleAuxiliaryInformationOffsetsBox1.getOffsets().length == arrayOfLong1.length)
      {
        int i = 0;
        for (int j = 0; j < arrayOfLong1.length; j++)
        {
          long l2 = localSampleAuxiliaryInformationOffsetsBox1.getOffsets()[j];
          long l3 = 0L;
          if (localSampleAuxiliaryInformationSizesBox1.getDefaultSampleInfoSize() > 0)
            l3 += localSampleAuxiliaryInformationSizesBox1.getSampleCount() * arrayOfLong1[j];
          while (true)
          {
            ByteBuffer localByteBuffer1 = localContainer.getByteBuffer(l2, l3);
            for (int m = 0; m < arrayOfLong1[j]; m++)
            {
              long l4 = localSampleAuxiliaryInformationSizesBox1.getSize(i + m);
              this.sampleEncryptionEntries.add(parseCencAuxDataFormat(localTrackEncryptionBox1.getDefaultIvSize(), localByteBuffer1, l4));
            }
            for (int k = 0; k < arrayOfLong1[j]; k++)
              l3 += localSampleAuxiliaryInformationSizesBox1.getSize(i + k);
          }
          i = (int)(i + arrayOfLong1[j]);
        }
      }
      throw new RuntimeException("Number of saio offsets must be either 1 or number of chunks");
    }
  }

  private CencSampleAuxiliaryDataFormat parseCencAuxDataFormat(int paramInt, ByteBuffer paramByteBuffer, long paramLong)
  {
    CencSampleAuxiliaryDataFormat localCencSampleAuxiliaryDataFormat = new CencSampleAuxiliaryDataFormat();
    if (paramLong > 0L)
    {
      localCencSampleAuxiliaryDataFormat.iv = new byte[paramInt];
      paramByteBuffer.get(localCencSampleAuxiliaryDataFormat.iv);
      if (paramLong > paramInt)
      {
        localCencSampleAuxiliaryDataFormat.pairs = new CencSampleAuxiliaryDataFormat.Pair[IsoTypeReader.readUInt16(paramByteBuffer)];
        for (int i = 0; i < localCencSampleAuxiliaryDataFormat.pairs.length; i++)
          localCencSampleAuxiliaryDataFormat.pairs[i] = localCencSampleAuxiliaryDataFormat.createPair(IsoTypeReader.readUInt16(paramByteBuffer), IsoTypeReader.readUInt32(paramByteBuffer));
      }
    }
    return localCencSampleAuxiliaryDataFormat;
  }

  public UUID getDefaultKeyId()
  {
    return this.defaultKeyId;
  }

  public String getName()
  {
    return "enc(" + super.getName() + ")";
  }

  public List<CencSampleAuxiliaryDataFormat> getSampleEncryptionEntries()
  {
    return this.sampleEncryptionEntries;
  }

  public boolean hasSubSampleEncryption()
  {
    return false;
  }

  public String toString()
  {
    return "CencMp4TrackImpl{handler='" + getHandler() + '\'' + '}';
  }

  private class FindSaioSaizPair
  {
    private Container container;
    private SampleAuxiliaryInformationOffsetsBox saio;
    private SampleAuxiliaryInformationSizesBox saiz;

    static
    {
      if (!CencMp4TrackImplImpl.class.desiredAssertionStatus());
      for (boolean bool = true; ; bool = false)
      {
        $assertionsDisabled = bool;
        return;
      }
    }

    public FindSaioSaizPair(Container arg2)
    {
      Object localObject;
      this.container = localObject;
    }

    public SampleAuxiliaryInformationOffsetsBox getSaio()
    {
      return this.saio;
    }

    public SampleAuxiliaryInformationSizesBox getSaiz()
    {
      return this.saiz;
    }

    public FindSaioSaizPair invoke()
    {
      List localList1 = this.container.getBoxes(SampleAuxiliaryInformationSizesBox.class);
      List localList2 = this.container.getBoxes(SampleAuxiliaryInformationOffsetsBox.class);
      assert (localList1.size() == localList2.size());
      this.saiz = null;
      this.saio = null;
      int i = 0;
      if (i < localList1.size())
      {
        if (((this.saiz == null) && (((SampleAuxiliaryInformationSizesBox)localList1.get(i)).getAuxInfoType() == null)) || ("cenc".equals(((SampleAuxiliaryInformationSizesBox)localList1.get(i)).getAuxInfoType())))
        {
          this.saiz = ((SampleAuxiliaryInformationSizesBox)localList1.get(i));
          label133: if (((this.saio != null) || (((SampleAuxiliaryInformationOffsetsBox)localList2.get(i)).getAuxInfoType() != null)) && (!"cenc".equals(((SampleAuxiliaryInformationOffsetsBox)localList2.get(i)).getAuxInfoType())))
            break label262;
        }
        for (this.saio = ((SampleAuxiliaryInformationOffsetsBox)localList2.get(i)); ; this.saio = ((SampleAuxiliaryInformationOffsetsBox)localList2.get(i)))
        {
          i++;
          break;
          if ((this.saiz != null) && (this.saiz.getAuxInfoType() == null) && ("cenc".equals(((SampleAuxiliaryInformationSizesBox)localList1.get(i)).getAuxInfoType())))
          {
            this.saiz = ((SampleAuxiliaryInformationSizesBox)localList1.get(i));
            break label133;
          }
          throw new RuntimeException("Are there two cenc labeled saiz?");
          label262: if ((this.saio == null) || (this.saio.getAuxInfoType() != null) || (!"cenc".equals(((SampleAuxiliaryInformationOffsetsBox)localList2.get(i)).getAuxInfoType())))
            break label317;
        }
        label317: throw new RuntimeException("Are there two cenc labeled saio?");
      }
      return this;
    }
  }
}