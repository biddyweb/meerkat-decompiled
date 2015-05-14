package com.google.common.io;

final class CharSource$EmptyCharSource extends CharSource.CharSequenceCharSource
{
  private static final EmptyCharSource INSTANCE = new EmptyCharSource();

  private CharSource$EmptyCharSource()
  {
    super("");
  }

  public String toString()
  {
    return "CharSource.empty()";
  }
}