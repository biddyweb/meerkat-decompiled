package com.google.android.exoplayer.chunk.parser.webm;

import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.upstream.NonBlockingInputStream;

abstract interface EbmlEventHandler
{
  public abstract int getElementType(int paramInt);

  public abstract boolean onBinaryElement(int paramInt1, long paramLong, int paramInt2, int paramInt3, NonBlockingInputStream paramNonBlockingInputStream)
    throws ParserException;

  public abstract void onFloatElement(int paramInt, double paramDouble)
    throws ParserException;

  public abstract void onIntegerElement(int paramInt, long paramLong)
    throws ParserException;

  public abstract void onMasterElementEnd(int paramInt)
    throws ParserException;

  public abstract void onMasterElementStart(int paramInt1, long paramLong1, int paramInt2, long paramLong2)
    throws ParserException;

  public abstract void onStringElement(int paramInt, String paramString)
    throws ParserException;
}