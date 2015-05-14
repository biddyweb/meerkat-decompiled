package com.google.android.exoplayer.upstream;

import com.google.android.exoplayer.util.Assertions;
import java.util.Arrays;

public final class BufferPool
  implements Allocator
{
  private static final int INITIAL_RECYCLED_BUFFERS_CAPACITY = 100;
  private int allocatedBufferCount;
  public final int bufferLength;
  private int recycledBufferCount;
  private byte[][] recycledBuffers;

  public BufferPool(int paramInt)
  {
    if (paramInt > 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkArgument(bool);
      this.bufferLength = paramInt;
      this.recycledBuffers = new byte[100][];
      return;
    }
  }

  private void ensureRecycledBufferCapacity(int paramInt)
  {
    if (this.recycledBuffers.length < paramInt)
    {
      byte[][] arrayOfByte = new byte[paramInt * 2][];
      if (this.recycledBufferCount > 0)
        System.arraycopy(this.recycledBuffers, 0, arrayOfByte, 0, this.recycledBufferCount);
      this.recycledBuffers = arrayOfByte;
    }
  }

  private byte[] nextBuffer()
  {
    if (this.recycledBufferCount > 0)
    {
      byte[][] arrayOfByte = this.recycledBuffers;
      int i = -1 + this.recycledBufferCount;
      this.recycledBufferCount = i;
      return arrayOfByte[i];
    }
    return new byte[this.bufferLength];
  }

  private int requiredBufferCount(long paramLong)
  {
    return (int)((paramLong + this.bufferLength - 1L) / this.bufferLength);
  }

  public Allocation allocate(int paramInt)
  {
    try
    {
      AllocationImpl localAllocationImpl = new AllocationImpl(allocate(paramInt, (byte[][])null));
      return localAllocationImpl;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  byte[][] allocate(int paramInt, byte[][] paramArrayOfByte)
  {
    long l = paramInt;
    try
    {
      int i = requiredBufferCount(l);
      if (paramArrayOfByte != null)
      {
        int j = paramArrayOfByte.length;
        if (i > j);
      }
      while (true)
      {
        return paramArrayOfByte;
        byte[][] arrayOfByte = new byte[i][];
        int k = 0;
        if (paramArrayOfByte != null)
        {
          k = paramArrayOfByte.length;
          System.arraycopy(paramArrayOfByte, 0, arrayOfByte, 0, k);
        }
        this.allocatedBufferCount += i - k;
        for (int m = k; m < i; m++)
          arrayOfByte[m] = nextBuffer();
        paramArrayOfByte = arrayOfByte;
      }
    }
    finally
    {
    }
  }

  public byte[] allocateDirect()
  {
    try
    {
      this.allocatedBufferCount = (1 + this.allocatedBufferCount);
      byte[] arrayOfByte = nextBuffer();
      return arrayOfByte;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public int getAllocatedSize()
  {
    try
    {
      int i = this.allocatedBufferCount;
      int j = this.bufferLength;
      int k = i * j;
      return k;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  void release(AllocationImpl paramAllocationImpl)
  {
    try
    {
      byte[][] arrayOfByte = paramAllocationImpl.getBuffers();
      this.allocatedBufferCount -= arrayOfByte.length;
      int i = this.recycledBufferCount + arrayOfByte.length;
      ensureRecycledBufferCapacity(i);
      System.arraycopy(arrayOfByte, 0, this.recycledBuffers, this.recycledBufferCount, arrayOfByte.length);
      this.recycledBufferCount = i;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void releaseDirect(byte[] paramArrayOfByte)
  {
    try
    {
      if (paramArrayOfByte.length == this.bufferLength);
      for (boolean bool = true; ; bool = false)
      {
        Assertions.checkArgument(bool);
        this.allocatedBufferCount = (-1 + this.allocatedBufferCount);
        ensureRecycledBufferCapacity(1 + this.recycledBufferCount);
        byte[][] arrayOfByte = this.recycledBuffers;
        int i = this.recycledBufferCount;
        this.recycledBufferCount = (i + 1);
        arrayOfByte[i] = paramArrayOfByte;
        return;
      }
    }
    finally
    {
    }
  }

  public void trim(int paramInt)
  {
    try
    {
      int i = Math.max(0, (-1 + (paramInt + this.bufferLength)) / this.bufferLength - this.allocatedBufferCount);
      if (i < this.recycledBufferCount)
      {
        Arrays.fill(this.recycledBuffers, i, this.recycledBufferCount, null);
        this.recycledBufferCount = i;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private class AllocationImpl
    implements Allocation
  {
    private byte[][] buffers;

    public AllocationImpl(byte[][] arg2)
    {
      Object localObject;
      this.buffers = localObject;
    }

    public int capacity()
    {
      return BufferPool.this.bufferLength * this.buffers.length;
    }

    public void ensureCapacity(int paramInt)
    {
      this.buffers = BufferPool.this.allocate(paramInt, this.buffers);
    }

    public byte[][] getBuffers()
    {
      return this.buffers;
    }

    public int getFragmentLength(int paramInt)
    {
      return BufferPool.this.bufferLength;
    }

    public int getFragmentOffset(int paramInt)
    {
      return 0;
    }

    public void release()
    {
      if (this.buffers != null)
      {
        BufferPool.this.release(this);
        this.buffers = ((byte[][])null);
      }
    }
  }
}