package com.google.android.gms.internal;

public enum zzjo
{
  public static String zzIi = "Error";
  public static String zzIj = "status";
  private final String zzIk;

  static
  {
    zzHA = new zzjo("NETWORK_ERROR", 13, "NetworkError");
    zzHB = new zzjo("USER_CANCEL", 14, "UserCancel");
    zzHC = new zzjo("PERMISSION_DENIED", 15, "PermissionDenied");
    zzHD = new zzjo("DEVICE_MANAGEMENT_REQUIRED", 16, "DeviceManagementRequiredOrSyncDisabled");
    zzHE = new zzjo("THIRD_PARTY_DEVICE_MANAGEMENT_REQUIRED", 17, "ThirdPartyDeviceManagementRequired");
    zzHF = new zzjo("DM_INTERNAL_ERROR", 18, "DeviceManagementInternalError");
    zzHG = new zzjo("DM_SYNC_DISABLED", 19, "DeviceManagementSyncDisabled");
    zzHH = new zzjo("DM_ADMIN_BLOCKED", 20, "DeviceManagementAdminBlocked");
    zzHI = new zzjo("DM_ADMIN_PENDING_APPROVAL", 21, "DeviceManagementAdminPendingApproval");
    zzHJ = new zzjo("DM_STALE_SYNC_REQUIRED", 22, "DeviceManagementStaleSyncRequired");
    zzHK = new zzjo("DM_DEACTIVATED", 23, "DeviceManagementDeactivated");
    zzHL = new zzjo("DM_REQUIRED", 24, "DeviceManagementRequired");
    zzHM = new zzjo("CLIENT_LOGIN_DISABLED", 25, "ClientLoginDisabled");
    zzHN = new zzjo("NEED_PERMISSION", 26, "NeedPermission");
    zzHO = new zzjo("BAD_PASSWORD", 27, "WeakPassword");
    zzHP = new zzjo("ALREADY_HAS_GMAIL", 28, "ALREADY_HAS_GMAIL");
    zzHQ = new zzjo("BAD_REQUEST", 29, "BadRequest");
    zzHR = new zzjo("BAD_USERNAME", 30, "BadUsername");
    zzHS = new zzjo("LOGIN_FAIL", 31, "LoginFail");
    zzHT = new zzjo("NOT_LOGGED_IN", 32, "NotLoggedIn");
    zzHU = new zzjo("NO_GMAIL", 33, "NoGmail");
    zzHV = new zzjo("REQUEST_DENIED", 34, "RequestDenied");
    zzHW = new zzjo("SERVER_ERROR", 35, "ServerError");
    zzHX = new zzjo("USERNAME_UNAVAILABLE", 36, "UsernameUnavailable");
    zzHY = new zzjo("DELETED_GMAIL", 37, "DeletedGmail");
    zzHZ = new zzjo("SOCKET_TIMEOUT", 38, "SocketTimeout");
    zzIa = new zzjo("EXISTING_USERNAME", 39, "ExistingUsername");
    zzIb = new zzjo("NEEDS_BROWSER", 40, "NeedsBrowser");
    zzIc = new zzjo("GPLUS_OTHER", 41, "GPlusOther");
    zzId = new zzjo("GPLUS_NICKNAME", 42, "GPlusNickname");
    zzIe = new zzjo("GPLUS_INVALID_CHAR", 43, "GPlusInvalidChar");
    zzIf = new zzjo("GPLUS_INTERSTITIAL", 44, "GPlusInterstitial");
    zzIg = new zzjo("GPLUS_PROFILE_ERROR", 45, "ProfileUpgradeError");
    zzIh = new zzjo("INVALID_SCOPE", 46, "INVALID_SCOPE");
    zzjo[] arrayOfzzjo = new zzjo[47];
    arrayOfzzjo[0] = zzHn;
    arrayOfzzjo[1] = zzHo;
    arrayOfzzjo[2] = zzHp;
    arrayOfzzjo[3] = zzHq;
    arrayOfzzjo[4] = zzHr;
    arrayOfzzjo[5] = zzHs;
    arrayOfzzjo[6] = zzHt;
    arrayOfzzjo[7] = zzHu;
    arrayOfzzjo[8] = zzHv;
    arrayOfzzjo[9] = zzHw;
    arrayOfzzjo[10] = zzHx;
    arrayOfzzjo[11] = zzHy;
    arrayOfzzjo[12] = zzHz;
    arrayOfzzjo[13] = zzHA;
    arrayOfzzjo[14] = zzHB;
    arrayOfzzjo[15] = zzHC;
    arrayOfzzjo[16] = zzHD;
    arrayOfzzjo[17] = zzHE;
    arrayOfzzjo[18] = zzHF;
    arrayOfzzjo[19] = zzHG;
    arrayOfzzjo[20] = zzHH;
    arrayOfzzjo[21] = zzHI;
    arrayOfzzjo[22] = zzHJ;
    arrayOfzzjo[23] = zzHK;
    arrayOfzzjo[24] = zzHL;
    arrayOfzzjo[25] = zzHM;
    arrayOfzzjo[26] = zzHN;
    arrayOfzzjo[27] = zzHO;
    arrayOfzzjo[28] = zzHP;
    arrayOfzzjo[29] = zzHQ;
    arrayOfzzjo[30] = zzHR;
    arrayOfzzjo[31] = zzHS;
    arrayOfzzjo[32] = zzHT;
    arrayOfzzjo[33] = zzHU;
    arrayOfzzjo[34] = zzHV;
    arrayOfzzjo[35] = zzHW;
    arrayOfzzjo[36] = zzHX;
    arrayOfzzjo[37] = zzHY;
    arrayOfzzjo[38] = zzHZ;
    arrayOfzzjo[39] = zzIa;
    arrayOfzzjo[40] = zzIb;
    arrayOfzzjo[41] = zzIc;
    arrayOfzzjo[42] = zzId;
    arrayOfzzjo[43] = zzIe;
    arrayOfzzjo[44] = zzIf;
    arrayOfzzjo[45] = zzIg;
    arrayOfzzjo[46] = zzIh;
    zzIl = arrayOfzzjo;
  }

  private zzjo(String paramString)
  {
    this.zzIk = paramString;
  }

  public String zzhg()
  {
    return this.zzIk;
  }
}