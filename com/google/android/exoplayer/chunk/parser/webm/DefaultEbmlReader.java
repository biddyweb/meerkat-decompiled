package com.google.android.exoplayer.chunk.parser.webm;

import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.upstream.NonBlockingInputStream;
import com.google.android.exoplayer.util.Assertions;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.util.Stack;

final class DefaultEbmlReader
  implements EbmlReader
{
  private static final int MAX_INTEGER_ELEMENT_SIZE_BYTES = 8;
  private static final int STATE_BEGIN_READING = 0;
  private static final int STATE_FINISHED_READING = 2;
  private static final int STATE_READ_CONTENTS = 1;
  private static final int VALID_FLOAT32_ELEMENT_SIZE_BYTES = 4;
  private static final int VALID_FLOAT64_ELEMENT_SIZE_BYTES = 8;
  private static final int[] VARINT_LENGTH_MASKS = { 128, 64, 32, 16, 8, 4, 2, 1 };
  private long bytesRead;
  private int bytesState;
  private long elementContentSize;
  private int elementContentSizeState;
  private int elementId;
  private int elementIdState;
  private long elementOffset;
  private EbmlEventHandler eventHandler;
  private final Stack<MasterElement> masterElementsStack = new Stack();
  private int state;
  private byte[] stringBytes;
  private final byte[] tempByteArray = new byte[8];
  private int varintBytesLength;
  private int varintBytesState;

  private long getTempByteArrayValue(int paramInt, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      byte[] arrayOfByte = this.tempByteArray;
      arrayOfByte[0] = ((byte)(arrayOfByte[0] & (0xFFFFFFFF ^ VARINT_LENGTH_MASKS[(-1 + this.varintBytesLength)])));
    }
    long l = 0L;
    for (int i = 0; i < paramInt; i++)
      l = l << 8 | 0xFF & this.tempByteArray[i];
    return l;
  }

  private void prepareForNextElement()
  {
    this.state = 0;
    this.elementIdState = 0;
    this.elementContentSizeState = 0;
    this.elementOffset = this.bytesRead;
  }

  private int readBytesInternal(NonBlockingInputStream paramNonBlockingInputStream, ByteBuffer paramByteBuffer, int paramInt)
  {
    if ((this.bytesState == 0) && (paramInt > paramByteBuffer.capacity()))
      throw new IllegalArgumentException("Byte buffer not large enough");
    if (this.bytesState >= paramInt)
      return 0;
    return updateBytesState(paramNonBlockingInputStream.read(paramByteBuffer, paramInt - this.bytesState), paramInt);
  }

  private int readBytesInternal(NonBlockingInputStream paramNonBlockingInputStream, byte[] paramArrayOfByte, int paramInt)
  {
    if ((this.bytesState == 0) && (paramInt > paramArrayOfByte.length))
      throw new IllegalArgumentException("Byte array not large enough");
    if (this.bytesState >= paramInt)
      return 0;
    int i = paramInt - this.bytesState;
    return updateBytesState(paramNonBlockingInputStream.read(paramArrayOfByte, this.bytesState, i), paramInt);
  }

  private int readElementContentSize(NonBlockingInputStream paramNonBlockingInputStream)
  {
    int i;
    if (this.elementContentSizeState == 2)
      i = 0;
    do
    {
      return i;
      if (this.elementContentSizeState == 0)
      {
        this.varintBytesState = 0;
        this.elementContentSizeState = 1;
      }
      i = readVarintBytes(paramNonBlockingInputStream);
    }
    while (i != 0);
    this.elementContentSize = getTempByteArrayValue(this.varintBytesLength, true);
    this.elementContentSizeState = 2;
    return 0;
  }

  private int readElementId(NonBlockingInputStream paramNonBlockingInputStream)
  {
    int i;
    if (this.elementIdState == 2)
      i = 0;
    do
    {
      return i;
      if (this.elementIdState == 0)
      {
        this.varintBytesState = 0;
        this.elementIdState = 1;
      }
      i = readVarintBytes(paramNonBlockingInputStream);
    }
    while (i != 0);
    this.elementId = ((int)getTempByteArrayValue(this.varintBytesLength, false));
    this.elementIdState = 2;
    return 0;
  }

  private int readVarintBytes(NonBlockingInputStream paramNonBlockingInputStream)
  {
    int i;
    if (this.varintBytesState == 2)
      i = 0;
    do
    {
      do
      {
        return i;
        if (this.varintBytesState != 0)
          break;
        this.bytesState = 0;
        i = readBytesInternal(paramNonBlockingInputStream, this.tempByteArray, 1);
      }
      while (i != 0);
      this.varintBytesState = 1;
      int j = 0xFF & this.tempByteArray[0];
      this.varintBytesLength = -1;
      for (int k = 0; ; k++)
        if (k < VARINT_LENGTH_MASKS.length)
        {
          if ((j & VARINT_LENGTH_MASKS[k]) != 0)
            this.varintBytesLength = (k + 1);
        }
        else
        {
          if (this.varintBytesLength != -1)
            break;
          throw new IllegalStateException("No valid varint length mask found at bytesRead = " + this.bytesRead);
        }
      i = readBytesInternal(paramNonBlockingInputStream, this.tempByteArray, this.varintBytesLength);
    }
    while (i != 0);
    return 0;
  }

  private int skipBytesInternal(NonBlockingInputStream paramNonBlockingInputStream, int paramInt)
  {
    if (this.bytesState >= paramInt)
      return 0;
    return updateBytesState(paramNonBlockingInputStream.skip(paramInt - this.bytesState), paramInt);
  }

  private int updateBytesState(int paramInt1, int paramInt2)
  {
    if (paramInt1 == -1)
      return 2;
    this.bytesState = (paramInt1 + this.bytesState);
    this.bytesRead += paramInt1;
    if (this.bytesState < paramInt2)
      return 1;
    return 0;
  }

  public long getBytesRead()
  {
    return this.bytesRead;
  }

  public int read(NonBlockingInputStream paramNonBlockingInputStream)
    throws ParserException
  {
    boolean bool;
    if (this.eventHandler != null)
    {
      bool = true;
      Assertions.checkState(bool);
    }
    while (true)
    {
      int i3;
      if ((!this.masterElementsStack.isEmpty()) && (this.bytesRead >= ((MasterElement)this.masterElementsStack.peek()).elementEndOffsetBytes))
      {
        this.eventHandler.onMasterElementEnd(((MasterElement)this.masterElementsStack.pop()).elementId);
        i3 = 0;
      }
      do
      {
        return i3;
        bool = false;
        break;
        if (this.state != 0)
          break label121;
        i3 = readElementId(paramNonBlockingInputStream);
      }
      while (i3 != 0);
      int i4 = readElementContentSize(paramNonBlockingInputStream);
      if (i4 != 0)
        return i4;
      this.state = 1;
      this.bytesState = 0;
      label121: int i = this.eventHandler.getElementType(this.elementId);
      switch (i)
      {
      default:
        throw new IllegalStateException("Invalid element type " + i);
      case 1:
        int i2 = (int)(this.bytesRead - this.elementOffset);
        this.masterElementsStack.add(new MasterElement(this.elementId, this.bytesRead + this.elementContentSize, null));
        this.eventHandler.onMasterElementStart(this.elementId, this.elementOffset, i2, this.elementContentSize);
        prepareForNextElement();
        return 0;
      case 2:
        if (this.elementContentSize > 8L)
          throw new IllegalStateException("Invalid integer size " + this.elementContentSize);
        int i1 = readBytesInternal(paramNonBlockingInputStream, this.tempByteArray, (int)this.elementContentSize);
        if (i1 != 0)
          return i1;
        long l3 = getTempByteArrayValue((int)this.elementContentSize, false);
        this.eventHandler.onIntegerElement(this.elementId, l3);
        prepareForNextElement();
        return 0;
      case 5:
        if ((this.elementContentSize != 4L) && (this.elementContentSize != 8L))
          throw new IllegalStateException("Invalid float size " + this.elementContentSize);
        int n = readBytesInternal(paramNonBlockingInputStream, this.tempByteArray, (int)this.elementContentSize);
        if (n != 0)
          return n;
        long l2 = getTempByteArrayValue((int)this.elementContentSize, false);
        if (this.elementContentSize == 4L);
        for (double d = Float.intBitsToFloat((int)l2); ; d = Double.longBitsToDouble(l2))
        {
          this.eventHandler.onFloatElement(this.elementId, d);
          prepareForNextElement();
          return 0;
        }
      case 3:
        if (this.elementContentSize > 2147483647L)
          throw new IllegalStateException("String element size " + this.elementContentSize + " is larger than MAX_INT");
        if (this.stringBytes == null)
          this.stringBytes = new byte[(int)this.elementContentSize];
        int m = readBytesInternal(paramNonBlockingInputStream, this.stringBytes, (int)this.elementContentSize);
        if (m != 0)
          return m;
        String str = new String(this.stringBytes, Charset.forName("UTF-8"));
        this.stringBytes = null;
        this.eventHandler.onStringElement(this.elementId, str);
        prepareForNextElement();
        return 0;
      case 4:
        if (this.elementContentSize > 2147483647L)
          throw new IllegalStateException("Binary element size " + this.elementContentSize + " is larger than MAX_INT");
        if (paramNonBlockingInputStream.getAvailableByteCount() < this.elementContentSize)
          return 1;
        int k = (int)(this.bytesRead - this.elementOffset);
        if (this.eventHandler.onBinaryElement(this.elementId, this.elementOffset, k, (int)this.elementContentSize, paramNonBlockingInputStream))
        {
          long l1 = this.elementOffset + k + this.elementContentSize;
          if (l1 != this.bytesRead)
            throw new IllegalStateException("Incorrect total bytes read. Expected " + l1 + " but actually " + this.bytesRead);
          prepareForNextElement();
        }
        return 0;
      case 0:
      }
      if (this.elementContentSize > 2147483647L)
        throw new IllegalStateException("Unknown element size " + this.elementContentSize + " is larger than MAX_INT");
      int j = skipBytesInternal(paramNonBlockingInputStream, (int)this.elementContentSize);
      if (j != 0)
        return j;
      prepareForNextElement();
    }
  }

  public void readBytes(NonBlockingInputStream paramNonBlockingInputStream, ByteBuffer paramByteBuffer, int paramInt)
  {
    this.bytesState = 0;
    if (readBytesInternal(paramNonBlockingInputStream, paramByteBuffer, paramInt) != 0)
      throw new IllegalStateException("Couldn't read bytes into buffer");
  }

  public void readBytes(NonBlockingInputStream paramNonBlockingInputStream, byte[] paramArrayOfByte, int paramInt)
  {
    this.bytesState = 0;
    if (readBytesInternal(paramNonBlockingInputStream, paramArrayOfByte, paramInt) != 0)
      throw new IllegalStateException("Couldn't read bytes into array");
  }

  public long readVarint(NonBlockingInputStream paramNonBlockingInputStream)
  {
    this.varintBytesState = 0;
    if (readVarintBytes(paramNonBlockingInputStream) != 0)
      throw new IllegalStateException("Couldn't read varint");
    return getTempByteArrayValue(this.varintBytesLength, true);
  }

  public void reset()
  {
    prepareForNextElement();
    this.masterElementsStack.clear();
    this.bytesRead = 0L;
  }

  public void setEventHandler(EbmlEventHandler paramEbmlEventHandler)
  {
    this.eventHandler = paramEbmlEventHandler;
  }

  public void skipBytes(NonBlockingInputStream paramNonBlockingInputStream, int paramInt)
  {
    this.bytesState = 0;
    if (skipBytesInternal(paramNonBlockingInputStream, paramInt) != 0)
      throw new IllegalStateException("Couldn't skip bytes");
  }

  private static final class MasterElement
  {
    private final long elementEndOffsetBytes;
    private final int elementId;

    private MasterElement(int paramInt, long paramLong)
    {
      this.elementId = paramInt;
      this.elementEndOffsetBytes = paramLong;
    }
  }
}