package com.google.common.reflect;

import java.lang.reflect.Type;

final class Types$NativeTypeVariableEquals<X>
{
  static final boolean NATIVE_TYPE_VARIABLE_ONLY = bool2;

  static
  {
    boolean bool1 = NativeTypeVariableEquals.class.getTypeParameters()[0].equals(Types.newArtificialTypeVariable(NativeTypeVariableEquals.class, "X", new Type[0]));
    boolean bool2 = false;
    if (!bool1)
      bool2 = true;
  }
}