package co.getair.meerkat;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class FeatureFlag
{
  public static final String PHONE_VERIFICATION = "phoneVerification";
  private static final Map<String, Boolean> availableFeatures = Collections.unmodifiableMap(localHashMap);

  static
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("phoneVerification", Boolean.FALSE);
  }

  public static Boolean isFeatureAvailable(String paramString)
  {
    if (availableFeatures.get(paramString) != null)
      return (Boolean)availableFeatures.get(paramString);
    return Boolean.FALSE;
  }
}