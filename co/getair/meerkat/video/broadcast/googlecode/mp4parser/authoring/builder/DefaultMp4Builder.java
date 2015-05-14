package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.builder;

import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample;
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
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleSizeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleTableBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleToChunkBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleToChunkBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SoundMediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.StaticChunkOffsetBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubtitleMediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SyncSampleBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TimeToSampleBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TimeToSampleBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.VideoMediaHeaderBox;
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
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DefaultMp4Builder
  implements Mp4Builder
{
  private static Logger LOG;
  Set<StaticChunkOffsetBox> chunkOffsetBoxes = new HashSet();
  private FragmentIntersectionFinder intersectionFinder;
  Set<SampleAuxiliaryInformationOffsetsBox> sampleAuxiliaryInformationOffsetsBoxes = new HashSet();
  HashMap<Track, List<Sample>> track2Sample = new HashMap();
  HashMap<Track, long[]> track2SampleSizes = new HashMap();

  static
  {
    if (!DefaultMp4Builder.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      LOG = Logger.getLogger(DefaultMp4Builder.class.getName());
      return;
    }
  }

  public static long gcd(long paramLong1, long paramLong2)
  {
    if (paramLong2 == 0L)
      return paramLong1;
    return gcd(paramLong2, paramLong1 % paramLong2);
  }

  private static long sum(int[] paramArrayOfInt)
  {
    long l = 0L;
    int i = paramArrayOfInt.length;
    for (int j = 0; j < i; j++)
      l += paramArrayOfInt[j];
    return l;
  }

  private static long sum(long[] paramArrayOfLong)
  {
    long l = 0L;
    int i = paramArrayOfLong.length;
    for (int j = 0; j < i; j++)
      l += paramArrayOfLong[j];
    return l;
  }

  public Container build(Movie paramMovie)
  {
    if (this.intersectionFinder == null)
      this.intersectionFinder = new TwoSecondIntersectionFinder(paramMovie, 2);
    LOG.fine("Creating movie " + paramMovie);
    Iterator localIterator1 = paramMovie.getTracks().iterator();
    while (localIterator1.hasNext())
    {
      Track localTrack2 = (Track)localIterator1.next();
      List localList2 = localTrack2.getSamples();
      putSamples(localTrack2, localList2);
      long[] arrayOfLong3 = new long[localList2.size()];
      for (int k = 0; k < arrayOfLong3.length; k++)
        arrayOfLong3[k] = ((Sample)localList2.get(k)).getSize();
      this.track2SampleSizes.put(localTrack2, arrayOfLong3);
    }
    BasicContainer localBasicContainer = new BasicContainer();
    localBasicContainer.addBox(createFileTypeBox(paramMovie));
    HashMap localHashMap = new HashMap();
    Iterator localIterator2 = paramMovie.getTracks().iterator();
    while (localIterator2.hasNext())
    {
      Track localTrack1 = (Track)localIterator2.next();
      localHashMap.put(localTrack1, getChunkSizes(localTrack1, paramMovie));
    }
    MovieBox localMovieBox = createMovieBox(paramMovie, localHashMap);
    localBasicContainer.addBox(localMovieBox);
    List localList1 = Path.getPaths(localMovieBox, "trak/mdia/minf/stbl/stsz");
    long l1 = 0L;
    Iterator localIterator3 = localList1.iterator();
    while (localIterator3.hasNext())
      l1 += sum(((SampleSizeBox)localIterator3.next()).getSampleSizes());
    InterleaveChunkMdat localInterleaveChunkMdat = new InterleaveChunkMdat(paramMovie, localHashMap, l1, null);
    localBasicContainer.addBox(localInterleaveChunkMdat);
    long l2 = localInterleaveChunkMdat.getDataOffset();
    Iterator localIterator4 = this.chunkOffsetBoxes.iterator();
    while (localIterator4.hasNext())
    {
      long[] arrayOfLong2 = ((StaticChunkOffsetBox)localIterator4.next()).getChunkOffsets();
      for (int j = 0; j < arrayOfLong2.length; j++)
        arrayOfLong2[j] = (l2 + arrayOfLong2[j]);
    }
    Iterator localIterator5 = this.sampleAuxiliaryInformationOffsetsBoxes.iterator();
    SampleAuxiliaryInformationOffsetsBox localSampleAuxiliaryInformationOffsetsBox;
    long l3;
    if (localIterator5.hasNext())
    {
      localSampleAuxiliaryInformationOffsetsBox = (SampleAuxiliaryInformationOffsetsBox)localIterator5.next();
      l3 = 44L + localSampleAuxiliaryInformationOffsetsBox.getSize();
    }
    Container localContainer;
    label580: for (Object localObject = localSampleAuxiliaryInformationOffsetsBox; ; localObject = localContainer)
    {
      localContainer = ((Box)localObject).getParent();
      Iterator localIterator6 = ((Container)localContainer).getBoxes().iterator();
      long[] arrayOfLong1;
      while (true)
      {
        Box localBox;
        if (localIterator6.hasNext())
        {
          localBox = (Box)localIterator6.next();
          if (localBox != localObject);
        }
        else
        {
          if ((localContainer instanceof Box))
            break label580;
          arrayOfLong1 = localSampleAuxiliaryInformationOffsetsBox.getOffsets();
          for (int i = 0; i < arrayOfLong1.length; i++)
            arrayOfLong1[i] = (l3 + arrayOfLong1[i]);
        }
        l3 += localBox.getSize();
      }
      localSampleAuxiliaryInformationOffsetsBox.setOffsets(arrayOfLong1);
      break;
      return localBasicContainer;
    }
  }

  protected void createCencBoxes(CencEncryptedTrack paramCencEncryptedTrack, SampleTableBox paramSampleTableBox, int[] paramArrayOfInt)
  {
    SampleAuxiliaryInformationSizesBox localSampleAuxiliaryInformationSizesBox = new SampleAuxiliaryInformationSizesBox();
    localSampleAuxiliaryInformationSizesBox.setAuxInfoType("cenc");
    localSampleAuxiliaryInformationSizesBox.setFlags(1);
    List localList = paramCencEncryptedTrack.getSampleEncryptionEntries();
    SampleAuxiliaryInformationOffsetsBox localSampleAuxiliaryInformationOffsetsBox;
    SampleEncryptionBox localSampleEncryptionBox;
    long l;
    int i;
    long[] arrayOfLong;
    if (paramCencEncryptedTrack.hasSubSampleEncryption())
    {
      short[] arrayOfShort = new short[localList.size()];
      for (int n = 0; n < arrayOfShort.length; n++)
        arrayOfShort[n] = ((short)((CencSampleAuxiliaryDataFormat)localList.get(n)).getSize());
      localSampleAuxiliaryInformationSizesBox.setSampleInfoSizes(arrayOfShort);
      localSampleAuxiliaryInformationOffsetsBox = new SampleAuxiliaryInformationOffsetsBox();
      localSampleEncryptionBox = new SampleEncryptionBox();
      localSampleEncryptionBox.setSubSampleEncryption(paramCencEncryptedTrack.hasSubSampleEncryption());
      localSampleEncryptionBox.setEntries(localList);
      l = localSampleEncryptionBox.getOffsetToFirstIV();
      i = 0;
      arrayOfLong = new long[paramArrayOfInt.length];
    }
    for (int j = 0; ; j++)
    {
      if (j >= paramArrayOfInt.length)
        break label246;
      arrayOfLong[j] = l;
      int k = 0;
      while (true)
        if (k < paramArrayOfInt[j])
        {
          int m = i + 1;
          l += ((CencSampleAuxiliaryDataFormat)localList.get(i)).getSize();
          k++;
          i = m;
          continue;
          localSampleAuxiliaryInformationSizesBox.setDefaultSampleInfoSize(8);
          localSampleAuxiliaryInformationSizesBox.setSampleCount(paramCencEncryptedTrack.getSamples().size());
          break;
        }
    }
    label246: localSampleAuxiliaryInformationOffsetsBox.setOffsets(arrayOfLong);
    paramSampleTableBox.addBox(localSampleAuxiliaryInformationSizesBox);
    paramSampleTableBox.addBox(localSampleAuxiliaryInformationOffsetsBox);
    paramSampleTableBox.addBox(localSampleEncryptionBox);
    this.sampleAuxiliaryInformationOffsetsBoxes.add(localSampleAuxiliaryInformationOffsetsBox);
  }

  protected void createCtts(Track paramTrack, SampleTableBox paramSampleTableBox)
  {
    List localList = paramTrack.getCompositionTimeEntries();
    if ((localList != null) && (!localList.isEmpty()))
    {
      CompositionTimeToSample localCompositionTimeToSample = new CompositionTimeToSample();
      localCompositionTimeToSample.setEntries(localList);
      paramSampleTableBox.addBox(localCompositionTimeToSample);
    }
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

  protected FileTypeBox createFileTypeBox(Movie paramMovie)
  {
    LinkedList localLinkedList = new LinkedList();
    localLinkedList.add("isom");
    localLinkedList.add("iso2");
    localLinkedList.add("avc1");
    return new FileTypeBox("isom", 0L, localLinkedList);
  }

  protected MovieBox createMovieBox(Movie paramMovie, Map<Track, int[]> paramMap)
  {
    MovieBox localMovieBox = new MovieBox();
    MovieHeaderBox localMovieHeaderBox = new MovieHeaderBox();
    localMovieHeaderBox.setCreationTime(new Date());
    localMovieHeaderBox.setModificationTime(new Date());
    localMovieHeaderBox.setMatrix(paramMovie.getMatrix());
    long l1 = getTimescale(paramMovie);
    long l2 = 0L;
    Iterator localIterator1 = paramMovie.getTracks().iterator();
    label219: 
    while (localIterator1.hasNext())
    {
      Track localTrack2 = (Track)localIterator1.next();
      if ((localTrack2.getEdits() == null) || (localTrack2.getEdits().isEmpty()));
      long l5;
      for (long l4 = localTrack2.getDuration() * getTimescale(paramMovie) / localTrack2.getTrackMetaData().getTimescale(); ; l4 = l5 * getTimescale(paramMovie))
      {
        if (l4 <= l2)
          break label219;
        l2 = l4;
        break;
        l5 = 0L;
        Iterator localIterator4 = localTrack2.getEdits().iterator();
        while (localIterator4.hasNext())
          l5 += ()((Edit)localIterator4.next()).getSegmentDuration();
      }
    }
    localMovieHeaderBox.setDuration(l2);
    localMovieHeaderBox.setTimescale(l1);
    long l3 = 0L;
    Iterator localIterator2 = paramMovie.getTracks().iterator();
    while (localIterator2.hasNext())
    {
      Track localTrack1 = (Track)localIterator2.next();
      if (l3 < localTrack1.getTrackMetaData().getTrackId())
        l3 = localTrack1.getTrackMetaData().getTrackId();
    }
    localMovieHeaderBox.setNextTrackId(l3 + 1L);
    localMovieBox.addBox(localMovieHeaderBox);
    Iterator localIterator3 = paramMovie.getTracks().iterator();
    while (localIterator3.hasNext())
      localMovieBox.addBox(createTrackBox((Track)localIterator3.next(), paramMovie, paramMap));
    Box localBox = createUdta(paramMovie);
    if (localBox != null)
      localMovieBox.addBox(localBox);
    return localMovieBox;
  }

  protected void createSdtp(Track paramTrack, SampleTableBox paramSampleTableBox)
  {
    if ((paramTrack.getSampleDependencies() != null) && (!paramTrack.getSampleDependencies().isEmpty()))
    {
      SampleDependencyTypeBox localSampleDependencyTypeBox = new SampleDependencyTypeBox();
      localSampleDependencyTypeBox.setEntries(paramTrack.getSampleDependencies());
      paramSampleTableBox.addBox(localSampleDependencyTypeBox);
    }
  }

  protected Box createStbl(Track paramTrack, Movie paramMovie, Map<Track, int[]> paramMap)
  {
    SampleTableBox localSampleTableBox = new SampleTableBox();
    createStsd(paramTrack, localSampleTableBox);
    createStts(paramTrack, localSampleTableBox);
    createCtts(paramTrack, localSampleTableBox);
    createStss(paramTrack, localSampleTableBox);
    createSdtp(paramTrack, localSampleTableBox);
    createStsc(paramTrack, paramMap, localSampleTableBox);
    createStsz(paramTrack, localSampleTableBox);
    createStco(paramTrack, paramMovie, paramMap, localSampleTableBox);
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
      int i = 0;
      if (i < paramTrack.getSamples().size())
      {
        int j = 0;
        for (int k = 0; k < ((List)localEntry1.getValue()).size(); k++)
        {
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
          localEntry.setSampleCount(1L + localEntry.getSampleCount());
        }
      }
      localSampleTableBox.addBox(localSampleGroupDescriptionBox);
      localSampleTableBox.addBox(localSampleToGroupBox);
    }
    if ((paramTrack instanceof CencEncryptedTrack))
      createCencBoxes((CencEncryptedTrack)paramTrack, localSampleTableBox, (int[])paramMap.get(paramTrack));
    createSubs(paramTrack, localSampleTableBox);
    return localSampleTableBox;
  }

  protected void createStco(Track paramTrack, Movie paramMovie, Map<Track, int[]> paramMap, SampleTableBox paramSampleTableBox)
  {
    int[] arrayOfInt1 = (int[])paramMap.get(paramTrack);
    StaticChunkOffsetBox localStaticChunkOffsetBox = new StaticChunkOffsetBox();
    this.chunkOffsetBoxes.add(localStaticChunkOffsetBox);
    long l1 = 0L;
    long[] arrayOfLong = new long[arrayOfInt1.length];
    if (LOG.isLoggable(Level.FINE))
      LOG.fine("Calculating chunk offsets for track_" + paramTrack.getTrackMetaData().getTrackId());
    for (int i = 0; i < arrayOfInt1.length; i++)
    {
      if (LOG.isLoggable(Level.FINER))
        LOG.finer("Calculating chunk offsets for track_" + paramTrack.getTrackMetaData().getTrackId() + " chunk " + i);
      Iterator localIterator = paramMovie.getTracks().iterator();
      while (localIterator.hasNext())
      {
        Track localTrack = (Track)localIterator.next();
        if (LOG.isLoggable(Level.FINEST))
          LOG.finest("Adding offsets of track_" + localTrack.getTrackMetaData().getTrackId());
        int[] arrayOfInt2 = (int[])paramMap.get(localTrack);
        long l2 = 0L;
        for (int j = 0; j < i; j++)
          l2 += arrayOfInt2[j];
        if (localTrack == paramTrack)
          arrayOfLong[i] = l1;
        for (int k = CastUtils.l2i(l2); k < l2 + arrayOfInt2[i]; k++)
          l1 += ((long[])this.track2SampleSizes.get(localTrack))[k];
      }
    }
    localStaticChunkOffsetBox.setChunkOffsets(arrayOfLong);
    paramSampleTableBox.addBox(localStaticChunkOffsetBox);
  }

  protected void createStsc(Track paramTrack, Map<Track, int[]> paramMap, SampleTableBox paramSampleTableBox)
  {
    int[] arrayOfInt = (int[])paramMap.get(paramTrack);
    SampleToChunkBox localSampleToChunkBox = new SampleToChunkBox();
    localSampleToChunkBox.setEntries(new LinkedList());
    long l = -2147483648L;
    for (int i = 0; i < arrayOfInt.length; i++)
      if (l != arrayOfInt[i])
      {
        localSampleToChunkBox.getEntries().add(new SampleToChunkBox.Entry(i + 1, arrayOfInt[i], 1L));
        l = arrayOfInt[i];
      }
    paramSampleTableBox.addBox(localSampleToChunkBox);
  }

  protected void createStsd(Track paramTrack, SampleTableBox paramSampleTableBox)
  {
    paramSampleTableBox.addBox(paramTrack.getSampleDescriptionBox());
  }

  protected void createStss(Track paramTrack, SampleTableBox paramSampleTableBox)
  {
    long[] arrayOfLong = paramTrack.getSyncSamples();
    if ((arrayOfLong != null) && (arrayOfLong.length > 0))
    {
      SyncSampleBox localSyncSampleBox = new SyncSampleBox();
      localSyncSampleBox.setSampleNumber(arrayOfLong);
      paramSampleTableBox.addBox(localSyncSampleBox);
    }
  }

  protected void createStsz(Track paramTrack, SampleTableBox paramSampleTableBox)
  {
    SampleSizeBox localSampleSizeBox = new SampleSizeBox();
    localSampleSizeBox.setSampleSizes((long[])this.track2SampleSizes.get(paramTrack));
    paramSampleTableBox.addBox(localSampleSizeBox);
  }

  protected void createStts(Track paramTrack, SampleTableBox paramSampleTableBox)
  {
    TimeToSampleBox.Entry localEntry = null;
    ArrayList localArrayList = new ArrayList();
    long[] arrayOfLong = paramTrack.getSampleDurations();
    int i = arrayOfLong.length;
    int j = 0;
    if (j < i)
    {
      long l = arrayOfLong[j];
      if ((localEntry != null) && (localEntry.getDelta() == l))
        localEntry.setCount(1L + localEntry.getCount());
      while (true)
      {
        j++;
        break;
        localEntry = new TimeToSampleBox.Entry(1L, l);
        localArrayList.add(localEntry);
      }
    }
    TimeToSampleBox localTimeToSampleBox = new TimeToSampleBox();
    localTimeToSampleBox.setEntries(localArrayList);
    paramSampleTableBox.addBox(localTimeToSampleBox);
  }

  protected void createSubs(Track paramTrack, SampleTableBox paramSampleTableBox)
  {
    if (paramTrack.getSubsampleInformationBox() != null)
      paramSampleTableBox.addBox(paramTrack.getSubsampleInformationBox());
  }

  protected TrackBox createTrackBox(Track paramTrack, Movie paramMovie, Map<Track, int[]> paramMap)
  {
    TrackBox localTrackBox = new TrackBox();
    TrackHeaderBox localTrackHeaderBox = new TrackHeaderBox();
    localTrackHeaderBox.setEnabled(true);
    localTrackHeaderBox.setInMovie(true);
    localTrackHeaderBox.setInPreview(true);
    localTrackHeaderBox.setInPoster(true);
    localTrackHeaderBox.setMatrix(paramTrack.getTrackMetaData().getMatrix());
    localTrackHeaderBox.setAlternateGroup(paramTrack.getTrackMetaData().getGroup());
    localTrackHeaderBox.setCreationTime(paramTrack.getTrackMetaData().getCreationTime());
    MediaBox localMediaBox;
    MediaInformationBox localMediaInformationBox;
    if ((paramTrack.getEdits() == null) || (paramTrack.getEdits().isEmpty()))
    {
      localTrackHeaderBox.setDuration(paramTrack.getDuration() * getTimescale(paramMovie) / paramTrack.getTrackMetaData().getTimescale());
      localTrackHeaderBox.setHeight(paramTrack.getTrackMetaData().getHeight());
      localTrackHeaderBox.setWidth(paramTrack.getTrackMetaData().getWidth());
      localTrackHeaderBox.setLayer(paramTrack.getTrackMetaData().getLayer());
      localTrackHeaderBox.setModificationTime(new Date());
      localTrackHeaderBox.setTrackId(paramTrack.getTrackMetaData().getTrackId());
      localTrackHeaderBox.setVolume(paramTrack.getTrackMetaData().getVolume());
      localTrackBox.addBox(localTrackHeaderBox);
      localTrackBox.addBox(createEdts(paramTrack, paramMovie));
      localMediaBox = new MediaBox();
      localTrackBox.addBox(localMediaBox);
      MediaHeaderBox localMediaHeaderBox = new MediaHeaderBox();
      localMediaHeaderBox.setCreationTime(paramTrack.getTrackMetaData().getCreationTime());
      localMediaHeaderBox.setDuration(paramTrack.getDuration());
      localMediaHeaderBox.setTimescale(paramTrack.getTrackMetaData().getTimescale());
      localMediaHeaderBox.setLanguage(paramTrack.getTrackMetaData().getLanguage());
      localMediaBox.addBox(localMediaHeaderBox);
      HandlerBox localHandlerBox = new HandlerBox();
      localMediaBox.addBox(localHandlerBox);
      localHandlerBox.setHandlerType(paramTrack.getHandler());
      localMediaInformationBox = new MediaInformationBox();
      if (!paramTrack.getHandler().equals("vide"))
        break label526;
      localMediaInformationBox.addBox(new VideoMediaHeaderBox());
    }
    while (true)
    {
      DataInformationBox localDataInformationBox = new DataInformationBox();
      DataReferenceBox localDataReferenceBox = new DataReferenceBox();
      localDataInformationBox.addBox(localDataReferenceBox);
      DataEntryUrlBox localDataEntryUrlBox = new DataEntryUrlBox();
      localDataEntryUrlBox.setFlags(1);
      localDataReferenceBox.addBox(localDataEntryUrlBox);
      localMediaInformationBox.addBox(localDataInformationBox);
      localMediaInformationBox.addBox(createStbl(paramTrack, paramMovie, paramMap));
      localMediaBox.addBox(localMediaInformationBox);
      return localTrackBox;
      long l = 0L;
      Iterator localIterator = paramTrack.getEdits().iterator();
      while (localIterator.hasNext())
        l += ()((Edit)localIterator.next()).getSegmentDuration();
      localTrackHeaderBox.setDuration(l * paramTrack.getTrackMetaData().getTimescale());
      break;
      label526: if (paramTrack.getHandler().equals("soun"))
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

  protected Box createUdta(Movie paramMovie)
  {
    return null;
  }

  int[] getChunkSizes(Track paramTrack, Movie paramMovie)
  {
    long[] arrayOfLong = this.intersectionFinder.sampleNumbers(paramTrack);
    int[] arrayOfInt = new int[arrayOfLong.length];
    int i = 0;
    if (i < arrayOfLong.length)
    {
      long l1 = arrayOfLong[i] - 1L;
      if (arrayOfLong.length == i + 1);
      for (long l2 = paramTrack.getSamples().size(); ; l2 = arrayOfLong[(i + 1)] - 1L)
      {
        arrayOfInt[i] = CastUtils.l2i(l2 - l1);
        i++;
        break;
      }
    }
    assert (((List)this.track2Sample.get(paramTrack)).size() == sum(arrayOfInt)) : "The number of samples and the sum of all chunk lengths must be equal";
    return arrayOfInt;
  }

  public long getTimescale(Movie paramMovie)
  {
    long l = ((Track)paramMovie.getTracks().iterator().next()).getTrackMetaData().getTimescale();
    Iterator localIterator = paramMovie.getTracks().iterator();
    while (localIterator.hasNext())
      l = gcd(((Track)localIterator.next()).getTrackMetaData().getTimescale(), l);
    return l;
  }

  protected List<Sample> putSamples(Track paramTrack, List<Sample> paramList)
  {
    return (List)this.track2Sample.put(paramTrack, paramList);
  }

  public void setIntersectionFinder(FragmentIntersectionFinder paramFragmentIntersectionFinder)
  {
    this.intersectionFinder = paramFragmentIntersectionFinder;
  }

  private class InterleaveChunkMdat
    implements Box
  {
    List<List<Sample>> chunkList = new ArrayList();
    long contentSize;
    Container parent;
    List<Track> tracks;

    private InterleaveChunkMdat(Map<Track, int[]> paramLong, long arg3)
    {
      Object localObject2;
      this.contentSize = localObject2;
      this.tracks = paramLong.getTracks();
      Object localObject1;
      for (int i = 0; i < ((int[])localObject1.values().iterator().next()).length; i++)
      {
        Iterator localIterator = this.tracks.iterator();
        while (localIterator.hasNext())
        {
          Track localTrack = (Track)localIterator.next();
          int[] arrayOfInt = (int[])localObject1.get(localTrack);
          long l = 0L;
          for (int j = 0; j < i; j++)
            l += arrayOfInt[j];
          List localList = ((List)DefaultMp4Builder.this.track2Sample.get(localTrack)).subList(CastUtils.l2i(l), CastUtils.l2i(l + arrayOfInt[i]));
          this.chunkList.add(localList);
        }
      }
    }

    private boolean isSmallBox(long paramLong)
    {
      return 8L + paramLong < 4294967296L;
    }

    public void getBox(WritableByteChannel paramWritableByteChannel)
      throws IOException
    {
      ByteBuffer localByteBuffer = ByteBuffer.allocate(16);
      long l = getSize();
      if (isSmallBox(l))
      {
        IsoTypeWriter.writeUInt32(localByteBuffer, l);
        localByteBuffer.put(IsoFile.fourCCtoBytes("mdat"));
        if (!isSmallBox(l))
          break label139;
        localByteBuffer.put(new byte[8]);
      }
      while (true)
      {
        localByteBuffer.rewind();
        paramWritableByteChannel.write(localByteBuffer);
        Iterator localIterator1 = this.chunkList.iterator();
        while (localIterator1.hasNext())
        {
          Iterator localIterator2 = ((List)localIterator1.next()).iterator();
          while (localIterator2.hasNext())
            ((Sample)localIterator2.next()).writeTo(paramWritableByteChannel);
        }
        IsoTypeWriter.writeUInt32(localByteBuffer, 1L);
        break;
        label139: IsoTypeWriter.writeUInt64(localByteBuffer, l);
      }
    }

    public long getDataOffset()
    {
      Object localObject = this;
      long l = 16L;
      if ((localObject instanceof Box))
      {
        Iterator localIterator = ((Box)localObject).getParent().getBoxes().iterator();
        while (true)
        {
          Box localBox;
          if (localIterator.hasNext())
          {
            localBox = (Box)localIterator.next();
            if (localObject != localBox);
          }
          else
          {
            localObject = ((Box)localObject).getParent();
            break;
          }
          l += localBox.getSize();
        }
      }
      return l;
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
      return 16L + this.contentSize;
    }

    public String getType()
    {
      return "mdat";
    }

    public void parse(DataSource paramDataSource, ByteBuffer paramByteBuffer, long paramLong, BoxParser paramBoxParser)
      throws IOException
    {
    }

    public void setParent(Container paramContainer)
    {
      this.parent = paramContainer;
    }
  }
}