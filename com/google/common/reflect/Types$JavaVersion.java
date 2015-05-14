package com.google.common.reflect;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableList.Builder;
import java.lang.reflect.AnnotatedElement;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;

 enum Types$JavaVersion
{
  static final JavaVersion CURRENT = JAVA6;

  static
  {
    JavaVersion[] arrayOfJavaVersion = new JavaVersion[3];
    arrayOfJavaVersion[0] = JAVA6;
    arrayOfJavaVersion[1] = JAVA7;
    arrayOfJavaVersion[2] = JAVA8;
    $VALUES = arrayOfJavaVersion;
    if (AnnotatedElement.class.isAssignableFrom(TypeVariable.class))
    {
      CURRENT = JAVA8;
      return;
    }
    if ((new TypeCapture()
    {
    }
    .capture() instanceof Class))
    {
      CURRENT = JAVA7;
      return;
    }
  }

  abstract Type newArrayType(Type paramType);

  String typeName(Type paramType)
  {
    return Types.toString(paramType);
  }

  final ImmutableList<Type> usedInGenericType(Type[] paramArrayOfType)
  {
    ImmutableList.Builder localBuilder = ImmutableList.builder();
    int i = paramArrayOfType.length;
    for (int j = 0; j < i; j++)
      localBuilder.add(usedInGenericType(paramArrayOfType[j]));
    return localBuilder.build();
  }

  abstract Type usedInGenericType(Type paramType);
}