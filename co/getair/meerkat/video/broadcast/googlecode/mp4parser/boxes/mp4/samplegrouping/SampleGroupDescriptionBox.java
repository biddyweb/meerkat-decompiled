package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.StepwiseTemporalLayerEntry;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.SyncSampleEntry;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.TemporalLayerSampleGroup;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15.TemporalSubLayerSampleGroup;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class SampleGroupDescriptionBox extends AbstractFullBox
{
  public static final String TYPE = "sgpd";
  private int defaultLength;
  private List<GroupEntry> groupEntries = new LinkedList();

  public SampleGroupDescriptionBox()
  {
    super("sgpd");
    setVersion(1);
  }

  private GroupEntry parseGroupEntry(ByteBuffer paramByteBuffer, String paramString)
  {
    Object localObject;
    if ("roll".equals(paramString))
      localObject = new RollRecoveryEntry();
    while (true)
    {
      ((GroupEntry)localObject).parse(paramByteBuffer);
      return localObject;
      if ("rash".equals(paramString))
        localObject = new RateShareEntry();
      else if ("seig".equals(paramString))
        localObject = new CencSampleEncryptionInformationGroupEntry();
      else if ("rap ".equals(paramString))
        localObject = new VisualRandomAccessEntry();
      else if ("tele".equals(paramString))
        localObject = new TemporalLevelEntry();
      else if ("sync".equals(paramString))
        localObject = new SyncSampleEntry();
      else if ("tscl".equals(paramString))
        localObject = new TemporalLayerSampleGroup();
      else if ("tsas".equals(paramString))
        localObject = new TemporalSubLayerSampleGroup();
      else if ("stsa".equals(paramString))
        localObject = new StepwiseTemporalLayerEntry();
      else
        localObject = new UnknownEntry(paramString);
    }
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    if (getVersion() != 1)
      throw new RuntimeException("SampleGroupDescriptionBox are only supported in version 1");
    String str = IsoTypeReader.read4cc(paramByteBuffer);
    if (getVersion() == 1)
      this.defaultLength = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
    long l2;
    for (long l1 = IsoTypeReader.readUInt32(paramByteBuffer); ; l1 = l2)
    {
      l2 = l1 - 1L;
      if (l1 <= 0L)
        return;
      int i = this.defaultLength;
      if (getVersion() != 1)
        break;
      if (this.defaultLength == 0)
        i = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
      int j = i + paramByteBuffer.position();
      ByteBuffer localByteBuffer = paramByteBuffer.slice();
      localByteBuffer.limit(i);
      this.groupEntries.add(parseGroupEntry(localByteBuffer, str));
      paramByteBuffer.position(j);
    }
    throw new RuntimeException("This should be implemented");
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    SampleGroupDescriptionBox localSampleGroupDescriptionBox;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localSampleGroupDescriptionBox = (SampleGroupDescriptionBox)paramObject;
      if (this.defaultLength != localSampleGroupDescriptionBox.defaultLength)
        return false;
      if (this.groupEntries == null)
        break;
    }
    while (this.groupEntries.equals(localSampleGroupDescriptionBox.groupEntries));
    while (true)
    {
      return false;
      if (localSampleGroupDescriptionBox.groupEntries == null)
        break;
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    paramByteBuffer.put(IsoFile.fourCCtoBytes(((GroupEntry)this.groupEntries.get(0)).getType()));
    if (getVersion() == 1)
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.defaultLength);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.groupEntries.size());
    Iterator localIterator = this.groupEntries.iterator();
    while (localIterator.hasNext())
    {
      GroupEntry localGroupEntry = (GroupEntry)localIterator.next();
      if ((getVersion() == 1) && (this.defaultLength == 0))
        IsoTypeWriter.writeUInt32(paramByteBuffer, localGroupEntry.get().limit());
      paramByteBuffer.put(localGroupEntry.get());
    }
  }

  protected long getContentSize()
  {
    long l1 = 8L;
    if (getVersion() == 1)
      l1 += 4L;
    long l2 = l1 + 4L;
    Iterator localIterator = this.groupEntries.iterator();
    while (localIterator.hasNext())
    {
      GroupEntry localGroupEntry = (GroupEntry)localIterator.next();
      if ((getVersion() == 1) && (this.defaultLength == 0))
        l2 += 4L;
      l2 += localGroupEntry.size();
    }
    return l2;
  }

  public int getDefaultLength()
  {
    return this.defaultLength;
  }

  public List<GroupEntry> getGroupEntries()
  {
    return this.groupEntries;
  }

  public int hashCode()
  {
    int i = 31 * (0 + this.defaultLength);
    if (this.groupEntries != null);
    for (int j = this.groupEntries.hashCode(); ; j = 0)
      return i + j;
  }

  public void setDefaultLength(int paramInt)
  {
    this.defaultLength = paramInt;
  }

  public void setGroupEntries(List<GroupEntry> paramList)
  {
    this.groupEntries = paramList;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder().append("SampleGroupDescriptionBox{groupingType='");
    if (this.groupEntries.size() > 0);
    for (String str = ((GroupEntry)this.groupEntries.get(0)).getType(); ; str = "????")
      return str + '\'' + ", defaultLength=" + this.defaultLength + ", groupEntries=" + this.groupEntries + '}';
  }
}