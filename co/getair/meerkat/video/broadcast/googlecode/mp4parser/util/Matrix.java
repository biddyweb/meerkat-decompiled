package co.getair.meerkat.video.broadcast.googlecode.mp4parser.util;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import java.nio.ByteBuffer;

public class Matrix
{
  public static final Matrix ROTATE_0 = new Matrix(1.0D, 0.0D, 0.0D, 1.0D, 0.0D, 0.0D, 1.0D, 0.0D, 0.0D);
  public static final Matrix ROTATE_180 = new Matrix(-1.0D, 0.0D, 0.0D, -1.0D, 0.0D, 0.0D, 1.0D, 0.0D, 0.0D);
  public static final Matrix ROTATE_270 = new Matrix(0.0D, -1.0D, 1.0D, 0.0D, 0.0D, 0.0D, 1.0D, 0.0D, 0.0D);
  public static final Matrix ROTATE_90 = new Matrix(0.0D, 1.0D, -1.0D, 0.0D, 0.0D, 0.0D, 1.0D, 0.0D, 0.0D);
  double a;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  double u;
  double v;
  double w;

  public Matrix(double paramDouble1, double paramDouble2, double paramDouble3, double paramDouble4, double paramDouble5, double paramDouble6, double paramDouble7, double paramDouble8, double paramDouble9)
  {
    this.u = paramDouble5;
    this.v = paramDouble6;
    this.w = paramDouble7;
    this.a = paramDouble1;
    this.b = paramDouble2;
    this.c = paramDouble3;
    this.d = paramDouble4;
    this.tx = paramDouble8;
    this.ty = paramDouble9;
  }

  public static Matrix fromByteBuffer(ByteBuffer paramByteBuffer)
  {
    return fromFileOrder(IsoTypeReader.readFixedPoint1616(paramByteBuffer), IsoTypeReader.readFixedPoint1616(paramByteBuffer), IsoTypeReader.readFixedPoint0230(paramByteBuffer), IsoTypeReader.readFixedPoint1616(paramByteBuffer), IsoTypeReader.readFixedPoint1616(paramByteBuffer), IsoTypeReader.readFixedPoint0230(paramByteBuffer), IsoTypeReader.readFixedPoint1616(paramByteBuffer), IsoTypeReader.readFixedPoint1616(paramByteBuffer), IsoTypeReader.readFixedPoint0230(paramByteBuffer));
  }

  public static Matrix fromFileOrder(double paramDouble1, double paramDouble2, double paramDouble3, double paramDouble4, double paramDouble5, double paramDouble6, double paramDouble7, double paramDouble8, double paramDouble9)
  {
    return new Matrix(paramDouble1, paramDouble2, paramDouble4, paramDouble5, paramDouble3, paramDouble6, paramDouble9, paramDouble7, paramDouble8);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    Matrix localMatrix;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localMatrix = (Matrix)paramObject;
      if (Double.compare(localMatrix.a, this.a) != 0)
        return false;
      if (Double.compare(localMatrix.b, this.b) != 0)
        return false;
      if (Double.compare(localMatrix.c, this.c) != 0)
        return false;
      if (Double.compare(localMatrix.d, this.d) != 0)
        return false;
      if (Double.compare(localMatrix.tx, this.tx) != 0)
        return false;
      if (Double.compare(localMatrix.ty, this.ty) != 0)
        return false;
      if (Double.compare(localMatrix.u, this.u) != 0)
        return false;
      if (Double.compare(localMatrix.v, this.v) != 0)
        return false;
    }
    while (Double.compare(localMatrix.w, this.w) == 0);
    return false;
  }

  public void getContent(ByteBuffer paramByteBuffer)
  {
    IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.a);
    IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.b);
    IsoTypeWriter.writeFixedPoint0230(paramByteBuffer, this.u);
    IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.c);
    IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.d);
    IsoTypeWriter.writeFixedPoint0230(paramByteBuffer, this.v);
    IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.tx);
    IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.ty);
    IsoTypeWriter.writeFixedPoint0230(paramByteBuffer, this.w);
  }

  public int hashCode()
  {
    long l1 = Double.doubleToLongBits(this.u);
    int i = (int)(l1 ^ l1 >>> 32);
    long l2 = Double.doubleToLongBits(this.v);
    int j = i * 31 + (int)(l2 ^ l2 >>> 32);
    long l3 = Double.doubleToLongBits(this.w);
    int k = j * 31 + (int)(l3 ^ l3 >>> 32);
    long l4 = Double.doubleToLongBits(this.a);
    int m = k * 31 + (int)(l4 ^ l4 >>> 32);
    long l5 = Double.doubleToLongBits(this.b);
    int n = m * 31 + (int)(l5 ^ l5 >>> 32);
    long l6 = Double.doubleToLongBits(this.c);
    int i1 = n * 31 + (int)(l6 ^ l6 >>> 32);
    long l7 = Double.doubleToLongBits(this.d);
    int i2 = i1 * 31 + (int)(l7 ^ l7 >>> 32);
    long l8 = Double.doubleToLongBits(this.tx);
    int i3 = i2 * 31 + (int)(l8 ^ l8 >>> 32);
    long l9 = Double.doubleToLongBits(this.ty);
    return i3 * 31 + (int)(l9 ^ l9 >>> 32);
  }

  public String toString()
  {
    if (equals(ROTATE_0))
      return "Rotate 0\u00B0";
    if (equals(ROTATE_90))
      return "Rotate 90\u00B0";
    if (equals(ROTATE_180))
      return "Rotate 180\u00B0";
    if (equals(ROTATE_270))
      return "Rotate 270\u00B0";
    return "Matrix{u=" + this.u + ", v=" + this.v + ", w=" + this.w + ", a=" + this.a + ", b=" + this.b + ", c=" + this.c + ", d=" + this.d + ", tx=" + this.tx + ", ty=" + this.ty + '}';
  }
}