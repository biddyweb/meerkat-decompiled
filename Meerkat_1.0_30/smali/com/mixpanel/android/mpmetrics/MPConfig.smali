.class public Lcom/mixpanel/android/mpmetrics/MPConfig;
.super Ljava/lang/Object;
.source "MPConfig.java"


# static fields
.field public static DEBUG:Z = false

.field private static final LOGTAG:Ljava/lang/String; = "MixpanelAPI.Configuration"

.field static final MAX_NOTIFICATION_CACHE_COUNT:I = 0x2

.field static final REFERRER_PREFS_NAME:Ljava/lang/String; = "com.mixpanel.android.mpmetrics.ReferralInfo"

.field public static final UI_FEATURES_MIN_API:I = 0x10

.field public static final VERSION:Ljava/lang/String; = "4.5.3"

.field private static sInstance:Lcom/mixpanel/android/mpmetrics/MPConfig;

.field private static final sInstanceLock:Ljava/lang/Object;


# instance fields
.field private final mAutoShowMixpanelUpdates:Z

.field private final mBulkUploadLimit:I

.field private final mDataExpiration:I

.field private final mDecideEndpoint:Ljava/lang/String;

.field private final mDecideFallbackEndpoint:Ljava/lang/String;

.field private final mDisableAppOpenEvent:Z

.field private final mDisableEmulatorBindingUI:Z

.field private final mDisableFallback:Z

.field private final mDisableGestureBindingUI:Z

.field private final mEditorUrl:Ljava/lang/String;

.field private final mEventsEndpoint:Ljava/lang/String;

.field private final mEventsFallbackEndpoint:Ljava/lang/String;

.field private final mFlushInterval:I

.field private final mPeopleEndpoint:Ljava/lang/String;

.field private final mPeopleFallbackEndpoint:Ljava/lang/String;

.field private final mResourcePackageName:Ljava/lang/String;

