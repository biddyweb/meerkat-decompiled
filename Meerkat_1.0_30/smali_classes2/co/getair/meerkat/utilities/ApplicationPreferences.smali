.class public Lco/getair/meerkat/utilities/ApplicationPreferences;
.super Ljava/lang/Object;
.source "ApplicationPreferences.java"


# static fields
.field private static final APP_SHARED_PREFS:Ljava/lang/String;

.field private static final KEY_PREFRENCES_ADD_WATCHER_TEMPLATE:Ljava/lang/String; = "addWatcherTemplate"

.field private static final KEY_PREFRENCES_AUTHENTICATION_TOKEN:Ljava/lang/String; = "authToken"

.field private static final KEY_PREFRENCES_AUTHENTICATION_TOKEN_APP_VERSION_CODE:Ljava/lang/String; = "authTokenAppVersionCode"

.field private static final KEY_PREFRENCES_AUTHENTICATION_TOKEN_EXPIRATION_DATE:Ljava/lang/String; = "authTokenExpirationDate"

.field private static final KEY_PREFRENCES_COUNTRY_CODE:Ljava/lang/String; = "defaultCountryCode"

.field private static final KEY_PREFRENCES_IS_FIRST_RETWEET:Ljava/lang/String; = "isFirstRetweet"

.field private static final KEY_PREFRENCES_IS_FIRST_TIME_REQUESTING_LOCATION:Ljava/lang/String; = "isFirstTimeRequestingLocation"

.field private static final KEY_PREFRENCES_IS_FIRST_UPLOAD_IMAGE:Ljava/lang/String; = "isFirstUploadImage2"

.field private static final KEY_PREFRENCES_NOTIFICATIONS_TOKEN:Ljava/lang/String; = "notificationsToken"

.field private static final KEY_PREFRENCES_SHOULD_ASK_FOR_ADDRESS_BOOK:Ljava/lang/String; = "shouldAskForAddressBook"

.field private static final KEY_PREFRENCES_SHOULD_PROVIDE_PHONE_NUMBER:Ljava/lang/String; = "shouldProvidePhoneNumver"


# instance fields
.field private context:Landroid/content/Context;

.field private prefrencesEditor:Landroid/content/SharedPreferences$Editor;

.field private sharedPrefrences:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-class v0, Lco/getair/meerkat/utilities/ApplicationPreferences;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/utilities/ApplicationPreferences;->APP_SHARED_PREFS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->context:Landroid/content/Context;

    .line 38
    sget-object v0, Lco/getair/meerkat/utilities/ApplicationPreferences;->APP_SHARED_PREFS:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->sharedPrefrences:Landroid/content/SharedPreferences;

    .line 39
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->sharedPrefrences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iput-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    .line 40
    return-void
.end method


