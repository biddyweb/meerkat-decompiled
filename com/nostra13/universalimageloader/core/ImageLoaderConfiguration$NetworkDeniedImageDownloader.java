package com.nostra13.universalimageloader.core;

import com.nostra13.universalimageloader.core.download.ImageDownloader;
import java.io.IOException;
import java.io.InputStream;

class ImageLoaderConfiguration$NetworkDeniedImageDownloader
  implements ImageDownloader
{
  private final ImageDownloader wrappedDownloader;

  public ImageLoaderConfiguration$NetworkDeniedImageDownloader(ImageDownloader paramImageDownloader)
  {
    this.wrappedDownloader = paramImageDownloader;
  }

  public InputStream getStream(String paramString, Object paramObject)
    throws IOException
  {
    switch (ImageLoaderConfiguration.1.$SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme.ofUri(paramString).ordinal()])
    {
    default:
      return this.wrappedDownloader.getStream(paramString, paramObject);
    case 1:
    case 2:
    }
    throw new IllegalStateException();
  }
}