package com.mixpanel.android.java_websocket.util;

import com.mixpanel.android.java_websocket.exceptions.InvalidDataException;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;

public class Charsetfunctions
{
  public static CodingErrorAction codingErrorAction = CodingErrorAction.REPORT;

  public static byte[] asciiBytes(String paramString)
  {
    try
    {
      byte[] arrayOfByte = paramString.getBytes("ASCII");
      return arrayOfByte;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException(localUnsupportedEncodingException);
    }
  }

  public static void main(String[] paramArrayOfString)
    throws InvalidDataException
  {
    stringUtf8(utf8Bytes(""));
    stringAscii(asciiBytes(""));
  }

  public static String stringAscii(byte[] paramArrayOfByte)
  {
    return stringAscii(paramArrayOfByte, 0, paramArrayOfByte.length);
  }

  public static String stringAscii(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    try
    {
      String str = new String(paramArrayOfByte, paramInt1, paramInt2, "ASCII");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException(localUnsupportedEncodingException);
    }
  }

  public static String stringUtf8(ByteBuffer paramByteBuffer)
    throws InvalidDataException
  {
    CharsetDecoder localCharsetDecoder = Charset.forName("UTF8").newDecoder();
    localCharsetDecoder.onMalformedInput(codingErrorAction);
    localCharsetDecoder.onUnmappableCharacter(codingErrorAction);
    try
    {
      paramByteBuffer.mark();
      String str = localCharsetDecoder.decode(paramByteBuffer).toString();
      paramByteBuffer.reset();
      return str;
    }
    catch (CharacterCodingException localCharacterCodingException)
    {
      throw new InvalidDataException(1007, localCharacterCodingException);
    }
  }

  public static String stringUtf8(byte[] paramArrayOfByte)
    throws InvalidDataException
  {
    return stringUtf8(ByteBuffer.wrap(paramArrayOfByte));
  }

  public static byte[] utf8Bytes(String paramString)
  {
    try
    {
      byte[] arrayOfByte = paramString.getBytes("UTF8");
      return arrayOfByte;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException(localUnsupportedEncodingException);
    }
  }
}