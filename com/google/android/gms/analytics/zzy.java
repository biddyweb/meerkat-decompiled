package com.google.android.gms.analytics;

import java.util.SortedSet;
import java.util.TreeSet;

class zzy
{
  private static final zzy zzCU = new zzy();
  private SortedSet<zza> zzCR = new TreeSet();
  private StringBuilder zzCS = new StringBuilder();
  private boolean zzCT = false;

  public static zzy zzfV()
  {
    return zzCU;
  }

  public void zzF(boolean paramBoolean)
  {
    try
    {
      this.zzCT = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void zza(zza paramzza)
  {
    try
    {
      if (!this.zzCT)
      {
        this.zzCR.add(paramzza);
        this.zzCS.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".charAt(paramzza.ordinal()));
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public String zzfW()
  {
    try
    {
      StringBuilder localStringBuilder = new StringBuilder();
      int i = 6;
      int j = 0;
      while (this.zzCR.size() > 0)
      {
        zza localzza = (zza)this.zzCR.first();
        this.zzCR.remove(localzza);
        int k = localzza.ordinal();
        while (k >= i)
        {
          localStringBuilder.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".charAt(j));
          i += 6;
          j = 0;
        }
        j += (1 << localzza.ordinal() % 6);
      }
      if ((j > 0) || (localStringBuilder.length() == 0))
        localStringBuilder.append("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_".charAt(j));
      this.zzCR.clear();
      String str = localStringBuilder.toString();
      return str;
    }
    finally
    {
    }
  }

  public String zzfX()
  {
    try
    {
      if (this.zzCS.length() > 0)
        this.zzCS.insert(0, ".");
      String str = this.zzCS.toString();
      this.zzCS = new StringBuilder();
      return str;
    }
    finally
    {
    }
  }

  public static enum zza
  {
    static
    {
      zzDA = new zza("GET_EXCEPTION_PARSER", 31);
      zzDB = new zza("CONSTRUCT_TRANSACTION", 32);
      zzDC = new zza("CONSTRUCT_EXCEPTION", 33);
      zzDD = new zza("CONSTRUCT_RAW_EXCEPTION", 34);
      zzDE = new zza("CONSTRUCT_TIMING", 35);
      zzDF = new zza("CONSTRUCT_SOCIAL", 36);
      zzDG = new zza("BLANK_37", 37);
      zzDH = new zza("BLANK_38", 38);
      zzDI = new zza("GET_TRACKER", 39);
      zzDJ = new zza("GET_DEFAULT_TRACKER", 40);
      zzDK = new zza("SET_DEFAULT_TRACKER", 41);
      zzDL = new zza("SET_APP_OPT_OUT", 42);
      zzDM = new zza("GET_APP_OPT_OUT", 43);
      zzDN = new zza("DISPATCH", 44);
      zzDO = new zza("SET_DISPATCH_PERIOD", 45);
      zzDP = new zza("BLANK_46", 46);
      zzDQ = new zza("REPORT_UNCAUGHT_EXCEPTIONS", 47);
      zzDR = new zza("SET_AUTO_ACTIVITY_TRACKING", 48);
      zzDS = new zza("SET_SESSION_TIMEOUT", 49);
      zzDT = new zza("CONSTRUCT_EVENT", 50);
      zzDU = new zza("CONSTRUCT_ITEM", 51);
      zzDV = new zza("BLANK_52", 52);
      zzDW = new zza("BLANK_53", 53);
      zzDX = new zza("SET_DRY_RUN", 54);
      zzDY = new zza("GET_DRY_RUN", 55);
      zzDZ = new zza("SET_LOGGER", 56);
      zzEa = new zza("SET_FORCE_LOCAL_DISPATCH", 57);
      zzEb = new zza("GET_TRACKER_NAME", 58);
      zzEc = new zza("CLOSE_TRACKER", 59);
      zzEd = new zza("EASY_TRACKER_ACTIVITY_START", 60);
      zzEe = new zza("EASY_TRACKER_ACTIVITY_STOP", 61);
      zzEf = new zza("CONSTRUCT_APP_VIEW", 62);
      zza[] arrayOfzza = new zza[63];
      arrayOfzza[0] = zzCV;
      arrayOfzza[1] = zzCW;
      arrayOfzza[2] = zzCX;
      arrayOfzza[3] = zzCY;
      arrayOfzza[4] = zzCZ;
      arrayOfzza[5] = zzDa;
      arrayOfzza[6] = zzDb;
      arrayOfzza[7] = zzDc;
      arrayOfzza[8] = zzDd;
      arrayOfzza[9] = zzDe;
      arrayOfzza[10] = zzDf;
      arrayOfzza[11] = zzDg;
      arrayOfzza[12] = zzDh;
      arrayOfzza[13] = zzDi;
      arrayOfzza[14] = zzDj;
      arrayOfzza[15] = zzDk;
      arrayOfzza[16] = zzDl;
      arrayOfzza[17] = zzDm;
      arrayOfzza[18] = zzDn;
      arrayOfzza[19] = zzDo;
      arrayOfzza[20] = zzDp;
      arrayOfzza[21] = zzDq;
      arrayOfzza[22] = zzDr;
      arrayOfzza[23] = zzDs;
      arrayOfzza[24] = zzDt;
      arrayOfzza[25] = zzDu;
      arrayOfzza[26] = zzDv;
      arrayOfzza[27] = zzDw;
      arrayOfzza[28] = zzDx;
      arrayOfzza[29] = zzDy;
      arrayOfzza[30] = zzDz;
      arrayOfzza[31] = zzDA;
      arrayOfzza[32] = zzDB;
      arrayOfzza[33] = zzDC;
      arrayOfzza[34] = zzDD;
      arrayOfzza[35] = zzDE;
      arrayOfzza[36] = zzDF;
      arrayOfzza[37] = zzDG;
      arrayOfzza[38] = zzDH;
      arrayOfzza[39] = zzDI;
      arrayOfzza[40] = zzDJ;
      arrayOfzza[41] = zzDK;
      arrayOfzza[42] = zzDL;
      arrayOfzza[43] = zzDM;
      arrayOfzza[44] = zzDN;
      arrayOfzza[45] = zzDO;
      arrayOfzza[46] = zzDP;
      arrayOfzza[47] = zzDQ;
      arrayOfzza[48] = zzDR;
      arrayOfzza[49] = zzDS;
      arrayOfzza[50] = zzDT;
      arrayOfzza[51] = zzDU;
      arrayOfzza[52] = zzDV;
      arrayOfzza[53] = zzDW;
      arrayOfzza[54] = zzDX;
      arrayOfzza[55] = zzDY;
      arrayOfzza[56] = zzDZ;
      arrayOfzza[57] = zzEa;
      arrayOfzza[58] = zzEb;
      arrayOfzza[59] = zzEc;
      arrayOfzza[60] = zzEd;
      arrayOfzza[61] = zzEe;
      arrayOfzza[62] = zzEf;
    }
  }
}