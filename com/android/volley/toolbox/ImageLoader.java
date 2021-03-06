package com.android.volley.toolbox;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Handler;
import android.os.Looper;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;

public class ImageLoader
{
  private int mBatchResponseDelayMs = 100;
  private final HashMap<String, BatchedImageRequest> mBatchedResponses = new HashMap();
  private final ImageCache mCache;
  private final Handler mHandler = new Handler(Looper.getMainLooper());
  private final HashMap<String, BatchedImageRequest> mInFlightRequests = new HashMap();
  private final RequestQueue mRequestQueue;
  private Runnable mRunnable;

  public ImageLoader(RequestQueue paramRequestQueue, ImageCache paramImageCache)
  {
    this.mRequestQueue = paramRequestQueue;
    this.mCache = paramImageCache;
  }

  private void batchResponse(String paramString, BatchedImageRequest paramBatchedImageRequest)
  {
    this.mBatchedResponses.put(paramString, paramBatchedImageRequest);
    if (this.mRunnable == null)
    {
      this.mRunnable = new Runnable()
      {
        public void run()
        {
          Iterator localIterator1 = ImageLoader.this.mBatchedResponses.values().iterator();
          while (localIterator1.hasNext())
          {
            ImageLoader.BatchedImageRequest localBatchedImageRequest = (ImageLoader.BatchedImageRequest)localIterator1.next();
            Iterator localIterator2 = ImageLoader.BatchedImageRequest.access$300(localBatchedImageRequest).iterator();
            while (localIterator2.hasNext())
            {
              ImageLoader.ImageContainer localImageContainer = (ImageLoader.ImageContainer)localIterator2.next();
              if (ImageLoader.ImageContainer.access$400(localImageContainer) != null)
                if (localBatchedImageRequest.getError() == null)
                {
                  ImageLoader.ImageContainer.access$502(localImageContainer, ImageLoader.BatchedImageRequest.access$000(localBatchedImageRequest));
                  ImageLoader.ImageContainer.access$400(localImageContainer).onResponse(localImageContainer, false);
                }
                else
                {
                  ImageLoader.ImageContainer.access$400(localImageContainer).onErrorResponse(localBatchedImageRequest.getError());
                }
            }
          }
          ImageLoader.this.mBatchedResponses.clear();
          ImageLoader.access$602(ImageLoader.this, null);
        }
      };
      this.mHandler.postDelayed(this.mRunnable, this.mBatchResponseDelayMs);
    }
  }

  private static String getCacheKey(String paramString, int paramInt1, int paramInt2, ImageView.ScaleType paramScaleType)
  {
    return 12 + paramString.length() + "#W" + paramInt1 + "#H" + paramInt2 + "#S" + paramScaleType.ordinal() + paramString;
  }

  public static ImageListener getImageListener(final ImageView paramImageView, final int paramInt1, int paramInt2)
  {
    return new ImageListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        if (this.val$errorImageResId != 0)
          paramImageView.setImageResource(this.val$errorImageResId);
      }

