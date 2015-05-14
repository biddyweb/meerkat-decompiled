package com.google.thirdparty.publicsuffix;

import com.google.common.annotations.GwtCompatible;

@GwtCompatible
 enum PublicSuffixType
{
  private final char innerNodeCode;
  private final char leafNodeCode;

  static
  {
    ICANN = new PublicSuffixType("ICANN", 1, '!', '?');
    PublicSuffixType[] arrayOfPublicSuffixType = new PublicSuffixType[2];
    arrayOfPublicSuffixType[0] = PRIVATE;
    arrayOfPublicSuffixType[1] = ICANN;
  }

  private PublicSuffixType(char paramChar1, char paramChar2)
  {
    this.innerNodeCode = paramChar1;
    this.leafNodeCode = paramChar2;
  }

  static PublicSuffixType fromCode(char paramChar)
  {
    for (PublicSuffixType localPublicSuffixType : values())
      if ((localPublicSuffixType.getInnerNodeCode() == paramChar) || (localPublicSuffixType.getLeafNodeCode() == paramChar))
        return localPublicSuffixType;
    throw new IllegalArgumentException(38 + "No enum corresponding to given code: " + paramChar);
  }

  static PublicSuffixType fromIsPrivate(boolean paramBoolean)
  {
    if (paramBoolean)
      return PRIVATE;
    return ICANN;
  }

  char getInnerNodeCode()
  {
    return this.innerNodeCode;
  }

  char getLeafNodeCode()
  {
    return this.leafNodeCode;
  }
}