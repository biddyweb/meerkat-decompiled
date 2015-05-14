package com.digits.sdk.android;

import android.content.res.Resources;
import android.util.SparseIntArray;

class PhoneNumberErrorCodes extends DigitsErrorCodes
{
  PhoneNumberErrorCodes(Resources paramResources)
  {
    super(paramResources);
    this.codeIdMap.put(44, R.string.dgts__try_again_phone_number);
    this.codeIdMap.put(300, R.string.dgts__try_again_phone_number);
    this.codeIdMap.put(303, R.string.dgts__try_again_phone_number);
    this.codeIdMap.put(285, R.string.dgts__confirmation_error_alternative);
    this.codeIdMap.put(286, R.string.dgts__confirmation_error_alternative);
  }
}