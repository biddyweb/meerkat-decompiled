.class abstract Lcom/crashlytics/android/answers/AnswersKit;
.super Lio/fabric/sdk/android/Kit;
.source "AnswersKit.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/fabric/sdk/android/Kit",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# static fields
.field static final CRASHLYTICS_API_ENDPOINT:Ljava/lang/String; = "com.crashlytics.ApiEndpoint"

.field static final FIRST_LAUNCH_INTERVAL_IN_MS:J = 0x36ee80L

.field static final PREFKEY_ANALYTICS_LAUNCHED:Ljava/lang/String; = "analytics_launched"

.field static final SESSION_ANALYTICS_FILE_EXTENSION:Ljava/lang/String; = ".tap"

.field static final SESSION_ANALYTICS_FILE_NAME:Ljava/lang/String; = "session_analytics.tap"

.field private static final SESSION_ANALYTICS_TO_SEND_DIR:Ljava/lang/String; = "session_analytics_to_send"

.field public static final TAG:Ljava/lang/String; = "Answers"


# instance fields
.field private installedAt:J

.field private preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

.field sessionAnalyticsManager:Lcom/crashlytics/android/answers/SessionAnalyticsManager;

.field private versionCode:Ljava/lang/String;

.field private versionName:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lio/fabric/sdk/android/Kit;-><init>()V

    return-void
.end method

