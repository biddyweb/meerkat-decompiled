package com.twitter.sdk.android.tweetui;

import android.text.TextUtils;
import com.twitter.sdk.android.core.models.User;

final class UserUtils
{
  static CharSequence formatScreenName(CharSequence paramCharSequence)
  {
    if (TextUtils.isEmpty(paramCharSequence))
      paramCharSequence = "";
    while (paramCharSequence.charAt(0) == '@')
      return paramCharSequence;
    return "@" + paramCharSequence;
  }

  static String getProfileImageUrlHttps(User paramUser, AvatarSize paramAvatarSize)
  {
    if ((paramUser != null) && (paramUser.profileImageUrlHttps != null))
    {
      String str = paramUser.profileImageUrlHttps;
      if ((paramAvatarSize == null) || (str == null))
        return str;
      switch (1.$SwitchMap$com$twitter$sdk$android$tweetui$UserUtils$AvatarSize[paramAvatarSize.ordinal()])
      {
      default:
        return str;
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      }
      return str.replace(AvatarSize.NORMAL.getSuffix(), paramAvatarSize.getSuffix());
    }
    return null;
  }

  static enum AvatarSize
  {
    private final String suffix;

    static
    {
      BIGGER = new AvatarSize("BIGGER", 1, "_bigger");
      MINI = new AvatarSize("MINI", 2, "_mini");
      ORIGINAL = new AvatarSize("ORIGINAL", 3, "_original");
      REASONABLY_SMALL = new AvatarSize("REASONABLY_SMALL", 4, "_reasonably_small");
      AvatarSize[] arrayOfAvatarSize = new AvatarSize[5];
      arrayOfAvatarSize[0] = NORMAL;
      arrayOfAvatarSize[1] = BIGGER;
      arrayOfAvatarSize[2] = MINI;
      arrayOfAvatarSize[3] = ORIGINAL;
      arrayOfAvatarSize[4] = REASONABLY_SMALL;
    }

    private AvatarSize(String paramString)
    {
      this.suffix = paramString;
    }

    String getSuffix()
    {
      return this.suffix;
    }
  }
}