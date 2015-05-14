.class public Lco/getair/meerkat/dtos/Session;
.super Ljava/lang/Object;
.source "Session.java"


# instance fields
.field private appVersionCode:I

.field private authToken:Ljava/lang/String;

.field private expirationTime:J

.field private shouldAskForAddressBook:Z

.field private shouldProvidePhoneNumber:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;JZ)V
    .locals 2
    .param p1, "authToken"    # Ljava/lang/String;
    .param p2, "expirationTime"    # J
    .param p4, "shouldProvidePhoneNumber"    # Z

    .prologue
    const/4 v0, 0x0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-boolean v0, p0, Lco/getair/meerkat/dtos/Session;->shouldProvidePhoneNumber:Z

    .line 22
    iput-boolean v0, p0, Lco/getair/meerkat/dtos/Session;->shouldAskForAddressBook:Z

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lco/getair/meerkat/dtos/Session;->appVersionCode:I

    .line 27
    iput-object p1, p0, Lco/getair/meerkat/dtos/Session;->authToken:Ljava/lang/String;

    .line 28
    iput-wide p2, p0, Lco/getair/meerkat/dtos/Session;->expirationTime:J

    .line 29
    iput-boolean p4, p0, Lco/getair/meerkat/dtos/Session;->shouldProvidePhoneNumber:Z

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JZZI)V
    .locals 2
    .param p1, "authToken"    # Ljava/lang/String;
    .param p2, "expirationTime"    # J
    .param p4, "shouldProvidePhoneNumber"    # Z
    .param p5, "shouldAskForAddressBook"    # Z
    .param p6, "appVersionCode"    # I

    .prologue
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-boolean v0, p0, Lco/getair/meerkat/dtos/Session;->shouldProvidePhoneNumber:Z

    .line 22
    iput-boolean v0, p0, Lco/getair/meerkat/dtos/Session;->shouldAskForAddressBook:Z

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lco/getair/meerkat/dtos/Session;->appVersionCode:I

    .line 33
    iput-object p1, p0, Lco/getair/meerkat/dtos/Session;->authToken:Ljava/lang/String;

    .line 34
    iput-wide p2, p0, Lco/getair/meerkat/dtos/Session;->expirationTime:J

    .line 35
    iput p6, p0, Lco/getair/meerkat/dtos/Session;->appVersionCode:I

    .line 36
    iput-boolean p4, p0, Lco/getair/meerkat/dtos/Session;->shouldProvidePhoneNumber:Z

    .line 37
    iput-boolean p5, p0, Lco/getair/meerkat/dtos/Session;->shouldAskForAddressBook:Z

    .line 38
    return-void
.end method

.method public static loadSession(Landroid/content/Context;)Lco/getair/meerkat/dtos/Session;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 71
    const/4 v0, 0x0

    .line 73
    .local v0, "session":Lco/getair/meerkat/dtos/Session;
    new-instance v7, Lco/getair/meerkat/utilities/ApplicationPreferences;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Lco/getair/meerkat/utilities/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    .line 74
    .local v7, "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    invoke-virtual {v7}, Lco/getair/meerkat/utilities/ApplicationPreferences;->getAuthToken()Ljava/lang/String;

    move-result-object v1

    .line 75
    .local v1, "authToken":Ljava/lang/String;
    invoke-virtual {v7}, Lco/getair/meerkat/utilities/ApplicationPreferences;->getAuthoTokenExpirationDate()J

    move-result-wide v2

    .line 76
    .local v2, "expirationTime":J
    invoke-virtual {v7}, Lco/getair/meerkat/utilities/ApplicationPreferences;->getAuthTokenAppVersionCode()I

    move-result v6

    .line 77
    .local v6, "versionCode":I
    invoke-virtual {v7}, Lco/getair/meerkat/utilities/ApplicationPreferences;->getShouldProvidePhoneNumberState()Z

    move-result v4

    .line 78
    .local v4, "shouldProvidePhoneNumber":Z
    invoke-virtual {v7}, Lco/getair/meerkat/utilities/ApplicationPreferences;->getShouldAskForAddressBookState()Z

    move-result v5

    .line 80
    .local v5, "shouldAskForAddressBook":Z
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    .line 82
    new-instance v0, Lco/getair/meerkat/dtos/Session;

    .end local v0    # "session":Lco/getair/meerkat/dtos/Session;
    invoke-direct/range {v0 .. v6}, Lco/getair/meerkat/dtos/Session;-><init>(Ljava/lang/String;JZZI)V

    .line 85
    .restart local v0    # "session":Lco/getair/meerkat/dtos/Session;
    :cond_0
    return-object v0
