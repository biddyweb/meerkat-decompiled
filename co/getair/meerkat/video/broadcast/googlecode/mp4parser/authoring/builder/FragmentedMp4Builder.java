package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.builder;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.DataEntryUrlBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.DataInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.DataReferenceBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.EditBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.EditListBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.EditListBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.FileTypeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.HandlerBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.HintMediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MediaBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MediaInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MovieBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MovieHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.NullMediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleSizeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleTableBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleToChunkBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SchemeTypeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SoundMediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.StaticChunkOffsetBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubtitleMediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TimeToSampleBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.VideoMediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieExtendsBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieExtendsHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieFragmentBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieFragmentHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieFragmentRandomAccessBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieFragmentRandomAccessOffsetBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.SampleFlags;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackExtendsBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackFragmentBaseMediaDecodeTimeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackFragmentBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackFragmentHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackFragmentRandomAccessBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackFragmentRandomAccessBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackRunBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackRunBox.Entry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.BasicContainer;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Edit;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Movie;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks.CencEncryptedTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.dece.SampleEncryptionBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.SampleGroupDescriptionBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.SampleToGroupBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.SampleToGroupBox.Entry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Path;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part12.SampleAuxiliaryInformationOffsetsBox;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part12.SampleAuxiliaryInformationSizesBox;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.TrackEncryptionBox;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.logging.Logger;

