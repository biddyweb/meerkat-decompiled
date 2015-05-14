package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractContainerBox;
import java.util.Iterator;
import java.util.List;

public class SampleTableBox extends AbstractContainerBox
{
  public static final String TYPE = "stbl";
  private SampleToChunkBox sampleToChunkBox;

  public SampleTableBox()
  {
    super("stbl");
  }

  public ChunkOffsetBox getChunkOffsetBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof ChunkOffsetBox))
        return (ChunkOffsetBox)localBox;
    }
    return null;
  }

  public CompositionTimeToSample getCompositionTimeToSample()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof CompositionTimeToSample))
        return (CompositionTimeToSample)localBox;
    }
    return null;
  }

  public SampleDependencyTypeBox getSampleDependencyTypeBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof SampleDependencyTypeBox))
        return (SampleDependencyTypeBox)localBox;
    }
    return null;
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof SampleDescriptionBox))
        return (SampleDescriptionBox)localBox;
    }
    return null;
  }

  public SampleSizeBox getSampleSizeBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof SampleSizeBox))
        return (SampleSizeBox)localBox;
    }
    return null;
  }

  public SampleToChunkBox getSampleToChunkBox()
  {
    if (this.sampleToChunkBox != null)
      return this.sampleToChunkBox;
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof SampleToChunkBox))
      {
        this.sampleToChunkBox = ((SampleToChunkBox)localBox);
        return this.sampleToChunkBox;
      }
    }
    return null;
  }

  public StaticChunkOffsetBox getStaticChunkOffsetBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof StaticChunkOffsetBox))
        return (StaticChunkOffsetBox)localBox;
    }
    return null;
  }

  public SyncSampleBox getSyncSampleBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof SyncSampleBox))
        return (SyncSampleBox)localBox;
    }
    return null;
  }

  public TimeToSampleBox getTimeToSampleBox()
  {
    Iterator localIterator = getBoxes().iterator();
    while (localIterator.hasNext())
    {
      Box localBox = (Box)localIterator.next();
      if ((localBox instanceof TimeToSampleBox))
        return (TimeToSampleBox)localBox;
    }
    return null;
  }
}