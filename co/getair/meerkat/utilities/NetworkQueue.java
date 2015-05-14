package co.getair.meerkat.utilities;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.v4.util.LruCache;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.ImageLoader.ImageCache;
import com.android.volley.toolbox.Volley;

public class NetworkQueue
{
  private static Context context;
  private static NetworkQueue instance;
  private ImageLoader imageLoader;
  private RequestQueue requestQueue;

  private NetworkQueue(Context paramContext)
  {
    context = paramContext;
    this.requestQueue = getRequestQueue();
    this.imageLoader = new ImageLoader(this.requestQueue, new ImageLoader.ImageCache()
    {
      private final LruCache<String, Bitmap> cache = new LruCache(20);

      public Bitmap getBitmap(String paramAnonymousString)
      {
        return (Bitmap)this.cache.get(paramAnonymousString);
      }

      public void putBitmap(String paramAnonymousString, Bitmap paramAnonymousBitmap)
      {
        this.cache.put(paramAnonymousString, paramAnonymousBitmap);
      }
    });
  }

  public static NetworkQueue getInstance(Context paramContext)
  {
    try
    {
      if (instance == null)
        instance = new NetworkQueue(paramContext);
      NetworkQueue localNetworkQueue = instance;
      return localNetworkQueue;
    }
    finally
    {
    }
  }

  public <T> void addToRequestQueue(Request<T> paramRequest)
  {
    getRequestQueue().add(paramRequest);
  }

  public ImageLoader getImageLoader()
  {
    return this.imageLoader;
  }

  public RequestQueue getRequestQueue()
  {
    if (this.requestQueue == null)
      this.requestQueue = Volley.newRequestQueue(context.getApplicationContext());
    return this.requestQueue;
  }
}