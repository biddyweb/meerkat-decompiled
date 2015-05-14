package com.mixpanel.android.mpmetrics;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.Log;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;

public class InAppNotification
  implements Parcelable
{
  public static final Parcelable.Creator<InAppNotification> CREATOR = new Parcelable.Creator()
  {
    public InAppNotification createFromParcel(Parcel paramAnonymousParcel)
    {
      return new InAppNotification(paramAnonymousParcel);
    }

    public InAppNotification[] newArray(int paramAnonymousInt)
    {
      return new InAppNotification[paramAnonymousInt];
    }
  };
  private static final Pattern FILE_EXTENSION_PATTERN = Pattern.compile("(\\.[^./]+$)");
  private static final String LOGTAG = "MixpanelAPI.InAppNotification";
  private final String mBody;
  private final String mCallToAction;
  private final String mCallToActionUrl;
  private final JSONObject mDescription;
  private final int mId;
  private Bitmap mImage;
  private final String mImageUrl;
  private final int mMessageId;
  private final String mTitle;
  private final String mType;

  public InAppNotification(Parcel paramParcel)
  {
    Object localObject = new JSONObject();
    try
    {
      JSONObject localJSONObject = new JSONObject(paramParcel.readString());
      localObject = localJSONObject;
      this.mDescription = ((JSONObject)localObject);
      this.mId = paramParcel.readInt();
      this.mMessageId = paramParcel.readInt();
      this.mType = paramParcel.readString();
      this.mTitle = paramParcel.readString();
      this.mBody = paramParcel.readString();
      this.mImageUrl = paramParcel.readString();
      this.mCallToAction = paramParcel.readString();
      this.mCallToActionUrl = paramParcel.readString();
      this.mImage = ((Bitmap)paramParcel.readParcelable(Bitmap.class.getClassLoader()));
      return;
    }
    catch (JSONException localJSONException)
    {
      while (true)
        Log.e("MixpanelAPI.InAppNotification", "Error reading JSON when creating InAppNotification from Parcel");
    }
  }

  InAppNotification(JSONObject paramJSONObject)
    throws BadDecideObjectException
  {
    try
    {
      this.mDescription = paramJSONObject;
      this.mId = paramJSONObject.getInt("id");
      this.mMessageId = paramJSONObject.getInt("message_id");
      this.mType = paramJSONObject.getString("type");
      this.mTitle = paramJSONObject.getString("title");
      this.mBody = paramJSONObject.getString("body");
      this.mImageUrl = paramJSONObject.getString("image_url");
      this.mImage = Bitmap.createBitmap(500, 500, Bitmap.Config.ARGB_8888);
      this.mCallToAction = paramJSONObject.getString("cta");
      this.mCallToActionUrl = paramJSONObject.getString("cta_url");
      return;
    }
    catch (JSONException localJSONException)
    {
      throw new BadDecideObjectException("Notification JSON was unexpected or bad", localJSONException);
    }
  }

  static String sizeSuffixUrl(String paramString1, String paramString2)
  {
    Matcher localMatcher = FILE_EXTENSION_PATTERN.matcher(paramString1);
    if (localMatcher.find())
      paramString1 = localMatcher.replaceFirst(paramString2 + "$1");
    return paramString1;
  }

  public int describeContents()
  {
    return 0;
  }

  public String getBody()
  {
    return this.mBody;
  }

  public String getCallToAction()
  {
    return this.mCallToAction;
  }

  public String getCallToActionUrl()
  {
    return this.mCallToActionUrl;
  }

  JSONObject getCampaignProperties()
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("campaign_id", getId());
      localJSONObject.put("message_id", getMessageId());
      localJSONObject.put("message_type", "inapp");
      localJSONObject.put("message_subtype", this.mType);
      return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
      Log.e("MixpanelAPI.InAppNotification", "Impossible JSON Exception", localJSONException);
    }
    return localJSONObject;
  }

  public int getId()
  {
    return this.mId;
  }

  public Bitmap getImage()
  {
    return this.mImage;
  }

  public String getImage2xUrl()
  {
    return sizeSuffixUrl(this.mImageUrl, "@2x");
  }

  public String getImage4xUrl()
  {
    return sizeSuffixUrl(this.mImageUrl, "@4x");
  }

  public String getImageUrl()
  {
    return this.mImageUrl;
  }

  public int getMessageId()
  {
    return this.mMessageId;
  }

  public String getTitle()
  {
    return this.mTitle;
  }

  public Type getType()
  {
    if (Type.MINI.toString().equals(this.mType))
      return Type.MINI;
    if (Type.TAKEOVER.toString().equals(this.mType))
      return Type.TAKEOVER;
    return Type.UNKNOWN;
  }

  void setImage(Bitmap paramBitmap)
  {
    this.mImage = paramBitmap;
  }

  String toJSON()
  {
    return this.mDescription.toString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.mDescription.toString());
    paramParcel.writeInt(this.mId);
    paramParcel.writeInt(this.mMessageId);
    paramParcel.writeString(this.mType);
    paramParcel.writeString(this.mTitle);
    paramParcel.writeString(this.mBody);
    paramParcel.writeString(this.mImageUrl);
    paramParcel.writeString(this.mCallToAction);
    paramParcel.writeString(this.mCallToActionUrl);
    paramParcel.writeParcelable(this.mImage, paramInt);
  }

  public static enum Type
  {
    static
    {
      // Byte code:
      //   0: new 15\011com/mixpanel/android/mpmetrics/InAppNotification$Type$1
      //   3: dup
      //   4: ldc 16
      //   6: iconst_0
      //   7: invokespecial 20\011com/mixpanel/android/mpmetrics/InAppNotification$Type$1:<init>\011(Ljava/lang/String;I)V
      //   10: putstatic 22\011com/mixpanel/android/mpmetrics/InAppNotification$Type:UNKNOWN\011Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;
      //   13: new 24\011com/mixpanel/android/mpmetrics/InAppNotification$Type$2
      //   16: dup
      //   17: ldc 25
      //   19: iconst_1
      //   20: invokespecial 26\011com/mixpanel/android/mpmetrics/InAppNotification$Type$2:<init>\011(Ljava/lang/String;I)V
      //   23: putstatic 28\011com/mixpanel/android/mpmetrics/InAppNotification$Type:MINI\011Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;
      //   26: new 30\011com/mixpanel/android/mpmetrics/InAppNotification$Type$3
      //   29: dup
      //   30: ldc 31
      //   32: iconst_2
      //   33: invokespecial 32\011com/mixpanel/android/mpmetrics/InAppNotification$Type$3:<init>\011(Ljava/lang/String;I)V
      //   36: putstatic 34\011com/mixpanel/android/mpmetrics/InAppNotification$Type:TAKEOVER\011Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;
      //   39: iconst_3
      //   40: anewarray 2\011com/mixpanel/android/mpmetrics/InAppNotification$Type
      //   43: astore_0
      //   44: aload_0
      //   45: iconst_0
      //   46: getstatic 22\011com/mixpanel/android/mpmetrics/InAppNotification$Type:UNKNOWN\011Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;
      //   49: aastore
      //   50: aload_0
      //   51: iconst_1
      //   52: getstatic 28\011com/mixpanel/android/mpmetrics/InAppNotification$Type:MINI\011Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;
      //   55: aastore
      //   56: aload_0
      //   57: iconst_2
      //   58: getstatic 34\011com/mixpanel/android/mpmetrics/InAppNotification$Type:TAKEOVER\011Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;
      //   61: aastore
      //   62: aload_0
      //   63: putstatic 36\011com/mixpanel/android/mpmetrics/InAppNotification$Type:$VALUES\011[Lcom/mixpanel/android/mpmetrics/InAppNotification$Type;
      //   66: return
    }
  }
}