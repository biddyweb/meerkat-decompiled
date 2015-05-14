package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.CompositionTimeToSample.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDependencyTypeBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.TextSampleEntry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.TextSampleEntry.BoxRecord;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.TextSampleEntry.StyleRecord;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.AbstractTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.SampleImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.threegpp26245.FontTableBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.threegpp26245.FontTableBox.FontRecord;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class TextTrackImpl extends AbstractTrack
{
  SampleDescriptionBox sampleDescriptionBox = new SampleDescriptionBox();
  List<Line> subs = new LinkedList();
  TrackMetaData trackMetaData = new TrackMetaData();

  public TextTrackImpl()
  {
    super("subtiles");
    TextSampleEntry localTextSampleEntry = new TextSampleEntry("tx3g");
    localTextSampleEntry.setDataReferenceIndex(1);
    localTextSampleEntry.setStyleRecord(new TextSampleEntry.StyleRecord());
    localTextSampleEntry.setBoxRecord(new TextSampleEntry.BoxRecord());
    this.sampleDescriptionBox.addBox(localTextSampleEntry);
    FontTableBox localFontTableBox = new FontTableBox();
    localFontTableBox.setEntries(Collections.singletonList(new FontTableBox.FontRecord(1, "Serif")));
    localTextSampleEntry.addBox(localFontTableBox);
    this.trackMetaData.setCreationTime(new Date());
    this.trackMetaData.setModificationTime(new Date());
    this.trackMetaData.setTimescale(1000L);
  }

  public void close()
    throws IOException
  {
  }

  public List<CompositionTimeToSample.Entry> getCompositionTimeEntries()
  {
    return null;
  }

  public String getHandler()
  {
    return "sbtl";
  }

  public List<SampleDependencyTypeBox.Entry> getSampleDependencies()
  {
    return null;
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return this.sampleDescriptionBox;
  }

  public long[] getSampleDurations()
  {
    ArrayList localArrayList = new ArrayList();
    long l1 = 0L;
    Iterator localIterator1 = this.subs.iterator();
    if (localIterator1.hasNext())
    {
      Line localLine = (Line)localIterator1.next();
      long l2 = localLine.from - l1;
      if (l2 > 0L)
        localArrayList.add(Long.valueOf(l2));
      while (l2 >= 0L)
      {
        localArrayList.add(Long.valueOf(localLine.to - localLine.from));
        l1 = localLine.to;
        break;
      }
      throw new Error("Subtitle display times may not intersect");
    }
    long[] arrayOfLong = new long[localArrayList.size()];
    int i = 0;
    Iterator localIterator2 = localArrayList.iterator();
    while (localIterator2.hasNext())
    {
      Long localLong = (Long)localIterator2.next();
      int j = i + 1;
      arrayOfLong[i] = localLong.longValue();
      i = j;
    }
    return arrayOfLong;
  }

  public List<Sample> getSamples()
  {
    LinkedList localLinkedList = new LinkedList();
    long l1 = 0L;
    Iterator localIterator = this.subs.iterator();
    while (localIterator.hasNext())
    {
      Line localLine = (Line)localIterator.next();
      long l2 = localLine.from - l1;
      label89: ByteArrayOutputStream localByteArrayOutputStream;
      DataOutputStream localDataOutputStream;
      if (l2 > 0L)
      {
        localLinkedList.add(new SampleImpl(ByteBuffer.wrap(new byte[] { 0, 0 })));
        localByteArrayOutputStream = new ByteArrayOutputStream();
        localDataOutputStream = new DataOutputStream(localByteArrayOutputStream);
      }
      try
      {
        localDataOutputStream.writeShort(localLine.text.getBytes("UTF-8").length);
        localDataOutputStream.write(localLine.text.getBytes("UTF-8"));
        localDataOutputStream.close();
        localLinkedList.add(new SampleImpl(ByteBuffer.wrap(localByteArrayOutputStream.toByteArray())));
        l1 = localLine.to;
        continue;
        if (l2 >= 0L)
          break label89;
        throw new Error("Subtitle display times may not intersect");
      }
      catch (IOException localIOException)
      {
        throw new Error("VM is broken. Does not support UTF-8");
      }
    }
    return localLinkedList;
  }

  public List<Line> getSubs()
  {
    return this.subs;
  }

  public SubSampleInformationBox getSubsampleInformationBox()
  {
    return null;
  }

  public long[] getSyncSamples()
  {
    return null;
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.trackMetaData;
  }

  public static class Line
  {
    long from;
    String text;
    long to;

    public Line(long paramLong1, long paramLong2, String paramString)
    {
      this.from = paramLong1;
      this.to = paramLong2;
      this.text = paramString;
    }

    public long getFrom()
    {
      return this.from;
    }

    public String getText()
    {
      return this.text;
    }

    public long getTo()
    {
      return this.to;
    }
  }
}