package com.google.common.reflect;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Function;
import com.google.common.base.Joiner;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicates;
import com.google.common.collect.Iterables;
import java.lang.reflect.Array;
import java.lang.reflect.GenericDeclaration;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Collection;
import java.util.concurrent.atomic.AtomicReference;
import javax.annotation.Nullable;

final class Types
{
  private static final Joiner COMMA_JOINER = Joiner.on(", ").useForNull("null");
  private static final Function<Type, String> TYPE_NAME = new Types.1();

  private static void disallowPrimitiveType(Type[] paramArrayOfType, String paramString)
  {
    int i = paramArrayOfType.length;
    int j = 0;
    if (j < i)
    {
      Type localType = paramArrayOfType[j];
      Class localClass;
      if ((localType instanceof Class))
      {
        localClass = (Class)localType;
        if (localClass.isPrimitive())
          break label67;
      }
      label67: for (boolean bool = true; ; bool = false)
      {
        Preconditions.checkArgument(bool, "Primitive type '%s' used as %s", new Object[] { localClass, paramString });
        j++;
        break;
      }
    }
  }

  private static Iterable<Type> filterUpperBounds(Iterable<Type> paramIterable)
  {
    return Iterables.filter(paramIterable, Predicates.not(Predicates.equalTo(Object.class)));
  }

  static Class<?> getArrayClass(Class<?> paramClass)
  {
    return Array.newInstance(paramClass, 0).getClass();
  }

  @Nullable
  static Type getComponentType(Type paramType)
  {
    Preconditions.checkNotNull(paramType);
    AtomicReference localAtomicReference = new AtomicReference();
    new Types.2(localAtomicReference).visit(new Type[] { paramType });
    return (Type)localAtomicReference.get();
  }

  static Type newArrayType(Type paramType)
  {
    int i = 1;
    if ((paramType instanceof WildcardType))
    {
      WildcardType localWildcardType = (WildcardType)paramType;
      Type[] arrayOfType1 = localWildcardType.getLowerBounds();
      if (arrayOfType1.length <= i);
      int m;
      for (int k = i; ; m = 0)
      {
        Preconditions.checkArgument(k, "Wildcard cannot have more than one lower bounds.");
        if (arrayOfType1.length != i)
          break;
        return supertypeOf(newArrayType(arrayOfType1[0]));
      }
      Type[] arrayOfType2 = localWildcardType.getUpperBounds();
      if (arrayOfType2.length == i);
      while (true)
      {
        Preconditions.checkArgument(i, "Wildcard should have only one upper bound.");
        return subtypeOf(newArrayType(arrayOfType2[0]));
        int j = 0;
      }
    }
    return Types.JavaVersion.CURRENT.newArrayType(paramType);
  }

  static <D extends GenericDeclaration> TypeVariable<D> newArtificialTypeVariable(D paramD, String paramString, Type[] paramArrayOfType)
  {
    if (paramArrayOfType.length == 0)
    {
      paramArrayOfType = new Type[1];
      paramArrayOfType[0] = Object.class;
    }
    return new Types.TypeVariableImpl(paramD, paramString, paramArrayOfType);
  }

  static ParameterizedType newParameterizedType(Class<?> paramClass, Type[] paramArrayOfType)
  {
    return new Types.ParameterizedTypeImpl(ClassOwnership.JVM_BEHAVIOR.getOwnerType(paramClass), paramClass, paramArrayOfType);
  }

