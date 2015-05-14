package com.google.android.exoplayer.hls.parser;

import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.upstream.BufferPool;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.nio.ByteBuffer;
import java.util.concurrent.ConcurrentLinkedQueue;

final class RollingSampleBuffer
{
  private final long[] dataOffsetHolder;
  private final ConcurrentLinkedQueue<byte[]> dataQueue;
  private final int fragmentLength;
  private final BufferPool fragmentPool;
  private final InfoQueue infoQueue;
  private byte[] lastFragment;
  private int lastFragmentOffset;
  private long pendingSampleOffset;
  private long pendingSampleTimeUs;
  private long totalBytesDropped;
  private long totalBytesWritten;

  public RollingSampleBuffer(BufferPool paramBufferPool)
  {
    this.fragmentPool = paramBufferPool;
    this.fragmentLength = paramBufferPool.bufferLength;
    this.infoQueue = new InfoQueue();
    this.dataQueue = new ConcurrentLinkedQueue();
    this.dataOffsetHolder = new long[1];
  }

  private void dropFragmentsTo(long paramLong)
  {
    int i = (int)(paramLong - this.totalBytesDropped) / this.fragmentLength;
    for (int j = 0; j < i; j++)
    {
      this.fragmentPool.releaseDirect((byte[])this.dataQueue.remove());
      this.totalBytesDropped += this.fragmentLength;
    }
  }

  private void readData(long paramLong, ByteBuffer paramByteBuffer, int paramInt)
  {
    int i = paramInt;
    while (i > 0)
    {
      dropFragmentsTo(paramLong);
      int j = (int)(paramLong - this.totalBytesDropped);
      int k = Math.min(i, this.fragmentLength - j);
      paramByteBuffer.put((byte[])this.dataQueue.peek(), j, k);
      paramLong += k;
      i -= k;
    }
  }

  public void appendData(ParsableByteArray paramParsableByteArray, int paramInt)
  {
    int i = paramInt;
    while (i > 0)
    {
      if ((this.dataQueue.isEmpty()) || (this.lastFragmentOffset == this.fragmentLength))
      {
        this.lastFragmentOffset = 0;
        this.lastFragment = this.fragmentPool.allocateDirect();
        this.dataQueue.add(this.lastFragment);
      }
      int j = Math.min(i, this.fragmentLength - this.lastFragmentOffset);
      paramParsableByteArray.readBytes(this.lastFragment, this.lastFragmentOffset, j);
      this.lastFragmentOffset = (j + this.lastFragmentOffset);
      i -= j;
    }
    this.totalBytesWritten += paramInt;
  }

  public void commitSample(boolean paramBoolean, int paramInt)
  {
    int i = 1;
    int m;
    InfoQueue localInfoQueue;
    long l1;
    long l2;
    if (paramInt <= 0)
    {
      int j = i;
      Assertions.checkState(j);
      m = (int)(this.totalBytesWritten + paramInt - this.pendingSampleOffset);
      localInfoQueue = this.infoQueue;
      l1 = this.pendingSampleTimeUs;
      l2 = this.pendingSampleOffset;
      if (!paramBoolean)
        break label70;
    }
    while (true)
    {
      localInfoQueue.commitSample(l1, l2, m, i);
      return;
      int k = 0;
      break;
      label70: i = 0;
    }
  }

  public boolean peekSample(SampleHolder paramSampleHolder)
  {
    return this.infoQueue.peekSample(paramSampleHolder, this.dataOffsetHolder);
  }

  public void readSample(SampleHolder paramSampleHolder)
  {
    this.infoQueue.peekSample(paramSampleHolder, this.dataOffsetHolder);
    if ((paramSampleHolder.data == null) || (paramSampleHolder.data.capacity() < paramSampleHolder.size))
      paramSampleHolder.replaceBuffer(paramSampleHolder.size);
    if (paramSampleHolder.data != null)
      readData(this.dataOffsetHolder[0], paramSampleHolder.data, paramSampleHolder.size);
    dropFragmentsTo(this.infoQueue.moveToNextSample());
  }

