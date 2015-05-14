package com.nostra13.universalimageloader.core;

import com.nostra13.universalimageloader.core.assist.FlushedInputStream;
import com.nostra13.universalimageloader.core.download.ImageDownloader;
import java.io.IOException;
import java.io.InputStream;

class ImageLoaderConfiguration$SlowNetworkImageDownloader
  implements ImageDownloader
{
  private final ImageDownloader wrappedDownloader;

  public ImageLoaderConfiguration$SlowNetworkImageDownloader(ImageDownloader paramImageDownloader)
  {
    this.wrappedDownloader = paramImageDownloader;
  }

  public InputStream getStream(String paramString, Object paramObject)
    throws IOException
  {
    InputStream localInputStream = this.wrappedDownloader.getStream(paramString, paramObject);
    switch (ImageLoaderConfiguration.1.$SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme[com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme.ofUri(paramString).ordinal()])
    {
    default:
      return localInputStream;
    case 1:
    case 2:
    }
    return new FlushedInputStream(localInputStream);
  }
}