.field private final mTestMode:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const/4 v0, 0x0

    sput-boolean v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    .line 263
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/mixpanel/android/mpmetrics/MPConfig;->sInstanceLock:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Landroid/os/Bundle;)V
    .locals 13
    .param p1, "metaData"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const-string v11, "com.mixpanel.android.MPConfig.EnableDebugLogging"

    invoke-virtual {p1, v11, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    sput-boolean v11, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    .line 51
    const-string v11, "com.mixpanel.android.MPConfig.AutoCheckForSurveys"

    invoke-virtual {p1, v11}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 52
    const-string v11, "MixpanelAPI.Configuration"

    const-string v12, "com.mixpanel.android.MPConfig.AutoCheckForSurveys has been deprecated in favor of com.mixpanel.android.MPConfig.AutoShowMixpanelUpdates. Please update this key as soon as possible."

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    :cond_0
    const-string v11, "com.mixpanel.android.MPConfig.BulkUploadLimit"

    const/16 v12, 0x28

    invoke-virtual {p1, v11, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v11

    iput v11, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mBulkUploadLimit:I

    .line 57
    const-string v11, "com.mixpanel.android.MPConfig.FlushInterval"

    const v12, 0xea60

    invoke-virtual {p1, v11, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v11

    iput v11, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mFlushInterval:I

    .line 58
    const-string v11, "com.mixpanel.android.MPConfig.DataExpiration"

    const v12, 0x19bfcc00

    invoke-virtual {p1, v11, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v11

    iput v11, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDataExpiration:I

    .line 59
    const-string v11, "com.mixpanel.android.MPConfig.DisableFallback"

    invoke-virtual {p1, v11, v9}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    iput-boolean v11, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDisableFallback:Z

    .line 60
    const-string v11, "com.mixpanel.android.MPConfig.ResourcePackageName"

    invoke-virtual {p1, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mResourcePackageName:Ljava/lang/String;

    .line 61
    const-string v11, "com.mixpanel.android.MPConfig.DisableGestureBindingUI"

    invoke-virtual {p1, v11, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    iput-boolean v11, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDisableGestureBindingUI:Z

    .line 62
    const-string v11, "com.mixpanel.android.MPConfig.DisableEmulatorBindingUI"

    invoke-virtual {p1, v11, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    iput-boolean v11, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDisableEmulatorBindingUI:Z

    .line 63
    const-string v11, "com.mixpanel.android.MPConfig.DisableAppOpenEvent"

    invoke-virtual {p1, v11, v9}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    iput-boolean v11, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDisableAppOpenEvent:Z

    .line 66
    const-string v11, "com.mixpanel.android.MPConfig.AutoCheckForSurveys"

    invoke-virtual {p1, v11, v9}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    .line 67
    .local v8, "surveysAutoCheck":Z
    const-string v11, "com.mixpanel.android.MPConfig.AutoShowMixpanelUpdates"

    invoke-virtual {p1, v11, v9}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    .line 68
    .local v5, "mixpanelUpdatesAutoShow":Z
    if-eqz v8, :cond_9

    if-eqz v5, :cond_9

    :goto_0
    iput-boolean v9, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mAutoShowMixpanelUpdates:Z

    .line 70
    const-string v9, "com.mixpanel.android.MPConfig.TestMode"

    invoke-virtual {p1, v9, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    iput-boolean v9, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mTestMode:Z

    .line 72
    const-string v9, "com.mixpanel.android.MPConfig.EventsEndpoint"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 73
    .local v3, "eventsEndpoint":Ljava/lang/String;
    if-nez v3, :cond_1

    .line 74
    const-string v3, "https://api.mixpanel.com/track?ip=1"

    .line 76
    :cond_1
    iput-object v3, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mEventsEndpoint:Ljava/lang/String;

    .line 78
    const-string v9, "com.mixpanel.android.MPConfig.EventsFallbackEndpoint"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 79
    .local v4, "eventsFallbackEndpoint":Ljava/lang/String;
    if-nez v4, :cond_2

    .line 80
    const-string v4, "http://api.mixpanel.com/track?ip=1"

    .line 82
    :cond_2
    iput-object v4, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mEventsFallbackEndpoint:Ljava/lang/String;

    .line 84
    const-string v9, "com.mixpanel.android.MPConfig.PeopleEndpoint"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 85
    .local v6, "peopleEndpoint":Ljava/lang/String;
    if-nez v6, :cond_3

    .line 86
    const-string v6, "https://api.mixpanel.com/engage"

    .line 88
    :cond_3
    iput-object v6, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mPeopleEndpoint:Ljava/lang/String;

    .line 90
    const-string v9, "com.mixpanel.android.MPConfig.PeopleFallbackEndpoint"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 91
    .local v7, "peopleFallbackEndpoint":Ljava/lang/String;
    if-nez v7, :cond_4

    .line 92
    const-string v7, "http://api.mixpanel.com/engage"

    .line 94
    :cond_4
    iput-object v7, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mPeopleFallbackEndpoint:Ljava/lang/String;

    .line 96
    const-string v9, "com.mixpanel.android.MPConfig.DecideEndpoint"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "decideEndpoint":Ljava/lang/String;
    if-nez v0, :cond_5

    .line 98
    const-string v0, "https://decide.mixpanel.com/decide"

    .line 100
    :cond_5
    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDecideEndpoint:Ljava/lang/String;

    .line 102
    const-string v9, "com.mixpanel.android.MPConfig.DecideFallbackEndpoint"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 103
    .local v1, "decideFallbackEndpoint":Ljava/lang/String;
    if-nez v1, :cond_6

    .line 104
    const-string v1, "http://decide.mixpanel.com/decide"

    .line 106
    :cond_6
    iput-object v1, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDecideFallbackEndpoint:Ljava/lang/String;

    .line 108
    const-string v9, "com.mixpanel.android.MPConfig.EditorUrl"

    invoke-virtual {p1, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 109
    .local v2, "editorUrl":Ljava/lang/String;
    if-nez v2, :cond_7

    .line 110
    const-string v2, "wss://switchboard.mixpanel.com/connect/"

    .line 112
    :cond_7
    iput-object v2, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mEditorUrl:Ljava/lang/String;

    .line 114
    sget-boolean v9, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    if-eqz v9, :cond_8

    .line 115
    const-string v9, "MixpanelAPI.Configuration"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Mixpanel configured with:\n    AutoShowMixpanelUpdates "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 117
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getAutoShowMixpanelUpdates()Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    BulkUploadLimit "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 118
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getBulkUploadLimit()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    FlushInterval "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 119
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getFlushInterval()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    DataExpiration "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 120
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDataExpiration()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    DisableFallback "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 121
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDisableFallback()Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    DisableAppOpenEvent "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 122
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDisableAppOpenEvent()Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    DisableDeviceUIBinding "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 123
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDisableGestureBindingUI()Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    DisableEmulatorUIBinding "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 124
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDisableEmulatorBindingUI()Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    EnableDebugLogging "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-boolean v11, Lcom/mixpanel/android/mpmetrics/MPConfig;->DEBUG:Z

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    TestMode "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 126
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getTestMode()Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    EventsEndpoint "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 127
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getEventsEndpoint()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    PeopleEndpoint "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 128
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getPeopleEndpoint()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    DecideEndpoint "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 129
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDecideEndpoint()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    EventsFallbackEndpoint "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 130
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getEventsFallbackEndpoint()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    PeopleFallbackEndpoint "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 131
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getPeopleFallbackEndpoint()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    DecideFallbackEndpoint "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 132
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDecideFallbackEndpoint()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "    EditorUrl "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 133
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getEditorUrl()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 115
    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    :cond_8
    return-void

    .end local v0    # "decideEndpoint":Ljava/lang/String;
    .end local v1    # "decideFallbackEndpoint":Ljava/lang/String;
    .end local v2    # "editorUrl":Ljava/lang/String;
    .end local v3    # "eventsEndpoint":Ljava/lang/String;
    .end local v4    # "eventsFallbackEndpoint":Ljava/lang/String;
    .end local v6    # "peopleEndpoint":Ljava/lang/String;
    .end local v7    # "peopleFallbackEndpoint":Ljava/lang/String;
    :cond_9
    move v9, v10

    .line 68
    goto/16 :goto_0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/mixpanel/android/mpmetrics/MPConfig;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    sget-object v2, Lcom/mixpanel/android/mpmetrics/MPConfig;->sInstanceLock:Ljava/lang/Object;

    monitor-enter v2

    .line 39
    :try_start_0
    sget-object v1, Lcom/mixpanel/android/mpmetrics/MPConfig;->sInstance:Lcom/mixpanel/android/mpmetrics/MPConfig;

    if-nez v1, :cond_0

    .line 40
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 41
    .local v0, "appContext":Landroid/content/Context;
    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->readConfig(Landroid/content/Context;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v1

    sput-object v1, Lcom/mixpanel/android/mpmetrics/MPConfig;->sInstance:Lcom/mixpanel/android/mpmetrics/MPConfig;

    .line 43
    .end local v0    # "appContext":Landroid/content/Context;
    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    sget-object v1, Lcom/mixpanel/android/mpmetrics/MPConfig;->sInstance:Lcom/mixpanel/android/mpmetrics/MPConfig;

    return-object v1

    .line 43
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method static readConfig(Landroid/content/Context;)Lcom/mixpanel/android/mpmetrics/MPConfig;
    .locals 7
    .param p0, "appContext"    # Landroid/content/Context;

    .prologue
    .line 231
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 233
    .local v3, "packageName":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const/16 v5, 0x80

    invoke-virtual {v4, v3, v5}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 234
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 235
    .local v1, "configBundle":Landroid/os/Bundle;
    if-nez v1, :cond_0

    .line 236
    new-instance v1, Landroid/os/Bundle;

    .end local v1    # "configBundle":Landroid/os/Bundle;
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 238
    .restart local v1    # "configBundle":Landroid/os/Bundle;
    :cond_0
    new-instance v4, Lcom/mixpanel/android/mpmetrics/MPConfig;

    invoke-direct {v4, v1}, Lcom/mixpanel/android/mpmetrics/MPConfig;-><init>(Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    .line 239
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v1    # "configBundle":Landroid/os/Bundle;
    :catch_0
    move-exception v2

    .line 240
    .local v2, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can\'t configure Mixpanel with package name "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method


# virtual methods
.method public getAutoShowMixpanelUpdates()Z
    .locals 1

    .prologue
    .line 205
    iget-boolean v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mAutoShowMixpanelUpdates:Z

    return v0
.end method

.method public getBulkUploadLimit()I
    .locals 1

    .prologue
    .line 140
    iget v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mBulkUploadLimit:I

    return v0
.end method

.method public getDataExpiration()I
    .locals 1

    .prologue
    .line 150
    iget v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDataExpiration:I

    return v0
.end method

.method public getDecideEndpoint()Ljava/lang/String;
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDecideEndpoint:Ljava/lang/String;

    return-object v0
.end method

.method public getDecideFallbackEndpoint()Ljava/lang/String;
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDecideFallbackEndpoint:Ljava/lang/String;

    return-object v0
.end method

.method public getDisableAppOpenEvent()Z
    .locals 1

    .prologue
    .line 166
    iget-boolean v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDisableAppOpenEvent:Z

    return v0
.end method

.method public getDisableEmulatorBindingUI()Z
    .locals 1

    .prologue
    .line 162
    iget-boolean v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDisableEmulatorBindingUI:Z

    return v0
.end method

.method public getDisableFallback()Z
    .locals 1

    .prologue
    .line 154
    iget-boolean v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDisableFallback:Z

    return v0
.end method

.method public getDisableGestureBindingUI()Z
    .locals 1

    .prologue
    .line 158
    iget-boolean v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mDisableGestureBindingUI:Z

    return v0
.end method

.method public getEditorUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 210
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mEditorUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getEventsEndpoint()Ljava/lang/String;
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mEventsEndpoint:Ljava/lang/String;

    return-object v0
.end method

.method public getEventsFallbackEndpoint()Ljava/lang/String;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mEventsFallbackEndpoint:Ljava/lang/String;

    return-object v0
.end method

.method public getFlushInterval()I
    .locals 1

    .prologue
    .line 145
    iget v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mFlushInterval:I

    return v0
.end method

.method public getPeopleEndpoint()Ljava/lang/String;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mPeopleEndpoint:Ljava/lang/String;

    return-object v0
.end method

.method public getPeopleFallbackEndpoint()Ljava/lang/String;
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mPeopleFallbackEndpoint:Ljava/lang/String;

    return-object v0
.end method

.method public getResourcePackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mResourcePackageName:Ljava/lang/String;

    return-object v0
.end method

.method public getTestMode()Z
    .locals 1

    .prologue
    .line 170
    iget-boolean v0, p0, Lcom/mixpanel/android/mpmetrics/MPConfig;->mTestMode:Z

    return v0
.end method