      public void onResponse(ImageLoader.ImageContainer paramAnonymousImageContainer, boolean paramAnonymousBoolean)
      {
        if (paramAnonymousImageContainer.getBitmap() != null)
          paramImageView.setImageBitmap(paramAnonymousImageContainer.getBitmap());
        while (paramInt1 == 0)
          return;
        paramImageView.setImageResource(paramInt1);
      }
    };
  }

  private void throwIfNotOnMainThread()
  {
    if (Looper.myLooper() != Looper.getMainLooper())
      throw new IllegalStateException("ImageLoader must be invoked from the main thread.");
  }

  public ImageContainer get(String paramString, ImageListener paramImageListener)
  {
    return get(paramString, paramImageListener, 0, 0);
  }

  public ImageContainer get(String paramString, ImageListener paramImageListener, int paramInt1, int paramInt2)
  {
    return get(paramString, paramImageListener, paramInt1, paramInt2, ImageView.ScaleType.CENTER_INSIDE);
  }

  public ImageContainer get(String paramString, ImageListener paramImageListener, int paramInt1, int paramInt2, ImageView.ScaleType paramScaleType)
  {
    throwIfNotOnMainThread();
    String str = getCacheKey(paramString, paramInt1, paramInt2, paramScaleType);
    Bitmap localBitmap = this.mCache.getBitmap(str);
    if (localBitmap != null)
    {
      ImageContainer localImageContainer1 = new ImageContainer(localBitmap, paramString, null, null);
      paramImageListener.onResponse(localImageContainer1, true);
      return localImageContainer1;
    }
    ImageContainer localImageContainer2 = new ImageContainer(null, paramString, str, paramImageListener);
    paramImageListener.onResponse(localImageContainer2, true);
    BatchedImageRequest localBatchedImageRequest = (BatchedImageRequest)this.mInFlightRequests.get(str);
    if (localBatchedImageRequest != null)
    {
      localBatchedImageRequest.addContainer(localImageContainer2);
      return localImageContainer2;
    }
    Request localRequest = makeImageRequest(paramString, paramInt1, paramInt2, paramScaleType, str);
    this.mRequestQueue.add(localRequest);
    this.mInFlightRequests.put(str, new BatchedImageRequest(localRequest, localImageContainer2));
    return localImageContainer2;
  }

  public boolean isCached(String paramString, int paramInt1, int paramInt2)
  {
    return isCached(paramString, paramInt1, paramInt2, ImageView.ScaleType.CENTER_INSIDE);
  }

  public boolean isCached(String paramString, int paramInt1, int paramInt2, ImageView.ScaleType paramScaleType)
  {
    throwIfNotOnMainThread();
    String str = getCacheKey(paramString, paramInt1, paramInt2, paramScaleType);
    return this.mCache.getBitmap(str) != null;
  }

  protected Request<Bitmap> makeImageRequest(String paramString1, int paramInt1, int paramInt2, ImageView.ScaleType paramScaleType, final String paramString2)
  {
    return new ImageRequest(paramString1, new Response.Listener()
    {
      public void onResponse(Bitmap paramAnonymousBitmap)
      {
        ImageLoader.this.onGetImageSuccess(paramString2, paramAnonymousBitmap);
      }
    }
    , paramInt1, paramInt2, paramScaleType, Bitmap.Config.RGB_565, new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        ImageLoader.this.onGetImageError(paramString2, paramAnonymousVolleyError);
      }
    });
  }

  protected void onGetImageError(String paramString, VolleyError paramVolleyError)
  {
    BatchedImageRequest localBatchedImageRequest = (BatchedImageRequest)this.mInFlightRequests.remove(paramString);
    if (localBatchedImageRequest != null)
    {
      localBatchedImageRequest.setError(paramVolleyError);
      batchResponse(paramString, localBatchedImageRequest);
    }
  }

  protected void onGetImageSuccess(String paramString, Bitmap paramBitmap)
  {
    this.mCache.putBitmap(paramString, paramBitmap);
    BatchedImageRequest localBatchedImageRequest = (BatchedImageRequest)this.mInFlightRequests.remove(paramString);
    if (localBatchedImageRequest != null)
    {
      BatchedImageRequest.access$002(localBatchedImageRequest, paramBitmap);
      batchResponse(paramString, localBatchedImageRequest);
    }
  }

  public void setBatchedResponseDelay(int paramInt)
  {
    this.mBatchResponseDelayMs = paramInt;
  }

  private class BatchedImageRequest
  {
    private final LinkedList<ImageLoader.ImageContainer> mContainers = new LinkedList();
    private VolleyError mError;
    private final Request<?> mRequest;
    private Bitmap mResponseBitmap;

    public BatchedImageRequest(ImageLoader.ImageContainer arg2)
    {
      Object localObject1;
      this.mRequest = localObject1;
      Object localObject2;
      this.mContainers.add(localObject2);
    }

    public void addContainer(ImageLoader.ImageContainer paramImageContainer)
    {
      this.mContainers.add(paramImageContainer);
    }

    public VolleyError getError()
    {
      return this.mError;
    }

    public boolean removeContainerAndCancelIfNecessary(ImageLoader.ImageContainer paramImageContainer)
    {
      this.mContainers.remove(paramImageContainer);
      if (this.mContainers.size() == 0)
      {
        this.mRequest.cancel();
        return true;
      }
      return false;
    }

    public void setError(VolleyError paramVolleyError)
    {
      this.mError = paramVolleyError;
    }
  }

  public static abstract interface ImageCache
  {
    public abstract Bitmap getBitmap(String paramString);

    public abstract void putBitmap(String paramString, Bitmap paramBitmap);
  }

  public class ImageContainer
  {
    private Bitmap mBitmap;
    private final String mCacheKey;
    private final ImageLoader.ImageListener mListener;
    private final String mRequestUrl;

    public ImageContainer(Bitmap paramString1, String paramString2, String paramImageListener, ImageLoader.ImageListener arg5)
    {
      this.mBitmap = paramString1;
      this.mRequestUrl = paramString2;
      this.mCacheKey = paramImageListener;
      Object localObject;
      this.mListener = localObject;
    }

    public void cancelRequest()
    {
      if (this.mListener == null);
      ImageLoader.BatchedImageRequest localBatchedImageRequest2;
      do
      {
        do
        {
          ImageLoader.BatchedImageRequest localBatchedImageRequest1;
          do
          {
            return;
            localBatchedImageRequest1 = (ImageLoader.BatchedImageRequest)ImageLoader.this.mInFlightRequests.get(this.mCacheKey);
            if (localBatchedImageRequest1 == null)
              break;
          }
          while (!localBatchedImageRequest1.removeContainerAndCancelIfNecessary(this));
          ImageLoader.this.mInFlightRequests.remove(this.mCacheKey);
          return;
          localBatchedImageRequest2 = (ImageLoader.BatchedImageRequest)ImageLoader.this.mBatchedResponses.get(this.mCacheKey);
        }
        while (localBatchedImageRequest2 == null);
        localBatchedImageRequest2.removeContainerAndCancelIfNecessary(this);
      }
      while (localBatchedImageRequest2.mContainers.size() != 0);
      ImageLoader.this.mBatchedResponses.remove(this.mCacheKey);
    }

    public Bitmap getBitmap()
    {
      return this.mBitmap;
    }

    public String getRequestUrl()
    {
      return this.mRequestUrl;
    }
  }

  public static abstract interface ImageListener extends Response.ErrorListener
  {
    public abstract void onResponse(ImageLoader.ImageContainer paramImageContainer, boolean paramBoolean);
  }
}