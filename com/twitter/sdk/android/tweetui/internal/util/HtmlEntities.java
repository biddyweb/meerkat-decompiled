package com.twitter.sdk.android.tweetui.internal.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public class HtmlEntities
{
  private static final String[][] BASIC_ARRAY;
  public static final HtmlEntities HTML40;
  static final String[][] HTML40_ARRAY;
  static final String[][] ISO8859_1_ARRAY = { { "nbsp", "160" }, { "iexcl", "161" }, { "cent", "162" }, { "pound", "163" }, { "curren", "164" }, { "yen", "165" }, { "brvbar", "166" }, { "sect", "167" }, { "uml", "168" }, { "copy", "169" }, { "ordf", "170" }, { "laquo", "171" }, { "not", "172" }, { "shy", "173" }, { "reg", "174" }, { "macr", "175" }, { "deg", "176" }, { "plusmn", "177" }, { "sup2", "178" }, { "sup3", "179" }, { "acute", "180" }, { "micro", "181" }, { "para", "182" }, { "middot", "183" }, { "cedil", "184" }, { "sup1", "185" }, { "ordm", "186" }, { "raquo", "187" }, { "frac14", "188" }, { "frac12", "189" }, { "frac34", "190" }, { "iquest", "191" }, { "Agrave", "192" }, { "Aacute", "193" }, { "Acirc", "194" }, { "Atilde", "195" }, { "Auml", "196" }, { "Aring", "197" }, { "AElig", "198" }, { "Ccedil", "199" }, { "Egrave", "200" }, { "Eacute", "201" }, { "Ecirc", "202" }, { "Euml", "203" }, { "Igrave", "204" }, { "Iacute", "205" }, { "Icirc", "206" }, { "Iuml", "207" }, { "ETH", "208" }, { "Ntilde", "209" }, { "Ograve", "210" }, { "Oacute", "211" }, { "Ocirc", "212" }, { "Otilde", "213" }, { "Ouml", "214" }, { "times", "215" }, { "Oslash", "216" }, { "Ugrave", "217" }, { "Uacute", "218" }, { "Ucirc", "219" }, { "Uuml", "220" }, { "Yacute", "221" }, { "THORN", "222" }, { "szlig", "223" }, { "agrave", "224" }, { "aacute", "225" }, { "acirc", "226" }, { "atilde", "227" }, { "auml", "228" }, { "aring", "229" }, { "aelig", "230" }, { "ccedil", "231" }, { "egrave", "232" }, { "eacute", "233" }, { "ecirc", "234" }, { "euml", "235" }, { "igrave", "236" }, { "iacute", "237" }, { "icirc", "238" }, { "iuml", "239" }, { "eth", "240" }, { "ntilde", "241" }, { "ograve", "242" }, { "oacute", "243" }, { "ocirc", "244" }, { "otilde", "245" }, { "ouml", "246" }, { "divide", "247" }, { "oslash", "248" }, { "ugrave", "249" }, { "uacute", "250" }, { "ucirc", "251" }, { "uuml", "252" }, { "yacute", "253" }, { "thorn", "254" }, { "yuml", "255" } };
  final EntityMap map = new LookupEntityMap();

  static
  {
    HTML40_ARRAY = new String[][] { { "fnof", "402" }, { "Alpha", "913" }, { "Beta", "914" }, { "Gamma", "915" }, { "Delta", "916" }, { "Epsilon", "917" }, { "Zeta", "918" }, { "Eta", "919" }, { "Theta", "920" }, { "Iota", "921" }, { "Kappa", "922" }, { "Lambda", "923" }, { "Mu", "924" }, { "Nu", "925" }, { "Xi", "926" }, { "Omicron", "927" }, { "Pi", "928" }, { "Rho", "929" }, { "Sigma", "931" }, { "Tau", "932" }, { "Upsilon", "933" }, { "Phi", "934" }, { "Chi", "935" }, { "Psi", "936" }, { "Omega", "937" }, { "alpha", "945" }, { "beta", "946" }, { "gamma", "947" }, { "delta", "948" }, { "epsilon", "949" }, { "zeta", "950" }, { "eta", "951" }, { "theta", "952" }, { "iota", "953" }, { "kappa", "954" }, { "lambda", "955" }, { "mu", "956" }, { "nu", "957" }, { "xi", "958" }, { "omicron", "959" }, { "pi", "960" }, { "rho", "961" }, { "sigmaf", "962" }, { "sigma", "963" }, { "tau", "964" }, { "upsilon", "965" }, { "phi", "966" }, { "chi", "967" }, { "psi", "968" }, { "omega", "969" }, { "thetasym", "977" }, { "upsih", "978" }, { "piv", "982" }, { "bull", "8226" }, { "hellip", "8230" }, { "prime", "8242" }, { "Prime", "8243" }, { "oline", "8254" }, { "frasl", "8260" }, { "weierp", "8472" }, { "image", "8465" }, { "real", "8476" }, { "trade", "8482" }, { "alefsym", "8501" }, { "larr", "8592" }, { "uarr", "8593" }, { "rarr", "8594" }, { "darr", "8595" }, { "harr", "8596" }, { "crarr", "8629" }, { "lArr", "8656" }, { "uArr", "8657" }, { "rArr", "8658" }, { "dArr", "8659" }, { "hArr", "8660" }, { "forall", "8704" }, { "part", "8706" }, { "exist", "8707" }, { "empty", "8709" }, { "nabla", "8711" }, { "isin", "8712" }, { "notin", "8713" }, { "ni", "8715" }, { "prod", "8719" }, { "sum", "8721" }, { "minus", "8722" }, { "lowast", "8727" }, { "radic", "8730" }, { "prop", "8733" }, { "infin", "8734" }, { "ang", "8736" }, { "and", "8743" }, { "or", "8744" }, { "cap", "8745" }, { "cup", "8746" }, { "int", "8747" }, { "there4", "8756" }, { "sim", "8764" }, { "cong", "8773" }, { "asymp", "8776" }, { "ne", "8800" }, { "equiv", "8801" }, { "le", "8804" }, { "ge", "8805" }, { "sub", "8834" }, { "sup", "8835" }, { "sube", "8838" }, { "supe", "8839" }, { "oplus", "8853" }, { "otimes", "8855" }, { "perp", "8869" }, { "sdot", "8901" }, { "lceil", "8968" }, { "rceil", "8969" }, { "lfloor", "8970" }, { "rfloor", "8971" }, { "lang", "9001" }, { "rang", "9002" }, { "loz", "9674" }, { "spades", "9824" }, { "clubs", "9827" }, { "hearts", "9829" }, { "diams", "9830" }, { "OElig", "338" }, { "oelig", "339" }, { "Scaron", "352" }, { "scaron", "353" }, { "Yuml", "376" }, { "circ", "710" }, { "tilde", "732" }, { "ensp", "8194" }, { "emsp", "8195" }, { "thinsp", "8201" }, { "zwnj", "8204" }, { "zwj", "8205" }, { "lrm", "8206" }, { "rlm", "8207" }, { "ndash", "8211" }, { "mdash", "8212" }, { "lsquo", "8216" }, { "rsquo", "8217" }, { "sbquo", "8218" }, { "ldquo", "8220" }, { "rdquo", "8221" }, { "bdquo", "8222" }, { "dagger", "8224" }, { "Dagger", "8225" }, { "permil", "8240" }, { "lsaquo", "8249" }, { "rsaquo", "8250" }, { "euro", "8364" } };
    BASIC_ARRAY = new String[][] { { "quot", "34" }, { "amp", "38" }, { "lt", "60" }, { "gt", "62" } };
    HTML40 = new HtmlEntities();
    fillWithHtml40Entities(HTML40);
  }

  static void fillWithHtml40Entities(HtmlEntities paramHtmlEntities)
  {
    paramHtmlEntities.addEntities(BASIC_ARRAY);
    paramHtmlEntities.addEntities(ISO8859_1_ARRAY);
    paramHtmlEntities.addEntities(HTML40_ARRAY);
  }

  public void addEntities(String[][] paramArrayOfString)
  {
    int i = paramArrayOfString.length;
    for (int j = 0; j < i; j++)
    {
      String[] arrayOfString = paramArrayOfString[j];
      addEntity(arrayOfString[0], Integer.parseInt(arrayOfString[1]));
    }
  }

  public void addEntity(String paramString, int paramInt)
  {
    this.map.add(paramString, paramInt);
  }

  public String entityName(int paramInt)
  {
    return this.map.name(paramInt);
  }

  public int entityValue(String paramString)
  {
    return this.map.value(paramString);
  }

  public Unescaped unescape(String paramString)
  {
    int i = paramString.length();
    StringBuilder localStringBuilder = new StringBuilder(i);
    ArrayList localArrayList = new ArrayList(5);
    int j = 0;
    char c;
    int k;
    if (j < i)
    {
      c = paramString.charAt(j);
      if (c == '&')
      {
        k = paramString.indexOf(';', j + 1);
        if (k == -1)
          localStringBuilder.append(c);
      }
    }
    while (true)
    {
      j++;
      break;
      String str = paramString.substring(j + 1, k);
      int m = str.length();
      int n = -1;
      if (m > 0)
      {
        if ((str.charAt(0) != '#') || (m <= 1))
          break label234;
        int i1 = str.charAt(1);
        if (((i1 == 120) || (i1 == 88)) && (m <= 2));
      }
      try
      {
        int i2 = Integer.valueOf(str.substring(2), 16).intValue();
        n = i2;
        while (true)
        {
          label171: if (n != -1)
            break label245;
          localStringBuilder.append('&');
          if (str.indexOf('&') != -1)
            break;
          localStringBuilder.append(str);
          localStringBuilder.append(';');
          j = k;
          break;
          int i3 = Integer.parseInt(str.substring(1));
          n = i3;
          continue;
          label234: n = entityValue(str);
        }
        label245: localStringBuilder.append((char)n);
        localArrayList.add(new int[] { j, k });
        j = k;
        continue;
        localStringBuilder.append(c);
        continue;
        return new Unescaped(localStringBuilder.toString(), localArrayList);
      }
      catch (Exception localException)
      {
        break label171;
      }
    }
  }

  static class ArrayEntityMap
    implements HtmlEntities.EntityMap
  {
    protected int growBy = 100;
    protected String[] names;
    protected int size = 0;
    protected int[] values;

    public ArrayEntityMap()
    {
      this.names = new String[this.growBy];
      this.values = new int[this.growBy];
    }

    public ArrayEntityMap(int paramInt)
    {
      this.growBy = paramInt;
      this.names = new String[paramInt];
      this.values = new int[paramInt];
    }

    public void add(String paramString, int paramInt)
    {
      ensureCapacity(1 + this.size);
      this.names[this.size] = paramString;
      this.values[this.size] = paramInt;
      this.size = (1 + this.size);
    }

    protected void ensureCapacity(int paramInt)
    {
      if (paramInt > this.names.length)
      {
        int i = Math.max(paramInt, this.size + this.growBy);
        String[] arrayOfString = new String[i];
        System.arraycopy(this.names, 0, arrayOfString, 0, this.size);
        this.names = arrayOfString;
        int[] arrayOfInt = new int[i];
        System.arraycopy(this.values, 0, arrayOfInt, 0, this.size);
        this.values = arrayOfInt;
      }
    }

    public String name(int paramInt)
    {
      for (int i = 0; i < this.size; i++)
        if (this.values[i] == paramInt)
          return this.names[i];
      return null;
    }

    public int value(String paramString)
    {
      for (int i = 0; i < this.size; i++)
        if (this.names[i].equals(paramString))
          return this.values[i];
      return -1;
    }
  }

  static class BinaryEntityMap extends HtmlEntities.ArrayEntityMap
  {
    public BinaryEntityMap()
    {
    }

    public BinaryEntityMap(int paramInt)
    {
      super();
    }

    private int binarySearch(int paramInt)
    {
      int i = 0;
      int j = -1 + this.size;
      while (i <= j)
      {
        k = i + j >>> 1;
        int m = this.values[k];
        if (m < paramInt)
        {
          i = k + 1;
        }
        else
        {
          if (m <= paramInt)
            break label64;
          j = k - 1;
        }
      }
      int k = -(i + 1);
      label64: return k;
    }

    public void add(String paramString, int paramInt)
    {
      ensureCapacity(1 + this.size);
      int i = binarySearch(paramInt);
      if (i > 0)
        return;
      int j = -(i + 1);
      System.arraycopy(this.values, j, this.values, j + 1, this.size - j);
      this.values[j] = paramInt;
      System.arraycopy(this.names, j, this.names, j + 1, this.size - j);
      this.names[j] = paramString;
      this.size = (1 + this.size);
    }

    public String name(int paramInt)
    {
      int i = binarySearch(paramInt);
      if (i < 0)
        return null;
      return this.names[i];
    }
  }

  static abstract interface EntityMap
  {
    public abstract void add(String paramString, int paramInt);

    public abstract String name(int paramInt);

    public abstract int value(String paramString);
  }

  static class HashEntityMap extends HtmlEntities.MapIntMap
  {
    public HashEntityMap()
    {
      this.mapNameToValue = new HashMap();
      this.mapValueToName = new HashMap();
    }
  }

  static class LookupEntityMap extends HtmlEntities.PrimitiveEntityMap
  {
    private static final int LOOKUP_TABLE_SIZE = 256;
    private String[] lookupTable;

    private void createLookupTable()
    {
      this.lookupTable = new String[256];
      for (int i = 0; i < 256; i++)
        this.lookupTable[i] = super.name(i);
    }

    private String[] lookupTable()
    {
      if (this.lookupTable == null)
        createLookupTable();
      return this.lookupTable;
    }

    public String name(int paramInt)
    {
      if (paramInt < 256)
        return lookupTable()[paramInt];
      return super.name(paramInt);
    }
  }

  static abstract class MapIntMap
    implements HtmlEntities.EntityMap
  {
    protected Map mapNameToValue;
    protected Map mapValueToName;

    public void add(String paramString, int paramInt)
    {
      this.mapNameToValue.put(paramString, Integer.valueOf(paramInt));
      this.mapValueToName.put(Integer.valueOf(paramInt), paramString);
    }

    public String name(int paramInt)
    {
      return (String)this.mapValueToName.get(Integer.valueOf(paramInt));
    }

    public int value(String paramString)
    {
      Object localObject = this.mapNameToValue.get(paramString);
      if (localObject == null)
        return -1;
      return ((Integer)localObject).intValue();
    }
  }

  static class PrimitiveEntityMap
    implements HtmlEntities.EntityMap
  {
    private final Map mapNameToValue = new HashMap();
    private final IntHashMap mapValueToName = new IntHashMap();

    public void add(String paramString, int paramInt)
    {
      this.mapNameToValue.put(paramString, Integer.valueOf(paramInt));
      this.mapValueToName.put(paramInt, paramString);
    }

    public String name(int paramInt)
    {
      return (String)this.mapValueToName.get(paramInt);
    }

    public int value(String paramString)
    {
      Object localObject = this.mapNameToValue.get(paramString);
      if (localObject == null)
        return -1;
      return ((Integer)localObject).intValue();
    }
  }

  static class TreeEntityMap extends HtmlEntities.MapIntMap
  {
    public TreeEntityMap()
    {
      this.mapNameToValue = new TreeMap();
      this.mapValueToName = new TreeMap();
    }
  }

  public static final class Unescaped
  {
    public final ArrayList<int[]> indices;
    public final String unescaped;

    public Unescaped(String paramString, ArrayList<int[]> paramArrayList)
    {
      this.unescaped = paramString;
      this.indices = paramArrayList;
    }
  }
}