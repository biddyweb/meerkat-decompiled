package com.digits.sdk.android;

import android.content.res.Resources;
import android.util.SparseIntArray;

class DigitsErrorCodes
  implements ErrorCodes
{
  private static final int INITIAL_CAPACITY = 10;
  protected final SparseIntArray codeIdMap = new SparseIntArray(10);
  private final Resources resources;

  DigitsErrorCodes(Resources paramResources)
  {
    this.codeIdMap.put(88, R.string.dgts__confirmation_error_alternative);
    this.codeIdMap.put(284, R.string.dgts__network_error);
    this.codeIdMap.put(302, R.string.dgts__network_error);
    this.codeIdMap.put(240, R.string.dgts__network_error);
    this.codeIdMap.put(87, R.string.dgts__network_error);
    this.resources = paramResources;
  }

  public String getDefaultMessage()
  {
    return this.resources.getString(R.string.dgts__try_again);
  }

  public String getMessage(int paramInt)
  {
    int i = this.codeIdMap.get(paramInt, -1);
    if (i == -1)
      return getDefaultMessage();
    return this.resources.getString(i);
  }

  public String getNetworkError()
  {
    return this.resources.getString(R.string.dgts__network_error);
  }
}