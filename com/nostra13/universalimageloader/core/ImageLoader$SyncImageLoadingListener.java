package com.nostra13.universalimageloader.core;

import android.graphics.Bitmap;
import android.view.View;
import com.nostra13.universalimageloader.core.listener.SimpleImageLoadingListener;

class ImageLoader$SyncImageLoadingListener extends SimpleImageLoadingListener
{
  private Bitmap loadedImage;

  public Bitmap getLoadedBitmap()
  {
    return this.loadedImage;
  }

  public void onLoadingComplete(String paramString, View paramView, Bitmap paramBitmap)
  {
    this.loadedImage = paramBitmap;
  }
}