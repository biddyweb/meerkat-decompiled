package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.annotations.DoNotParseDetail;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat.Pair;
import java.io.IOException;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public abstract class AbstractSampleEncryptionBox extends AbstractFullBox
{
  protected int algorithmId = -1;
  List<CencSampleAuxiliaryDataFormat> entries = Collections.emptyList();
  protected int ivSize = -1;
  protected byte[] kid = { -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 };

  protected AbstractSampleEncryptionBox(String paramString)
  {
    super(paramString);
  }

  private List<CencSampleAuxiliaryDataFormat> parseEntries(ByteBuffer paramByteBuffer, long paramLong, int paramInt)
  {
    ArrayList localArrayList = new ArrayList();
    long l1 = paramLong;
    while (true)
    {
      long l2 = l1 - 1L;
      if (l1 > 0L)
        try
        {
          CencSampleAuxiliaryDataFormat localCencSampleAuxiliaryDataFormat = new CencSampleAuxiliaryDataFormat();
          localCencSampleAuxiliaryDataFormat.iv = new byte[paramInt];
          paramByteBuffer.get(localCencSampleAuxiliaryDataFormat.iv);
          if ((0x2 & getFlags()) > 0)
          {
            localCencSampleAuxiliaryDataFormat.pairs = new CencSampleAuxiliaryDataFormat.Pair[IsoTypeReader.readUInt16(paramByteBuffer)];
            for (int i = 0; i < localCencSampleAuxiliaryDataFormat.pairs.length; i++)
              localCencSampleAuxiliaryDataFormat.pairs[i] = localCencSampleAuxiliaryDataFormat.createPair(IsoTypeReader.readUInt16(paramByteBuffer), IsoTypeReader.readUInt32(paramByteBuffer));
          }
          localArrayList.add(localCencSampleAuxiliaryDataFormat);
          l1 = l2;
        }
        catch (BufferUnderflowException localBufferUnderflowException)
        {
          localArrayList = null;
        }
    }
    return localArrayList;
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    if ((0x1 & getFlags()) > 0)
    {
      this.algorithmId = IsoTypeReader.readUInt24(paramByteBuffer);
      this.ivSize = IsoTypeReader.readUInt8(paramByteBuffer);
      this.kid = new byte[16];
      paramByteBuffer.get(this.kid);
    }
    long l = IsoTypeReader.readUInt32(paramByteBuffer);
    ByteBuffer localByteBuffer1 = paramByteBuffer.duplicate();
    ByteBuffer localByteBuffer2 = paramByteBuffer.duplicate();
    this.entries = parseEntries(localByteBuffer1, l, 8);
    if (this.entries == null)
    {
      this.entries = parseEntries(localByteBuffer2, l, 16);
      paramByteBuffer.position(paramByteBuffer.position() + paramByteBuffer.remaining() - localByteBuffer2.remaining());
    }
    while (this.entries == null)
    {
      throw new RuntimeException("Cannot parse SampleEncryptionBox");
      paramByteBuffer.position(paramByteBuffer.position() + paramByteBuffer.remaining() - localByteBuffer1.remaining());
    }
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    AbstractSampleEncryptionBox localAbstractSampleEncryptionBox;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localAbstractSampleEncryptionBox = (AbstractSampleEncryptionBox)paramObject;
      if (this.algorithmId != localAbstractSampleEncryptionBox.algorithmId)
        return false;
      if (this.ivSize != localAbstractSampleEncryptionBox.ivSize)
        return false;
      if (this.entries != null)
      {
        if (this.entries.equals(localAbstractSampleEncryptionBox.entries));
      }
      else
        while (localAbstractSampleEncryptionBox.entries != null)
          return false;
    }
    while (Arrays.equals(this.kid, localAbstractSampleEncryptionBox.kid));
    return false;
  }

  public void getBox(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    super.getBox(paramWritableByteChannel);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    if (isOverrideTrackEncryptionBoxParameters())
    {
      IsoTypeWriter.writeUInt24(paramByteBuffer, this.algorithmId);
      IsoTypeWriter.writeUInt8(paramByteBuffer, this.ivSize);
      paramByteBuffer.put(this.kid);
    }
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.entries.size());
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
    {
      CencSampleAuxiliaryDataFormat localCencSampleAuxiliaryDataFormat = (CencSampleAuxiliaryDataFormat)localIterator.next();
      if (localCencSampleAuxiliaryDataFormat.getSize() > 0)
      {
        if ((localCencSampleAuxiliaryDataFormat.iv.length != 8) && (localCencSampleAuxiliaryDataFormat.iv.length != 16))
          throw new RuntimeException("IV must be either 8 or 16 bytes");
        paramByteBuffer.put(localCencSampleAuxiliaryDataFormat.iv);
        if (isSubSampleEncryption())
        {
          IsoTypeWriter.writeUInt16(paramByteBuffer, localCencSampleAuxiliaryDataFormat.pairs.length);
          for (CencSampleAuxiliaryDataFormat.Pair localPair : localCencSampleAuxiliaryDataFormat.pairs)
          {
            IsoTypeWriter.writeUInt16(paramByteBuffer, localPair.clear());
            IsoTypeWriter.writeUInt32(paramByteBuffer, localPair.encrypted());
          }
        }
      }
    }
  }

  protected long getContentSize()
  {
    long l1 = 4L;
    if (isOverrideTrackEncryptionBoxParameters())
      l1 = l1 + 4L + this.kid.length;
    long l2 = l1 + 4L;
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
      l2 += ((CencSampleAuxiliaryDataFormat)localIterator.next()).getSize();
    return l2;
  }

  public List<CencSampleAuxiliaryDataFormat> getEntries()
  {
    return this.entries;
  }

  public List<Short> getEntrySizes()
  {
    ArrayList localArrayList = new ArrayList(this.entries.size());
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
    {
      CencSampleAuxiliaryDataFormat localCencSampleAuxiliaryDataFormat = (CencSampleAuxiliaryDataFormat)localIterator.next();
      short s = (short)localCencSampleAuxiliaryDataFormat.iv.length;
      if (isSubSampleEncryption())
        s = (short)((short)(s + 2) + 6 * localCencSampleAuxiliaryDataFormat.pairs.length);
      localArrayList.add(Short.valueOf(s));
    }
    return localArrayList;
  }

  public int getOffsetToFirstIV()
  {
    int i;
    if (getSize() > 4294967296L)
    {
      i = 16;
      if (!isOverrideTrackEncryptionBoxParameters())
        break label41;
    }
    label41: for (int j = 4 + this.kid.length; ; j = 0)
    {
      return 4 + (i + j);
      i = 8;
      break;
    }
  }

  public int hashCode()
  {
    int i = 31 * (31 * this.algorithmId + this.ivSize);
    if (this.kid != null);
    for (int j = Arrays.hashCode(this.kid); ; j = 0)
    {
      int k = 31 * (i + j);
      List localList = this.entries;
      int m = 0;
      if (localList != null)
        m = this.entries.hashCode();
      return k + m;
    }
  }

  @DoNotParseDetail
  protected boolean isOverrideTrackEncryptionBoxParameters()
  {
    return (0x1 & getFlags()) > 0;
  }

  @DoNotParseDetail
  public boolean isSubSampleEncryption()
  {
    return (0x2 & getFlags()) > 0;
  }

  public void setEntries(List<CencSampleAuxiliaryDataFormat> paramList)
  {
    this.entries = paramList;
  }

  @DoNotParseDetail
  public void setSubSampleEncryption(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      setFlags(0x2 | getFlags());
      return;
    }
    setFlags(0xFFFFFD & getFlags());
  }
}