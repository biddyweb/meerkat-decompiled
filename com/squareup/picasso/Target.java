package com.squareup.picasso;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;

public abstract interface Target
{
  public abstract void onBitmapFailed(Drawable paramDrawable);

  public abstract void onBitmapLoaded(Bitmap paramBitmap, Picasso.LoadedFrom paramLoadedFrom);

  public abstract void onPrepareLoad(Drawable paramDrawable);
}