package com.makeramen.roundedimageview;

import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.util.Log;
import android.widget.ImageView.ScaleType;

public class RoundedDrawable extends Drawable
{
  public static final int DEFAULT_BORDER_COLOR = -16777216;
  public static final String TAG = "RoundedDrawable";
  private final Bitmap mBitmap;
  private final int mBitmapHeight;
  private final Paint mBitmapPaint;
  private final RectF mBitmapRect = new RectF();
  private BitmapShader mBitmapShader;
  private final int mBitmapWidth;
  private ColorStateList mBorderColor = ColorStateList.valueOf(-16777216);
  private final Paint mBorderPaint;
  private final RectF mBorderRect = new RectF();
  private float mBorderWidth = 0.0F;
  private final RectF mBounds = new RectF();
  private float mCornerRadius = 0.0F;
  private final RectF mDrawableRect = new RectF();
  private boolean mOval = false;
  private boolean mRebuildShader = true;
  private ImageView.ScaleType mScaleType = ImageView.ScaleType.FIT_CENTER;
  private final Matrix mShaderMatrix = new Matrix();
  private Shader.TileMode mTileModeX = Shader.TileMode.CLAMP;
  private Shader.TileMode mTileModeY = Shader.TileMode.CLAMP;

  public RoundedDrawable(Bitmap paramBitmap)
  {
    this.mBitmap = paramBitmap;
    this.mBitmapWidth = paramBitmap.getWidth();
    this.mBitmapHeight = paramBitmap.getHeight();
    this.mBitmapRect.set(0.0F, 0.0F, this.mBitmapWidth, this.mBitmapHeight);
    this.mBitmapPaint = new Paint();
    this.mBitmapPaint.setStyle(Paint.Style.FILL);
    this.mBitmapPaint.setAntiAlias(true);
    this.mBorderPaint = new Paint();
    this.mBorderPaint.setStyle(Paint.Style.STROKE);
    this.mBorderPaint.setAntiAlias(true);
    this.mBorderPaint.setColor(this.mBorderColor.getColorForState(getState(), -16777216));
    this.mBorderPaint.setStrokeWidth(this.mBorderWidth);
  }

  public static Bitmap drawableToBitmap(Drawable paramDrawable)
  {
    if ((paramDrawable instanceof BitmapDrawable))
      return ((BitmapDrawable)paramDrawable).getBitmap();
    int i = Math.max(paramDrawable.getIntrinsicWidth(), 2);
    int j = Math.max(paramDrawable.getIntrinsicHeight(), 2);
    try
    {
      Bitmap localBitmap = Bitmap.createBitmap(i, j, Bitmap.Config.ARGB_8888);
      Canvas localCanvas = new Canvas(localBitmap);
      paramDrawable.setBounds(0, 0, localCanvas.getWidth(), localCanvas.getHeight());
      paramDrawable.draw(localCanvas);
      return localBitmap;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      Log.w("RoundedDrawable", "Failed to create bitmap from drawable!");
    }
    return null;
  }

  public static RoundedDrawable fromBitmap(Bitmap paramBitmap)
  {
    if (paramBitmap != null)
      return new RoundedDrawable(paramBitmap);
    return null;
  }

  public static Drawable fromDrawable(Drawable paramDrawable)
  {
    if ((paramDrawable == null) || ((paramDrawable instanceof RoundedDrawable)));
    Bitmap localBitmap;
    do
    {
      return paramDrawable;
      if ((paramDrawable instanceof LayerDrawable))
      {
        LayerDrawable localLayerDrawable = (LayerDrawable)paramDrawable;
        int i = localLayerDrawable.getNumberOfLayers();
        for (int j = 0; j < i; j++)
        {
          Drawable localDrawable = localLayerDrawable.getDrawable(j);
          localLayerDrawable.setDrawableByLayerId(localLayerDrawable.getId(j), fromDrawable(localDrawable));
        }
        return localLayerDrawable;
      }
      localBitmap = drawableToBitmap(paramDrawable);
    }
    while (localBitmap == null);
    return new RoundedDrawable(localBitmap);
  }