  static ParameterizedType newParameterizedTypeWithOwner(@Nullable Type paramType, Class<?> paramClass, Type[] paramArrayOfType)
  {
    if (paramType == null)
      return newParameterizedType(paramClass, paramArrayOfType);
    Preconditions.checkNotNull(paramArrayOfType);
    if (paramClass.getEnclosingClass() != null);
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool, "Owner type for unenclosed %s", new Object[] { paramClass });
      return new Types.ParameterizedTypeImpl(paramType, paramClass, paramArrayOfType);
    }
  }

  @VisibleForTesting
  static WildcardType subtypeOf(Type paramType)
  {
    return new Types.WildcardTypeImpl(new Type[0], new Type[] { paramType });
  }

  @Nullable
  private static Type subtypeOfComponentType(Type[] paramArrayOfType)
  {
    int i = paramArrayOfType.length;
    for (int j = 0; j < i; j++)
    {
      Type localType = getComponentType(paramArrayOfType[j]);
      if (localType != null)
      {
        if ((localType instanceof Class))
        {
          Class localClass = (Class)localType;
          if (localClass.isPrimitive())
            return localClass;
        }
        return subtypeOf(localType);
      }
    }
    return null;
  }

  @VisibleForTesting
  static WildcardType supertypeOf(Type paramType)
  {
    return new Types.WildcardTypeImpl(new Type[] { paramType }, new Type[] { Object.class });
  }

  private static Type[] toArray(Collection<Type> paramCollection)
  {
    return (Type[])paramCollection.toArray(new Type[paramCollection.size()]);
  }

  static String toString(Type paramType)
  {
    if ((paramType instanceof Class))
      return ((Class)paramType).getName();
    return paramType.toString();
  }

  private static abstract enum ClassOwnership
  {
    static final ClassOwnership JVM_BEHAVIOR = detectJvmBehavior();

    static
    {
      // Byte code:
      //   0: new 15\011com/google/common/reflect/Types$ClassOwnership$1
      //   3: dup
      //   4: ldc 16
      //   6: iconst_0
      //   7: invokespecial 20\011com/google/common/reflect/Types$ClassOwnership$1:<init>\011(Ljava/lang/String;I)V
      //   10: putstatic 22\011com/google/common/reflect/Types$ClassOwnership:OWNED_BY_ENCLOSING_CLASS\011Lcom/google/common/reflect/Types$ClassOwnership;
      //   13: new 24\011com/google/common/reflect/Types$ClassOwnership$2
      //   16: dup
      //   17: ldc 25
      //   19: iconst_1
      //   20: invokespecial 26\011com/google/common/reflect/Types$ClassOwnership$2:<init>\011(Ljava/lang/String;I)V
      //   23: putstatic 28\011com/google/common/reflect/Types$ClassOwnership:LOCAL_CLASS_HAS_NO_OWNER\011Lcom/google/common/reflect/Types$ClassOwnership;
      //   26: iconst_2
      //   27: anewarray 2\011com/google/common/reflect/Types$ClassOwnership
      //   30: astore_0
      //   31: aload_0
      //   32: iconst_0
      //   33: getstatic 22\011com/google/common/reflect/Types$ClassOwnership:OWNED_BY_ENCLOSING_CLASS\011Lcom/google/common/reflect/Types$ClassOwnership;
      //   36: aastore
      //   37: aload_0
      //   38: iconst_1
      //   39: getstatic 28\011com/google/common/reflect/Types$ClassOwnership:LOCAL_CLASS_HAS_NO_OWNER\011Lcom/google/common/reflect/Types$ClassOwnership;
      //   42: aastore
      //   43: aload_0
      //   44: putstatic 30\011com/google/common/reflect/Types$ClassOwnership:$VALUES\011[Lcom/google/common/reflect/Types$ClassOwnership;
      //   47: invokestatic 34\011com/google/common/reflect/Types$ClassOwnership:detectJvmBehavior\011()Lcom/google/common/reflect/Types$ClassOwnership;
      //   50: putstatic 36\011com/google/common/reflect/Types$ClassOwnership:JVM_BEHAVIOR\011Lcom/google/common/reflect/Types$ClassOwnership;
      //   53: return
    }

    private static ClassOwnership detectJvmBehavior()
    {
      ParameterizedType localParameterizedType = (ParameterizedType)new Types.ClassOwnership.3().getClass().getGenericSuperclass();
      for (ClassOwnership localClassOwnership : values())
        if (localClassOwnership.getOwnerType(Types.ClassOwnership.1LocalClass.class) == localParameterizedType.getOwnerType())
          return localClassOwnership;
      throw new AssertionError();
    }

    @Nullable
    abstract Class<?> getOwnerType(Class<?> paramClass);
  }
}