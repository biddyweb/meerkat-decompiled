package com.mixpanel.android.util;

import android.graphics.Bitmap;
import java.lang.reflect.Array;

public class StackBlurManager
{
  public static void process(Bitmap paramBitmap, int paramInt)
  {
    if (paramInt < 1)
      return;
    int i = paramBitmap.getWidth();
    int j = paramBitmap.getHeight();
    int[] arrayOfInt1 = new int[i * j];
    paramBitmap.getPixels(arrayOfInt1, 0, i, 0, 0, i, j);
    int k = i - 1;
    int m = j - 1;
    int n = i * j;
    int i1 = 1 + (paramInt + paramInt);
    int[] arrayOfInt2 = new int[n];
    int[] arrayOfInt3 = new int[n];
    int[] arrayOfInt4 = new int[n];
    int[] arrayOfInt5 = new int[Math.max(i, j)];
    int i2 = i1 + 1 >> 1;
    int i3 = i2 * i2;
    int[] arrayOfInt6 = new int[i3 * 256];
    for (int i4 = 0; ; i4++)
    {
      int i5 = i3 * 256;
      if (i4 >= i5)
        break;
      arrayOfInt6[i4] = (i4 / i3);
    }
    int i6 = 0;
    int i7 = 0;
    int[] arrayOfInt7 = { i1, 3 };
    int[][] arrayOfInt = (int[][])Array.newInstance(Integer.TYPE, arrayOfInt7);
    int i8 = paramInt + 1;
    for (int i9 = 0; i9 < j; i9++)
    {
      int i37 = 0;
      int i38 = 0;
      int i39 = 0;
      int i40 = 0;
      int i41 = 0;
      int i42 = 0;
      int i43 = 0;
      int i44 = 0;
      int i45 = 0;
      int i46 = -paramInt;
      if (i46 <= paramInt)
      {
        int i59 = arrayOfInt1[(i7 + Math.min(k, Math.max(i46, 0)))];
        int[] arrayOfInt13 = arrayOfInt[(i46 + paramInt)];
        arrayOfInt13[0] = ((0xFF0000 & i59) >> 16);
        arrayOfInt13[1] = ((0xFF00 & i59) >> 8);
        arrayOfInt13[2] = (i59 & 0xFF);
        int i60 = i8 - Math.abs(i46);
        i39 += i60 * arrayOfInt13[0];
        i38 += i60 * arrayOfInt13[1];
        i37 += i60 * arrayOfInt13[2];
        if (i46 > 0)
        {
          i45 += arrayOfInt13[0];
          i44 += arrayOfInt13[1];
          i43 += arrayOfInt13[2];
        }
        while (true)
        {
          i46++;
          break;
          i42 += arrayOfInt13[0];
          i41 += arrayOfInt13[1];
          i40 += arrayOfInt13[2];
        }
      }
      int i47 = paramInt;
      for (int i48 = 0; i48 < i; i48++)
      {
        arrayOfInt2[i7] = arrayOfInt6[i39];
        arrayOfInt3[i7] = arrayOfInt6[i38];
        arrayOfInt4[i7] = arrayOfInt6[i37];
        int i49 = i39 - i42;
        int i50 = i38 - i41;
        int i51 = i37 - i40;
        int[] arrayOfInt11 = arrayOfInt[((i1 + (i47 - paramInt)) % i1)];
        int i52 = i42 - arrayOfInt11[0];
        int i53 = i41 - arrayOfInt11[1];
        int i54 = i40 - arrayOfInt11[2];
        if (i9 == 0)
          arrayOfInt5[i48] = Math.min(1 + (i48 + paramInt), k);
        int i55 = arrayOfInt1[(i6 + arrayOfInt5[i48])];
        arrayOfInt11[0] = ((0xFF0000 & i55) >> 16);
        arrayOfInt11[1] = ((0xFF00 & i55) >> 8);
        arrayOfInt11[2] = (i55 & 0xFF);
        int i56 = i45 + arrayOfInt11[0];
        int i57 = i44 + arrayOfInt11[1];
        int i58 = i43 + arrayOfInt11[2];
        i39 = i49 + i56;
        i38 = i50 + i57;
        i37 = i51 + i58;
        i47 = (i47 + 1) % i1;
        int[] arrayOfInt12 = arrayOfInt[(i47 % i1)];
        i42 = i52 + arrayOfInt12[0];
        i41 = i53 + arrayOfInt12[1];
        i40 = i54 + arrayOfInt12[2];
        i45 = i56 - arrayOfInt12[0];
        i44 = i57 - arrayOfInt12[1];
        i43 = i58 - arrayOfInt12[2];
        i7++;
      }
      i6 += i;
    }
    for (int i10 = 0; i10 < i; i10++)
    {
      int i11 = 0;
      int i12 = 0;
      int i13 = 0;
      int i14 = 0;
      int i15 = 0;
      int i16 = 0;
      int i17 = 0;
      int i18 = 0;
      int i19 = 0;
      int i20 = i * -paramInt;
      int i21 = -paramInt;
      if (i21 <= paramInt)
      {
        int i35 = i10 + Math.max(0, i20);
        int[] arrayOfInt10 = arrayOfInt[(i21 + paramInt)];
        arrayOfInt10[0] = arrayOfInt2[i35];
        arrayOfInt10[1] = arrayOfInt3[i35];
        arrayOfInt10[2] = arrayOfInt4[i35];
        int i36 = i8 - Math.abs(i21);
        i13 += i36 * arrayOfInt2[i35];
        i12 += i36 * arrayOfInt3[i35];
        i11 += i36 * arrayOfInt4[i35];
        if (i21 > 0)
        {
          i19 += arrayOfInt10[0];
          i18 += arrayOfInt10[1];
          i17 += arrayOfInt10[2];
        }
        while (true)
        {
          if (i21 < m)
            i20 += i;
          i21++;
          break;
          i16 += arrayOfInt10[0];
          i15 += arrayOfInt10[1];
          i14 += arrayOfInt10[2];
        }
      }
      int i22 = i10;
      int i23 = paramInt;
      for (int i24 = 0; i24 < j; i24++)
      {
        arrayOfInt1[i22] = (0xFF000000 | arrayOfInt6[i13] << 16 | arrayOfInt6[i12] << 8 | arrayOfInt6[i11]);
        int i25 = i13 - i16;
        int i26 = i12 - i15;
        int i27 = i11 - i14;
        int[] arrayOfInt8 = arrayOfInt[((i1 + (i23 - paramInt)) % i1)];
        int i28 = i16 - arrayOfInt8[0];
        int i29 = i15 - arrayOfInt8[1];
        int i30 = i14 - arrayOfInt8[2];
        if (i10 == 0)
          arrayOfInt5[i24] = (i * Math.min(i24 + i8, m));
        int i31 = i10 + arrayOfInt5[i24];
        arrayOfInt8[0] = arrayOfInt2[i31];
        arrayOfInt8[1] = arrayOfInt3[i31];
        arrayOfInt8[2] = arrayOfInt4[i31];
        int i32 = i19 + arrayOfInt8[0];
        int i33 = i18 + arrayOfInt8[1];
        int i34 = i17 + arrayOfInt8[2];
        i13 = i25 + i32;
        i12 = i26 + i33;
        i11 = i27 + i34;
        i23 = (i23 + 1) % i1;
        int[] arrayOfInt9 = arrayOfInt[i23];
        i16 = i28 + arrayOfInt9[0];
        i15 = i29 + arrayOfInt9[1];
        i14 = i30 + arrayOfInt9[2];
        i19 = i32 - arrayOfInt9[0];
        i18 = i33 - arrayOfInt9[1];
        i17 = i34 - arrayOfInt9[2];
        i22 += i;
      }
    }
    paramBitmap.setPixels(arrayOfInt1, 0, i, 0, 0, i, j);
  }
}