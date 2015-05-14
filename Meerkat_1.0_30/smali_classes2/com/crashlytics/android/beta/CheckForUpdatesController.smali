.class Lcom/crashlytics/android/beta/CheckForUpdatesController;
.super Ljava/lang/Object;
.source "CheckForUpdatesController.java"


# static fields
.field static final LAST_UPDATE_CHECK_DEFAULT:J = 0x0L

.field static final LAST_UPDATE_CHECK_KEY:Ljava/lang/String; = "last_update_check"


# instance fields
.field private final beta:Lcom/crashlytics/android/beta/Beta;

.field private final betaSettings:Lio/fabric/sdk/android/services/settings/BetaSettingsData;

.field private final buildProps:Lcom/crashlytics/android/beta/BuildProperties;

.field private final context:Landroid/content/Context;

.field private final currentTimeProvider:Lio/fabric/sdk/android/services/common/CurrentTimeProvider;

.field private final httpRequestFactory:Lio/fabric/sdk/android/services/network/HttpRequestFactory;

.field private final idManager:Lio/fabric/sdk/android/services/common/IdManager;

.field private final preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/crashlytics/android/beta/Beta;Lio/fabric/sdk/android/services/common/IdManager;Lio/fabric/sdk/android/services/settings/BetaSettingsData;Lcom/crashlytics/android/beta/BuildProperties;Lio/fabric/sdk/android/services/persistence/PreferenceStore;Lio/fabric/sdk/android/services/common/CurrentTimeProvider;Lio/fabric/sdk/android/services/network/HttpRequestFactory;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "beta"    # Lcom/crashlytics/android/beta/Beta;
    .param p3, "idManager"    # Lio/fabric/sdk/android/services/common/IdManager;
    .param p4, "betaSettings"    # Lio/fabric/sdk/android/services/settings/BetaSettingsData;
    .param p5, "buildProps"    # Lcom/crashlytics/android/beta/BuildProperties;
    .param p6, "prefsStore"    # Lio/fabric/sdk/android/services/persistence/PreferenceStore;
    .param p7, "currentTimeProvider"    # Lio/fabric/sdk/android/services/common/CurrentTimeProvider;
    .param p8, "httpRequestFactory"    # Lio/fabric/sdk/android/services/network/HttpRequestFactory;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->context:Landroid/content/Context;

    .line 38
    iput-object p2, p0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->beta:Lcom/crashlytics/android/beta/Beta;

    .line 39
    iput-object p3, p0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    .line 40
    iput-object p4, p0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->betaSettings:Lio/fabric/sdk/android/services/settings/BetaSettingsData;

    .line 41
    iput-object p5, p0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->buildProps:Lcom/crashlytics/android/beta/BuildProperties;

    .line 42
    iput-object p6, p0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    .line 43
    iput-object p7, p0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->currentTimeProvider:Lio/fabric/sdk/android/services/common/CurrentTimeProvider;

    .line 44
    iput-object p8, p0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->httpRequestFactory:Lio/fabric/sdk/android/services/network/HttpRequestFactory;

    .line 45
    return-void
.end method


