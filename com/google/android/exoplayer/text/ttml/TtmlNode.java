package com.google.android.exoplayer.text.ttml;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

final class TtmlNode
{
  public static final String TAG_BODY = "body";
  public static final String TAG_BR = "br";
  public static final String TAG_DIV = "div";
  public static final String TAG_HEAD = "head";
  public static final String TAG_LAYOUT = "layout";
  public static final String TAG_METADATA = "metadata";
  public static final String TAG_P = "p";
  public static final String TAG_REGION = "region";
  public static final String TAG_SMPTE_DATA = "smpte:data";
  public static final String TAG_SMPTE_IMAGE = "smpte:image";
  public static final String TAG_SMPTE_INFORMATION = "smpte:information";
  public static final String TAG_SPAN = "span";
  public static final String TAG_STYLE = "style";
  public static final String TAG_STYLING = "styling";
  public static final String TAG_TT = "tt";
  public static final long UNDEFINED_TIME = -1L;
  private List<TtmlNode> children;
  public final long endTimeUs;
  public final boolean isTextNode;
  public final long startTimeUs;
  public final String tag;
  public final String text;

  private TtmlNode(String paramString1, String paramString2, long paramLong1, long paramLong2)
  {
    this.tag = paramString1;
    this.text = paramString2;
    if (paramString2 != null);
    for (boolean bool = true; ; bool = false)
    {
      this.isTextNode = bool;
      this.startTimeUs = paramLong1;
      this.endTimeUs = paramLong2;
      return;
    }
  }

  private static String applySpacePolicy(String paramString, boolean paramBoolean)
  {
    String str = paramString.replaceAll("\r\n", "\n").replaceAll(" *\n *", "\n");
    if (paramBoolean)
      str = str.replaceAll("\n", " ");
    return str.replaceAll("[ \t\\x0B\f\r]+", " ");
  }

  public static TtmlNode buildNode(String paramString, long paramLong1, long paramLong2)
  {
    return new TtmlNode(paramString, null, paramLong1, paramLong2);
  }

  public static TtmlNode buildTextNode(String paramString)
  {
    return new TtmlNode(null, applySpacePolicy(paramString, true), -1L, -1L);
  }

  private void getEventTimes(TreeSet<Long> paramTreeSet, boolean paramBoolean)
  {
    boolean bool1 = "p".equals(this.tag);
    if ((paramBoolean) || (bool1))
    {
      if (this.startTimeUs != -1L)
        paramTreeSet.add(Long.valueOf(this.startTimeUs));
      if (this.endTimeUs != -1L)
        paramTreeSet.add(Long.valueOf(this.endTimeUs));
    }
    if (this.children == null)
      return;
    int i = 0;
    label75: TtmlNode localTtmlNode;
    if (i < this.children.size())
    {
      localTtmlNode = (TtmlNode)this.children.get(i);
      if ((!paramBoolean) && (!bool1))
        break label130;
    }
    label130: for (boolean bool2 = true; ; bool2 = false)
    {
      localTtmlNode.getEventTimes(paramTreeSet, bool2);
      i++;
      break label75;
      break;
    }
  }

  private void getText(long paramLong, StringBuilder paramStringBuilder, boolean paramBoolean)
  {
    if ((this.isTextNode) && (paramBoolean))
      paramStringBuilder.append(this.text);
    boolean bool1;
    int i;
    do
    {
      do
      {
        return;
        if (("br".equals(this.tag)) && (paramBoolean))
        {
          paramStringBuilder.append("\n");
          return;
        }
      }
      while (("metadata".equals(this.tag)) || (!isActive(paramLong)));
      bool1 = "p".equals(this.tag);
      i = paramStringBuilder.length();
      int j = 0;
      if (j < getChildCount())
      {
        TtmlNode localTtmlNode = getChild(j);
        if ((paramBoolean) || (bool1));
        for (boolean bool2 = true; ; bool2 = false)
        {
          localTtmlNode.getText(paramLong, paramStringBuilder, bool2);
          j++;
          break;
        }
      }
    }
    while ((!bool1) || (i == paramStringBuilder.length()));
    paramStringBuilder.append("\n");
  }

  public void addChild(TtmlNode paramTtmlNode)
  {
    if (this.children == null)
      this.children = new ArrayList();
    this.children.add(paramTtmlNode);
  }

  public TtmlNode getChild(int paramInt)
  {
    if (this.children == null)
      throw new IndexOutOfBoundsException();
    return (TtmlNode)this.children.get(paramInt);
  }

  public int getChildCount()
  {
    if (this.children == null)
      return 0;
    return this.children.size();
  }

  public long[] getEventTimesUs()
  {
    TreeSet localTreeSet = new TreeSet();
    getEventTimes(localTreeSet, false);
    long[] arrayOfLong = new long[localTreeSet.size()];
    Iterator localIterator = localTreeSet.iterator();
    int j;
    for (int i = 0; localIterator.hasNext(); i = j)
    {
      long l = ((Long)localIterator.next()).longValue();
      j = i + 1;
      arrayOfLong[i] = l;
    }
    return arrayOfLong;
  }

  public String getText(long paramLong)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    getText(paramLong, localStringBuilder, false);
    return applySpacePolicy(localStringBuilder.toString().replaceAll("\n$", ""), false);
  }

  public boolean isActive(long paramLong)
  {
    return ((this.startTimeUs == -1L) && (this.endTimeUs == -1L)) || ((this.startTimeUs <= paramLong) && (this.endTimeUs == -1L)) || ((this.startTimeUs == -1L) && (paramLong < this.endTimeUs)) || ((this.startTimeUs <= paramLong) && (paramLong < this.endTimeUs));
  }
}