# virtual methods
.method public getAddWatcherTemplate()Ljava/lang/String;
    .locals 3

    .prologue
    .line 94
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->sharedPrefrences:Landroid/content/SharedPreferences;

    const-string v1, "addWatcherTemplate"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAuthToken()Ljava/lang/String;
    .locals 3

    .prologue
    .line 43
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->sharedPrefrences:Landroid/content/SharedPreferences;

    const-string v1, "authToken"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAuthTokenAppVersionCode()I
    .locals 3

    .prologue
    .line 65
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->sharedPrefrences:Landroid/content/SharedPreferences;

    const-string v1, "authTokenAppVersionCode"

    const/4 v2, -0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getAuthoTokenExpirationDate()J
    .locals 4

    .prologue
    .line 53
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->sharedPrefrences:Landroid/content/SharedPreferences;

    const-string v1, "authTokenExpirationDate"

    const-wide/16 v2, -0x1

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDefaultCountryCode()Ljava/lang/String;
    .locals 3

    .prologue
    .line 139
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->sharedPrefrences:Landroid/content/SharedPreferences;

    const-string v1, "defaultCountryCode"

    iget-object v2, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget-object v2, v2, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v2}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNotificationsToken()Ljava/lang/String;
    .locals 3

    .prologue
    .line 130
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->sharedPrefrences:Landroid/content/SharedPreferences;

    const-string v1, "notificationsToken"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getShouldAskForAddressBookState()Z
    .locals 3

    .prologue
    .line 89
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->sharedPrefrences:Landroid/content/SharedPreferences;

    const-string v1, "shouldAskForAddressBook"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getShouldProvidePhoneNumberState()Z
    .locals 3

    .prologue
    .line 80
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->sharedPrefrences:Landroid/content/SharedPreferences;

    const-string v1, "shouldProvidePhoneNumver"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isFirstTimeRequestingLocation()Z
    .locals 3

    .prologue
    .line 112
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->sharedPrefrences:Landroid/content/SharedPreferences;

    const-string v1, "isFirstTimeRequestingLocation"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isFirstTimeRetweetStream()Z
    .locals 3

    .prologue
    .line 103
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->sharedPrefrences:Landroid/content/SharedPreferences;

    const-string v1, "isFirstRetweet"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isFirstTimeUploadingProfileImage()Z
    .locals 3

    .prologue
    .line 121
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->sharedPrefrences:Landroid/content/SharedPreferences;

    const-string v1, "isFirstUploadImage2"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public saveAddWatchersTemplate(Ljava/lang/String;)V
    .locals 2
    .param p1, "addWatchersTemplate"    # Ljava/lang/String;

    .prologue
    .line 98
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "addWatcherTemplate"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 99
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 100
    return-void
.end method

.method public saveAuthToken(Ljava/lang/String;)V
    .locals 2
    .param p1, "authToken"    # Ljava/lang/String;

    .prologue
    .line 47
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "authToken"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 48
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 49
    return-void
.end method

.method public saveAuthTokenExpirationDate(J)V
    .locals 3
    .param p1, "authTokenExpirationDate"    # J

    .prologue
    .line 70
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "authTokenExpirationDate"

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 71
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 72
    return-void
.end method

.method public saveDefaultCountryCode(Ljava/lang/String;)V
    .locals 2
    .param p1, "countryCode"    # Ljava/lang/String;

    .prologue
    .line 143
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "defaultCountryCode"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 144
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 145
    return-void
.end method

.method public saveIsFirstTimeRequestingLocation(Z)V
    .locals 2
    .param p1, "isFirstTimeRequestingLocation"    # Z

    .prologue
    .line 116
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "isFirstTimeRequestingLocation"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 117
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 118
    return-void
.end method

.method public saveIsFirstTimeRetweetStream(Z)V
    .locals 2
    .param p1, "isFirstTimeRetweet"    # Z

    .prologue
    .line 107
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "isFirstRetweet"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 108
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 109
    return-void
.end method

.method public saveIsFirstTimeUploadingProfileImage(Z)V
    .locals 2
    .param p1, "isFirstTimeUploadingProfileImage"    # Z

    .prologue
    .line 125
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "isFirstUploadImage2"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 126
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 127
    return-void
.end method

.method public saveNotificationsToken(Ljava/lang/String;)V
    .locals 2
    .param p1, "notificationsToken"    # Ljava/lang/String;

    .prologue
    .line 134
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "notificationsToken"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 135
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 136
    return-void
.end method

.method public saveShouldAskForAddressBook(Z)V
    .locals 2
    .param p1, "shouldAskForAddressBook"    # Z

    .prologue
    .line 84
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "shouldAskForAddressBook"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 85
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 86
    return-void
.end method

.method public saveShouldProvidePhoneNumber(Z)V
    .locals 2
    .param p1, "shouldProvidePhoneNumber"    # Z

    .prologue
    .line 75
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "shouldProvidePhoneNumver"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 76
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 77
    return-void
.end method

.method public setAuthTokenAppVersionCode(I)V
    .locals 2
    .param p1, "versionCode"    # I

    .prologue
    .line 58
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    const-string v1, "authTokenAppVersionCode"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 59
    iget-object v0, p0, Lco/getair/meerkat/utilities/ApplicationPreferences;->prefrencesEditor:Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 61
    return-void
.end method
