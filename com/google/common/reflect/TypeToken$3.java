package com.google.common.reflect;

import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;

class TypeToken$3 extends TypeVisitor
{
  TypeToken$3(TypeToken paramTypeToken)
  {
  }

  void visitGenericArrayType(GenericArrayType paramGenericArrayType)
  {
    Type[] arrayOfType = new Type[1];
    arrayOfType[0] = paramGenericArrayType.getGenericComponentType();
    visit(arrayOfType);
  }

  void visitParameterizedType(ParameterizedType paramParameterizedType)
  {
    visit(paramParameterizedType.getActualTypeArguments());
    Type[] arrayOfType = new Type[1];
    arrayOfType[0] = paramParameterizedType.getOwnerType();
    visit(arrayOfType);
  }

  void visitTypeVariable(TypeVariable<?> paramTypeVariable)
  {
    String str = String.valueOf(String.valueOf(TypeToken.access$400(this.this$0)));
    throw new IllegalArgumentException(58 + str.length() + str + "contains a type variable and is not safe for the operation");
  }

  void visitWildcardType(WildcardType paramWildcardType)
  {
    visit(paramWildcardType.getLowerBounds());
    visit(paramWildcardType.getUpperBounds());
  }
}