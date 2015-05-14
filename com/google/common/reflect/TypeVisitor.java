package com.google.common.reflect;

import com.google.common.collect.Sets;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Set;
import javax.annotation.concurrent.NotThreadSafe;

@NotThreadSafe
abstract class TypeVisitor
{
  private final Set<Type> visited = Sets.newHashSet();

  public final void visit(Type[] paramArrayOfType)
  {
    int i = paramArrayOfType.length;
    int j = 0;
    while (j < i)
    {
      Type localType = paramArrayOfType[j];
      if ((localType == null) || (!this.visited.add(localType)))
      {
        j++;
      }
      else
      {
        while (true)
        {
          try
          {
            if ((localType instanceof TypeVariable))
            {
              visitTypeVariable((TypeVariable)localType);
              if (1 != 0)
                break;
              this.visited.remove(localType);
              break;
            }
            if ((localType instanceof WildcardType))
            {
              visitWildcardType((WildcardType)localType);
              continue;
            }
          }
          finally
          {
            if (0 == 0)
              this.visited.remove(localType);
          }
          if ((localType instanceof ParameterizedType))
          {
            visitParameterizedType((ParameterizedType)localType);
          }
          else if ((localType instanceof Class))
          {
            visitClass((Class)localType);
          }
          else
          {
            if (!(localType instanceof GenericArrayType))
              break label177;
            visitGenericArrayType((GenericArrayType)localType);
          }
        }
        label177: String str = String.valueOf(String.valueOf(localType));
        throw new AssertionError(14 + str.length() + "Unknown type: " + str);
      }
    }
  }

  void visitClass(Class<?> paramClass)
  {
  }

  void visitGenericArrayType(GenericArrayType paramGenericArrayType)
  {
  }

  void visitParameterizedType(ParameterizedType paramParameterizedType)
  {
  }

  void visitTypeVariable(TypeVariable<?> paramTypeVariable)
  {
  }

  void visitWildcardType(WildcardType paramWildcardType)
  {
  }
}