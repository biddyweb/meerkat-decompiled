package com.google.common.collect;

import javax.annotation.Nullable;

final class RegularImmutableMap$NonTerminalMapEntry<K, V> extends ImmutableMapEntry<K, V>
{
  private final ImmutableMapEntry<K, V> nextInKeyBucket;

  RegularImmutableMap$NonTerminalMapEntry(ImmutableMapEntry<K, V> paramImmutableMapEntry1, ImmutableMapEntry<K, V> paramImmutableMapEntry2)
  {
    super(paramImmutableMapEntry1);
    this.nextInKeyBucket = paramImmutableMapEntry2;
  }

  RegularImmutableMap$NonTerminalMapEntry(K paramK, V paramV, ImmutableMapEntry<K, V> paramImmutableMapEntry)
  {
    super(paramK, paramV);
    this.nextInKeyBucket = paramImmutableMapEntry;
  }

  ImmutableMapEntry<K, V> getNextInKeyBucket()
  {
    return this.nextInKeyBucket;
  }

  @Nullable
  ImmutableMapEntry<K, V> getNextInValueBucket()
  {
    return null;
  }
}