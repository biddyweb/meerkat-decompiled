package com.google.common.collect;

import com.google.common.annotations.VisibleForTesting;

@VisibleForTesting
class Ordering$IncomparableValueException extends ClassCastException
{
  private static final long serialVersionUID;
  final Object value;

  Ordering$IncomparableValueException(Object paramObject)
  {
    super(22 + str.length() + "Cannot compare value: " + str);
    this.value = paramObject;
  }
}