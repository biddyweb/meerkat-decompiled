package com.squareup.mimecraft;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

public final class Multipart
  implements Part
{
  private final String boundary;
  private final Map<String, String> headers;
  private final List<Part> parts;

  private Multipart(Type paramType, List<Part> paramList, String paramString)
  {
    Utils.isNotNull(paramType, "Multipart type must not be null.");
    this.parts = paramList;
    this.headers = Collections.singletonMap("Content-Type", "multipart/" + paramType.contentType + "; boundary=" + paramString);
    this.boundary = paramString;
  }

  private static void writeBoundary(OutputStream paramOutputStream, byte[] paramArrayOfByte, boolean paramBoolean1, boolean paramBoolean2)
    throws IOException
  {
    if (!paramBoolean1)
    {
      paramOutputStream.write(13);
      paramOutputStream.write(10);
    }
    paramOutputStream.write(45);
    paramOutputStream.write(45);
    paramOutputStream.write(paramArrayOfByte);
    if (paramBoolean2)
    {
      paramOutputStream.write(45);
      paramOutputStream.write(45);
      return;
    }
    paramOutputStream.write(13);
    paramOutputStream.write(10);
  }

  private static void writePart(OutputStream paramOutputStream, Part paramPart)
    throws IOException
  {
    Map localMap = paramPart.getHeaders();
    if (localMap != null)
    {
      Iterator localIterator = localMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        paramOutputStream.write(((String)localEntry.getKey()).getBytes("UTF-8"));
        paramOutputStream.write(58);
        paramOutputStream.write(32);
        paramOutputStream.write(((String)localEntry.getValue()).getBytes("UTF-8"));
        paramOutputStream.write(13);
        paramOutputStream.write(10);
      }
    }
    paramOutputStream.write(13);
    paramOutputStream.write(10);
    paramPart.writeBodyTo(paramOutputStream);
  }

  public Map<String, String> getHeaders()
  {
    return this.headers;
  }

  public void writeBodyTo(OutputStream paramOutputStream)
    throws IOException
  {
    byte[] arrayOfByte = this.boundary.getBytes("UTF-8");
    boolean bool = true;
    Iterator localIterator = this.parts.iterator();
    while (localIterator.hasNext())
    {
      Part localPart = (Part)localIterator.next();
      writeBoundary(paramOutputStream, arrayOfByte, bool, false);
      writePart(paramOutputStream, localPart);
      bool = false;
    }
    writeBoundary(paramOutputStream, arrayOfByte, false, true);
  }

  public static class Builder
  {
    private final String boundary;
    private final List<Part> parts = new ArrayList();
    private Multipart.Type type = Multipart.Type.MIXED;

    public Builder()
    {
      this(UUID.randomUUID().toString());
    }

    public Builder(String paramString)
    {
      this.boundary = paramString;
    }

    public Builder addPart(Part paramPart)
    {
      Utils.isNotNull(paramPart, "Part must not be null.");
      this.parts.add(paramPart);
      return this;
    }

    public Multipart build()
    {
      if (this.parts.isEmpty())
        throw new IllegalStateException("Multipart body must have at least one part.");
      return new Multipart(this.type, this.parts, this.boundary, null);
    }

    public Builder type(Multipart.Type paramType)
    {
      Utils.isNotNull(paramType, "Type must not be null.");
      this.type = paramType;
      return this;
    }
  }

  public static enum Type
  {
    final String contentType;

    static
    {
      ALTERNATIVE = new Type("ALTERNATIVE", 1, "alternative");
      DIGEST = new Type("DIGEST", 2, "digest");
      PARALLEL = new Type("PARALLEL", 3, "parallel");
      FORM = new Type("FORM", 4, "form-data");
      Type[] arrayOfType = new Type[5];
      arrayOfType[0] = MIXED;
      arrayOfType[1] = ALTERNATIVE;
      arrayOfType[2] = DIGEST;
      arrayOfType[3] = PARALLEL;
      arrayOfType[4] = FORM;
    }

    private Type(String paramString)
    {
      this.contentType = paramString;
    }
  }
}