package com.google.android.exoplayer;

import android.os.Handler;
import com.google.android.exoplayer.upstream.Allocator;
import com.google.android.exoplayer.upstream.NetworkLock;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class DefaultLoadControl
  implements LoadControl
{
  private static final int ABOVE_HIGH_WATERMARK = 0;
  private static final int BELOW_LOW_WATERMARK = 2;
  private static final int BETWEEN_WATERMARKS = 1;
  public static final float DEFAULT_HIGH_POOL_LOAD = 0.8F;
  public static final int DEFAULT_HIGH_WATERMARK_MS = 30000;
  public static final float DEFAULT_LOW_POOL_LOAD = 0.2F;
  public static final int DEFAULT_LOW_WATERMARK_MS = 15000;
  private final Allocator allocator;
  private int bufferPoolState;
  private final Handler eventHandler;
  private final EventListener eventListener;
  private boolean fillingBuffers;
  private final float highPoolLoad;
  private final long highWatermarkUs;
  private final HashMap<Object, LoaderState> loaderStates;
  private final List<Object> loaders;
  private final float lowPoolLoad;
  private final long lowWatermarkUs;
  private long maxLoadStartPositionUs;
  private boolean streamingPrioritySet;
  private int targetBufferSize;

  public DefaultLoadControl(Allocator paramAllocator)
  {
    this(paramAllocator, null, null);
  }

  public DefaultLoadControl(Allocator paramAllocator, Handler paramHandler, EventListener paramEventListener)
  {
    this(paramAllocator, paramHandler, paramEventListener, 15000, 30000, 0.2F, 0.8F);
  }

  public DefaultLoadControl(Allocator paramAllocator, Handler paramHandler, EventListener paramEventListener, int paramInt1, int paramInt2, float paramFloat1, float paramFloat2)
  {
    this.allocator = paramAllocator;
    this.eventHandler = paramHandler;
    this.eventListener = paramEventListener;
    this.loaders = new ArrayList();
    this.loaderStates = new HashMap();
    this.lowWatermarkUs = (1000L * paramInt1);
    this.highWatermarkUs = (1000L * paramInt2);
    this.lowPoolLoad = paramFloat1;
    this.highPoolLoad = paramFloat2;
  }

  private int getBufferPoolState(int paramInt)
  {
    float f = paramInt / this.targetBufferSize;
    if (f > this.highPoolLoad)
      return 0;
    if (f < this.lowPoolLoad)
      return 2;
    return 1;
  }

  private int getLoaderBufferState(long paramLong1, long paramLong2)
  {
    if (paramLong2 == -1L);
    long l;
    do
    {
      return 0;
      l = paramLong2 - paramLong1;
    }
    while (l > this.highWatermarkUs);
    if (l < this.lowWatermarkUs)
      return 2;
    return 1;
  }

  private void notifyLoadingChanged(final boolean paramBoolean)
  {
    if ((this.eventHandler != null) && (this.eventListener != null))
      this.eventHandler.post(new Runnable()
      {
        public void run()
        {
          DefaultLoadControl.this.eventListener.onLoadingChanged(paramBoolean);
        }
      });
  }

  private void updateControlState()
  {
    boolean bool1 = false;
    boolean bool2 = false;
    int i = 0;
    int j = this.bufferPoolState;
    int k = 0;
    if (k < this.loaders.size())
    {
      LoaderState localLoaderState = (LoaderState)this.loaderStates.get(this.loaders.get(k));
      bool1 |= localLoaderState.loading;
      bool2 |= localLoaderState.failed;
      if (localLoaderState.nextLoadPositionUs != -1L);
      for (int n = 1; ; n = 0)
      {
        i |= n;
        j = Math.max(j, localLoaderState.bufferState);
        k++;
        break;
      }
    }
    boolean bool3;
    if ((!this.loaders.isEmpty()) && (!bool2) && ((bool1) || (i != 0)) && ((j == 2) || ((j == 1) && (this.fillingBuffers))))
    {
      bool3 = true;
      this.fillingBuffers = bool3;
      if ((!this.fillingBuffers) || (this.streamingPrioritySet))
        break label304;
      NetworkLock.instance.add(0);
      this.streamingPrioritySet = true;
      notifyLoadingChanged(true);
    }
    while (true)
    {
      this.maxLoadStartPositionUs = -1L;
      if (!this.fillingBuffers)
        return;
      for (int m = 0; m < this.loaders.size(); m++)
      {
        Object localObject = this.loaders.get(m);
        long l = ((LoaderState)this.loaderStates.get(localObject)).nextLoadPositionUs;
        if ((l != -1L) && ((this.maxLoadStartPositionUs == -1L) || (l < this.maxLoadStartPositionUs)))
          this.maxLoadStartPositionUs = l;
      }
      bool3 = false;
      break;
      label304: if ((!this.fillingBuffers) && (this.streamingPrioritySet) && (!bool1))
      {
        NetworkLock.instance.remove(0);
        this.streamingPrioritySet = false;
        notifyLoadingChanged(false);
      }
    }
  }

  public Allocator getAllocator()
  {
    return this.allocator;
  }

  public void register(Object paramObject, int paramInt)
  {
    this.loaders.add(paramObject);
    this.loaderStates.put(paramObject, new LoaderState(paramInt));
    this.targetBufferSize = (paramInt + this.targetBufferSize);
  }

  public void trimAllocator()
  {
    this.allocator.trim(this.targetBufferSize);
  }

  public void unregister(Object paramObject)
  {
    this.loaders.remove(paramObject);
    LoaderState localLoaderState = (LoaderState)this.loaderStates.remove(paramObject);
    this.targetBufferSize -= localLoaderState.bufferSizeContribution;
    updateControlState();
  }

  public boolean update(Object paramObject, long paramLong1, long paramLong2, boolean paramBoolean1, boolean paramBoolean2)
  {
    int i = getLoaderBufferState(paramLong1, paramLong2);
    LoaderState localLoaderState = (LoaderState)this.loaderStates.get(paramObject);
    int j;
    int k;
    int m;
    if ((localLoaderState.bufferState != i) || (localLoaderState.nextLoadPositionUs != paramLong2) || (localLoaderState.loading != paramBoolean1) || (localLoaderState.failed != paramBoolean2))
    {
      j = 1;
      if (j != 0)
      {
        localLoaderState.bufferState = i;
        localLoaderState.nextLoadPositionUs = paramLong2;
        localLoaderState.loading = paramBoolean1;
        localLoaderState.failed = paramBoolean2;
      }
      k = this.allocator.getAllocatedSize();
      m = getBufferPoolState(k);
      if (this.bufferPoolState == m)
        break label191;
    }
    label191: for (int n = 1; ; n = 0)
    {
      if (n != 0)
        this.bufferPoolState = m;
      if ((j != 0) || (n != 0))
        updateControlState();
      if ((k >= this.targetBufferSize) || (paramLong2 == -1L) || (paramLong2 > this.maxLoadStartPositionUs))
        break label197;
      return true;
      j = 0;
      break;
    }
    label197: return false;
  }

  public static abstract interface EventListener
  {
    public abstract void onLoadingChanged(boolean paramBoolean);
  }

  private static class LoaderState
  {
    public final int bufferSizeContribution;
    public int bufferState;
    public boolean failed;
    public boolean loading;
    public long nextLoadPositionUs;

    public LoaderState(int paramInt)
    {
      this.bufferSizeContribution = paramInt;
      this.bufferState = 0;
      this.loading = false;
      this.failed = false;
      this.nextLoadPositionUs = -1L;
    }
  }
}