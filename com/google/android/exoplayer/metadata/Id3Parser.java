package com.google.android.exoplayer.metadata;

import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class Id3Parser
  implements MetadataParser<Map<String, Object>>
{
  private static String getCharsetName(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return "ISO-8859-1";
    case 0:
      return "ISO-8859-1";
    case 1:
      return "UTF-16";
    case 2:
      return "UTF-16BE";
    case 3:
    }
    return "UTF-8";
  }

  private static int indexOf(byte[] paramArrayOfByte, int paramInt, byte paramByte)
  {
    for (int i = paramInt; i < paramArrayOfByte.length; i++)
      if (paramArrayOfByte[i] == paramByte)
        return i;
    return paramArrayOfByte.length;
  }

  private static int indexOfNot(byte[] paramArrayOfByte, int paramInt, byte paramByte)
  {
    for (int i = paramInt; i < paramArrayOfByte.length; i++)
      if (paramArrayOfByte[i] != paramByte)
        return i;
    return paramArrayOfByte.length;
  }

  private static int parseId3Header(ParsableByteArray paramParsableByteArray)
    throws ParserException
  {
    int i = paramParsableByteArray.readUnsignedByte();
    int j = paramParsableByteArray.readUnsignedByte();
    int k = paramParsableByteArray.readUnsignedByte();
    if ((i != 73) || (j != 68) || (k != 51))
    {
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = Integer.valueOf(i);
      arrayOfObject[1] = Integer.valueOf(j);
      arrayOfObject[2] = Integer.valueOf(k);
      throw new ParserException(String.format("Unexpected ID3 file identifier, expected \"ID3\", actual \"%c%c%c\".", arrayOfObject));
    }
    paramParsableByteArray.skip(2);
    int m = paramParsableByteArray.readUnsignedByte();
    int n = paramParsableByteArray.readSynchSafeInt();
    if ((m & 0x2) != 0)
    {
      int i1 = paramParsableByteArray.readSynchSafeInt();
      if (i1 > 4)
        paramParsableByteArray.skip(i1 - 4);
      n -= i1;
    }
    if ((m & 0x8) != 0)
      n -= 10;
    return n;
  }

  public boolean canParse(String paramString)
  {
    return paramString.equals("application/id3");
  }

  public Map<String, Object> parse(byte[] paramArrayOfByte, int paramInt)
    throws UnsupportedEncodingException, ParserException
  {
    HashMap localHashMap = new HashMap();
    ParsableByteArray localParsableByteArray = new ParsableByteArray(paramArrayOfByte, paramInt);
    int i = parseId3Header(localParsableByteArray);
    int j;
    int k;
    int m;
    int n;
    int i1;
    if (i > 0)
    {
      j = localParsableByteArray.readUnsignedByte();
      k = localParsableByteArray.readUnsignedByte();
      m = localParsableByteArray.readUnsignedByte();
      n = localParsableByteArray.readUnsignedByte();
      i1 = localParsableByteArray.readSynchSafeInt();
      if (i1 > 1);
    }
    else
    {
      return Collections.unmodifiableMap(localHashMap);
    }
    localParsableByteArray.skip(2);
    if ((j == 84) && (k == 88) && (m == 88) && (n == 88))
    {
      String str2 = getCharsetName(localParsableByteArray.readUnsignedByte());
      byte[] arrayOfByte2 = new byte[i1 - 1];
      localParsableByteArray.readBytes(arrayOfByte2, 0, i1 - 1);
      int i2 = indexOf(arrayOfByte2, 0, (byte)0);
      String str3 = new String(arrayOfByte2, 0, i2, str2);
      int i3 = indexOfNot(arrayOfByte2, i2, (byte)0);
      int i4 = indexOf(arrayOfByte2, i3, (byte)0);
      String str4 = new String(arrayOfByte2, i3, i4 - i3, str2);
      TxxxMetadata localTxxxMetadata = new TxxxMetadata(str3, str4);
      localHashMap.put("TXXX", localTxxxMetadata);
    }
    while (true)
    {
      i -= i1 + 10;
      break;
      Object[] arrayOfObject = new Object[4];
      arrayOfObject[0] = Integer.valueOf(j);
      arrayOfObject[1] = Integer.valueOf(k);
      arrayOfObject[2] = Integer.valueOf(m);
      arrayOfObject[3] = Integer.valueOf(n);
      String str1 = String.format("%c%c%c%c", arrayOfObject);
      byte[] arrayOfByte1 = new byte[i1];
      localParsableByteArray.readBytes(arrayOfByte1, 0, i1);
      localHashMap.put(str1, arrayOfByte1);
    }
  }
}