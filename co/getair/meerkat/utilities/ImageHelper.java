package co.getair.meerkat.utilities;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Shader.TileMode;
import android.util.DisplayMetrics;
import android.widget.ImageView.ScaleType;
import com.makeramen.roundedimageview.RoundedImageView;

public class ImageHelper
{
  public static RoundedImageView circleImage(Context paramContext, DisplayMetrics paramDisplayMetrics, Bitmap paramBitmap, int paramInt)
  {
    RoundedImageView localRoundedImageView = new RoundedImageView(paramContext);
    localRoundedImageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
    localRoundedImageView.setImageBitmap(resizeBitmap(paramDisplayMetrics, paramBitmap, paramInt, paramInt));
    localRoundedImageView.setOval(true);
    localRoundedImageView.setTileModeX(Shader.TileMode.REPEAT);
    localRoundedImageView.setTileModeY(Shader.TileMode.REPEAT);
    return localRoundedImageView;
  }

  public static Bitmap resizeBitmap(DisplayMetrics paramDisplayMetrics, Bitmap paramBitmap, int paramInt1, int paramInt2)
  {
    return Bitmap.createScaledBitmap(paramBitmap, (int)(paramInt1 * paramDisplayMetrics.density), (int)(paramInt2 * paramDisplayMetrics.density), true);
  }
}