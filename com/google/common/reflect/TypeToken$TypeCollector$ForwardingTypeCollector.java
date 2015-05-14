package com.google.common.reflect;

class TypeToken$TypeCollector$ForwardingTypeCollector<K> extends TypeToken.TypeCollector<K>
{
  private final TypeToken.TypeCollector<K> delegate;

  TypeToken$TypeCollector$ForwardingTypeCollector(TypeToken.TypeCollector<K> paramTypeCollector)
  {
    super(null);
    this.delegate = paramTypeCollector;
  }

  Iterable<? extends K> getInterfaces(K paramK)
  {
    return this.delegate.getInterfaces(paramK);
  }

  Class<?> getRawType(K paramK)
  {
    return this.delegate.getRawType(paramK);
  }

  K getSuperclass(K paramK)
  {
    return this.delegate.getSuperclass(paramK);
  }
}