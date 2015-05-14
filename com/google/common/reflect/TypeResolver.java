package com.google.common.reflect;

import com.google.common.annotations.Beta;
import com.google.common.base.Joiner;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;
import com.google.common.collect.Maps;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import javax.annotation.Nullable;

@Beta
public final class TypeResolver
{
  private final TypeTable typeTable;

  public TypeResolver()
  {
    this.typeTable = new TypeTable();
  }

  private TypeResolver(TypeTable paramTypeTable)
  {
    this.typeTable = paramTypeTable;
  }

  static TypeResolver accordingTo(Type paramType)
  {
    return new TypeResolver().where(TypeMappingIntrospector.getTypeMappings(paramType));
  }

  private static <T> T expectArgument(Class<T> paramClass, Object paramObject)
  {
    try
    {
      Object localObject = paramClass.cast(paramObject);
      return localObject;
    }
    catch (ClassCastException localClassCastException)
    {
      String str1 = String.valueOf(String.valueOf(paramObject));
      String str2 = String.valueOf(String.valueOf(paramClass.getSimpleName()));
      throw new IllegalArgumentException(10 + str1.length() + str2.length() + str1 + " is not a " + str2);
    }
  }

  private static void populateTypeMappings(Map<TypeVariableKey, Type> paramMap, Type paramType1, final Type paramType2)
  {
    if (paramType1.equals(paramType2))
      return;
    new TypeVisitor()
    {
      void visitClass(Class<?> paramAnonymousClass)
      {
        String str = String.valueOf(String.valueOf(paramAnonymousClass));
        throw new IllegalArgumentException(21 + str.length() + "No type mapping from " + str);
      }

      void visitGenericArrayType(GenericArrayType paramAnonymousGenericArrayType)
      {
        Type localType = Types.getComponentType(paramType2);
        if (localType != null);
        for (boolean bool = true; ; bool = false)
        {
          Object[] arrayOfObject = new Object[1];
          arrayOfObject[0] = paramType2;
          Preconditions.checkArgument(bool, "%s is not an array type.", arrayOfObject);
          TypeResolver.populateTypeMappings(this.val$mappings, paramAnonymousGenericArrayType.getGenericComponentType(), localType);
          return;
        }
      }

      void visitParameterizedType(ParameterizedType paramAnonymousParameterizedType)
      {
        ParameterizedType localParameterizedType = (ParameterizedType)TypeResolver.expectArgument(ParameterizedType.class, paramType2);
        boolean bool1 = paramAnonymousParameterizedType.getRawType().equals(localParameterizedType.getRawType());
        Object[] arrayOfObject = new Object[2];
        arrayOfObject[0] = paramAnonymousParameterizedType;
        arrayOfObject[1] = paramType2;
        Preconditions.checkArgument(bool1, "Inconsistent raw type: %s vs. %s", arrayOfObject);
        Type[] arrayOfType1 = paramAnonymousParameterizedType.getActualTypeArguments();
        Type[] arrayOfType2 = localParameterizedType.getActualTypeArguments();
        if (arrayOfType1.length == arrayOfType2.length);
        for (boolean bool2 = true; ; bool2 = false)
        {
          Preconditions.checkArgument(bool2, "%s not compatible with %s", new Object[] { paramAnonymousParameterizedType, localParameterizedType });
          for (int i = 0; i < arrayOfType1.length; i++)
            TypeResolver.populateTypeMappings(this.val$mappings, arrayOfType1[i], arrayOfType2[i]);
        }
      }

      void visitTypeVariable(TypeVariable<?> paramAnonymousTypeVariable)
      {
        this.val$mappings.put(new TypeResolver.TypeVariableKey(paramAnonymousTypeVariable), paramType2);
      }

      void visitWildcardType(WildcardType paramAnonymousWildcardType)
      {
        WildcardType localWildcardType = (WildcardType)TypeResolver.expectArgument(WildcardType.class, paramType2);
        Type[] arrayOfType1 = paramAnonymousWildcardType.getUpperBounds();
        Type[] arrayOfType2 = localWildcardType.getUpperBounds();
        Type[] arrayOfType3 = paramAnonymousWildcardType.getLowerBounds();
        Type[] arrayOfType4 = localWildcardType.getLowerBounds();
        if ((arrayOfType1.length == arrayOfType2.length) && (arrayOfType3.length == arrayOfType4.length));
        for (boolean bool = true; ; bool = false)
        {
          Object[] arrayOfObject = new Object[2];
          arrayOfObject[0] = paramAnonymousWildcardType;
          arrayOfObject[1] = paramType2;
          Preconditions.checkArgument(bool, "Incompatible type: %s vs. %s", arrayOfObject);
          for (int i = 0; i < arrayOfType1.length; i++)
            TypeResolver.populateTypeMappings(this.val$mappings, arrayOfType1[i], arrayOfType2[i]);
        }
        for (int j = 0; j < arrayOfType3.length; j++)
          TypeResolver.populateTypeMappings(this.val$mappings, arrayOfType3[j], arrayOfType4[j]);
      }
    }
    .visit(new Type[] { paramType1 });
  }

