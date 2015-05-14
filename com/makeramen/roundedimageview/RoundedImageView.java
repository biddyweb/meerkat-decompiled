package com.makeramen.roundedimageview;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.ColorFilter;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;
import android.util.AttributeSet;
import android.util.Log;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;

public class RoundedImageView extends ImageView
{
  public static final float DEFAULT_BORDER_WIDTH = 0.0F;
  public static final float DEFAULT_RADIUS = 0.0F;
  public static final Shader.TileMode DEFAULT_TILE_MODE;
  private static final ImageView.ScaleType[] SCALE_TYPES;
  public static final String TAG = "RoundedImageView";
  private static final int TILE_MODE_CLAMP = 0;
  private static final int TILE_MODE_MIRROR = 2;
  private static final int TILE_MODE_REPEAT = 1;
  private static final int TILE_MODE_UNDEFINED = -2;
  private ColorStateList borderColor = ColorStateList.valueOf(-16777216);
  private float borderWidth = 0.0F;
  private float cornerRadius = 0.0F;
  private boolean isOval = false;
  private Drawable mBackgroundDrawable;
  private ColorFilter mColorFilter = null;
  private boolean mColorMod = false;
  private Drawable mDrawable;
  private boolean mHasColorFilter = false;
  private int mResource;
  private ImageView.ScaleType mScaleType;
  private boolean mutateBackground = false;
  private Shader.TileMode tileModeX = DEFAULT_TILE_MODE;
  private Shader.TileMode tileModeY = DEFAULT_TILE_MODE;

  static
  {
    if (!RoundedImageView.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      DEFAULT_TILE_MODE = Shader.TileMode.CLAMP;
      ImageView.ScaleType[] arrayOfScaleType = new ImageView.ScaleType[8];
      arrayOfScaleType[0] = ImageView.ScaleType.MATRIX;
      arrayOfScaleType[1] = ImageView.ScaleType.FIT_XY;
      arrayOfScaleType[2] = ImageView.ScaleType.FIT_START;
      arrayOfScaleType[3] = ImageView.ScaleType.FIT_CENTER;
      arrayOfScaleType[4] = ImageView.ScaleType.FIT_END;
      arrayOfScaleType[5] = ImageView.ScaleType.CENTER;
      arrayOfScaleType[6] = ImageView.ScaleType.CENTER_CROP;
      arrayOfScaleType[7] = ImageView.ScaleType.CENTER_INSIDE;
      SCALE_TYPES = arrayOfScaleType;
      return;
    }
  }

  public RoundedImageView(Context paramContext)
  {
    super(paramContext);
  }

