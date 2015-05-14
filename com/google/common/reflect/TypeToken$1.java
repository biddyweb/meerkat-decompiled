package com.google.common.reflect;

import java.lang.reflect.Method;
import java.lang.reflect.Type;

class TypeToken$1 extends Invokable.MethodInvokable<T>
{
  TypeToken$1(TypeToken paramTypeToken, Method paramMethod)
  {
    super(paramMethod);
  }

  Type[] getGenericExceptionTypes()
  {
    return TypeToken.access$000(this.this$0, super.getGenericExceptionTypes());
  }

  Type[] getGenericParameterTypes()
  {
    return TypeToken.access$000(this.this$0, super.getGenericParameterTypes());
  }

  Type getGenericReturnType()
  {
    return this.this$0.resolveType(super.getGenericReturnType()).getType();
  }

  public TypeToken<T> getOwnerType()
  {
    return this.this$0;
  }

  public String toString()
  {
    String str1 = String.valueOf(String.valueOf(getOwnerType()));
    String str2 = String.valueOf(String.valueOf(super.toString()));
    return 1 + str1.length() + str2.length() + str1 + "." + str2;
  }
}