  private Type resolveGenericArrayType(GenericArrayType paramGenericArrayType)
  {
    return Types.newArrayType(resolveType(paramGenericArrayType.getGenericComponentType()));
  }

  private ParameterizedType resolveParameterizedType(ParameterizedType paramParameterizedType)
  {
    Type localType1 = paramParameterizedType.getOwnerType();
    if (localType1 == null);
    for (Type localType2 = null; ; localType2 = resolveType(localType1))
    {
      Type localType3 = resolveType(paramParameterizedType.getRawType());
      Type[] arrayOfType = resolveTypes(paramParameterizedType.getActualTypeArguments());
      return Types.newParameterizedTypeWithOwner(localType2, (Class)localType3, arrayOfType);
    }
  }

  private Type[] resolveTypes(Type[] paramArrayOfType)
  {
    Type[] arrayOfType = new Type[paramArrayOfType.length];
    for (int i = 0; i < paramArrayOfType.length; i++)
      arrayOfType[i] = resolveType(paramArrayOfType[i]);
    return arrayOfType;
  }

  private WildcardType resolveWildcardType(WildcardType paramWildcardType)
  {
    Type[] arrayOfType1 = paramWildcardType.getLowerBounds();
    Type[] arrayOfType2 = paramWildcardType.getUpperBounds();
    return new Types.WildcardTypeImpl(resolveTypes(arrayOfType1), resolveTypes(arrayOfType2));
  }

  public Type resolveType(Type paramType)
  {
    Preconditions.checkNotNull(paramType);
    if ((paramType instanceof TypeVariable))
      paramType = this.typeTable.resolve((TypeVariable)paramType);
    do
    {
      return paramType;
      if ((paramType instanceof ParameterizedType))
        return resolveParameterizedType((ParameterizedType)paramType);
      if ((paramType instanceof GenericArrayType))
        return resolveGenericArrayType((GenericArrayType)paramType);
    }
    while (!(paramType instanceof WildcardType));
    return resolveWildcardType((WildcardType)paramType);
  }

  public TypeResolver where(Type paramType1, Type paramType2)
  {
    HashMap localHashMap = Maps.newHashMap();
    populateTypeMappings(localHashMap, (Type)Preconditions.checkNotNull(paramType1), (Type)Preconditions.checkNotNull(paramType2));
    return where(localHashMap);
  }

  TypeResolver where(Map<TypeVariableKey, ? extends Type> paramMap)
  {
    return new TypeResolver(this.typeTable.where(paramMap));
  }

  private static final class TypeMappingIntrospector extends TypeVisitor
  {
    private static final TypeResolver.WildcardCapturer wildcardCapturer = new TypeResolver.WildcardCapturer(null);
    private final Map<TypeResolver.TypeVariableKey, Type> mappings = Maps.newHashMap();

    static ImmutableMap<TypeResolver.TypeVariableKey, Type> getTypeMappings(Type paramType)
    {
      TypeMappingIntrospector localTypeMappingIntrospector = new TypeMappingIntrospector();
      Type[] arrayOfType = new Type[1];
      arrayOfType[0] = wildcardCapturer.capture(paramType);
      localTypeMappingIntrospector.visit(arrayOfType);
      return ImmutableMap.copyOf(localTypeMappingIntrospector.mappings);
    }

