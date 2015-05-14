package io.fabric.sdk.android.services.common;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;

public class ApiKey
{
  static final String CRASHLYTICS_API_KEY = "com.crashlytics.ApiKey";
  static final String FABRIC_API_KEY = "io.fabric.ApiKey";

  @Deprecated
  public static String getApiKey(Context paramContext)
  {
    Fabric.getLogger().w("Fabric", "getApiKey(context) is deprecated, please upgrade kit(s) to the latest version.");
    return new ApiKey().getValue(paramContext);
  }

  @Deprecated
  public static String getApiKey(Context paramContext, boolean paramBoolean)
  {
    Fabric.getLogger().w("Fabric", "getApiKey(context, debug) is deprecated, please upgrade kit(s) to the latest version.");
    return new ApiKey().getValue(paramContext);
  }

  protected String buildApiKeyInstructions()
  {
    return "Fabric could not be initialized, API key missing from AndroidManifest.xml. Add the following tag to your Application element \n\t<meta-data android:name=\"io.fabric.ApiKey\" android:value=\"YOUR_API_KEY\"/>";
  }

  protected String getApiKeyFromManifest(Context paramContext)
  {
    Object localObject = null;
    try
    {
      String str1 = paramContext.getPackageName();
      Bundle localBundle = paramContext.getPackageManager().getApplicationInfo(str1, 128).metaData;
      localObject = null;
      if (localBundle != null)
      {
        localObject = localBundle.getString("io.fabric.ApiKey");
        if (localObject == null)
        {
          Fabric.getLogger().d("Fabric", "Falling back to Crashlytics key lookup from Manifest");
          String str2 = localBundle.getString("com.crashlytics.ApiKey");
          localObject = str2;
        }
      }
      return localObject;
    }
    catch (Exception localException)
    {
      Fabric.getLogger().d("Fabric", "Caught non-fatal exception while retrieving apiKey: " + localException);
    }
    return localObject;
  }

  protected String getApiKeyFromStrings(Context paramContext)
  {
    int i = CommonUtils.getResourcesIdentifier(paramContext, "io.fabric.ApiKey", "string");
    if (i == 0)
    {
      Fabric.getLogger().d("Fabric", "Falling back to Crashlytics key lookup from Strings");
      i = CommonUtils.getResourcesIdentifier(paramContext, "com.crashlytics.ApiKey", "string");
    }
    String str = null;
    if (i != 0)
      str = paramContext.getResources().getString(i);
    return str;
  }

  public String getValue(Context paramContext)
  {
    String str = getApiKeyFromManifest(paramContext);
    if (TextUtils.isEmpty(str))
      str = getApiKeyFromStrings(paramContext);
    if (TextUtils.isEmpty(str))
      logErrorOrThrowException(paramContext);
    return str;
  }

  protected void logErrorOrThrowException(Context paramContext)
  {
    if ((Fabric.isDebuggable()) || (CommonUtils.isAppDebuggable(paramContext)))
      throw new IllegalArgumentException(buildApiKeyInstructions());
    Fabric.getLogger().e("Fabric", buildApiKeyInstructions());
  }
}