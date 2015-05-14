package com.google.common.reflect;

import com.google.common.base.Predicate;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;

 enum TypeToken$TypeFilter
  implements Predicate<TypeToken<?>>
{
  static
  {
    TypeFilter[] arrayOfTypeFilter = new TypeFilter[2];
    arrayOfTypeFilter[0] = IGNORE_TYPE_VARIABLE_OR_WILDCARD;
    arrayOfTypeFilter[1] = INTERFACE_ONLY;
  }
}