    private void map(TypeResolver.TypeVariableKey paramTypeVariableKey, Type paramType)
    {
      if (this.mappings.containsKey(paramTypeVariableKey))
        return;
      for (Type localType1 = paramType; ; localType1 = (Type)this.mappings.get(TypeResolver.TypeVariableKey.forLookup(localType1)))
      {
        if (localType1 == null)
          break label78;
        if (paramTypeVariableKey.equalsType(localType1))
        {
          for (Type localType2 = paramType; localType2 != null; localType2 = (Type)this.mappings.remove(TypeResolver.TypeVariableKey.forLookup(localType2)));
          break;
        }
      }
      label78: this.mappings.put(paramTypeVariableKey, paramType);
    }

    void visitClass(Class<?> paramClass)
    {
      Type[] arrayOfType = new Type[1];
      arrayOfType[0] = paramClass.getGenericSuperclass();
      visit(arrayOfType);
      visit(paramClass.getGenericInterfaces());
    }

    void visitParameterizedType(ParameterizedType paramParameterizedType)
    {
      Class localClass = (Class)paramParameterizedType.getRawType();
      TypeVariable[] arrayOfTypeVariable = localClass.getTypeParameters();
      Type[] arrayOfType1 = paramParameterizedType.getActualTypeArguments();
      if (arrayOfTypeVariable.length == arrayOfType1.length);
      for (boolean bool = true; ; bool = false)
      {
        Preconditions.checkState(bool);
        for (int i = 0; i < arrayOfTypeVariable.length; i++)
          map(new TypeResolver.TypeVariableKey(arrayOfTypeVariable[i]), arrayOfType1[i]);
      }
      visit(new Type[] { localClass });
      Type[] arrayOfType2 = new Type[1];
      arrayOfType2[0] = paramParameterizedType.getOwnerType();
      visit(arrayOfType2);
    }

    void visitTypeVariable(TypeVariable<?> paramTypeVariable)
    {
      visit(paramTypeVariable.getBounds());
    }

    void visitWildcardType(WildcardType paramWildcardType)
    {
      visit(paramWildcardType.getUpperBounds());
    }
  }

  private static class TypeTable
  {
    private final ImmutableMap<TypeResolver.TypeVariableKey, Type> map;

    TypeTable()
    {
      this.map = ImmutableMap.of();
    }

    private TypeTable(ImmutableMap<TypeResolver.TypeVariableKey, Type> paramImmutableMap)
    {
      this.map = paramImmutableMap;
    }

    final Type resolve(final TypeVariable<?> paramTypeVariable)
    {
      return resolveInternal(paramTypeVariable, new TypeTable()
      {
        public Type resolveInternal(TypeVariable<?> paramAnonymousTypeVariable, TypeResolver.TypeTable paramAnonymousTypeTable)
        {
          if (paramAnonymousTypeVariable.getGenericDeclaration().equals(paramTypeVariable.getGenericDeclaration()))
            return paramAnonymousTypeVariable;
          return jdField_this.resolveInternal(paramAnonymousTypeVariable, paramAnonymousTypeTable);
        }
      });
    }

    Type resolveInternal(TypeVariable<?> paramTypeVariable, TypeTable paramTypeTable)
    {
      Type localType = (Type)this.map.get(new TypeResolver.TypeVariableKey(paramTypeVariable));
      if (localType == null)
      {
        Type[] arrayOfType1 = paramTypeVariable.getBounds();
        if (arrayOfType1.length == 0);
        Type[] arrayOfType2;
        do
        {
          return paramTypeVariable;
          arrayOfType2 = new TypeResolver(paramTypeTable, null).resolveTypes(arrayOfType1);
        }
        while ((Types.NativeTypeVariableEquals.NATIVE_TYPE_VARIABLE_ONLY) && (Arrays.equals(arrayOfType1, arrayOfType2)));
        return Types.newArtificialTypeVariable(paramTypeVariable.getGenericDeclaration(), paramTypeVariable.getName(), arrayOfType2);
      }
      return new TypeResolver(paramTypeTable, null).resolveType(localType);
    }

