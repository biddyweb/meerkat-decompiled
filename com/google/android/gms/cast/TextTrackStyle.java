package com.google.android.gms.cast;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.view.accessibility.CaptioningManager;
import android.view.accessibility.CaptioningManager.CaptionStyle;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.internal.zzjv;
import com.google.android.gms.internal.zzma;
import com.google.android.gms.internal.zzme;
import org.json.JSONException;
import org.json.JSONObject;

public final class TextTrackStyle
{
  public static final int COLOR_UNSPECIFIED = 0;
  public static final float DEFAULT_FONT_SCALE = 1.0F;
  public static final int EDGE_TYPE_DEPRESSED = 4;
  public static final int EDGE_TYPE_DROP_SHADOW = 2;
  public static final int EDGE_TYPE_NONE = 0;
  public static final int EDGE_TYPE_OUTLINE = 1;
  public static final int EDGE_TYPE_RAISED = 3;
  public static final int EDGE_TYPE_UNSPECIFIED = -1;
  public static final int FONT_FAMILY_CASUAL = 4;
  public static final int FONT_FAMILY_CURSIVE = 5;
  public static final int FONT_FAMILY_MONOSPACED_SANS_SERIF = 1;
  public static final int FONT_FAMILY_MONOSPACED_SERIF = 3;
  public static final int FONT_FAMILY_SANS_SERIF = 0;
  public static final int FONT_FAMILY_SERIF = 2;
  public static final int FONT_FAMILY_SMALL_CAPITALS = 6;
  public static final int FONT_FAMILY_UNSPECIFIED = -1;
  public static final int FONT_STYLE_BOLD = 1;
  public static final int FONT_STYLE_BOLD_ITALIC = 3;
  public static final int FONT_STYLE_ITALIC = 2;
  public static final int FONT_STYLE_NORMAL = 0;
  public static final int FONT_STYLE_UNSPECIFIED = -1;
  public static final int WINDOW_TYPE_NONE = 0;
  public static final int WINDOW_TYPE_NORMAL = 1;
  public static final int WINDOW_TYPE_ROUNDED = 2;
  public static final int WINDOW_TYPE_UNSPECIFIED = -1;
  private int zzAz;
  private JSONObject zzIX;
  private float zzJP;
  private int zzJQ;
  private int zzJR;
  private int zzJS;
  private int zzJT;
  private int zzJU;
  private int zzJV;
  private String zzJW;
  private int zzJX;
  private int zzJY;

  public TextTrackStyle()
  {
    clear();
  }

  private void clear()
  {
    this.zzJP = 1.0F;
    this.zzJQ = 0;
    this.zzAz = 0;
    this.zzJR = -1;
    this.zzJS = 0;
    this.zzJT = -1;
    this.zzJU = 0;
    this.zzJV = 0;
    this.zzJW = null;
    this.zzJX = -1;
    this.zzJY = -1;
    this.zzIX = null;
  }

  public static TextTrackStyle fromSystemSettings(Context paramContext)
  {
    TextTrackStyle localTextTrackStyle = new TextTrackStyle();
    if (!zzme.zzkj())
      return localTextTrackStyle;
    CaptioningManager localCaptioningManager = (CaptioningManager)paramContext.getSystemService("captioning");
    localTextTrackStyle.setFontScale(localCaptioningManager.getFontScale());
    CaptioningManager.CaptionStyle localCaptionStyle = localCaptioningManager.getUserStyle();
    localTextTrackStyle.setBackgroundColor(localCaptionStyle.backgroundColor);
    localTextTrackStyle.setForegroundColor(localCaptionStyle.foregroundColor);
    Typeface localTypeface;
    label120: boolean bool1;
    boolean bool2;
    switch (localCaptionStyle.edgeType)
    {
    default:
      localTextTrackStyle.setEdgeType(0);
      localTextTrackStyle.setEdgeColor(localCaptionStyle.edgeColor);
      localTypeface = localCaptionStyle.getTypeface();
      if (localTypeface != null)
      {
        if (!Typeface.MONOSPACE.equals(localTypeface))
          break label167;
        localTextTrackStyle.setFontGenericFamily(1);
        bool1 = localTypeface.isBold();
        bool2 = localTypeface.isItalic();
        if ((!bool1) || (!bool2))
          break label213;
        localTextTrackStyle.setFontStyle(3);
      }
      break;
    case 1:
    case 2:
    }
    while (true)
    {
      return localTextTrackStyle;
      localTextTrackStyle.setEdgeType(1);
      break;
      localTextTrackStyle.setEdgeType(2);
      break;
      label167: if (Typeface.SANS_SERIF.equals(localTypeface))
      {
        localTextTrackStyle.setFontGenericFamily(0);
        break label120;
      }
      if (Typeface.SERIF.equals(localTypeface))
      {
        localTextTrackStyle.setFontGenericFamily(2);
        break label120;
      }
      localTextTrackStyle.setFontGenericFamily(0);
      break label120;
      label213: if (bool1)
        localTextTrackStyle.setFontStyle(1);
      else if (bool2)
        localTextTrackStyle.setFontStyle(2);
      else
        localTextTrackStyle.setFontStyle(0);
    }
  }

