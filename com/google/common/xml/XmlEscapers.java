package com.google.common.xml;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.escape.Escaper;
import com.google.common.escape.Escapers;
import com.google.common.escape.Escapers.Builder;

@Beta
@GwtCompatible
public class XmlEscapers
{
  private static final char MAX_ASCII_CONTROL_CHAR = '\037';
  private static final char MIN_ASCII_CONTROL_CHAR;
  private static final Escaper XML_ATTRIBUTE_ESCAPER = localBuilder.build();
  private static final Escaper XML_CONTENT_ESCAPER;
  private static final Escaper XML_ESCAPER;

  static
  {
    Escapers.Builder localBuilder = Escapers.builder();
    localBuilder.setSafeRange('\000', 65533);
    localBuilder.setUnsafeReplacement("\uFFFD");
    for (char c = '\000'; c <= '\037'; c = (char)(c + '\001'))
      if ((c != '\t') && (c != '\n') && (c != '\r'))
        localBuilder.addEscape(c, "\uFFFD");
    localBuilder.addEscape('&', "&amp;");
    localBuilder.addEscape('<', "&lt;");
    localBuilder.addEscape('>', "&gt;");
    XML_CONTENT_ESCAPER = localBuilder.build();
    localBuilder.addEscape('\'', "&apos;");
    localBuilder.addEscape('"', "&quot;");
    XML_ESCAPER = localBuilder.build();
    localBuilder.addEscape('\t', "&#x9;");
    localBuilder.addEscape('\n', "&#xA;");
    localBuilder.addEscape('\r', "&#xD;");
  }

  public static Escaper xmlAttributeEscaper()
  {
    return XML_ATTRIBUTE_ESCAPER;
  }

  public static Escaper xmlContentEscaper()
  {
    return XML_CONTENT_ESCAPER;
  }
}