.end method


# virtual methods
.method public getAppVersionCode()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lco/getair/meerkat/dtos/Session;->appVersionCode:I

    return v0
.end method

.method public getAuthToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lco/getair/meerkat/dtos/Session;->authToken:Ljava/lang/String;

    return-object v0
.end method

.method public getExpirationTime()J
    .locals 2

    .prologue
    .line 46
    iget-wide v0, p0, Lco/getair/meerkat/dtos/Session;->expirationTime:J

    return-wide v0
.end method

.method public saveSession(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 90
    new-instance v0, Lco/getair/meerkat/utilities/ApplicationPreferences;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Lco/getair/meerkat/utilities/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    .line 91
    .local v0, "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    iget-object v4, p0, Lco/getair/meerkat/dtos/Session;->authToken:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lco/getair/meerkat/utilities/ApplicationPreferences;->saveAuthToken(Ljava/lang/String;)V

    .line 92
    iget-wide v4, p0, Lco/getair/meerkat/dtos/Session;->expirationTime:J

    invoke-virtual {v0, v4, v5}, Lco/getair/meerkat/utilities/ApplicationPreferences;->saveAuthTokenExpirationDate(J)V

    .line 93
    iget-boolean v4, p0, Lco/getair/meerkat/dtos/Session;->shouldProvidePhoneNumber:Z

    invoke-virtual {v0, v4}, Lco/getair/meerkat/utilities/ApplicationPreferences;->saveShouldProvidePhoneNumber(Z)V

    .line 94
    iget-boolean v4, p0, Lco/getair/meerkat/dtos/Session;->shouldAskForAddressBook:Z

    invoke-virtual {v0, v4}, Lco/getair/meerkat/utilities/ApplicationPreferences;->saveShouldAskForAddressBook(Z)V

    .line 97
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 98
    .local v2, "pInfo":Landroid/content/pm/PackageInfo;
    iget v3, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 99
    .local v3, "versionCode":I
    invoke-virtual {v0, v3}, Lco/getair/meerkat/utilities/ApplicationPreferences;->setAuthTokenAppVersionCode(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    .end local v2    # "pInfo":Landroid/content/pm/PackageInfo;
    .end local v3    # "versionCode":I
    :goto_0
    return-void

    .line 100
    :catch_0
    move-exception v1

    .line 102
    .local v1, "ex":Ljava/lang/Exception;
    const-string v4, "Error retrieving version code"

    invoke-static {v4}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    .line 103
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public setShouldAskForAddressBook(Z)V
    .locals 0
    .param p1, "shouldAskForAddressBook"    # Z

    .prologue
    .line 62
    iput-boolean p1, p0, Lco/getair/meerkat/dtos/Session;->shouldAskForAddressBook:Z

    .line 63
    return-void
.end method

.method public setShouldProvidePhoneNumber(Z)V
    .locals 0
    .param p1, "shouldProvidePhoneNumber"    # Z

    .prologue
    .line 66
    iput-boolean p1, p0, Lco/getair/meerkat/dtos/Session;->shouldProvidePhoneNumber:Z

    .line 67
    return-void
.end method

.method public shouldAskForAddressBook()Z
    .locals 1

    .prologue
    .line 58
    iget-boolean v0, p0, Lco/getair/meerkat/dtos/Session;->shouldAskForAddressBook:Z

    return v0
.end method

.method public shouldProvidePhoneNumber()Z
    .locals 1

    .prologue
    .line 54
    iget-boolean v0, p0, Lco/getair/meerkat/dtos/Session;->shouldProvidePhoneNumber:Z

    return v0
.end method
