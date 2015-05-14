package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.samples;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.MovieFragmentBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackExtendsBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackFragmentBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackFragmentHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackRunBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment.TrackRunBox.Entry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Path;
import java.io.IOException;
import java.lang.ref.SoftReference;
import java.lang.reflect.Array;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class FragmentedMp4SampleList extends AbstractList<Sample>
{
  private List<TrackFragmentBox> allTrafs;
  private int[] firstSamples;
  IsoFile[] fragments;
  private SoftReference<Sample>[] sampleCache;
  private int size_ = -1;
  Container topLevel;
  TrackBox trackBox = null;
  TrackExtendsBox trex = null;
  private Map<TrackRunBox, SoftReference<ByteBuffer>> trunDataCache = new HashMap();

  public FragmentedMp4SampleList(long paramLong, Container paramContainer, IsoFile[] paramArrayOfIsoFile)
  {
    this.topLevel = paramContainer;
    this.fragments = paramArrayOfIsoFile;
    Iterator localIterator1 = Path.getPaths(paramContainer, "moov[0]/trak").iterator();
    while (localIterator1.hasNext())
    {
      TrackBox localTrackBox = (TrackBox)localIterator1.next();
      if (localTrackBox.getTrackHeaderBox().getTrackId() == paramLong)
        this.trackBox = localTrackBox;
    }
    if (this.trackBox == null)
      throw new RuntimeException("This MP4 does not contain track " + paramLong);
    Iterator localIterator2 = Path.getPaths(paramContainer, "moov[0]/mvex[0]/trex").iterator();
    while (localIterator2.hasNext())
    {
      TrackExtendsBox localTrackExtendsBox = (TrackExtendsBox)localIterator2.next();
      if (localTrackExtendsBox.getTrackId() == this.trackBox.getTrackHeaderBox().getTrackId())
        this.trex = localTrackExtendsBox;
    }
    this.sampleCache = ((SoftReference[])Array.newInstance(SoftReference.class, size()));
    initAllFragments();
  }

  private int getTrafSize(TrackFragmentBox paramTrackFragmentBox)
  {
    List localList = paramTrackFragmentBox.getBoxes();
    int i = 0;
    for (int j = 0; j < localList.size(); j++)
    {
      Box localBox = (Box)localList.get(j);
      if ((localBox instanceof TrackRunBox))
        i += CastUtils.l2i(((TrackRunBox)localBox).getSampleCount());
    }
    return i;
  }

  private List<TrackFragmentBox> initAllFragments()
  {
    Object localObject;
    if (this.allTrafs != null)
      localObject = this.allTrafs;
    while (true)
    {
      return localObject;
      localObject = new ArrayList();
      Iterator localIterator1 = this.topLevel.getBoxes(MovieFragmentBox.class).iterator();
      while (localIterator1.hasNext())
      {
        Iterator localIterator4 = ((MovieFragmentBox)localIterator1.next()).getBoxes(TrackFragmentBox.class).iterator();
        while (localIterator4.hasNext())
        {
          TrackFragmentBox localTrackFragmentBox2 = (TrackFragmentBox)localIterator4.next();
          if (localTrackFragmentBox2.getTrackFragmentHeaderBox().getTrackId() == this.trackBox.getTrackHeaderBox().getTrackId())
            ((List)localObject).add(localTrackFragmentBox2);
        }
      }
      if (this.fragments != null)
      {
        IsoFile[] arrayOfIsoFile = this.fragments;
        int k = arrayOfIsoFile.length;
        for (int m = 0; m < k; m++)
        {
          Iterator localIterator2 = arrayOfIsoFile[m].getBoxes(MovieFragmentBox.class).iterator();
          while (localIterator2.hasNext())
          {
            Iterator localIterator3 = ((MovieFragmentBox)localIterator2.next()).getBoxes(TrackFragmentBox.class).iterator();
            while (localIterator3.hasNext())
            {
              TrackFragmentBox localTrackFragmentBox1 = (TrackFragmentBox)localIterator3.next();
              if (localTrackFragmentBox1.getTrackFragmentHeaderBox().getTrackId() == this.trackBox.getTrackHeaderBox().getTrackId())
                ((List)localObject).add(localTrackFragmentBox1);
            }
          }
        }
      }
      this.allTrafs = ((List)localObject);
      int i = 1;
      this.firstSamples = new int[this.allTrafs.size()];
      for (int j = 0; j < this.allTrafs.size(); j++)
      {
        this.firstSamples[j] = i;
        i += getTrafSize((TrackFragmentBox)this.allTrafs.get(j));
      }
    }
  }

  public Sample get(int paramInt)
  {
    if (this.sampleCache[paramInt] != null)
    {
      Sample localSample = (Sample)this.sampleCache[paramInt].get();
      if (localSample != null)
        return localSample;
    }
    int i = paramInt + 1;
    for (int j = -1 + this.firstSamples.length; i - this.firstSamples[j] < 0; j--);
    TrackFragmentBox localTrackFragmentBox = (TrackFragmentBox)this.allTrafs.get(j);
    int k = i - this.firstSamples[j];
    int m = 0;
    MovieFragmentBox localMovieFragmentBox = (MovieFragmentBox)localTrackFragmentBox.getParent();
    Iterator localIterator1 = localTrackFragmentBox.getBoxes().iterator();
    while (localIterator1.hasNext())
    {
      Box localBox = (Box)localIterator1.next();
      if ((localBox instanceof TrackRunBox))
      {
        TrackRunBox localTrackRunBox = (TrackRunBox)localBox;
        if (localTrackRunBox.getEntries().size() < k - m)
        {
          m += localTrackRunBox.getEntries().size();
        }
        else
        {
          List localList = localTrackRunBox.getEntries();
          TrackFragmentHeaderBox localTrackFragmentHeaderBox = localTrackFragmentBox.getTrackFragmentHeaderBox();
          boolean bool1 = localTrackRunBox.isSampleSizePresent();
          boolean bool2 = localTrackFragmentHeaderBox.hasDefaultSampleSize();
          long l1 = 0L;
          ByteBuffer localByteBuffer;
          label262: long l3;
          Object localObject;
          label295: int i3;
          Iterator localIterator2;
          if (!bool1)
          {
            if (bool2)
              l1 = localTrackFragmentHeaderBox.getDefaultSampleSize();
          }
          else
          {
            SoftReference localSoftReference1 = (SoftReference)this.trunDataCache.get(localTrackRunBox);
            if (localSoftReference1 == null)
              break label397;
            localByteBuffer = (ByteBuffer)localSoftReference1.get();
            if (localByteBuffer != null)
              break label469;
            l3 = 0L;
            if (!localTrackFragmentHeaderBox.hasBaseDataOffset())
              break label403;
            l3 += localTrackFragmentHeaderBox.getBaseDataOffset();
            localObject = localMovieFragmentBox.getParent();
            if (localTrackRunBox.isDataOffsetPresent())
              l3 += localTrackRunBox.getDataOffset();
            i3 = 0;
            localIterator2 = localList.iterator();
          }
          while (true)
          {
            if (!localIterator2.hasNext())
              break label422;
            TrackRunBox.Entry localEntry = (TrackRunBox.Entry)localIterator2.next();
            if (bool1)
            {
              i3 = (int)(i3 + localEntry.getSampleSize());
              continue;
              if (this.trex == null)
                throw new RuntimeException("File doesn't contain trex box but track fragments aren't fully self contained. Cannot determine sample size.");
              l1 = this.trex.getDefaultSampleSize();
              break;
              label397: localByteBuffer = null;
              break label262;
              label403: localObject = localMovieFragmentBox;
              break label295;
            }
            i3 = (int)(l1 + i3);
          }
          label422: long l4 = i3;
          label469: final int n;
          while (true)
          {
            try
            {
              localByteBuffer = ((Container)localObject).getByteBuffer(l3, l4);
              Map localMap = this.trunDataCache;
              SoftReference localSoftReference3 = new SoftReference(localByteBuffer);
              localMap.put(localTrackRunBox, localSoftReference3);
              n = 0;
              int i1 = 0;
              int i2 = k - m;
              if (i1 >= i2)
                break;
              if (bool1)
              {
                n = (int)(n + ((TrackRunBox.Entry)localList.get(i1)).getSampleSize());
                i1++;
                continue;
              }
            }
            catch (IOException localIOException)
            {
              throw new RuntimeException(localIOException);
            }
            n = (int)(l1 + n);
          }
          if (bool1);
          for (final long l2 = ((TrackRunBox.Entry)localList.get(k - m)).getSampleSize(); ; l2 = l1)
          {
            Sample local1 = new Sample()
            {
              public ByteBuffer asByteBuffer()
              {
                return (ByteBuffer)((ByteBuffer)n.position(this.val$finalOffset)).slice().limit(CastUtils.l2i(l2));
              }

              public long getSize()
              {
                return l2;
              }

              public void writeTo(WritableByteChannel paramAnonymousWritableByteChannel)
                throws IOException
              {
                paramAnonymousWritableByteChannel.write(asByteBuffer());
              }
            };
            SoftReference[] arrayOfSoftReference = this.sampleCache;
            SoftReference localSoftReference2 = new SoftReference(local1);
            arrayOfSoftReference[paramInt] = localSoftReference2;
            return local1;
          }
        }
      }
    }
    throw new RuntimeException("Couldn't find sample in the traf I was looking");
  }

  public int size()
  {
    if (this.size_ != -1)
      return this.size_;
    int i = 0;
    Iterator localIterator1 = this.topLevel.getBoxes(MovieFragmentBox.class).iterator();
    while (localIterator1.hasNext())
    {
      Iterator localIterator4 = ((MovieFragmentBox)localIterator1.next()).getBoxes(TrackFragmentBox.class).iterator();
      while (localIterator4.hasNext())
      {
        TrackFragmentBox localTrackFragmentBox2 = (TrackFragmentBox)localIterator4.next();
        if (localTrackFragmentBox2.getTrackFragmentHeaderBox().getTrackId() == this.trackBox.getTrackHeaderBox().getTrackId())
          i = (int)(i + ((TrackRunBox)localTrackFragmentBox2.getBoxes(TrackRunBox.class).get(0)).getSampleCount());
      }
    }
    IsoFile[] arrayOfIsoFile = this.fragments;
    int j = arrayOfIsoFile.length;
    for (int k = 0; k < j; k++)
    {
      Iterator localIterator2 = arrayOfIsoFile[k].getBoxes(MovieFragmentBox.class).iterator();
      while (localIterator2.hasNext())
      {
        Iterator localIterator3 = ((MovieFragmentBox)localIterator2.next()).getBoxes(TrackFragmentBox.class).iterator();
        while (localIterator3.hasNext())
        {
          TrackFragmentBox localTrackFragmentBox1 = (TrackFragmentBox)localIterator3.next();
          if (localTrackFragmentBox1.getTrackFragmentHeaderBox().getTrackId() == this.trackBox.getTrackHeaderBox().getTrackId())
            i = (int)(i + ((TrackRunBox)localTrackFragmentBox1.getBoxes(TrackRunBox.class).get(0)).getSampleCount());
        }
      }
    }
    this.size_ = i;
    return i;
  }
}