public class FragmentedMp4Builder
  implements Mp4Builder
{
  private static final Logger LOG;
  protected FragmentIntersectionFinder intersectionFinder;

  static
  {
    if (!FragmentedMp4Builder.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      LOG = Logger.getLogger(FragmentedMp4Builder.class.getName());
      return;
    }
  }

  private long getTrackDuration(Movie paramMovie, Track paramTrack)
  {
    return paramTrack.getDuration() * paramMovie.getTimescale() / paramTrack.getTrackMetaData().getTimescale();
  }

  public Container build(Movie paramMovie)
  {
    LOG.fine("Creating movie " + paramMovie);
    if (this.intersectionFinder == null)
    {
      Iterator localIterator2 = paramMovie.getTracks().iterator();
      Track localTrack;
      do
      {
        boolean bool = localIterator2.hasNext();
        localObject = null;
        if (!bool)
          break;
        localTrack = (Track)localIterator2.next();
      }
      while (!localTrack.getHandler().equals("vide"));
      Object localObject = localTrack;
      this.intersectionFinder = new SyncSampleIntersectFinderImpl(paramMovie, localObject, -1);
    }
    BasicContainer localBasicContainer = new BasicContainer();
    localBasicContainer.addBox(createFtyp(paramMovie));
    localBasicContainer.addBox(createMoov(paramMovie));
    Iterator localIterator1 = createMoofMdat(paramMovie).iterator();
    while (localIterator1.hasNext())
      localBasicContainer.addBox((Box)localIterator1.next());
    localBasicContainer.addBox(createMfra(paramMovie, localBasicContainer));
    return localBasicContainer;
  }

  protected DataInformationBox createDinf(Movie paramMovie, Track paramTrack)
  {
    DataInformationBox localDataInformationBox = new DataInformationBox();
    DataReferenceBox localDataReferenceBox = new DataReferenceBox();
    localDataInformationBox.addBox(localDataReferenceBox);
    DataEntryUrlBox localDataEntryUrlBox = new DataEntryUrlBox();
    localDataEntryUrlBox.setFlags(1);
    localDataReferenceBox.addBox(localDataEntryUrlBox);
    return localDataInformationBox;
  }

  protected Box createEdts(Track paramTrack, Movie paramMovie)
  {
    if ((paramTrack.getEdits() != null) && (paramTrack.getEdits().size() > 0))
    {
      EditListBox localEditListBox = new EditListBox();
      localEditListBox.setVersion(1);
      ArrayList localArrayList = new ArrayList();
      Iterator localIterator = paramTrack.getEdits().iterator();
      while (localIterator.hasNext())
      {
        Edit localEdit = (Edit)localIterator.next();
        localArrayList.add(new EditListBox.Entry(localEditListBox, Math.round(localEdit.getSegmentDuration() * paramMovie.getTimescale()), localEdit.getMediaTime() * paramTrack.getTrackMetaData().getTimescale() / localEdit.getTimeScale(), localEdit.getMediaRate()));
      }
      localEditListBox.setEntries(localArrayList);
      EditBox localEditBox = new EditBox();
      localEditBox.addBox(localEditListBox);
      return localEditBox;
    }
    return null;
  }

  protected int createFragment(List<Box> paramList, Track paramTrack, long[] paramArrayOfLong, int paramInt1, int paramInt2)
  {
    long l1;
    if (paramInt1 < paramArrayOfLong.length)
    {
      l1 = paramArrayOfLong[paramInt1];
      if (paramInt1 + 1 >= paramArrayOfLong.length)
        break label87;
    }
    label87: for (long l2 = paramArrayOfLong[(paramInt1 + 1)]; ; l2 = 1 + paramTrack.getSamples().size())
    {
      if (l1 != l2)
      {
        paramList.add(createMoof(l1, l2, paramTrack, paramInt2));
        int i = paramInt2 + 1;
        paramList.add(createMdat(l1, l2, paramTrack, paramInt2));
        paramInt2 = i;
      }
      return paramInt2;
    }
  }

  public Box createFtyp(Movie paramMovie)
  {
    LinkedList localLinkedList = new LinkedList();
    localLinkedList.add("isom");
    localLinkedList.add("iso2");
    localLinkedList.add("avc1");
    return new FileTypeBox("isom", 0L, localLinkedList);
  }

  protected Box createMdat(final long paramLong1, long paramLong2, final Track paramTrack, int paramInt)
  {
    return new Box()
    {
      Container parent;
      long size_ = -1L;

      public void getBox(WritableByteChannel paramAnonymousWritableByteChannel)
        throws IOException
      {
        ByteBuffer localByteBuffer = ByteBuffer.allocate(8);
        IsoTypeWriter.writeUInt32(localByteBuffer, CastUtils.l2i(getSize()));
        localByteBuffer.put(IsoFile.fourCCtoBytes(getType()));
        localByteBuffer.rewind();
        paramAnonymousWritableByteChannel.write(localByteBuffer);
        Iterator localIterator = this.this$0.getSamples(paramLong1, paramTrack, this.val$track, this.val$i).iterator();
        while (localIterator.hasNext())
          ((Sample)localIterator.next()).writeTo(paramAnonymousWritableByteChannel);
      }

      public long getOffset()
      {
        throw new RuntimeException("Doesn't have any meaning for programmatically created boxes");
      }

      public Container getParent()
      {
        return this.parent;
      }

      public long getSize()
      {
        if (this.size_ != -1L)
          return this.size_;
        long l = 8L;
        Iterator localIterator = this.this$0.getSamples(paramLong1, paramTrack, this.val$track, this.val$i).iterator();
        while (localIterator.hasNext())
          l += ((Sample)localIterator.next()).getSize();
        this.size_ = l;
        return l;
      }

      public String getType()
      {
        return "mdat";
      }

      public void parse(DataSource paramAnonymousDataSource, ByteBuffer paramAnonymousByteBuffer, long paramAnonymousLong, BoxParser paramAnonymousBoxParser)
        throws IOException
      {
      }

      public void setParent(Container paramAnonymousContainer)
      {
        this.parent = paramAnonymousContainer;
      }
    };
  }

  protected Box createMdhd(Movie paramMovie, Track paramTrack)
  {
    MediaHeaderBox localMediaHeaderBox = new MediaHeaderBox();
    localMediaHeaderBox.setCreationTime(paramTrack.getTrackMetaData().getCreationTime());
    localMediaHeaderBox.setModificationTime(getDate());
    localMediaHeaderBox.setDuration(0L);
    localMediaHeaderBox.setTimescale(paramTrack.getTrackMetaData().getTimescale());
    localMediaHeaderBox.setLanguage(paramTrack.getTrackMetaData().getLanguage());
    return localMediaHeaderBox;
  }

  protected Box createMdia(Track paramTrack, Movie paramMovie)
  {
    MediaBox localMediaBox = new MediaBox();
    localMediaBox.addBox(createMdhd(paramMovie, paramTrack));
    localMediaBox.addBox(createMdiaHdlr(paramTrack, paramMovie));
    localMediaBox.addBox(createMinf(paramTrack, paramMovie));
    return localMediaBox;
  }

  protected Box createMdiaHdlr(Track paramTrack, Movie paramMovie)
  {
    HandlerBox localHandlerBox = new HandlerBox();
    localHandlerBox.setHandlerType(paramTrack.getHandler());
    return localHandlerBox;
  }

  protected void createMfhd(long paramLong1, long paramLong2, Track paramTrack, int paramInt, MovieFragmentBox paramMovieFragmentBox)
  {
    MovieFragmentHeaderBox localMovieFragmentHeaderBox = new MovieFragmentHeaderBox();
    localMovieFragmentHeaderBox.setSequenceNumber(paramInt);
    paramMovieFragmentBox.addBox(localMovieFragmentHeaderBox);
  }

  protected Box createMfra(Movie paramMovie, Container paramContainer)
  {
    MovieFragmentRandomAccessBox localMovieFragmentRandomAccessBox = new MovieFragmentRandomAccessBox();
    Iterator localIterator = paramMovie.getTracks().iterator();
    while (localIterator.hasNext())
      localMovieFragmentRandomAccessBox.addBox(createTfra((Track)localIterator.next(), paramContainer));
    MovieFragmentRandomAccessOffsetBox localMovieFragmentRandomAccessOffsetBox = new MovieFragmentRandomAccessOffsetBox();
    localMovieFragmentRandomAccessBox.addBox(localMovieFragmentRandomAccessOffsetBox);
    localMovieFragmentRandomAccessOffsetBox.setMfraSize(localMovieFragmentRandomAccessBox.getSize());
    return localMovieFragmentRandomAccessBox;
  }

  protected Box createMinf(Track paramTrack, Movie paramMovie)
  {
    MediaInformationBox localMediaInformationBox = new MediaInformationBox();
    if (paramTrack.getHandler().equals("vide"))
      localMediaInformationBox.addBox(new VideoMediaHeaderBox());
    while (true)
    {
      localMediaInformationBox.addBox(createDinf(paramMovie, paramTrack));
      localMediaInformationBox.addBox(createStbl(paramMovie, paramTrack));
      return localMediaInformationBox;
      if (paramTrack.getHandler().equals("soun"))
        localMediaInformationBox.addBox(new SoundMediaHeaderBox());
      else if (paramTrack.getHandler().equals("text"))
        localMediaInformationBox.addBox(new NullMediaHeaderBox());
      else if (paramTrack.getHandler().equals("subt"))
        localMediaInformationBox.addBox(new SubtitleMediaHeaderBox());
      else if (paramTrack.getHandler().equals("hint"))
        localMediaInformationBox.addBox(new HintMediaHeaderBox());
      else if (paramTrack.getHandler().equals("sbtl"))
        localMediaInformationBox.addBox(new NullMediaHeaderBox());
    }
  }

  protected Box createMoof(long paramLong1, long paramLong2, Track paramTrack, int paramInt)
  {
    MovieFragmentBox localMovieFragmentBox = new MovieFragmentBox();
    createMfhd(paramLong1, paramLong2, paramTrack, paramInt, localMovieFragmentBox);
    createTraf(paramLong1, paramLong2, paramTrack, paramInt, localMovieFragmentBox);
    TrackRunBox localTrackRunBox = (TrackRunBox)localMovieFragmentBox.getTrackRunBoxes().get(0);
    localTrackRunBox.setDataOffset(1);
    localTrackRunBox.setDataOffset((int)(8L + localMovieFragmentBox.getSize()));
    return localMovieFragmentBox;
  }

  protected List<Box> createMoofMdat(Movie paramMovie)
  {
    LinkedList localLinkedList = new LinkedList();
    HashMap localHashMap = new HashMap();
    int i = 0;
    Iterator localIterator1 = paramMovie.getTracks().iterator();
    while (localIterator1.hasNext())
    {
      Track localTrack2 = (Track)localIterator1.next();
      long[] arrayOfLong = this.intersectionFinder.sampleNumbers(localTrack2);
      localHashMap.put(localTrack2, arrayOfLong);
      i = Math.max(i, arrayOfLong.length);
    }
    int j = 1;
    for (int k = 0; k < i; k++)
    {
      Iterator localIterator2 = sortTracksInSequence(paramMovie.getTracks(), k, localHashMap).iterator();
      while (localIterator2.hasNext())
      {
        Track localTrack1 = (Track)localIterator2.next();
        j = createFragment(localLinkedList, localTrack1, (long[])localHashMap.get(localTrack1), k, j);
      }
    }
    return localLinkedList;
  }

  protected Box createMoov(Movie paramMovie)
  {
    MovieBox localMovieBox = new MovieBox();
    localMovieBox.addBox(createMvhd(paramMovie));
    Iterator localIterator = paramMovie.getTracks().iterator();
    while (localIterator.hasNext())
      localMovieBox.addBox(createTrak((Track)localIterator.next(), paramMovie));
    localMovieBox.addBox(createMvex(paramMovie));
    return localMovieBox;
  }

  protected Box createMvex(Movie paramMovie)
  {
    MovieExtendsBox localMovieExtendsBox = new MovieExtendsBox();
    MovieExtendsHeaderBox localMovieExtendsHeaderBox = new MovieExtendsHeaderBox();
    localMovieExtendsHeaderBox.setVersion(1);
    Iterator localIterator1 = paramMovie.getTracks().iterator();
    while (localIterator1.hasNext())
    {
      long l = getTrackDuration(paramMovie, (Track)localIterator1.next());
      if (localMovieExtendsHeaderBox.getFragmentDuration() < l)
        localMovieExtendsHeaderBox.setFragmentDuration(l);
    }
    localMovieExtendsBox.addBox(localMovieExtendsHeaderBox);
    Iterator localIterator2 = paramMovie.getTracks().iterator();
    while (localIterator2.hasNext())
      localMovieExtendsBox.addBox(createTrex(paramMovie, (Track)localIterator2.next()));
    return localMovieExtendsBox;
  }

  protected Box createMvhd(Movie paramMovie)
  {
    MovieHeaderBox localMovieHeaderBox = new MovieHeaderBox();
    localMovieHeaderBox.setVersion(1);
    localMovieHeaderBox.setCreationTime(getDate());
    localMovieHeaderBox.setModificationTime(getDate());
    localMovieHeaderBox.setDuration(0L);
    localMovieHeaderBox.setTimescale(paramMovie.getTimescale());
    long l = 0L;
    Iterator localIterator = paramMovie.getTracks().iterator();
    while (localIterator.hasNext())
    {
      Track localTrack = (Track)localIterator.next();
      if (l < localTrack.getTrackMetaData().getTrackId())
        l = localTrack.getTrackMetaData().getTrackId();
    }
    localMovieHeaderBox.setNextTrackId(l + 1L);
    return localMovieHeaderBox;
  }

  protected void createSaio(long paramLong1, long paramLong2, CencEncryptedTrack paramCencEncryptedTrack, int paramInt, TrackFragmentBox paramTrackFragmentBox)
  {
    ((SchemeTypeBox)Path.getPath(paramCencEncryptedTrack.getSampleDescriptionBox(), "enc.[0]/sinf[0]/schm[0]"));
    SampleAuxiliaryInformationOffsetsBox localSampleAuxiliaryInformationOffsetsBox = new SampleAuxiliaryInformationOffsetsBox();
    paramTrackFragmentBox.addBox(localSampleAuxiliaryInformationOffsetsBox);
    assert (paramTrackFragmentBox.getBoxes(TrackRunBox.class).size() == 1) : "Don't know how to deal with multiple Track Run Boxes when encrypting";
    localSampleAuxiliaryInformationOffsetsBox.setAuxInfoType("cenc");
    localSampleAuxiliaryInformationOffsetsBox.setFlags(1);
    long l1 = 0L + 8L;
    Iterator localIterator1 = paramTrackFragmentBox.getBoxes().iterator();
    Box localBox2;
    long l2;
    Iterator localIterator2;
    if (localIterator1.hasNext())
    {
      localBox2 = (Box)localIterator1.next();
      if ((localBox2 instanceof SampleEncryptionBox))
        l1 += ((SampleEncryptionBox)localBox2).getOffsetToFirstIV();
    }
    else
    {
      MovieFragmentBox localMovieFragmentBox = (MovieFragmentBox)paramTrackFragmentBox.getParent();
      l2 = l1 + 16L;
      localIterator2 = localMovieFragmentBox.getBoxes().iterator();
    }
    while (true)
    {
      Box localBox1;
      if (localIterator2.hasNext())
      {
        localBox1 = (Box)localIterator2.next();
        if (localBox1 != paramTrackFragmentBox);
      }
      else
      {
        localSampleAuxiliaryInformationOffsetsBox.setOffsets(new long[] { l2 });
        return;
        l1 += localBox2.getSize();
        break;
      }
      l2 += localBox1.getSize();
    }
  }

  protected void createSaiz(long paramLong1, long paramLong2, CencEncryptedTrack paramCencEncryptedTrack, int paramInt, TrackFragmentBox paramTrackFragmentBox)
  {
    SampleDescriptionBox localSampleDescriptionBox = paramCencEncryptedTrack.getSampleDescriptionBox();
    ((SchemeTypeBox)Path.getPath(localSampleDescriptionBox, "enc.[0]/sinf[0]/schm[0]"));
    TrackEncryptionBox localTrackEncryptionBox = (TrackEncryptionBox)Path.getPath(localSampleDescriptionBox, "enc.[0]/sinf[0]/schi[0]/tenc[0]");
    SampleAuxiliaryInformationSizesBox localSampleAuxiliaryInformationSizesBox = new SampleAuxiliaryInformationSizesBox();
    localSampleAuxiliaryInformationSizesBox.setAuxInfoType("cenc");
    localSampleAuxiliaryInformationSizesBox.setFlags(1);
    if (paramCencEncryptedTrack.hasSubSampleEncryption())
    {
      short[] arrayOfShort = new short[CastUtils.l2i(paramLong2 - paramLong1)];
      List localList = paramCencEncryptedTrack.getSampleEncryptionEntries().subList(CastUtils.l2i(paramLong1 - 1L), CastUtils.l2i(paramLong2 - 1L));
      for (int i = 0; i < arrayOfShort.length; i++)
        arrayOfShort[i] = ((short)((CencSampleAuxiliaryDataFormat)localList.get(i)).getSize());
      localSampleAuxiliaryInformationSizesBox.setSampleInfoSizes(arrayOfShort);
    }
    while (true)
    {
      paramTrackFragmentBox.addBox(localSampleAuxiliaryInformationSizesBox);
      return;
      localSampleAuxiliaryInformationSizesBox.setDefaultSampleInfoSize(localTrackEncryptionBox.getDefaultIvSize());
      localSampleAuxiliaryInformationSizesBox.setSampleCount(CastUtils.l2i(paramLong2 - paramLong1));
    }
  }

  protected void createSenc(long paramLong1, long paramLong2, CencEncryptedTrack paramCencEncryptedTrack, int paramInt, TrackFragmentBox paramTrackFragmentBox)
  {
    SampleEncryptionBox localSampleEncryptionBox = new SampleEncryptionBox();
    localSampleEncryptionBox.setSubSampleEncryption(paramCencEncryptedTrack.hasSubSampleEncryption());
    localSampleEncryptionBox.setEntries(paramCencEncryptedTrack.getSampleEncryptionEntries().subList(CastUtils.l2i(paramLong1 - 1L), CastUtils.l2i(paramLong2 - 1L)));
    paramTrackFragmentBox.addBox(localSampleEncryptionBox);
  }

  protected Box createStbl(Movie paramMovie, Track paramTrack)
  {
    SampleTableBox localSampleTableBox = new SampleTableBox();
    createStsd(paramTrack, localSampleTableBox);
    localSampleTableBox.addBox(new TimeToSampleBox());
    localSampleTableBox.addBox(new SampleToChunkBox());
    localSampleTableBox.addBox(new SampleSizeBox());
    localSampleTableBox.addBox(new StaticChunkOffsetBox());
    return localSampleTableBox;
  }

  protected void createStsd(Track paramTrack, SampleTableBox paramSampleTableBox)
  {
    paramSampleTableBox.addBox(paramTrack.getSampleDescriptionBox());
  }

  protected void createTfdt(long paramLong, Track paramTrack, TrackFragmentBox paramTrackFragmentBox)
  {
    TrackFragmentBaseMediaDecodeTimeBox localTrackFragmentBaseMediaDecodeTimeBox = new TrackFragmentBaseMediaDecodeTimeBox();
    localTrackFragmentBaseMediaDecodeTimeBox.setVersion(1);
    long l = 0L;
    long[] arrayOfLong = paramTrack.getSampleDurations();
    for (int i = 1; i < paramLong; i++)
      l += arrayOfLong[(i - 1)];
    localTrackFragmentBaseMediaDecodeTimeBox.setBaseMediaDecodeTime(l);
    paramTrackFragmentBox.addBox(localTrackFragmentBaseMediaDecodeTimeBox);
  }

  protected void createTfhd(long paramLong1, long paramLong2, Track paramTrack, int paramInt, TrackFragmentBox paramTrackFragmentBox)
  {
    TrackFragmentHeaderBox localTrackFragmentHeaderBox = new TrackFragmentHeaderBox();
    localTrackFragmentHeaderBox.setDefaultSampleFlags(new SampleFlags());
    localTrackFragmentHeaderBox.setBaseDataOffset(-1L);
    localTrackFragmentHeaderBox.setTrackId(paramTrack.getTrackMetaData().getTrackId());
    localTrackFragmentHeaderBox.setDefaultBaseIsMoof(true);
    paramTrackFragmentBox.addBox(localTrackFragmentHeaderBox);
  }

  protected Box createTfra(Track paramTrack, Container paramContainer)
  {
    TrackFragmentRandomAccessBox localTrackFragmentRandomAccessBox = new TrackFragmentRandomAccessBox();
    localTrackFragmentRandomAccessBox.setVersion(1);
    LinkedList localLinkedList1 = new LinkedList();
    Object localObject = null;
    Iterator localIterator1 = Path.getPaths(paramContainer, "moov/mvex/trex").iterator();
    while (localIterator1.hasNext())
    {
      TrackExtendsBox localTrackExtendsBox = (TrackExtendsBox)localIterator1.next();
      if (localTrackExtendsBox.getTrackId() == paramTrack.getTrackMetaData().getTrackId())
        localObject = localTrackExtendsBox;
    }
    long l1 = 0L;
    long l2 = 0L;
    Iterator localIterator2 = paramContainer.getBoxes().iterator();
    while (localIterator2.hasNext())
    {
      Box localBox = (Box)localIterator2.next();
      if ((localBox instanceof MovieFragmentBox))
      {
        List localList1 = ((MovieFragmentBox)localBox).getBoxes(TrackFragmentBox.class);
        for (int i = 0; i < localList1.size(); i++)
        {
          TrackFragmentBox localTrackFragmentBox = (TrackFragmentBox)localList1.get(i);
          if (localTrackFragmentBox.getTrackFragmentHeaderBox().getTrackId() == paramTrack.getTrackMetaData().getTrackId())
          {
            List localList2 = localTrackFragmentBox.getBoxes(TrackRunBox.class);
            int j = 0;
            int k = localList2.size();
            if (j < k)
            {
              LinkedList localLinkedList2 = new LinkedList();
              TrackRunBox localTrackRunBox = (TrackRunBox)localList2.get(j);
              for (int m = 0; ; m++)
              {
                int n = localTrackRunBox.getEntries().size();
                if (m >= n)
                  break;
                TrackRunBox.Entry localEntry = (TrackRunBox.Entry)localTrackRunBox.getEntries().get(m);
                SampleFlags localSampleFlags;
                if ((m == 0) && (localTrackRunBox.isFirstSampleFlagsPresent()))
                  localSampleFlags = localTrackRunBox.getFirstSampleFlags();
                while ((localSampleFlags == null) && (paramTrack.getHandler().equals("vide")))
                {
                  throw new RuntimeException("Cannot find SampleFlags for video track but it's required to build tfra");
                  if (localTrackRunBox.isSampleFlagsPresent())
                    localSampleFlags = localEntry.getSampleFlags();
                  else
                    localSampleFlags = localObject.getDefaultSampleFlags();
                }
                if ((localSampleFlags == null) || (localSampleFlags.getSampleDependsOn() == 2))
                  localLinkedList2.add(new TrackFragmentRandomAccessBox.Entry(l2, l1, i + 1, j + 1, m + 1));
                l2 += localEntry.getSampleDuration();
              }
              if ((localLinkedList2.size() == localTrackRunBox.getEntries().size()) && (localTrackRunBox.getEntries().size() > 0))
                localLinkedList1.add(localLinkedList2.get(0));
              while (true)
              {
                j++;
                break;
                localLinkedList1.addAll(localLinkedList2);
              }
            }
          }
        }
      }
      l1 += localBox.getSize();
    }
    localTrackFragmentRandomAccessBox.setEntries(localLinkedList1);
    localTrackFragmentRandomAccessBox.setTrackId(paramTrack.getTrackMetaData().getTrackId());
    return localTrackFragmentRandomAccessBox;
  }

  protected Box createTkhd(Movie paramMovie, Track paramTrack)
  {
    TrackHeaderBox localTrackHeaderBox = new TrackHeaderBox();
    localTrackHeaderBox.setVersion(1);
    localTrackHeaderBox.setFlags(7);
    localTrackHeaderBox.setAlternateGroup(paramTrack.getTrackMetaData().getGroup());
    localTrackHeaderBox.setCreationTime(paramTrack.getTrackMetaData().getCreationTime());
    localTrackHeaderBox.setDuration(0L);
    localTrackHeaderBox.setHeight(paramTrack.getTrackMetaData().getHeight());
    localTrackHeaderBox.setWidth(paramTrack.getTrackMetaData().getWidth());
    localTrackHeaderBox.setLayer(paramTrack.getTrackMetaData().getLayer());
    localTrackHeaderBox.setModificationTime(getDate());
    localTrackHeaderBox.setTrackId(paramTrack.getTrackMetaData().getTrackId());
    localTrackHeaderBox.setVolume(paramTrack.getTrackMetaData().getVolume());
    return localTrackHeaderBox;
  }

  protected void createTraf(long paramLong1, long paramLong2, Track paramTrack, int paramInt, MovieFragmentBox paramMovieFragmentBox)
  {
    TrackFragmentBox localTrackFragmentBox = new TrackFragmentBox();
    paramMovieFragmentBox.addBox(localTrackFragmentBox);
    createTfhd(paramLong1, paramLong2, paramTrack, paramInt, localTrackFragmentBox);
    createTfdt(paramLong1, paramTrack, localTrackFragmentBox);
    createTrun(paramLong1, paramLong2, paramTrack, paramInt, localTrackFragmentBox);
    if ((paramTrack instanceof CencEncryptedTrack))
    {
      createSaiz(paramLong1, paramLong2, (CencEncryptedTrack)paramTrack, paramInt, localTrackFragmentBox);
      createSenc(paramLong1, paramLong2, (CencEncryptedTrack)paramTrack, paramInt, localTrackFragmentBox);
      createSaio(paramLong1, paramLong2, (CencEncryptedTrack)paramTrack, paramInt, localTrackFragmentBox);
    }
    HashMap localHashMap = new HashMap();
    Iterator localIterator1 = paramTrack.getSampleGroups().entrySet().iterator();
    while (localIterator1.hasNext())
    {
      Map.Entry localEntry2 = (Map.Entry)localIterator1.next();
      String str2 = ((GroupEntry)localEntry2.getKey()).getType();
      Object localObject = (List)localHashMap.get(str2);
      if (localObject == null)
      {
        localObject = new ArrayList();
        localHashMap.put(str2, localObject);
      }
      ((List)localObject).add(localEntry2.getKey());
    }
    Iterator localIterator2 = localHashMap.entrySet().iterator();
    while (localIterator2.hasNext())
    {
      Map.Entry localEntry1 = (Map.Entry)localIterator2.next();
      SampleGroupDescriptionBox localSampleGroupDescriptionBox = new SampleGroupDescriptionBox();
      String str1 = (String)localEntry1.getKey();
      localSampleGroupDescriptionBox.setGroupEntries((List)localEntry1.getValue());
      SampleToGroupBox localSampleToGroupBox = new SampleToGroupBox();
      localSampleToGroupBox.setGroupingType(str1);
      SampleToGroupBox.Entry localEntry = null;
      int i = CastUtils.l2i(paramLong1 - 1L);
      if (i < CastUtils.l2i(paramLong2 - 1L))
      {
        int j = 0;
        for (int k = 0; ; k++)
        {
          int m = ((List)localEntry1.getValue()).size();
          if (k >= m)
            break;
          GroupEntry localGroupEntry = (GroupEntry)((List)localEntry1.getValue()).get(k);
          if (Arrays.binarySearch((long[])paramTrack.getSampleGroups().get(localGroupEntry), i) >= 0)
            j = k + 1;
        }
        if ((localEntry == null) || (localEntry.getGroupDescriptionIndex() != j))
        {
          localEntry = new SampleToGroupBox.Entry(1L, j);
          localSampleToGroupBox.getEntries().add(localEntry);
        }
        while (true)
        {
          i++;
          break;
          long l = 1L + localEntry.getSampleCount();
          localEntry.setSampleCount(l);
        }
      }
      localTrackFragmentBox.addBox(localSampleGroupDescriptionBox);
      localTrackFragmentBox.addBox(localSampleToGroupBox);
    }
  }

  protected Box createTrak(Track paramTrack, Movie paramMovie)
  {
    LOG.fine("Creating Track " + paramTrack);
    TrackBox localTrackBox = new TrackBox();
    localTrackBox.addBox(createTkhd(paramMovie, paramTrack));
    Box localBox = createEdts(paramTrack, paramMovie);
    if (localBox != null)
      localTrackBox.addBox(localBox);
    localTrackBox.addBox(createMdia(paramTrack, paramMovie));
    return localTrackBox;
  }

  protected Box createTrex(Movie paramMovie, Track paramTrack)
  {
    TrackExtendsBox localTrackExtendsBox = new TrackExtendsBox();
    localTrackExtendsBox.setTrackId(paramTrack.getTrackMetaData().getTrackId());
    localTrackExtendsBox.setDefaultSampleDescriptionIndex(1L);
    localTrackExtendsBox.setDefaultSampleDuration(0L);
    localTrackExtendsBox.setDefaultSampleSize(0L);
    SampleFlags localSampleFlags = new SampleFlags();
    if (("soun".equals(paramTrack.getHandler())) || ("subt".equals(paramTrack.getHandler())))
    {
      localSampleFlags.setSampleDependsOn(2);
      localSampleFlags.setSampleIsDependedOn(2);
    }
    localTrackExtendsBox.setDefaultSampleFlags(localSampleFlags);
    return localTrackExtendsBox;
  }

  protected void createTrun(long paramLong1, long paramLong2, Track paramTrack, int paramInt, TrackFragmentBox paramTrackFragmentBox)
  {
    TrackRunBox localTrackRunBox = new TrackRunBox();
    localTrackRunBox.setVersion(1);
    long[] arrayOfLong = getSampleSizes(paramLong1, paramLong2, paramTrack, paramInt);
    localTrackRunBox.setSampleDurationPresent(true);
    localTrackRunBox.setSampleSizePresent(true);
    ArrayList localArrayList = new ArrayList(CastUtils.l2i(paramLong2 - paramLong1));
    List localList = paramTrack.getCompositionTimeEntries();
    int i = 0;
    CompositionTimeToSample.Entry[] arrayOfEntry;
    long l1;
    if ((localList != null) && (localList.size() > 0))
    {
      arrayOfEntry = (CompositionTimeToSample.Entry[])localList.toArray(new CompositionTimeToSample.Entry[localList.size()]);
      if (arrayOfEntry == null)
        break label202;
      l1 = arrayOfEntry[0].getCount();
      label118: if (l1 <= 0L)
        break label210;
    }
    label202: label210: for (boolean bool1 = true; ; bool1 = false)
    {
      localTrackRunBox.setSampleCompositionTimeOffsetPresent(bool1);
      for (long l2 = 1L; l2 < paramLong1; l2 += 1L)
        if (arrayOfEntry != null)
        {
          l1 -= 1L;
          if ((l1 == 0L) && (arrayOfEntry.length - i > 1))
          {
            i++;
            l1 = arrayOfEntry[i].getCount();
          }
        }
      arrayOfEntry = null;
      break;
      l1 = -1L;
      break label118;
    }
    boolean bool2;
    int j;
    label275: TrackRunBox.Entry localEntry;
    SampleFlags localSampleFlags;
    if (((paramTrack.getSampleDependencies() != null) && (!paramTrack.getSampleDependencies().isEmpty())) || ((paramTrack.getSyncSamples() != null) && (paramTrack.getSyncSamples().length != 0)))
    {
      bool2 = true;
      localTrackRunBox.setSampleFlagsPresent(bool2);
      j = 0;
      if (j >= arrayOfLong.length)
        break label563;
      localEntry = new TrackRunBox.Entry();
      localEntry.setSampleSize(arrayOfLong[j]);
      if (bool2)
      {
        localSampleFlags = new SampleFlags();
        if ((paramTrack.getSampleDependencies() != null) && (!paramTrack.getSampleDependencies().isEmpty()))
        {
          SampleDependencyTypeBox.Entry localEntry1 = (SampleDependencyTypeBox.Entry)paramTrack.getSampleDependencies().get(j);
          localSampleFlags.setSampleDependsOn(localEntry1.getSampleDependsOn());
          localSampleFlags.setSampleIsDependedOn(localEntry1.getSampleIsDependentOn());
          localSampleFlags.setSampleHasRedundancy(localEntry1.getSampleHasRedundancy());
        }
        if ((paramTrack.getSyncSamples() != null) && (paramTrack.getSyncSamples().length > 0))
        {
          if (Arrays.binarySearch(paramTrack.getSyncSamples(), paramLong1 + j) < 0)
            break label548;
          localSampleFlags.setSampleIsDifferenceSample(false);
          localSampleFlags.setSampleDependsOn(2);
        }
      }
    }
    while (true)
    {
      localEntry.setSampleFlags(localSampleFlags);
      localEntry.setSampleDuration(paramTrack.getSampleDurations()[CastUtils.l2i(paramLong1 + j - 1L)]);
      if (arrayOfEntry != null)
      {
        localEntry.setSampleCompositionTimeOffset(arrayOfEntry[i].getOffset());
        l1 -= 1L;
        if ((l1 == 0L) && (arrayOfEntry.length - i > 1))
        {
          i++;
          l1 = arrayOfEntry[i].getCount();
        }
      }
      localArrayList.add(localEntry);
      j++;
      break label275;
      bool2 = false;
      break;
      label548: localSampleFlags.setSampleIsDifferenceSample(true);
      localSampleFlags.setSampleDependsOn(1);
    }
    label563: localTrackRunBox.setEntries(localArrayList);
    paramTrackFragmentBox.addBox(localTrackRunBox);
  }

  public Date getDate()
  {
    return new Date();
  }

  public FragmentIntersectionFinder getFragmentIntersectionFinder()
  {
    return this.intersectionFinder;
  }

  protected long[] getSampleSizes(long paramLong1, long paramLong2, Track paramTrack, int paramInt)
  {
    List localList = getSamples(paramLong1, paramLong2, paramTrack, paramInt);
    long[] arrayOfLong = new long[localList.size()];
    for (int i = 0; i < arrayOfLong.length; i++)
      arrayOfLong[i] = ((Sample)localList.get(i)).getSize();
    return arrayOfLong;
  }

  protected List<Sample> getSamples(long paramLong1, long paramLong2, Track paramTrack, int paramInt)
  {
    return paramTrack.getSamples().subList(-1 + CastUtils.l2i(paramLong1), -1 + CastUtils.l2i(paramLong2));
  }

  public void setIntersectionFinder(FragmentIntersectionFinder paramFragmentIntersectionFinder)
  {
    this.intersectionFinder = paramFragmentIntersectionFinder;
  }

  protected List<Track> sortTracksInSequence(List<Track> paramList, final int paramInt, final Map<Track, long[]> paramMap)
  {
    LinkedList localLinkedList = new LinkedList(paramList);
    Collections.sort(localLinkedList, new Comparator()
    {
      public int compare(Track paramAnonymousTrack1, Track paramAnonymousTrack2)
      {
        long l1 = ((long[])paramMap.get(paramAnonymousTrack1))[paramInt];
        long l2 = ((long[])paramMap.get(paramAnonymousTrack2))[paramInt];
        long[] arrayOfLong1 = paramAnonymousTrack1.getSampleDurations();
        long[] arrayOfLong2 = paramAnonymousTrack2.getSampleDurations();
        long l3 = 0L;
        long l4 = 0L;
        for (int i = 1; i < l1; i++)
          l3 += arrayOfLong1[(i - 1)];
        for (int j = 1; j < l2; j++)
          l4 += arrayOfLong2[(j - 1)];
        return (int)(100.0D * (l3 / paramAnonymousTrack1.getTrackMetaData().getTimescale() - l4 / paramAnonymousTrack2.getTrackMetaData().getTimescale()));
      }
    });
    return localLinkedList;
  }
}