package com.google.android.gms.drive;

public abstract interface FileUploadPreferences
{
  public static final int BATTERY_USAGE_CHARGING_ONLY = 257;
  public static final int BATTERY_USAGE_UNRESTRICTED = 256;
  public static final int NETWORK_TYPE_ANY = 1;
  public static final int NETWORK_TYPE_WIFI_ONLY = 2;
  public static final int PREFERENCE_VALUE_UNKNOWN;

  public abstract int getBatteryUsagePreference();

  public abstract int getNetworkTypePreference();

  public abstract boolean isRoamingAllowed();

  public abstract void setBatteryUsagePreference(int paramInt);

  public abstract void setNetworkTypePreference(int paramInt);

  public abstract void setRoamingAllowed(boolean paramBoolean);
}