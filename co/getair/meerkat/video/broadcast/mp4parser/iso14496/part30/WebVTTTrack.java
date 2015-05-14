package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part30;

import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.AbstractTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

public class WebVTTTrack extends AbstractTrack
{
  WebVTTSampleEntry sampleEntry = new WebVTTSampleEntry();
  List<Sample> samples = new ArrayList();
  String[] subs;

  public WebVTTTrack(DataSource paramDataSource)
    throws IOException
  {
    super(paramDataSource.toString());
    this.sampleEntry.addBox(new WebVTTConfigurationBox());
    this.sampleEntry.addBox(new WebVTTSourceLabelBox());
    ByteBuffer localByteBuffer = paramDataSource.map(0L, CastUtils.l2i(paramDataSource.size()));
    byte[] arrayOfByte = new byte[CastUtils.l2i(paramDataSource.size())];
    localByteBuffer.get(arrayOfByte);
    this.subs = Utf8.convert(arrayOfByte).split("\\r?\\n");
    String str = "";
    int i = 0;
    if (i < this.subs.length)
    {
      str = str + this.subs[i] + "\n";
      if ((!this.subs[(i + 1)].isEmpty()) || (!this.subs[(i + 2)].isEmpty()))
        break label210;
    }
    while (true)
    {
      if ((i >= this.subs.length) || (!this.subs[i].isEmpty()))
      {
        return;
        label210: i++;
        break;
      }
      i++;
    }
  }

  public void close()
    throws IOException
  {
  }

  public String getHandler()
  {
    return null;
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return null;
  }

  public long[] getSampleDurations()
  {
    return new long[0];
  }

  public List<Sample> getSamples()
  {
    return null;
  }

  public TrackMetaData getTrackMetaData()
  {
    return null;
  }
}