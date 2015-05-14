package com.digits.sdk.android;

import android.content.res.Resources;
import android.util.SparseIntArray;

class ConfirmationErrorCodes extends DigitsErrorCodes
{
  ConfirmationErrorCodes(Resources paramResources)
  {
    super(paramResources);
    this.codeIdMap.put(44, R.string.dgts__try_again_confirmation);
  }
}