# virtual methods
.method public checkForUpdates()V
    .locals 18

    .prologue
    .line 51
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->currentTimeProvider:Lio/fabric/sdk/android/services/common/CurrentTimeProvider;

    invoke-interface {v3}, Lio/fabric/sdk/android/services/common/CurrentTimeProvider;->getCurrentTimeMillis()J

    move-result-wide v10

    .line 52
    .local v10, "currentTimeMillis":J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->betaSettings:Lio/fabric/sdk/android/services/settings/BetaSettingsData;

    iget v3, v3, Lio/fabric/sdk/android/services/settings/BetaSettingsData;->updateSuspendDurationSeconds:I

    mul-int/lit16 v3, v3, 0x3e8

    int-to-long v0, v3

    move-wide/from16 v16, v0

    .line 54
    .local v16, "updateCheckDelayMillis":J
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v4, "Beta"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Check for updates delay: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v16

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    invoke-interface {v3}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->get()Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "last_update_check"

    const-wide/16 v6, 0x0

    invoke-interface {v3, v4, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v12

    .line 59
    .local v12, "lastCheckTimeMillis":J
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v4, "Beta"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Check for updates last check time: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    add-long v14, v12, v16

    .line 63
    .local v14, "nextCheckTimeMillis":J
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v4, "Beta"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Check for updates current time: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", next check time: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    cmp-long v3, v10, v14

    if-ltz v3, :cond_0

    .line 68
    :try_start_0
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v4, "Beta"

    const-string v5, "Performing update check"

    invoke-interface {v3, v4, v5}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    new-instance v3, Lio/fabric/sdk/android/services/common/ApiKey;

    invoke-direct {v3}, Lio/fabric/sdk/android/services/common/ApiKey;-><init>()V

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->context:Landroid/content/Context;

    invoke-virtual {v3, v4}, Lio/fabric/sdk/android/services/common/ApiKey;->getValue(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    .line 71
    .local v8, "apiKey":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->idManager:Lio/fabric/sdk/android/services/common/IdManager;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->buildProps:Lcom/crashlytics/android/beta/BuildProperties;

    iget-object v4, v4, Lcom/crashlytics/android/beta/BuildProperties;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v8, v4}, Lio/fabric/sdk/android/services/common/IdManager;->createIdHeaderValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 74
    .local v9, "idHeaderValue":Ljava/lang/String;
    new-instance v2, Lcom/crashlytics/android/beta/CheckForUpdatesRequest;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->beta:Lcom/crashlytics/android/beta/Beta;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->beta:Lcom/crashlytics/android/beta/Beta;

    invoke-virtual {v4}, Lcom/crashlytics/android/beta/Beta;->getOverridenSpiEndpoint()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->betaSettings:Lio/fabric/sdk/android/services/settings/BetaSettingsData;

    iget-object v5, v5, Lio/fabric/sdk/android/services/settings/BetaSettingsData;->updateUrl:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->httpRequestFactory:Lio/fabric/sdk/android/services/network/HttpRequestFactory;

    new-instance v7, Lcom/crashlytics/android/beta/CheckForUpdatesResponseTransform;

    invoke-direct {v7}, Lcom/crashlytics/android/beta/CheckForUpdatesResponseTransform;-><init>()V

    invoke-direct/range {v2 .. v7}, Lcom/crashlytics/android/beta/CheckForUpdatesRequest;-><init>(Lio/fabric/sdk/android/Kit;Ljava/lang/String;Ljava/lang/String;Lio/fabric/sdk/android/services/network/HttpRequestFactory;Lcom/crashlytics/android/beta/CheckForUpdatesResponseTransform;)V

    .line 85
    .local v2, "request":Lcom/crashlytics/android/beta/CheckForUpdatesRequest;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->buildProps:Lcom/crashlytics/android/beta/BuildProperties;

    invoke-virtual {v2, v8, v9, v3}, Lcom/crashlytics/android/beta/CheckForUpdatesRequest;->invoke(Ljava/lang/String;Ljava/lang/String;Lcom/crashlytics/android/beta/BuildProperties;)Lcom/crashlytics/android/beta/CheckForUpdatesResponse;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    invoke-interface {v3}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "last_update_check"

    invoke-interface {v3, v4, v10, v11}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 94
    .end local v2    # "request":Lcom/crashlytics/android/beta/CheckForUpdatesRequest;
    .end local v8    # "apiKey":Ljava/lang/String;
    .end local v9    # "idHeaderValue":Ljava/lang/String;
    :goto_0
    return-void

    .line 87
    :catchall_0
    move-exception v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/crashlytics/android/beta/CheckForUpdatesController;->preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    invoke-interface {v4}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string v5, "last_update_check"

    invoke-interface {v4, v5, v10, v11}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    throw v3

    .line 92
    :cond_0
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v4, "Beta"

    const-string v5, "Check for updates next check time was not passed"

    invoke-interface {v3, v4, v5}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
