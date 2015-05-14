package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AudioSampleEntry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.SampleEntry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.AbstractTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.AbstractDescriptorBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.ESDescriptorBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.AudioSpecificConfig;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.DecoderConfigDescriptor;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.DecoderSpecificInfo;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.ESDescriptor;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.SLConfigDescriptor;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Logger;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.channels.Channels;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class AppendTrack extends AbstractTrack
{
  private static Logger LOG = Logger.getLogger(AppendTrack.class);
  SampleDescriptionBox stsd;
  Track[] tracks;

  public AppendTrack(Track[] paramArrayOfTrack)
    throws IOException
  {
    super(appendTracknames(paramArrayOfTrack));
    this.tracks = paramArrayOfTrack;
    int i = paramArrayOfTrack.length;
    int j = 0;
    if (j < i)
    {
      Track localTrack = paramArrayOfTrack[j];
      if (this.stsd == null)
      {
        this.stsd = new SampleDescriptionBox();
        this.stsd.addBox((Box)localTrack.getSampleDescriptionBox().getBoxes(SampleEntry.class).get(0));
      }
      while (true)
      {
        j++;
        break;
        this.stsd = mergeStsds(this.stsd, localTrack.getSampleDescriptionBox());
      }
    }
  }

  public static String appendTracknames(Track[] paramArrayOfTrack)
  {
    String str = "";
    int i = paramArrayOfTrack.length;
    for (int j = 0; j < i; j++)
    {
      Track localTrack = paramArrayOfTrack[j];
      str = str + localTrack.getName() + " + ";
    }
    return str.substring(0, -3 + str.length());
  }

  private AudioSampleEntry mergeAudioSampleEntries(AudioSampleEntry paramAudioSampleEntry1, AudioSampleEntry paramAudioSampleEntry2)
  {
    AudioSampleEntry localAudioSampleEntry = new AudioSampleEntry(paramAudioSampleEntry2.getType());
    Iterator localIterator1;
    Iterator localIterator2;
    if (paramAudioSampleEntry1.getBytesPerFrame() == paramAudioSampleEntry2.getBytesPerFrame())
    {
      localAudioSampleEntry.setBytesPerFrame(paramAudioSampleEntry1.getBytesPerFrame());
      if (paramAudioSampleEntry1.getBytesPerPacket() != paramAudioSampleEntry2.getBytesPerPacket())
        break label385;
      localAudioSampleEntry.setBytesPerPacket(paramAudioSampleEntry1.getBytesPerPacket());
      if (paramAudioSampleEntry1.getBytesPerSample() != paramAudioSampleEntry2.getBytesPerSample())
        break label387;
      localAudioSampleEntry.setBytesPerSample(paramAudioSampleEntry1.getBytesPerSample());
      if (paramAudioSampleEntry1.getChannelCount() != paramAudioSampleEntry2.getChannelCount())
        break label397;
      localAudioSampleEntry.setChannelCount(paramAudioSampleEntry1.getChannelCount());
      if (paramAudioSampleEntry1.getPacketSize() != paramAudioSampleEntry2.getPacketSize())
        break label399;
      localAudioSampleEntry.setPacketSize(paramAudioSampleEntry1.getPacketSize());
      if (paramAudioSampleEntry1.getCompressionId() != paramAudioSampleEntry2.getCompressionId())
        break label409;
      localAudioSampleEntry.setCompressionId(paramAudioSampleEntry1.getCompressionId());
      if (paramAudioSampleEntry1.getSampleRate() != paramAudioSampleEntry2.getSampleRate())
        break label411;
      localAudioSampleEntry.setSampleRate(paramAudioSampleEntry1.getSampleRate());
      if (paramAudioSampleEntry1.getSampleSize() != paramAudioSampleEntry2.getSampleSize())
        break label413;
      localAudioSampleEntry.setSampleSize(paramAudioSampleEntry1.getSampleSize());
      if (paramAudioSampleEntry1.getSamplesPerPacket() != paramAudioSampleEntry2.getSamplesPerPacket())
        break label415;
      localAudioSampleEntry.setSamplesPerPacket(paramAudioSampleEntry1.getSamplesPerPacket());
      if (paramAudioSampleEntry1.getSoundVersion() != paramAudioSampleEntry2.getSoundVersion())
        break label417;
      localAudioSampleEntry.setSoundVersion(paramAudioSampleEntry1.getSoundVersion());
      if (!Arrays.equals(paramAudioSampleEntry1.getSoundVersion2Data(), paramAudioSampleEntry2.getSoundVersion2Data()))
        break label419;
      localAudioSampleEntry.setSoundVersion2Data(paramAudioSampleEntry1.getSoundVersion2Data());
      if (paramAudioSampleEntry1.getBoxes().size() != paramAudioSampleEntry2.getBoxes().size())
        break label383;
      localIterator1 = paramAudioSampleEntry1.getBoxes().iterator();
      localIterator2 = paramAudioSampleEntry2.getBoxes().iterator();
    }
    while (true)
    {
      Box localBox1;
      Box localBox2;
      ByteArrayOutputStream localByteArrayOutputStream1;
      ByteArrayOutputStream localByteArrayOutputStream2;
      if (localIterator1.hasNext())
      {
        localBox1 = (Box)localIterator1.next();
        localBox2 = (Box)localIterator2.next();
        localByteArrayOutputStream1 = new ByteArrayOutputStream();
        localByteArrayOutputStream2 = new ByteArrayOutputStream();
      }
      try
      {
        localBox1.getBox(Channels.newChannel(localByteArrayOutputStream1));
        localBox2.getBox(Channels.newChannel(localByteArrayOutputStream2));
        if (Arrays.equals(localByteArrayOutputStream1.toByteArray(), localByteArrayOutputStream2.toByteArray()))
        {
          localAudioSampleEntry.addBox(localBox1);
          continue;
          LOG.logError("BytesPerFrame differ");
          localAudioSampleEntry = null;
          label383: return localAudioSampleEntry;
          label385: return null;
          label387: LOG.logError("BytesPerSample differ");
          return null;
          label397: return null;
          label399: LOG.logError("ChannelCount differ");
          return null;
          label409: return null;
          label411: return null;
          label413: return null;
          label415: return null;
          label417: return null;
          label419: return null;
        }
      }
      catch (IOException localIOException)
      {
        LOG.logWarn(localIOException.getMessage());
        return null;
      }
      if (("esds".equals(localBox1.getType())) && ("esds".equals(localBox2.getType())))
      {
        ESDescriptorBox localESDescriptorBox1 = (ESDescriptorBox)localBox1;
        ESDescriptorBox localESDescriptorBox2 = (ESDescriptorBox)localBox2;
        localESDescriptorBox1.setDescriptor(mergeDescriptors(localESDescriptorBox1.getEsDescriptor(), localESDescriptorBox2.getEsDescriptor()));
        localAudioSampleEntry.addBox(localBox1);
      }
    }
  }

  private ESDescriptor mergeDescriptors(BaseDescriptor paramBaseDescriptor1, BaseDescriptor paramBaseDescriptor2)
  {
    if (((paramBaseDescriptor1 instanceof ESDescriptor)) && ((paramBaseDescriptor2 instanceof ESDescriptor)))
    {
      ESDescriptor localESDescriptor1 = (ESDescriptor)paramBaseDescriptor1;
      ESDescriptor localESDescriptor2 = (ESDescriptor)paramBaseDescriptor2;
      if (localESDescriptor1.getURLFlag() != localESDescriptor2.getURLFlag())
        localESDescriptor1 = null;
      label251: 
      do
      {
        return localESDescriptor1;
        if ((localESDescriptor1.getURLLength() == localESDescriptor2.getURLLength()) || (localESDescriptor1.getDependsOnEsId() != localESDescriptor2.getDependsOnEsId()))
          return null;
        if (localESDescriptor1.getEsId() != localESDescriptor2.getEsId())
          return null;
        if (localESDescriptor1.getoCREsId() != localESDescriptor2.getoCREsId())
          return null;
        if (localESDescriptor1.getoCRstreamFlag() != localESDescriptor2.getoCRstreamFlag())
          return null;
        if (localESDescriptor1.getRemoteODFlag() != localESDescriptor2.getRemoteODFlag())
          return null;
        if (localESDescriptor1.getStreamDependenceFlag() != localESDescriptor2.getStreamDependenceFlag())
          return null;
        if ((localESDescriptor1.getStreamPriority() == localESDescriptor2.getStreamPriority()) || (localESDescriptor1.getURLString() != null))
        {
          if (!localESDescriptor1.getURLString().equals(localESDescriptor2.getURLString()));
          if (localESDescriptor1.getDecoderConfigDescriptor() == null)
            break label251;
          if (localESDescriptor1.getDecoderConfigDescriptor().equals(localESDescriptor2.getDecoderConfigDescriptor()))
            break label259;
        }
        DecoderConfigDescriptor localDecoderConfigDescriptor1;
        DecoderConfigDescriptor localDecoderConfigDescriptor2;
        while (localESDescriptor2.getDecoderConfigDescriptor() != null)
        {
          localDecoderConfigDescriptor1 = localESDescriptor1.getDecoderConfigDescriptor();
          localDecoderConfigDescriptor2 = localESDescriptor2.getDecoderConfigDescriptor();
          if ((localDecoderConfigDescriptor1.getAudioSpecificInfo() == null) || (localDecoderConfigDescriptor2.getAudioSpecificInfo() == null) || (localDecoderConfigDescriptor1.getAudioSpecificInfo().equals(localDecoderConfigDescriptor2.getAudioSpecificInfo())))
            break label285;
          return null;
          if (localESDescriptor2.getURLString() == null)
            break;
          break;
        }
        if (localESDescriptor1.getOtherDescriptors() != null)
        {
          if (localESDescriptor1.getOtherDescriptors().equals(localESDescriptor2.getOtherDescriptors()));
        }
        else
          while (localESDescriptor2.getOtherDescriptors() != null)
          {
            return null;
            if (localDecoderConfigDescriptor1.getAvgBitRate() != localDecoderConfigDescriptor2.getAvgBitRate())
              localDecoderConfigDescriptor1.setAvgBitRate((localDecoderConfigDescriptor1.getAvgBitRate() + localDecoderConfigDescriptor2.getAvgBitRate()) / 2L);
            if ((localDecoderConfigDescriptor1.getBufferSizeDB() == localDecoderConfigDescriptor2.getBufferSizeDB()) || (localDecoderConfigDescriptor1.getDecoderSpecificInfo() != null))
            {
              if (localDecoderConfigDescriptor1.getDecoderSpecificInfo().equals(localDecoderConfigDescriptor2.getDecoderSpecificInfo()));
            }
            else
              while (localDecoderConfigDescriptor2.getDecoderSpecificInfo() != null)
                return null;
            if (localDecoderConfigDescriptor1.getMaxBitRate() != localDecoderConfigDescriptor2.getMaxBitRate())
              localDecoderConfigDescriptor1.setMaxBitRate(Math.max(localDecoderConfigDescriptor1.getMaxBitRate(), localDecoderConfigDescriptor2.getMaxBitRate()));
            if (!localDecoderConfigDescriptor1.getProfileLevelIndicationDescriptors().equals(localDecoderConfigDescriptor2.getProfileLevelIndicationDescriptors()))
              return null;
            if (localDecoderConfigDescriptor1.getObjectTypeIndication() != localDecoderConfigDescriptor2.getObjectTypeIndication())
              return null;
            if (localDecoderConfigDescriptor1.getStreamType() != localDecoderConfigDescriptor2.getStreamType())
              return null;
            if (localDecoderConfigDescriptor1.getUpStream() == localDecoderConfigDescriptor2.getUpStream())
              break;
            return null;
          }
        if (localESDescriptor1.getSlConfigDescriptor() == null)
          break;
      }
      while (localESDescriptor1.getSlConfigDescriptor().equals(localESDescriptor2.getSlConfigDescriptor()));
      while (true)
      {
        label259: label285: return null;
        if (localESDescriptor2.getSlConfigDescriptor() == null)
          break;
      }
    }
    LOG.logError("I can only merge ESDescriptors");
    return null;
  }

  private SampleEntry mergeSampleEntry(SampleEntry paramSampleEntry1, SampleEntry paramSampleEntry2)
  {
    if (!paramSampleEntry1.getType().equals(paramSampleEntry2.getType()));
    do
    {
      return null;
      if (((paramSampleEntry1 instanceof VisualSampleEntry)) && ((paramSampleEntry2 instanceof VisualSampleEntry)))
        return mergeVisualSampleEntry((VisualSampleEntry)paramSampleEntry1, (VisualSampleEntry)paramSampleEntry2);
    }
    while ((!(paramSampleEntry1 instanceof AudioSampleEntry)) || (!(paramSampleEntry2 instanceof AudioSampleEntry)));
    return mergeAudioSampleEntries((AudioSampleEntry)paramSampleEntry1, (AudioSampleEntry)paramSampleEntry2);
  }

  private SampleDescriptionBox mergeStsds(SampleDescriptionBox paramSampleDescriptionBox1, SampleDescriptionBox paramSampleDescriptionBox2)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream1 = new ByteArrayOutputStream();
    ByteArrayOutputStream localByteArrayOutputStream2 = new ByteArrayOutputStream();
    try
    {
      paramSampleDescriptionBox1.getBox(Channels.newChannel(localByteArrayOutputStream1));
      paramSampleDescriptionBox2.getBox(Channels.newChannel(localByteArrayOutputStream2));
      byte[] arrayOfByte = localByteArrayOutputStream1.toByteArray();
      if (!Arrays.equals(localByteArrayOutputStream2.toByteArray(), arrayOfByte))
      {
        SampleEntry localSampleEntry = mergeSampleEntry((SampleEntry)paramSampleDescriptionBox1.getBoxes(SampleEntry.class).get(0), (SampleEntry)paramSampleDescriptionBox2.getBoxes(SampleEntry.class).get(0));
        if (localSampleEntry != null)
          paramSampleDescriptionBox1.setBoxes(Collections.singletonList(localSampleEntry));
      }
      else
      {
        return paramSampleDescriptionBox1;
      }
    }
    catch (IOException localIOException)
    {
      LOG.logError(localIOException.getMessage());
      return null;
    }
    throw new IOException("Cannot merge " + paramSampleDescriptionBox1.getBoxes(SampleEntry.class).get(0) + " and " + paramSampleDescriptionBox2.getBoxes(SampleEntry.class).get(0));
  }

  private VisualSampleEntry mergeVisualSampleEntry(VisualSampleEntry paramVisualSampleEntry1, VisualSampleEntry paramVisualSampleEntry2)
  {
    VisualSampleEntry localVisualSampleEntry = new VisualSampleEntry();
    Iterator localIterator1;
    Iterator localIterator2;
    if (paramVisualSampleEntry1.getHorizresolution() == paramVisualSampleEntry2.getHorizresolution())
    {
      localVisualSampleEntry.setHorizresolution(paramVisualSampleEntry1.getHorizresolution());
      localVisualSampleEntry.setCompressorname(paramVisualSampleEntry1.getCompressorname());
      if (paramVisualSampleEntry1.getDepth() != paramVisualSampleEntry2.getDepth())
        break label309;
      localVisualSampleEntry.setDepth(paramVisualSampleEntry1.getDepth());
      if (paramVisualSampleEntry1.getFrameCount() != paramVisualSampleEntry2.getFrameCount())
        break label320;
      localVisualSampleEntry.setFrameCount(paramVisualSampleEntry1.getFrameCount());
      if (paramVisualSampleEntry1.getHeight() != paramVisualSampleEntry2.getHeight())
        break label331;
      localVisualSampleEntry.setHeight(paramVisualSampleEntry1.getHeight());
      if (paramVisualSampleEntry1.getWidth() != paramVisualSampleEntry2.getWidth())
        break label342;
      localVisualSampleEntry.setWidth(paramVisualSampleEntry1.getWidth());
      if (paramVisualSampleEntry1.getVertresolution() != paramVisualSampleEntry2.getVertresolution())
        break label353;
      localVisualSampleEntry.setVertresolution(paramVisualSampleEntry1.getVertresolution());
      if (paramVisualSampleEntry1.getHorizresolution() != paramVisualSampleEntry2.getHorizresolution())
        break label364;
      localVisualSampleEntry.setHorizresolution(paramVisualSampleEntry1.getHorizresolution());
      if (paramVisualSampleEntry1.getBoxes().size() != paramVisualSampleEntry2.getBoxes().size())
        break label307;
      localIterator1 = paramVisualSampleEntry1.getBoxes().iterator();
      localIterator2 = paramVisualSampleEntry2.getBoxes().iterator();
    }
    while (true)
    {
      Box localBox1;
      Box localBox2;
      ByteArrayOutputStream localByteArrayOutputStream1;
      ByteArrayOutputStream localByteArrayOutputStream2;
      if (localIterator1.hasNext())
      {
        localBox1 = (Box)localIterator1.next();
        localBox2 = (Box)localIterator2.next();
        localByteArrayOutputStream1 = new ByteArrayOutputStream();
        localByteArrayOutputStream2 = new ByteArrayOutputStream();
      }
      try
      {
        localBox1.getBox(Channels.newChannel(localByteArrayOutputStream1));
        localBox2.getBox(Channels.newChannel(localByteArrayOutputStream2));
        if (Arrays.equals(localByteArrayOutputStream1.toByteArray(), localByteArrayOutputStream2.toByteArray()))
        {
          localVisualSampleEntry.addBox(localBox1);
          continue;
          LOG.logError("Horizontal Resolution differs");
          localVisualSampleEntry = null;
          label307: return localVisualSampleEntry;
          label309: LOG.logError("Depth differs");
          return null;
          label320: LOG.logError("frame count differs");
          return null;
          label331: LOG.logError("height differs");
          return null;
          label342: LOG.logError("width differs");
          return null;
          label353: LOG.logError("vert resolution differs");
          return null;
          label364: LOG.logError("horizontal resolution differs");
          return null;
        }
      }
      catch (IOException localIOException)
      {
        LOG.logWarn(localIOException.getMessage());
        return null;
      }
      if (((localBox1 instanceof AbstractDescriptorBox)) && ((localBox2 instanceof AbstractDescriptorBox)))
      {
        ESDescriptor localESDescriptor = mergeDescriptors(((AbstractDescriptorBox)localBox1).getDescriptor(), ((AbstractDescriptorBox)localBox2).getDescriptor());
        ((AbstractDescriptorBox)localBox1).setDescriptor(localESDescriptor);
        localVisualSampleEntry.addBox(localBox1);
      }
    }
  }

  public void close()
    throws IOException
  {
    Track[] arrayOfTrack = this.tracks;
    int i = arrayOfTrack.length;
    for (int j = 0; j < i; j++)
      arrayOfTrack[j].close();
  }

  public List<CompositionTimeToSample.Entry> getCompositionTimeEntries()
  {
    LinkedList localLinkedList1;
    if ((this.tracks[0].getCompositionTimeEntries() != null) && (!this.tracks[0].getCompositionTimeEntries().isEmpty()))
    {
      LinkedList localLinkedList2 = new LinkedList();
      Track[] arrayOfTrack = this.tracks;
      int i = arrayOfTrack.length;
      for (int j = 0; j < i; j++)
        localLinkedList2.add(CompositionTimeToSample.blowupCompositionTimes(arrayOfTrack[j].getCompositionTimeEntries()));
      localLinkedList1 = new LinkedList();
      Iterator localIterator = localLinkedList2.iterator();
      if (localIterator.hasNext())
      {
        int[] arrayOfInt = (int[])localIterator.next();
        int k = arrayOfInt.length;
        int m = 0;
        label131: if (m < k)
        {
          int n = arrayOfInt[m];
          if ((!localLinkedList1.isEmpty()) && (((CompositionTimeToSample.Entry)localLinkedList1.getLast()).getOffset() == n))
            break label188;
          localLinkedList1.add(new CompositionTimeToSample.Entry(1, n));
        }
        while (true)
        {
          m++;
          break label131;
          break;
          label188: CompositionTimeToSample.Entry localEntry = (CompositionTimeToSample.Entry)localLinkedList1.getLast();
          localEntry.setCount(1 + localEntry.getCount());
        }
      }
    }
    else
    {
      localLinkedList1 = null;
    }
    return localLinkedList1;
  }

  public String getHandler()
  {
    return this.tracks[0].getHandler();
  }

  public List<SampleDependencyTypeBox.Entry> getSampleDependencies()
  {
    int i = 0;
    LinkedList localLinkedList;
    Track[] arrayOfTrack;
    int j;
    if ((this.tracks[0].getSampleDependencies() != null) && (!this.tracks[0].getSampleDependencies().isEmpty()))
    {
      localLinkedList = new LinkedList();
      arrayOfTrack = this.tracks;
      j = arrayOfTrack.length;
    }
    while (i < j)
    {
      localLinkedList.addAll(arrayOfTrack[i].getSampleDependencies());
      i++;
      continue;
      localLinkedList = null;
    }
    return localLinkedList;
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return this.stsd;
  }

  public long[] getSampleDurations()
  {
    int i = 0;
    try
    {
      Track[] arrayOfTrack1 = this.tracks;
      int j = arrayOfTrack1.length;
      for (int k = 0; k < j; k++)
        i += arrayOfTrack1[k].getSampleDurations().length;
      long[] arrayOfLong1 = new long[i];
      int m = 0;
      Track[] arrayOfTrack2 = this.tracks;
      int n = arrayOfTrack2.length;
      int i1 = 0;
      while (i1 < n)
      {
        long[] arrayOfLong2 = arrayOfTrack2[i1].getSampleDurations();
        int i2 = arrayOfLong2.length;
        int i3 = 0;
        int i5;
        for (int i4 = m; i3 < i2; i4 = i5)
        {
          long l = arrayOfLong2[i3];
          i5 = i4 + 1;
          arrayOfLong1[i4] = l;
          i3++;
        }
        i1++;
        m = i4;
      }
      return arrayOfLong1;
    }
    finally
    {
    }
  }

  public List<Sample> getSamples()
  {
    ArrayList localArrayList = new ArrayList();
    Track[] arrayOfTrack = this.tracks;
    int i = arrayOfTrack.length;
    for (int j = 0; j < i; j++)
      localArrayList.addAll(arrayOfTrack[j].getSamples());
    return localArrayList;
  }

  public SubSampleInformationBox getSubsampleInformationBox()
  {
    return this.tracks[0].getSubsampleInformationBox();
  }

  public long[] getSyncSamples()
  {
    long[] arrayOfLong1;
    int m;
    long l1;
    Track[] arrayOfTrack2;
    int n;
    int i1;
    if ((this.tracks[0].getSyncSamples() != null) && (this.tracks[0].getSyncSamples().length > 0))
    {
      int i = 0;
      Track[] arrayOfTrack1 = this.tracks;
      int j = arrayOfTrack1.length;
      for (int k = 0; k < j; k++)
        i += arrayOfTrack1[k].getSyncSamples().length;
      arrayOfLong1 = new long[i];
      m = 0;
      l1 = 0L;
      arrayOfTrack2 = this.tracks;
      n = arrayOfTrack2.length;
      i1 = 0;
    }
    while (i1 < n)
    {
      Track localTrack = arrayOfTrack2[i1];
      long[] arrayOfLong2 = localTrack.getSyncSamples();
      int i2 = arrayOfLong2.length;
      int i3 = 0;
      int i5;
      for (int i4 = m; i3 < i2; i4 = i5)
      {
        long l2 = arrayOfLong2[i3];
        i5 = i4 + 1;
        arrayOfLong1[i4] = (l1 + l2);
        i3++;
      }
      l1 += localTrack.getSamples().size();
      i1++;
      m = i4;
      continue;
      arrayOfLong1 = null;
    }
    return arrayOfLong1;
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.tracks[0].getTrackMetaData();
  }
}