  private int zzaH(String paramString)
  {
    int i = 0;
    if (paramString != null)
    {
      int j = paramString.length();
      i = 0;
      if (j == 9)
      {
        int k = paramString.charAt(0);
        i = 0;
        if (k != 35);
      }
    }
    try
    {
      int m = Integer.parseInt(paramString.substring(1, 3), 16);
      int n = Integer.parseInt(paramString.substring(3, 5), 16);
      int i1 = Integer.parseInt(paramString.substring(5, 7), 16);
      int i2 = Color.argb(Integer.parseInt(paramString.substring(7, 9), 16), m, n, i1);
      i = i2;
      return i;
    }
    catch (NumberFormatException localNumberFormatException)
    {
    }
    return 0;
  }

  private String zzy(int paramInt)
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = Integer.valueOf(Color.red(paramInt));
    arrayOfObject[1] = Integer.valueOf(Color.green(paramInt));
    arrayOfObject[2] = Integer.valueOf(Color.blue(paramInt));
    arrayOfObject[3] = Integer.valueOf(Color.alpha(paramInt));
    return String.format("#%02X%02X%02X%02X", arrayOfObject);
  }

  public boolean equals(Object paramObject)
  {
    boolean bool1 = true;
    boolean bool3;
    if (this == paramObject)
      bool3 = bool1;
    TextTrackStyle localTextTrackStyle;
    boolean bool4;
    boolean bool5;
    label52: boolean bool6;
    do
    {
      do
      {
        boolean bool2;
        do
        {
          return bool3;
          bool2 = paramObject instanceof TextTrackStyle;
          bool3 = false;
        }
        while (!bool2);
        localTextTrackStyle = (TextTrackStyle)paramObject;
        if (this.zzIX != null)
          break;
        bool4 = bool1;
        if (localTextTrackStyle.zzIX != null)
          break label231;
        bool5 = bool1;
        bool3 = false;
      }
      while (bool4 != bool5);
      if ((this.zzIX == null) || (localTextTrackStyle.zzIX == null))
        break;
      bool6 = zzma.zzd(this.zzIX, localTextTrackStyle.zzIX);
      bool3 = false;
    }
    while (!bool6);
    if ((this.zzJP == localTextTrackStyle.zzJP) && (this.zzJQ == localTextTrackStyle.zzJQ) && (this.zzAz == localTextTrackStyle.zzAz) && (this.zzJR == localTextTrackStyle.zzJR) && (this.zzJS == localTextTrackStyle.zzJS) && (this.zzJT == localTextTrackStyle.zzJT) && (this.zzJV == localTextTrackStyle.zzJV) && (zzjv.zza(this.zzJW, localTextTrackStyle.zzJW)) && (this.zzJX == localTextTrackStyle.zzJX) && (this.zzJY == localTextTrackStyle.zzJY));
    while (true)
    {
      return bool1;
      bool4 = false;
      break;
      label231: bool5 = false;
      break label52;
      bool1 = false;
    }
  }

  public int getBackgroundColor()
  {
    return this.zzAz;
  }

  public JSONObject getCustomData()
  {
    return this.zzIX;
  }

  public int getEdgeColor()
  {
    return this.zzJS;
  }

  public int getEdgeType()
  {
    return this.zzJR;
  }

  public String getFontFamily()
  {
    return this.zzJW;
  }

  public int getFontGenericFamily()
  {
    return this.zzJX;
  }

  public float getFontScale()
  {
    return this.zzJP;
  }

  public int getFontStyle()
  {
    return this.zzJY;
  }

  public int getForegroundColor()
  {
    return this.zzJQ;
  }

  public int getWindowColor()
  {
    return this.zzJU;
  }

  public int getWindowCornerRadius()
  {
    return this.zzJV;
  }

  public int getWindowType()
  {
    return this.zzJT;
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[12];
    arrayOfObject[0] = Float.valueOf(this.zzJP);
    arrayOfObject[1] = Integer.valueOf(this.zzJQ);
    arrayOfObject[2] = Integer.valueOf(this.zzAz);
    arrayOfObject[3] = Integer.valueOf(this.zzJR);
    arrayOfObject[4] = Integer.valueOf(this.zzJS);
    arrayOfObject[5] = Integer.valueOf(this.zzJT);
    arrayOfObject[6] = Integer.valueOf(this.zzJU);
    arrayOfObject[7] = Integer.valueOf(this.zzJV);
    arrayOfObject[8] = this.zzJW;
    arrayOfObject[9] = Integer.valueOf(this.zzJX);
    arrayOfObject[10] = Integer.valueOf(this.zzJY);
    arrayOfObject[11] = this.zzIX;
    return zzw.hashCode(arrayOfObject);
  }

  public void setBackgroundColor(int paramInt)
  {
    this.zzAz = paramInt;
  }

  public void setCustomData(JSONObject paramJSONObject)
  {
    this.zzIX = paramJSONObject;
  }

  public void setEdgeColor(int paramInt)
  {
    this.zzJS = paramInt;
  }

  public void setEdgeType(int paramInt)
  {
    if ((paramInt < 0) || (paramInt > 4))
      throw new IllegalArgumentException("invalid edgeType");
    this.zzJR = paramInt;
  }

  public void setFontFamily(String paramString)
  {
    this.zzJW = paramString;
  }

  public void setFontGenericFamily(int paramInt)
  {
    if ((paramInt < 0) || (paramInt > 6))
      throw new IllegalArgumentException("invalid fontGenericFamily");
    this.zzJX = paramInt;
  }

  public void setFontScale(float paramFloat)
  {
    this.zzJP = paramFloat;
  }

  public void setFontStyle(int paramInt)
  {
    if ((paramInt < 0) || (paramInt > 3))
      throw new IllegalArgumentException("invalid fontStyle");
    this.zzJY = paramInt;
  }

  public void setForegroundColor(int paramInt)
  {
    this.zzJQ = paramInt;
  }

  public void setWindowColor(int paramInt)
  {
    this.zzJU = paramInt;
  }

  public void setWindowCornerRadius(int paramInt)
  {
    if (paramInt < 0)
      throw new IllegalArgumentException("invalid windowCornerRadius");
    this.zzJV = paramInt;
  }

  public void setWindowType(int paramInt)
  {
    if ((paramInt < 0) || (paramInt > 2))
      throw new IllegalArgumentException("invalid windowType");
    this.zzJT = paramInt;
  }

  public JSONObject toJson()
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("fontScale", this.zzJP);
      if (this.zzJQ != 0)
        localJSONObject.put("foregroundColor", zzy(this.zzJQ));
      if (this.zzAz != 0)
        localJSONObject.put("backgroundColor", zzy(this.zzAz));
      switch (this.zzJR)
      {
      default:
        if (this.zzJS != 0)
          localJSONObject.put("edgeColor", zzy(this.zzJS));
        switch (this.zzJT)
        {
        default:
          label156: if (this.zzJU != 0)
            localJSONObject.put("windowColor", zzy(this.zzJU));
          if (this.zzJT == 2)
            localJSONObject.put("windowRoundedCornerRadius", this.zzJV);
          if (this.zzJW != null)
            localJSONObject.put("fontFamily", this.zzJW);
          switch (this.zzJX)
          {
          default:
            label264: switch (this.zzJY)
            {
            default:
            case 0:
            case 1:
            case 2:
            case 3:
            }
            break;
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          }
          break;
        case 0:
        case 1:
        case 2:
        }
        break;
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      }
      while (true)
      {
        if (this.zzIX == null)
          break label587;
        localJSONObject.put("customData", this.zzIX);
        return localJSONObject;
        localJSONObject.put("edgeType", "NONE");
        break;
        localJSONObject.put("edgeType", "OUTLINE");
        break;
        localJSONObject.put("edgeType", "DROP_SHADOW");
        break;
        localJSONObject.put("edgeType", "RAISED");
        break;
        localJSONObject.put("edgeType", "DEPRESSED");
        break;
        localJSONObject.put("windowType", "NONE");
        break label156;
        localJSONObject.put("windowType", "NORMAL");
        break label156;
        localJSONObject.put("windowType", "ROUNDED_CORNERS");
        break label156;
        localJSONObject.put("fontGenericFamily", "SANS_SERIF");
        break label264;
        localJSONObject.put("fontGenericFamily", "MONOSPACED_SANS_SERIF");
        break label264;
        localJSONObject.put("fontGenericFamily", "SERIF");
        break label264;
        localJSONObject.put("fontGenericFamily", "MONOSPACED_SERIF");
        break label264;
        localJSONObject.put("fontGenericFamily", "CASUAL");
        break label264;
        localJSONObject.put("fontGenericFamily", "CURSIVE");
        break label264;
        localJSONObject.put("fontGenericFamily", "SMALL_CAPITALS");
        break label264;
        localJSONObject.put("fontStyle", "NORMAL");
        continue;
        localJSONObject.put("fontStyle", "BOLD");
        continue;
        localJSONObject.put("fontStyle", "ITALIC");
        continue;
        localJSONObject.put("fontStyle", "BOLD_ITALIC");
      }
      label587: return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
    }
    return localJSONObject;
  }

  public void zzd(JSONObject paramJSONObject)
    throws JSONException
  {
    clear();
    this.zzJP = ((float)paramJSONObject.optDouble("fontScale", 1.0D));
    this.zzJQ = zzaH(paramJSONObject.optString("foregroundColor"));
    this.zzAz = zzaH(paramJSONObject.optString("backgroundColor"));
    String str4;
    String str3;
    label132: String str2;
    label212: String str1;
    if (paramJSONObject.has("edgeType"))
    {
      str4 = paramJSONObject.getString("edgeType");
      if ("NONE".equals(str4))
        this.zzJR = 0;
    }
    else
    {
      this.zzJS = zzaH(paramJSONObject.optString("edgeColor"));
      if (paramJSONObject.has("windowType"))
      {
        str3 = paramJSONObject.getString("windowType");
        if (!"NONE".equals(str3))
          break label333;
        this.zzJT = 0;
      }
      this.zzJU = zzaH(paramJSONObject.optString("windowColor"));
      if (this.zzJT == 2)
        this.zzJV = paramJSONObject.optInt("windowRoundedCornerRadius", 0);
      this.zzJW = paramJSONObject.optString("fontFamily", null);
      if (paramJSONObject.has("fontGenericFamily"))
      {
        str2 = paramJSONObject.getString("fontGenericFamily");
        if (!"SANS_SERIF".equals(str2))
          break label371;
        this.zzJX = 0;
      }
      if (paramJSONObject.has("fontStyle"))
      {
        str1 = paramJSONObject.getString("fontStyle");
        if (!"NORMAL".equals(str1))
          break label480;
        this.zzJY = 0;
      }
    }
    while (true)
    {
      this.zzIX = paramJSONObject.optJSONObject("customData");
      return;
      if ("OUTLINE".equals(str4))
      {
        this.zzJR = 1;
        break;
      }
      if ("DROP_SHADOW".equals(str4))
      {
        this.zzJR = 2;
        break;
      }
      if ("RAISED".equals(str4))
      {
        this.zzJR = 3;
        break;
      }
      if (!"DEPRESSED".equals(str4))
        break;
      this.zzJR = 4;
      break;
      label333: if ("NORMAL".equals(str3))
      {
        this.zzJT = 1;
        break label132;
      }
      if (!"ROUNDED_CORNERS".equals(str3))
        break label132;
      this.zzJT = 2;
      break label132;
      label371: if ("MONOSPACED_SANS_SERIF".equals(str2))
      {
        this.zzJX = 1;
        break label212;
      }
      if ("SERIF".equals(str2))
      {
        this.zzJX = 2;
        break label212;
      }
      if ("MONOSPACED_SERIF".equals(str2))
      {
        this.zzJX = 3;
        break label212;
      }
      if ("CASUAL".equals(str2))
      {
        this.zzJX = 4;
        break label212;
      }
      if ("CURSIVE".equals(str2))
      {
        this.zzJX = 5;
        break label212;
      }
      if (!"SMALL_CAPITALS".equals(str2))
        break label212;
      this.zzJX = 6;
      break label212;
      label480: if ("BOLD".equals(str1))
        this.zzJY = 1;
      else if ("ITALIC".equals(str1))
        this.zzJY = 2;
      else if ("BOLD_ITALIC".equals(str1))
        this.zzJY = 3;
    }
  }
}