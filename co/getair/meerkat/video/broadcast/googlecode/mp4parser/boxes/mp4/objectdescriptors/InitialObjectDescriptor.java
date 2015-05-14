package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

public class InitialObjectDescriptor extends ObjectDescriptorBase
{
  int audioProfileLevelIndication;
  List<ESDescriptor> esDescriptors = new ArrayList();
  List<ExtensionDescriptor> extensionDescriptors = new ArrayList();
  int graphicsProfileLevelIndication;
  int includeInlineProfileLevelFlag;
  int oDProfileLevelIndication;
  private int objectDescriptorId;
  int sceneProfileLevelIndication;
  List<BaseDescriptor> unknownDescriptors = new ArrayList();
  int urlFlag;
  int urlLength;
  String urlString;
  int visualProfileLevelIndication;

  public void parseDetail(ByteBuffer paramByteBuffer)
    throws IOException
  {
    int i = IsoTypeReader.readUInt16(paramByteBuffer);
    this.objectDescriptorId = ((0xFFC0 & i) >> 6);
    this.urlFlag = ((i & 0x3F) >> 5);
    this.includeInlineProfileLevelFlag = ((i & 0x1F) >> 4);
    int j = -2 + getSize();
    int k;
    if (this.urlFlag == 1)
    {
      this.urlLength = IsoTypeReader.readUInt8(paramByteBuffer);
      this.urlString = IsoTypeReader.readString(paramByteBuffer, this.urlLength);
      k = j - (1 + this.urlLength);
    }
    BaseDescriptor localBaseDescriptor2;
    while (true)
    {
      if (k > 2)
      {
        localBaseDescriptor2 = ObjectDescriptorFactory.createFrom(-1, paramByteBuffer);
        if (!(localBaseDescriptor2 instanceof ExtensionDescriptor))
          break;
        this.extensionDescriptors.add((ExtensionDescriptor)localBaseDescriptor2);
      }
      return;
      this.oDProfileLevelIndication = IsoTypeReader.readUInt8(paramByteBuffer);
      this.sceneProfileLevelIndication = IsoTypeReader.readUInt8(paramByteBuffer);
      this.audioProfileLevelIndication = IsoTypeReader.readUInt8(paramByteBuffer);
      this.visualProfileLevelIndication = IsoTypeReader.readUInt8(paramByteBuffer);
      this.graphicsProfileLevelIndication = IsoTypeReader.readUInt8(paramByteBuffer);
      k = j - 5;
      if (k > 2)
      {
        BaseDescriptor localBaseDescriptor1 = ObjectDescriptorFactory.createFrom(-1, paramByteBuffer);
        k -= localBaseDescriptor1.getSize();
        if ((localBaseDescriptor1 instanceof ESDescriptor))
          this.esDescriptors.add((ESDescriptor)localBaseDescriptor1);
        else
          this.unknownDescriptors.add(localBaseDescriptor1);
      }
    }
    this.unknownDescriptors.add(localBaseDescriptor2);
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("InitialObjectDescriptor");
    localStringBuilder.append("{objectDescriptorId=").append(this.objectDescriptorId);
    localStringBuilder.append(", urlFlag=").append(this.urlFlag);
    localStringBuilder.append(", includeInlineProfileLevelFlag=").append(this.includeInlineProfileLevelFlag);
    localStringBuilder.append(", urlLength=").append(this.urlLength);
    localStringBuilder.append(", urlString='").append(this.urlString).append('\'');
    localStringBuilder.append(", oDProfileLevelIndication=").append(this.oDProfileLevelIndication);
    localStringBuilder.append(", sceneProfileLevelIndication=").append(this.sceneProfileLevelIndication);
    localStringBuilder.append(", audioProfileLevelIndication=").append(this.audioProfileLevelIndication);
    localStringBuilder.append(", visualProfileLevelIndication=").append(this.visualProfileLevelIndication);
    localStringBuilder.append(", graphicsProfileLevelIndication=").append(this.graphicsProfileLevelIndication);
    localStringBuilder.append(", esDescriptors=").append(this.esDescriptors);
    localStringBuilder.append(", extensionDescriptors=").append(this.extensionDescriptors);
    localStringBuilder.append(", unknownDescriptors=").append(this.unknownDescriptors);
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }
}