.method private initializeSessionAnalytics(Landroid/content/Context;)V
    .locals 28
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CommitPrefEdits"
        }
    .end annotation

    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 128
    :try_start_0
    new-instance v25, Lcom/crashlytics/android/answers/SessionEventTransform;

    invoke-direct/range {v25 .. v25}, Lcom/crashlytics/android/answers/SessionEventTransform;-><init>()V

    .line 129
    .local v25, "transform":Lcom/crashlytics/android/answers/SessionEventTransform;
    new-instance v24, Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;

    invoke-direct/range {v24 .. v24}, Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;-><init>()V

    .line 130
    .local v24, "timeProvider":Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;
    new-instance v23, Lio/fabric/sdk/android/services/events/GZIPQueueFileEventStorage;

    invoke-virtual/range {p0 .. p0}, Lcom/crashlytics/android/answers/AnswersKit;->getContext()Landroid/content/Context;

    move-result-object v16

    invoke-virtual/range {p0 .. p0}, Lcom/crashlytics/android/answers/AnswersKit;->getSdkDirectory()Ljava/io/File;

    move-result-object v17

    const-string v26, "session_analytics.tap"

    const-string v27, "session_analytics_to_send"

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    move-object/from16 v3, v26

    move-object/from16 v4, v27

    invoke-direct {v0, v1, v2, v3, v4}, Lio/fabric/sdk/android/services/events/GZIPQueueFileEventStorage;-><init>(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .local v23, "storage":Lio/fabric/sdk/android/services/events/EventsStorage;
    new-instance v18, Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    move-object/from16 v2, v25

    move-object/from16 v3, v24

    move-object/from16 v4, v23

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;-><init>(Landroid/content/Context;Lcom/crashlytics/android/answers/SessionEventTransform;Lio/fabric/sdk/android/services/common/CurrentTimeProvider;Lio/fabric/sdk/android/services/events/EventsStorage;)V

    .line 136
    .local v18, "analyticsFilesManager":Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;
    invoke-virtual/range {p0 .. p0}, Lcom/crashlytics/android/answers/AnswersKit;->getIdManager()Lio/fabric/sdk/android/services/common/IdManager;

    move-result-object v22

    .line 138
    .local v22, "idManager":Lio/fabric/sdk/android/services/common/IdManager;
    invoke-virtual/range {v22 .. v22}, Lio/fabric/sdk/android/services/common/IdManager;->getDeviceIdentifiers()Ljava/util/Map;

    move-result-object v20

    .line 141
    .local v20, "deviceIdentifiers":Ljava/util/Map;, "Ljava/util/Map<Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;>;"
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    .line 142
    .local v7, "appBundleId":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Lio/fabric/sdk/android/services/common/IdManager;->getAppInstallIdentifier()Ljava/lang/String;

    move-result-object v9

    .line 143
    .local v9, "installationId":Ljava/lang/String;
    sget-object v16, Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;->ANDROID_ID:Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 145
    .local v10, "androidId":Ljava/lang/String;
    sget-object v16, Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;->ANDROID_ADVERTISING_ID:Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 147
    .local v11, "advertisingId":Ljava/lang/String;
    sget-object v16, Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;->FONT_TOKEN:Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 149
    .local v12, "betaDeviceToken":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lio/fabric/sdk/android/services/common/CommonUtils;->resolveBuildId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    .line 150
    .local v13, "buildId":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Lio/fabric/sdk/android/services/common/IdManager;->getOsVersionString()Ljava/lang/String;

    move-result-object v14

    .line 151
    .local v14, "osVersion":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Lio/fabric/sdk/android/services/common/IdManager;->getModelName()Ljava/lang/String;

    move-result-object v15

    .line 152
    .local v15, "deviceModel":Ljava/lang/String;
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v8

    .line 154
    .local v8, "executionId":Ljava/lang/String;
    new-instance v6, Lcom/crashlytics/android/answers/SessionEventMetadata;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/crashlytics/android/answers/AnswersKit;->versionCode:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/crashlytics/android/answers/AnswersKit;->versionName:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-direct/range {v6 .. v17}, Lcom/crashlytics/android/answers/SessionEventMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    .local v6, "sessionEventMetadata":Lcom/crashlytics/android/answers/SessionEventMetadata;
    invoke-virtual/range {p0 .. p0}, Lcom/crashlytics/android/answers/AnswersKit;->getContext()Landroid/content/Context;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v19

    check-cast v19, Landroid/app/Application;

    .line 162
    .local v19, "application":Landroid/app/Application;
    if-eqz v19, :cond_1

    sget v16, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v17, 0xe

    move/from16 v0, v16

    move/from16 v1, v17

    if-lt v0, v1, :cond_1

    .line 164
    new-instance v16, Lio/fabric/sdk/android/services/network/DefaultHttpRequestFactory;

    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Lio/fabric/sdk/android/services/network/DefaultHttpRequestFactory;-><init>(Lio/fabric/sdk/android/Logger;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    move-object/from16 v2, v16

    invoke-static {v0, v6, v1, v2}, Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager;->build(Landroid/app/Application;Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;Lio/fabric/sdk/android/services/network/HttpRequestFactory;)Lcom/crashlytics/android/answers/AutoSessionAnalyticsManager;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/crashlytics/android/answers/AnswersKit;->sessionAnalyticsManager:Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    .line 173
    :goto_0
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/crashlytics/android/answers/AnswersKit;->installedAt:J

    move-wide/from16 v16, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Lcom/crashlytics/android/answers/AnswersKit;->isFirstLaunch(J)Z

    move-result v16

    if-eqz v16, :cond_0

    .line 174
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v16

    const-string v17, "Answers"

    const-string v26, "First launch"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    move-object/from16 v2, v26

    invoke-interface {v0, v1, v2}, Lio/fabric/sdk/android/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/crashlytics/android/answers/AnswersKit;->sessionAnalyticsManager:Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->onInstall()V

    .line 176
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/crashlytics/android/answers/AnswersKit;->preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/crashlytics/android/answers/AnswersKit;->preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    const-string v26, "analytics_launched"

    const/16 v27, 0x1

    move-object/from16 v0, v17

    move-object/from16 v1, v26

    move/from16 v2, v27

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v17

    invoke-interface/range {v16 .. v17}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->save(Landroid/content/SharedPreferences$Editor;)Z

    .line 183
    .end local v6    # "sessionEventMetadata":Lcom/crashlytics/android/answers/SessionEventMetadata;
    .end local v7    # "appBundleId":Ljava/lang/String;
    .end local v8    # "executionId":Ljava/lang/String;
    .end local v9    # "installationId":Ljava/lang/String;
    .end local v10    # "androidId":Ljava/lang/String;
    .end local v11    # "advertisingId":Ljava/lang/String;
    .end local v12    # "betaDeviceToken":Ljava/lang/String;
    .end local v13    # "buildId":Ljava/lang/String;
    .end local v14    # "osVersion":Ljava/lang/String;
    .end local v15    # "deviceModel":Ljava/lang/String;
    .end local v18    # "analyticsFilesManager":Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;
    .end local v19    # "application":Landroid/app/Application;
    .end local v20    # "deviceIdentifiers":Ljava/util/Map;, "Ljava/util/Map<Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;>;"
    .end local v22    # "idManager":Lio/fabric/sdk/android/services/common/IdManager;
    .end local v23    # "storage":Lio/fabric/sdk/android/services/events/EventsStorage;
    .end local v24    # "timeProvider":Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;
    .end local v25    # "transform":Lcom/crashlytics/android/answers/SessionEventTransform;
    :cond_0
    :goto_1
    return-void

    .line 168
    .restart local v6    # "sessionEventMetadata":Lcom/crashlytics/android/answers/SessionEventMetadata;
    .restart local v7    # "appBundleId":Ljava/lang/String;
    .restart local v8    # "executionId":Ljava/lang/String;
    .restart local v9    # "installationId":Ljava/lang/String;
    .restart local v10    # "androidId":Ljava/lang/String;
    .restart local v11    # "advertisingId":Ljava/lang/String;
    .restart local v12    # "betaDeviceToken":Ljava/lang/String;
    .restart local v13    # "buildId":Ljava/lang/String;
    .restart local v14    # "osVersion":Ljava/lang/String;
    .restart local v15    # "deviceModel":Ljava/lang/String;
    .restart local v18    # "analyticsFilesManager":Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;
    .restart local v19    # "application":Landroid/app/Application;
    .restart local v20    # "deviceIdentifiers":Ljava/util/Map;, "Ljava/util/Map<Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;>;"
    .restart local v22    # "idManager":Lio/fabric/sdk/android/services/common/IdManager;
    .restart local v23    # "storage":Lio/fabric/sdk/android/services/events/EventsStorage;
    .restart local v24    # "timeProvider":Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;
    .restart local v25    # "transform":Lcom/crashlytics/android/answers/SessionEventTransform;
    :cond_1
    new-instance v16, Lio/fabric/sdk/android/services/network/DefaultHttpRequestFactory;

    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Lio/fabric/sdk/android/services/network/DefaultHttpRequestFactory;-><init>(Lio/fabric/sdk/android/Logger;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    move-object/from16 v2, v16

    invoke-static {v0, v6, v1, v2}, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->build(Landroid/content/Context;Lcom/crashlytics/android/answers/SessionEventMetadata;Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;Lio/fabric/sdk/android/services/network/HttpRequestFactory;)Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/crashlytics/android/answers/AnswersKit;->sessionAnalyticsManager:Lcom/crashlytics/android/answers/SessionAnalyticsManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 179
    .end local v6    # "sessionEventMetadata":Lcom/crashlytics/android/answers/SessionEventMetadata;
    .end local v7    # "appBundleId":Ljava/lang/String;
    .end local v8    # "executionId":Ljava/lang/String;
    .end local v9    # "installationId":Ljava/lang/String;
    .end local v10    # "androidId":Ljava/lang/String;
    .end local v11    # "advertisingId":Ljava/lang/String;
    .end local v12    # "betaDeviceToken":Ljava/lang/String;
    .end local v13    # "buildId":Ljava/lang/String;
    .end local v14    # "osVersion":Ljava/lang/String;
    .end local v15    # "deviceModel":Ljava/lang/String;
    .end local v18    # "analyticsFilesManager":Lcom/crashlytics/android/answers/SessionAnalyticsFilesManager;
    .end local v19    # "application":Landroid/app/Application;
    .end local v20    # "deviceIdentifiers":Ljava/util/Map;, "Ljava/util/Map<Lio/fabric/sdk/android/services/common/IdManager$DeviceIdentifierType;Ljava/lang/String;>;"
    .end local v22    # "idManager":Lio/fabric/sdk/android/services/common/IdManager;
    .end local v23    # "storage":Lio/fabric/sdk/android/services/events/EventsStorage;
    .end local v24    # "timeProvider":Lio/fabric/sdk/android/services/common/SystemCurrentTimeProvider;
    .end local v25    # "transform":Lcom/crashlytics/android/answers/SessionEventTransform;
    :catch_0
    move-exception v21

    .line 180
    .local v21, "e":Ljava/lang/Exception;
    const-string v16, "Crashlytics failed to initialize session analytics."

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlledError(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method


# virtual methods
.method protected doInBackground()Ljava/lang/Boolean;
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 87
    invoke-virtual {p0}, Lcom/crashlytics/android/answers/AnswersKit;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 89
    .local v0, "context":Landroid/content/Context;
    invoke-direct {p0, v0}, Lcom/crashlytics/android/answers/AnswersKit;->initializeSessionAnalytics(Landroid/content/Context;)V

    .line 92
    :try_start_0
    invoke-static {}, Lio/fabric/sdk/android/services/settings/Settings;->getInstance()Lio/fabric/sdk/android/services/settings/Settings;

    move-result-object v3

    invoke-virtual {v3}, Lio/fabric/sdk/android/services/settings/Settings;->awaitSettingsData()Lio/fabric/sdk/android/services/settings/SettingsData;

    move-result-object v2

    .line 93
    .local v2, "settingsData":Lio/fabric/sdk/android/services/settings/SettingsData;
    if-nez v2, :cond_0

    .line 94
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 111
    .end local v2    # "settingsData":Lio/fabric/sdk/android/services/settings/SettingsData;
    :goto_0
    return-object v3

    .line 97
    .restart local v2    # "settingsData":Lio/fabric/sdk/android/services/settings/SettingsData;
    :cond_0
    iget-object v3, v2, Lio/fabric/sdk/android/services/settings/SettingsData;->featuresData:Lio/fabric/sdk/android/services/settings/FeaturesSettingsData;

    iget-boolean v3, v3, Lio/fabric/sdk/android/services/settings/FeaturesSettingsData;->collectAnalytics:Z

    if-eqz v3, :cond_1

    .line 98
    iget-object v3, p0, Lcom/crashlytics/android/answers/AnswersKit;->sessionAnalyticsManager:Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    iget-object v4, v2, Lio/fabric/sdk/android/services/settings/SettingsData;->analyticsSettingsData:Lio/fabric/sdk/android/services/settings/AnalyticsSettingsData;

    invoke-virtual {p0}, Lcom/crashlytics/android/answers/AnswersKit;->getOverridenSpiEndpoint()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->setAnalyticsSettingsData(Lio/fabric/sdk/android/services/settings/AnalyticsSettingsData;Ljava/lang/String;)V

    .line 101
    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0

    .line 103
    :cond_1
    const-string v3, "Disabling analytics collection based on settings flag value."

    invoke-static {v0, v3}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlled(Landroid/content/Context;Ljava/lang/String;)V

    .line 105
    iget-object v3, p0, Lcom/crashlytics/android/answers/AnswersKit;->sessionAnalyticsManager:Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    invoke-virtual {v3}, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->disable()V

    .line 106
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 108
    .end local v2    # "settingsData":Lio/fabric/sdk/android/services/settings/SettingsData;
    :catch_0
    move-exception v1

    .line 109
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v3

    const-string v4, "Answers"

    const-string v5, "Error dealing with settings"

    invoke-interface {v3, v4, v5, v1}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 111
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/crashlytics/android/answers/AnswersKit;->doInBackground()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method getAnalyticsLaunched()Z
    .locals 3

    .prologue
    .line 216
    iget-object v0, p0, Lcom/crashlytics/android/answers/AnswersKit;->preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    invoke-interface {v0}, Lio/fabric/sdk/android/services/persistence/PreferenceStore;->get()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "analytics_launched"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    const-string v0, "com.crashlytics.sdk.android:answers"

    return-object v0
.end method

.method getOverridenSpiEndpoint()Ljava/lang/String;
    .locals 2

    .prologue
    .line 188
    invoke-virtual {p0}, Lcom/crashlytics/android/answers/AnswersKit;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "com.crashlytics.ApiEndpoint"

    invoke-static {v0, v1}, Lio/fabric/sdk/android/services/common/CommonUtils;->getStringsFileValue(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getSdkDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 244
    new-instance v0, Lio/fabric/sdk/android/services/persistence/FileStoreImpl;

    invoke-direct {v0, p0}, Lio/fabric/sdk/android/services/persistence/FileStoreImpl;-><init>(Lio/fabric/sdk/android/Kit;)V

    invoke-virtual {v0}, Lio/fabric/sdk/android/services/persistence/FileStoreImpl;->getFilesDir()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 121
    const-string v0, "1.1.2.37"

    return-object v0
.end method

.method installedRecently(J)Z
    .locals 5
    .param p1, "installedAt"    # J

    .prologue
    .line 239
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v0, v2, p1

    .line 240
    .local v0, "timeDifferenceInMilliseconds":J
    const-wide/32 v2, 0x36ee80

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method isFirstLaunch(J)Z
    .locals 1
    .param p1, "installedAt"    # J

    .prologue
    .line 229
    invoke-virtual {p0}, Lcom/crashlytics/android/answers/AnswersKit;->getAnalyticsLaunched()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/crashlytics/android/answers/AnswersKit;->installedRecently(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method onCustom(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 210
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/crashlytics/android/answers/AnswersKit;->sessionAnalyticsManager:Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    if-eqz v0, :cond_0

    .line 211
    iget-object v0, p0, Lcom/crashlytics/android/answers/AnswersKit;->sessionAnalyticsManager:Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    invoke-virtual {v0, p1, p2}, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->onCustom(Ljava/lang/String;Ljava/util/Map;)V

    .line 213
    :cond_0
    return-void
.end method

.method public onException(Lio/fabric/sdk/android/services/common/Crash$FatalException;)V
    .locals 2
    .param p1, "exception"    # Lio/fabric/sdk/android/services/common/Crash$FatalException;

    .prologue
    .line 198
    iget-object v0, p0, Lcom/crashlytics/android/answers/AnswersKit;->sessionAnalyticsManager:Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    if-eqz v0, :cond_0

    .line 199
    iget-object v0, p0, Lcom/crashlytics/android/answers/AnswersKit;->sessionAnalyticsManager:Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    invoke-virtual {p1}, Lio/fabric/sdk/android/services/common/Crash$FatalException;->getSessionId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->onCrash(Ljava/lang/String;)V

    .line 201
    :cond_0
    return-void
.end method

.method public onException(Lio/fabric/sdk/android/services/common/Crash$LoggedException;)V
    .locals 2
    .param p1, "exception"    # Lio/fabric/sdk/android/services/common/Crash$LoggedException;

    .prologue
    .line 192
    iget-object v0, p0, Lcom/crashlytics/android/answers/AnswersKit;->sessionAnalyticsManager:Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p0, Lcom/crashlytics/android/answers/AnswersKit;->sessionAnalyticsManager:Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    invoke-virtual {p1}, Lio/fabric/sdk/android/services/common/Crash$LoggedException;->getSessionId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/crashlytics/android/answers/SessionAnalyticsManager;->onError(Ljava/lang/String;)V

    .line 195
    :cond_0
    return-void
.end method

.method protected onPreExecute()Z
    .locals 10
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 59
    :try_start_0
    new-instance v7, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;

    invoke-direct {v7, p0}, Lio/fabric/sdk/android/services/persistence/PreferenceStoreImpl;-><init>(Lio/fabric/sdk/android/Kit;)V

    iput-object v7, p0, Lcom/crashlytics/android/answers/AnswersKit;->preferenceStore:Lio/fabric/sdk/android/services/persistence/PreferenceStore;

    .line 61
    invoke-virtual {p0}, Lcom/crashlytics/android/answers/AnswersKit;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 62
    .local v1, "context":Landroid/content/Context;
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 63
    .local v4, "packageManager":Landroid/content/pm/PackageManager;
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    .line 65
    .local v5, "packageName":Ljava/lang/String;
    const/4 v7, 0x0

    invoke-virtual {v4, v5, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 67
    .local v3, "packageInfo":Landroid/content/pm/PackageInfo;
    iget v7, v3, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/crashlytics/android/answers/AnswersKit;->versionCode:Ljava/lang/String;

    .line 68
    iget-object v7, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    if-nez v7, :cond_0

    const-string v7, "0.0"

    :goto_0
    iput-object v7, p0, Lcom/crashlytics/android/answers/AnswersKit;->versionName:Ljava/lang/String;

    .line 71
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x9

    if-lt v7, v8, :cond_1

    .line 72
    iget-wide v8, v3, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    iput-wide v8, p0, Lcom/crashlytics/android/answers/AnswersKit;->installedAt:J

    .line 78
    :goto_1
    const/4 v6, 0x1

    .line 82
    .end local v1    # "context":Landroid/content/Context;
    .end local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v4    # "packageManager":Landroid/content/pm/PackageManager;
    .end local v5    # "packageName":Ljava/lang/String;
    :goto_2
    return v6

    .line 68
    .restart local v1    # "context":Landroid/content/Context;
    .restart local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    .restart local v4    # "packageManager":Landroid/content/pm/PackageManager;
    .restart local v5    # "packageName":Ljava/lang/String;
    :cond_0
    iget-object v7, v3, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    goto :goto_0

    .line 74
    :cond_1
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 76
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    new-instance v7, Ljava/io/File;

    iget-object v8, v0, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    iput-wide v8, p0, Lcom/crashlytics/android/answers/AnswersKit;->installedAt:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 79
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v1    # "context":Landroid/content/Context;
    .end local v3    # "packageInfo":Landroid/content/pm/PackageInfo;
    .end local v4    # "packageManager":Landroid/content/pm/PackageManager;
    .end local v5    # "packageName":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 80
    .local v2, "e":Ljava/lang/Exception;
    invoke-static {}, Lio/fabric/sdk/android/Fabric;->getLogger()Lio/fabric/sdk/android/Logger;

    move-result-object v7

    const-string v8, "Answers"

    const-string v9, "Error setting up app properties"

    invoke-interface {v7, v8, v9, v2}, Lio/fabric/sdk/android/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method setAnalyticsManager(Lcom/crashlytics/android/answers/SessionAnalyticsManager;)V
    .locals 0
    .param p1, "manager"    # Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/crashlytics/android/answers/AnswersKit;->sessionAnalyticsManager:Lcom/crashlytics/android/answers/SessionAnalyticsManager;

    .line 53
    return-void
.end method
