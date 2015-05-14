package co.getair.meerkat.dtos;

import android.graphics.Bitmap;
import java.util.Date;

public class ScheduleBroadcastParams
{
  String caption;
  Bitmap coverImage;
  Date timeOfBroadcast;

  public ScheduleBroadcastParams(String paramString, Date paramDate, Bitmap paramBitmap)
  {
    this.caption = paramString;
    this.timeOfBroadcast = paramDate;
    this.coverImage = paramBitmap;
  }

  public String getCaption()
  {
    return this.caption;
  }

  public Bitmap getCoverImage()
  {
    return this.coverImage;
  }

  public Date getTimeOfBroadcast()
  {
    return this.timeOfBroadcast;
  }
}