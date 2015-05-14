package com.google.common.reflect;

import com.google.common.base.Joiner;
import java.lang.reflect.Constructor;
import java.lang.reflect.Type;

class TypeToken$2 extends Invokable.ConstructorInvokable<T>
{
  TypeToken$2(TypeToken paramTypeToken, Constructor paramConstructor)
  {
    super(paramConstructor);
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
    String str2 = String.valueOf(String.valueOf(Joiner.on(", ").join(getGenericParameterTypes())));
    return 2 + str1.length() + str2.length() + str1 + "(" + str2 + ")";
  }
}