  private void updateShaderMatrix()
  {
    switch (1.$SwitchMap$android$widget$ImageView$ScaleType[this.mScaleType.ordinal()])
    {
    case 4:
    default:
      this.mBorderRect.set(this.mBitmapRect);
      this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBounds, Matrix.ScaleToFit.CENTER);
      this.mShaderMatrix.mapRect(this.mBorderRect);
      this.mBorderRect.inset(this.mBorderWidth / 2.0F, this.mBorderWidth / 2.0F);
      this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBorderRect, Matrix.ScaleToFit.FILL);
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
    case 7:
    }
    while (true)
    {
      this.mDrawableRect.set(this.mBorderRect);
      return;
      this.mBorderRect.set(this.mBounds);
      this.mBorderRect.inset(this.mBorderWidth / 2.0F, this.mBorderWidth / 2.0F);
      this.mShaderMatrix.reset();
      this.mShaderMatrix.setTranslate((int)(0.5F + 0.5F * (this.mBorderRect.width() - this.mBitmapWidth)), (int)(0.5F + 0.5F * (this.mBorderRect.height() - this.mBitmapHeight)));
      continue;
      this.mBorderRect.set(this.mBounds);
      this.mBorderRect.inset(this.mBorderWidth / 2.0F, this.mBorderWidth / 2.0F);
      this.mShaderMatrix.reset();
      float f4 = 0.0F;
      float f5;
      if (this.mBitmapWidth * this.mBorderRect.height() > this.mBorderRect.width() * this.mBitmapHeight)
        f5 = this.mBorderRect.height() / this.mBitmapHeight;
      for (float f6 = 0.5F * (this.mBorderRect.width() - f5 * this.mBitmapWidth); ; f6 = 0.0F)
      {
        this.mShaderMatrix.setScale(f5, f5);
        this.mShaderMatrix.postTranslate((int)(f6 + 0.5F) + this.mBorderWidth, (int)(f4 + 0.5F) + this.mBorderWidth);
        break;
        f5 = this.mBorderRect.width() / this.mBitmapWidth;
        f4 = 0.5F * (this.mBorderRect.height() - f5 * this.mBitmapHeight);
      }
      this.mShaderMatrix.reset();
      if ((this.mBitmapWidth <= this.mBounds.width()) && (this.mBitmapHeight <= this.mBounds.height()));
      for (float f1 = 1.0F; ; f1 = Math.min(this.mBounds.width() / this.mBitmapWidth, this.mBounds.height() / this.mBitmapHeight))
      {
        float f2 = (int)(0.5F + 0.5F * (this.mBounds.width() - f1 * this.mBitmapWidth));
        float f3 = (int)(0.5F + 0.5F * (this.mBounds.height() - f1 * this.mBitmapHeight));
        this.mShaderMatrix.setScale(f1, f1);
        this.mShaderMatrix.postTranslate(f2, f3);
        this.mBorderRect.set(this.mBitmapRect);
        this.mShaderMatrix.mapRect(this.mBorderRect);
        this.mBorderRect.inset(this.mBorderWidth / 2.0F, this.mBorderWidth / 2.0F);
        this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBorderRect, Matrix.ScaleToFit.FILL);
        break;
      }
      this.mBorderRect.set(this.mBitmapRect);
      this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBounds, Matrix.ScaleToFit.END);
      this.mShaderMatrix.mapRect(this.mBorderRect);
      this.mBorderRect.inset(this.mBorderWidth / 2.0F, this.mBorderWidth / 2.0F);
      this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBorderRect, Matrix.ScaleToFit.FILL);
      continue;
      this.mBorderRect.set(this.mBitmapRect);
      this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBounds, Matrix.ScaleToFit.START);
      this.mShaderMatrix.mapRect(this.mBorderRect);
      this.mBorderRect.inset(this.mBorderWidth / 2.0F, this.mBorderWidth / 2.0F);
      this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBorderRect, Matrix.ScaleToFit.FILL);
      continue;
      this.mBorderRect.set(this.mBounds);
      this.mBorderRect.inset(this.mBorderWidth / 2.0F, this.mBorderWidth / 2.0F);
      this.mShaderMatrix.reset();
      this.mShaderMatrix.setRectToRect(this.mBitmapRect, this.mBorderRect, Matrix.ScaleToFit.FILL);
    }
  }

  public void draw(Canvas paramCanvas)
  {
    if (this.mRebuildShader)
    {
      this.mBitmapShader = new BitmapShader(this.mBitmap, this.mTileModeX, this.mTileModeY);
      if ((this.mTileModeX == Shader.TileMode.CLAMP) && (this.mTileModeY == Shader.TileMode.CLAMP))
        this.mBitmapShader.setLocalMatrix(this.mShaderMatrix);
      this.mBitmapPaint.setShader(this.mBitmapShader);
      this.mRebuildShader = false;
    }
    if (this.mOval)
    {
      if (this.mBorderWidth > 0.0F)
      {
        paramCanvas.drawOval(this.mDrawableRect, this.mBitmapPaint);
        paramCanvas.drawOval(this.mBorderRect, this.mBorderPaint);
        return;
      }
      paramCanvas.drawOval(this.mDrawableRect, this.mBitmapPaint);
      return;
    }
    if (this.mBorderWidth > 0.0F)
    {
      paramCanvas.drawRoundRect(this.mDrawableRect, Math.max(this.mCornerRadius, 0.0F), Math.max(this.mCornerRadius, 0.0F), this.mBitmapPaint);
      paramCanvas.drawRoundRect(this.mBorderRect, this.mCornerRadius, this.mCornerRadius, this.mBorderPaint);
      return;
    }
    paramCanvas.drawRoundRect(this.mDrawableRect, this.mCornerRadius, this.mCornerRadius, this.mBitmapPaint);
  }

  public int getAlpha()
  {
    return this.mBitmapPaint.getAlpha();
  }

  public int getBorderColor()
  {
    return this.mBorderColor.getDefaultColor();
  }

  public ColorStateList getBorderColors()
  {
    return this.mBorderColor;
  }

  public float getBorderWidth()
  {
    return this.mBorderWidth;
  }

  public ColorFilter getColorFilter()
  {
    return this.mBitmapPaint.getColorFilter();
  }

  public float getCornerRadius()
  {
    return this.mCornerRadius;
  }

  public int getIntrinsicHeight()
  {
    return this.mBitmapHeight;
  }

  public int getIntrinsicWidth()
  {
    return this.mBitmapWidth;
  }

  public int getOpacity()
  {
    return -3;
  }

  public ImageView.ScaleType getScaleType()
  {
    return this.mScaleType;
  }

  public Shader.TileMode getTileModeX()
  {
    return this.mTileModeX;
  }

  public Shader.TileMode getTileModeY()
  {
    return this.mTileModeY;
  }

  public boolean isOval()
  {
    return this.mOval;
  }

  public boolean isStateful()
  {
    return this.mBorderColor.isStateful();
  }

  protected void onBoundsChange(Rect paramRect)
  {
    super.onBoundsChange(paramRect);
    this.mBounds.set(paramRect);
    updateShaderMatrix();
  }

  protected boolean onStateChange(int[] paramArrayOfInt)
  {
    int i = this.mBorderColor.getColorForState(paramArrayOfInt, 0);
    if (this.mBorderPaint.getColor() != i)
    {
      this.mBorderPaint.setColor(i);
      return true;
    }
    return super.onStateChange(paramArrayOfInt);
  }

  public void setAlpha(int paramInt)
  {
    this.mBitmapPaint.setAlpha(paramInt);
    invalidateSelf();
  }

  public RoundedDrawable setBorderColor(int paramInt)
  {
    return setBorderColor(ColorStateList.valueOf(paramInt));
  }

  public RoundedDrawable setBorderColor(ColorStateList paramColorStateList)
  {
    if (paramColorStateList != null);
    while (true)
    {
      this.mBorderColor = paramColorStateList;
      this.mBorderPaint.setColor(this.mBorderColor.getColorForState(getState(), -16777216));
      return this;
      paramColorStateList = ColorStateList.valueOf(0);
    }
  }

  public RoundedDrawable setBorderWidth(float paramFloat)
  {
    this.mBorderWidth = paramFloat;
    this.mBorderPaint.setStrokeWidth(this.mBorderWidth);
    return this;
  }

  public void setColorFilter(ColorFilter paramColorFilter)
  {
    this.mBitmapPaint.setColorFilter(paramColorFilter);
    invalidateSelf();
  }

  public RoundedDrawable setCornerRadius(float paramFloat)
  {
    this.mCornerRadius = paramFloat;
    return this;
  }

  public void setDither(boolean paramBoolean)
  {
    this.mBitmapPaint.setDither(paramBoolean);
    invalidateSelf();
  }

  public void setFilterBitmap(boolean paramBoolean)
  {
    this.mBitmapPaint.setFilterBitmap(paramBoolean);
    invalidateSelf();
  }

  public RoundedDrawable setOval(boolean paramBoolean)
  {
    this.mOval = paramBoolean;
    return this;
  }

  public RoundedDrawable setScaleType(ImageView.ScaleType paramScaleType)
  {
    if (paramScaleType == null)
      paramScaleType = ImageView.ScaleType.FIT_CENTER;
    if (this.mScaleType != paramScaleType)
    {
      this.mScaleType = paramScaleType;
      updateShaderMatrix();
    }
    return this;
  }

  public RoundedDrawable setTileModeX(Shader.TileMode paramTileMode)
  {
    if (this.mTileModeX != paramTileMode)
    {
      this.mTileModeX = paramTileMode;
      this.mRebuildShader = true;
      invalidateSelf();
    }
    return this;
  }

  public RoundedDrawable setTileModeY(Shader.TileMode paramTileMode)
  {
    if (this.mTileModeY != paramTileMode)
    {
      this.mTileModeY = paramTileMode;
      this.mRebuildShader = true;
      invalidateSelf();
    }
    return this;
  }

  public Bitmap toBitmap()
  {
    return drawableToBitmap(this);
  }
}