    final TypeTable where(Map<TypeResolver.TypeVariableKey, ? extends Type> paramMap)
    {
      ImmutableMap.Builder localBuilder = ImmutableMap.builder();
      localBuilder.putAll(this.map);
      Iterator localIterator = paramMap.entrySet().iterator();
      if (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        TypeResolver.TypeVariableKey localTypeVariableKey = (TypeResolver.TypeVariableKey)localEntry.getKey();
        Type localType = (Type)localEntry.getValue();
        if (!localTypeVariableKey.equalsType(localType));
        for (boolean bool = true; ; bool = false)
        {
          Preconditions.checkArgument(bool, "Type variable %s bound to itself", new Object[] { localTypeVariableKey });
          localBuilder.put(localTypeVariableKey, localType);
          break;
        }
      }
      return new TypeTable(localBuilder.build());
    }
  }

  static final class TypeVariableKey
  {
    private final TypeVariable<?> var;

    TypeVariableKey(TypeVariable<?> paramTypeVariable)
    {
      this.var = ((TypeVariable)Preconditions.checkNotNull(paramTypeVariable));
    }

    private boolean equalsTypeVariable(TypeVariable<?> paramTypeVariable)
    {
      return (this.var.getGenericDeclaration().equals(paramTypeVariable.getGenericDeclaration())) && (this.var.getName().equals(paramTypeVariable.getName()));
    }

    static Object forLookup(Type paramType)
    {
      if ((paramType instanceof TypeVariable))
        return new TypeVariableKey((TypeVariable)paramType);
      return null;
    }

    public boolean equals(Object paramObject)
    {
      if ((paramObject instanceof TypeVariableKey))
        return equalsTypeVariable(((TypeVariableKey)paramObject).var);
      return false;
    }

    boolean equalsType(Type paramType)
    {
      if ((paramType instanceof TypeVariable))
        return equalsTypeVariable((TypeVariable)paramType);
      return false;
    }

    public int hashCode()
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = this.var.getGenericDeclaration();
      arrayOfObject[1] = this.var.getName();
      return Objects.hashCode(arrayOfObject);
    }

    public String toString()
    {
      return this.var.toString();
    }
  }

  private static final class WildcardCapturer
  {
    private final AtomicInteger id = new AtomicInteger();

    private Type[] capture(Type[] paramArrayOfType)
    {
      Type[] arrayOfType = new Type[paramArrayOfType.length];
      for (int i = 0; i < paramArrayOfType.length; i++)
        arrayOfType[i] = capture(paramArrayOfType[i]);
      return arrayOfType;
    }

    private Type captureNullable(@Nullable Type paramType)
    {
      if (paramType == null)
        return null;
      return capture(paramType);
    }

    Type capture(Type paramType)
    {
      Preconditions.checkNotNull(paramType);
      if ((paramType instanceof Class));
      WildcardType localWildcardType;
      do
      {
        do
          return paramType;
        while ((paramType instanceof TypeVariable));
        if ((paramType instanceof GenericArrayType))
          return Types.newArrayType(capture(((GenericArrayType)paramType).getGenericComponentType()));
        if ((paramType instanceof ParameterizedType))
        {
          ParameterizedType localParameterizedType = (ParameterizedType)paramType;
          return Types.newParameterizedTypeWithOwner(captureNullable(localParameterizedType.getOwnerType()), (Class)localParameterizedType.getRawType(), capture(localParameterizedType.getActualTypeArguments()));
        }
        if (!(paramType instanceof WildcardType))
          break;
        localWildcardType = (WildcardType)paramType;
      }
      while (localWildcardType.getLowerBounds().length != 0);
      Type[] arrayOfType = localWildcardType.getUpperBounds();
      int i = this.id.incrementAndGet();
      String str = String.valueOf(String.valueOf(Joiner.on('&').join(arrayOfType)));
      return Types.newArtificialTypeVariable(WildcardCapturer.class, 33 + str.length() + "capture#" + i + "-of ? extends " + str, localWildcardType.getUpperBounds());
      throw new AssertionError("must have been one of the known types");
    }
  }
}