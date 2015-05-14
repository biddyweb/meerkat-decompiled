package com.squareup.picasso;

import android.net.Uri;

public abstract interface Picasso$Listener
{
  public abstract void onImageLoadFailed(Picasso paramPicasso, Uri paramUri, Exception paramException);
}