  public void release()
  {
    while (!this.dataQueue.isEmpty())
      this.fragmentPool.releaseDirect((byte[])this.dataQueue.remove());
  }

  public void skipSample()
  {
    dropFragmentsTo(this.infoQueue.moveToNextSample());
  }

  public void startSample(long paramLong, int paramInt)
  {
    if (paramInt <= 0);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      this.pendingSampleTimeUs = paramLong;
      this.pendingSampleOffset = (this.totalBytesWritten + paramInt);
      return;
    }
  }

  private static class InfoQueue
  {
    private static final int SAMPLE_CAPACITY_INCREMENT = 1000;
    private int capacity = 1000;
    private int[] flags = new int[this.capacity];
    private long[] offsets = new long[this.capacity];
    private int queueSize;
    private int readIndex;
    private int[] sizes = new int[this.capacity];
    private long[] timesUs = new long[this.capacity];
    private int writeIndex;

    public void commitSample(long paramLong1, long paramLong2, int paramInt1, int paramInt2)
    {
      try
      {
        this.timesUs[this.writeIndex] = paramLong1;
        this.offsets[this.writeIndex] = paramLong2;
        this.sizes[this.writeIndex] = paramInt1;
        this.flags[this.writeIndex] = paramInt2;
        this.queueSize = (1 + this.queueSize);
        if (this.queueSize == this.capacity)
        {
          int i = 1000 + this.capacity;
          long[] arrayOfLong1 = new long[i];
          long[] arrayOfLong2 = new long[i];
          int[] arrayOfInt1 = new int[i];
          int[] arrayOfInt2 = new int[i];
          int j = this.capacity - this.readIndex;
          System.arraycopy(this.offsets, this.readIndex, arrayOfLong1, 0, j);
          System.arraycopy(this.timesUs, this.readIndex, arrayOfLong2, 0, j);
          System.arraycopy(this.flags, this.readIndex, arrayOfInt1, 0, j);
          System.arraycopy(this.sizes, this.readIndex, arrayOfInt2, 0, j);
          int k = this.readIndex;
          System.arraycopy(this.offsets, 0, arrayOfLong1, j, k);
          System.arraycopy(this.timesUs, 0, arrayOfLong2, j, k);
          System.arraycopy(this.flags, 0, arrayOfInt1, j, k);
          System.arraycopy(this.sizes, 0, arrayOfInt2, j, k);
          this.offsets = arrayOfLong1;
          this.timesUs = arrayOfLong2;
          this.flags = arrayOfInt1;
          this.sizes = arrayOfInt2;
          this.readIndex = 0;
          this.writeIndex = this.capacity;
          this.queueSize = this.capacity;
          this.capacity = i;
        }
        while (true)
        {
          return;
          this.writeIndex = (1 + this.writeIndex);
          if (this.writeIndex == this.capacity)
            this.writeIndex = 0;
        }
      }
      finally
      {
      }
    }

    public long moveToNextSample()
    {
      try
      {
        this.queueSize = (-1 + this.queueSize);
        int i = this.readIndex;
        this.readIndex = (i + 1);
        if (this.readIndex == this.capacity)
          this.readIndex = 0;
        if (this.queueSize > 0);
        long l1;
        long l2;
        for (long l3 = this.offsets[this.readIndex]; ; l3 = l1 + l2)
        {
          return l3;
          l1 = this.sizes[i];
          l2 = this.offsets[i];
        }
      }
      finally
      {
      }
    }

    public boolean peekSample(SampleHolder paramSampleHolder, long[] paramArrayOfLong)
    {
      try
      {
        int i = this.queueSize;
        boolean bool = false;
        if (i == 0);
        while (true)
        {
          return bool;
          paramSampleHolder.timeUs = this.timesUs[this.readIndex];
          paramSampleHolder.size = this.sizes[this.readIndex];
          paramSampleHolder.flags = this.flags[this.readIndex];
          paramArrayOfLong[0] = this.offsets[this.readIndex];
          bool = true;
        }
      }
      finally
      {
      }
    }
  }
}