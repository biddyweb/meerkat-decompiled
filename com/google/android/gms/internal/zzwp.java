package com.google.android.gms.internal;

public class zzwp
{
  private final byte[] zzaHo = new byte[256];
  private int zzaHp;
  private int zzaHq;

  public zzwp(byte[] paramArrayOfByte)
  {
    for (int i = 0; i < 256; i++)
      this.zzaHo[i] = ((byte)i);
    int j = 0;
    for (int k = 0; k < 256; k++)
    {
      j = 0xFF & j + this.zzaHo[k] + paramArrayOfByte[(k % paramArrayOfByte.length)];
      int m = this.zzaHo[k];
      this.zzaHo[k] = this.zzaHo[j];
      this.zzaHo[j] = m;
    }
    this.zzaHp = 0;
    this.zzaHq = 0;
  }

  public void zzs(byte[] paramArrayOfByte)
  {
    int i = this.zzaHp;
    int j = this.zzaHq;
    for (int k = 0; k < paramArrayOfByte.length; k++)
    {
      i = 0xFF & i + 1;
      j = 0xFF & j + this.zzaHo[i];
      int m = this.zzaHo[i];
      this.zzaHo[i] = this.zzaHo[j];
      this.zzaHo[j] = m;
      paramArrayOfByte[k] = ((byte)(paramArrayOfByte[k] ^ this.zzaHo[(0xFF & this.zzaHo[i] + this.zzaHo[j])]));
    }
    this.zzaHp = i;
    this.zzaHq = j;
  }
}