package co.getair.meerkat.proxies;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.view.View;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.ApplicationFacade;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.listener.SimpleImageLoadingListener;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class ResourcesProxy extends Proxy
{
  BitmapDrawable streamCoverPlaceholder = null;
  boolean useTweetSheet = false;
  BitmapDrawable userPhotoPlaceholder = null;

  public ResourcesProxy(String paramString)
  {
    super(paramString);
  }

  public static String NAME()
  {
    return "ResourcesProxy";
  }

  public static ResourcesProxy getInstance()
  {
    return (ResourcesProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy(NAME());
  }

  public BitmapDrawable getStreamCoverPlaceholder()
  {
    return this.streamCoverPlaceholder;
  }

  public BitmapDrawable getUserPhotoPlaceholder()
  {
    return this.userPhotoPlaceholder;
  }

  public void onRegister()
  {
    super.onRegister();
    ImageLoader localImageLoader = ImageLoader.getInstance();
    localImageLoader.loadImage("https://static.meerkatapp.co/users/default/profile-tmb", new SimpleImageLoadingListener()
    {
      public void onLoadingComplete(String paramAnonymousString, View paramAnonymousView, Bitmap paramAnonymousBitmap)
      {
        super.onLoadingComplete(paramAnonymousString, paramAnonymousView, paramAnonymousBitmap);
        ResourcesProxy.this.userPhotoPlaceholder = new BitmapDrawable(Resources.getSystem(), paramAnonymousBitmap);
      }
    });
    localImageLoader.loadImage("https://static.meerkatapp.co/broadcasts/default/cover", new SimpleImageLoadingListener()
    {
      public void onLoadingComplete(String paramAnonymousString, View paramAnonymousView, Bitmap paramAnonymousBitmap)
      {
        super.onLoadingComplete(paramAnonymousString, paramAnonymousView, paramAnonymousBitmap);
        ResourcesProxy.this.streamCoverPlaceholder = new BitmapDrawable(Resources.getSystem(), paramAnonymousBitmap);
      }
    });
  }

  public boolean shouldUseTweetSheet()
  {
    return this.useTweetSheet;
  }
}