  public RoundedImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public RoundedImageView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.RoundedImageView, paramInt, 0);
    int i = localTypedArray.getInt(R.styleable.RoundedImageView_android_scaleType, -1);
    if (i >= 0)
      setScaleType(SCALE_TYPES[i]);
    while (true)
    {
      this.cornerRadius = localTypedArray.getDimensionPixelSize(R.styleable.RoundedImageView_riv_corner_radius, -1);
      this.borderWidth = localTypedArray.getDimensionPixelSize(R.styleable.RoundedImageView_riv_border_width, -1);
      if (this.cornerRadius < 0.0F)
        this.cornerRadius = 0.0F;
      if (this.borderWidth < 0.0F)
        this.borderWidth = 0.0F;
      this.borderColor = localTypedArray.getColorStateList(R.styleable.RoundedImageView_riv_border_color);
      if (this.borderColor == null)
        this.borderColor = ColorStateList.valueOf(-16777216);
      this.mutateBackground = localTypedArray.getBoolean(R.styleable.RoundedImageView_riv_mutate_background, false);
      this.isOval = localTypedArray.getBoolean(R.styleable.RoundedImageView_riv_oval, false);
      int j = localTypedArray.getInt(R.styleable.RoundedImageView_riv_tile_mode, -2);
      if (j != -2)
      {
        setTileModeX(parseTileMode(j));
        setTileModeY(parseTileMode(j));
      }
      int k = localTypedArray.getInt(R.styleable.RoundedImageView_riv_tile_mode_x, -2);
      if (k != -2)
        setTileModeX(parseTileMode(k));
      int m = localTypedArray.getInt(R.styleable.RoundedImageView_riv_tile_mode_y, -2);
      if (m != -2)
        setTileModeY(parseTileMode(m));
      updateDrawableAttrs();
      updateBackgroundDrawableAttrs(true);
      localTypedArray.recycle();
      return;
      setScaleType(ImageView.ScaleType.FIT_CENTER);
    }
  }

  private void applyColorMod()
  {
    if ((this.mDrawable != null) && (this.mColorMod))
    {
      this.mDrawable = this.mDrawable.mutate();
      if (this.mHasColorFilter)
        this.mDrawable.setColorFilter(this.mColorFilter);
    }
  }

  private static Shader.TileMode parseTileMode(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return null;
    case 0:
      return Shader.TileMode.CLAMP;
    case 1:
      return Shader.TileMode.REPEAT;
    case 2:
    }
    return Shader.TileMode.MIRROR;
  }

  private Drawable resolveResource()
  {
    Resources localResources = getResources();
    if (localResources == null)
      return null;
    int i = this.mResource;
    Object localObject = null;
    if (i != 0);
    try
    {
      Drawable localDrawable = localResources.getDrawable(this.mResource);
      localObject = localDrawable;
      return RoundedDrawable.fromDrawable(localObject);
    }
    catch (Exception localException)
    {
      while (true)
      {
        Log.w("RoundedImageView", "Unable to find resource: " + this.mResource, localException);
        this.mResource = 0;
        localObject = null;
      }
    }
  }

  private void updateAttrs(Drawable paramDrawable)
  {
    if (paramDrawable == null);
    while (true)
    {
      return;
      if ((paramDrawable instanceof RoundedDrawable))
      {
        ((RoundedDrawable)paramDrawable).setScaleType(this.mScaleType).setCornerRadius(this.cornerRadius).setBorderWidth(this.borderWidth).setBorderColor(this.borderColor).setOval(this.isOval).setTileModeX(this.tileModeX).setTileModeY(this.tileModeY);
        applyColorMod();
        return;
      }
      if ((paramDrawable instanceof LayerDrawable))
      {
        LayerDrawable localLayerDrawable = (LayerDrawable)paramDrawable;
        int i = 0;
        int j = localLayerDrawable.getNumberOfLayers();
        while (i < j)
        {
          updateAttrs(localLayerDrawable.getDrawable(i));
          i++;
        }
      }
    }
  }

  private void updateBackgroundDrawableAttrs(boolean paramBoolean)
  {
    if (this.mutateBackground)
    {
      if (paramBoolean)
        this.mBackgroundDrawable = RoundedDrawable.fromDrawable(this.mBackgroundDrawable);
      updateAttrs(this.mBackgroundDrawable);
    }
  }

  private void updateDrawableAttrs()
  {
    updateAttrs(this.mDrawable);
  }

  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    invalidate();
  }

  public int getBorderColor()
  {
    return this.borderColor.getDefaultColor();
  }

  public ColorStateList getBorderColors()
  {
    return this.borderColor;
  }

  public float getBorderWidth()
  {
    return this.borderWidth;
  }

  public float getCornerRadius()
  {
    return this.cornerRadius;
  }

  public ImageView.ScaleType getScaleType()
  {
    return this.mScaleType;
  }

  public Shader.TileMode getTileModeX()
  {
    return this.tileModeX;
  }

  public Shader.TileMode getTileModeY()
  {
    return this.tileModeY;
  }

  public boolean isOval()
  {
    return this.isOval;
  }

  public void mutateBackground(boolean paramBoolean)
  {
    if (this.mutateBackground == paramBoolean)
      return;
    this.mutateBackground = paramBoolean;
    updateBackgroundDrawableAttrs(true);
    invalidate();
  }

  public boolean mutatesBackground()
  {
    return this.mutateBackground;
  }

  public void setBackground(Drawable paramDrawable)
  {
    setBackgroundDrawable(paramDrawable);
  }

  @Deprecated
  public void setBackgroundDrawable(Drawable paramDrawable)
  {
    this.mBackgroundDrawable = paramDrawable;
    updateBackgroundDrawableAttrs(true);
    super.setBackgroundDrawable(this.mBackgroundDrawable);
  }

  public void setBorderColor(int paramInt)
  {
    setBorderColor(ColorStateList.valueOf(paramInt));
  }

  public void setBorderColor(ColorStateList paramColorStateList)
  {
    if (this.borderColor.equals(paramColorStateList))
      return;
    if (paramColorStateList != null);
    while (true)
    {
      this.borderColor = paramColorStateList;
      updateDrawableAttrs();
      updateBackgroundDrawableAttrs(false);
      if (this.borderWidth <= 0.0F)
        break;
      invalidate();
      return;
      paramColorStateList = ColorStateList.valueOf(-16777216);
    }
  }

  public void setBorderWidth(float paramFloat)
  {
    if (this.borderWidth == paramFloat)
      return;
    this.borderWidth = paramFloat;
    updateDrawableAttrs();
    updateBackgroundDrawableAttrs(false);
    invalidate();
  }

  public void setBorderWidth(int paramInt)
  {
    setBorderWidth(getResources().getDimension(paramInt));
  }

  public void setColorFilter(ColorFilter paramColorFilter)
  {
    if (this.mColorFilter != paramColorFilter)
    {
      this.mColorFilter = paramColorFilter;
      this.mHasColorFilter = true;
      this.mColorMod = true;
      applyColorMod();
      invalidate();
    }
  }

  public void setCornerRadius(float paramFloat)
  {
    if (this.cornerRadius == paramFloat)
      return;
    this.cornerRadius = paramFloat;
    updateDrawableAttrs();
    updateBackgroundDrawableAttrs(false);
    invalidate();
  }

  public void setCornerRadiusDimen(int paramInt)
  {
    setCornerRadius(getResources().getDimension(paramInt));
  }

  public void setImageBitmap(Bitmap paramBitmap)
  {
    this.mResource = 0;
    this.mDrawable = RoundedDrawable.fromBitmap(paramBitmap);
    updateDrawableAttrs();
    super.setImageDrawable(this.mDrawable);
  }

  public void setImageDrawable(Drawable paramDrawable)
  {
    this.mResource = 0;
    this.mDrawable = RoundedDrawable.fromDrawable(paramDrawable);
    updateDrawableAttrs();
    super.setImageDrawable(this.mDrawable);
  }

  public void setImageResource(int paramInt)
  {
    if (this.mResource != paramInt)
    {
      this.mResource = paramInt;
      this.mDrawable = resolveResource();
      updateDrawableAttrs();
      super.setImageDrawable(this.mDrawable);
    }
  }

  public void setImageURI(Uri paramUri)
  {
    super.setImageURI(paramUri);
    setImageDrawable(getDrawable());
  }

  public void setOval(boolean paramBoolean)
  {
    this.isOval = paramBoolean;
    updateDrawableAttrs();
    updateBackgroundDrawableAttrs(false);
    invalidate();
  }

  public void setScaleType(ImageView.ScaleType paramScaleType)
  {
    assert (paramScaleType != null);
    if (this.mScaleType != paramScaleType)
    {
      this.mScaleType = paramScaleType;
      switch (RoundedImageView.1.$SwitchMap$android$widget$ImageView$ScaleType[paramScaleType.ordinal()])
      {
      default:
        super.setScaleType(paramScaleType);
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      }
    }
    while (true)
    {
      updateDrawableAttrs();
      updateBackgroundDrawableAttrs(false);
      invalidate();
      return;
      super.setScaleType(ImageView.ScaleType.FIT_XY);
    }
  }

  public void setTileModeX(Shader.TileMode paramTileMode)
  {
    if (this.tileModeX == paramTileMode)
      return;
    this.tileModeX = paramTileMode;
    updateDrawableAttrs();
    updateBackgroundDrawableAttrs(false);
    invalidate();
  }

  public void setTileModeY(Shader.TileMode paramTileMode)
  {
    if (this.tileModeY == paramTileMode)
      return;
    this.tileModeY = paramTileMode;
    updateDrawableAttrs();
    updateBackgroundDrawableAttrs(false);
    invalidate();
  }
}