.class public Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
.super Ljava/lang/Object;
.source "MixpanelAPI.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UnsupportedUpdatesFromMixpanel;,
        Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;,
        Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UnsupportedUpdatesListener;,
        Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;,
        Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;,
        Lcom/mixpanel/android/mpmetrics/MixpanelAPI$InstanceProcessor;,
        Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;
    }
.end annotation


# static fields
.field private static final APP_LINKS_LOGTAG:Ljava/lang/String; = "MixpanelAPI - App Links (OPTIONAL)"

.field private static final ENGAGE_DATE_FORMAT_STRING:Ljava/lang/String; = "yyyy-MM-dd\'T\'HH:mm:ss"

.field private static final LOGTAG:Ljava/lang/String; = "MixpanelAPI.MixpanelAPI"

.field public static final VERSION:Ljava/lang/String; = "4.5.3"

.field private static final sInstanceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Landroid/content/Context;",
            "Lcom/mixpanel/android/mpmetrics/MixpanelAPI;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sPrefsLoader:Lcom/mixpanel/android/mpmetrics/SharedPreferencesLoader;

.field private static sReferrerPrefs:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<",
            "Landroid/content/SharedPreferences;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

.field private final mContext:Landroid/content/Context;

.field private final mDecideMessages:Lcom/mixpanel/android/mpmetrics/DecideMessages;

.field private final mDeviceInfo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mEventTimings:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final mMessages:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

.field private final mPeople:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;

.field private final mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

.field private final mToken:Ljava/lang/String;

.field private final mTrackingDebug:Lcom/mixpanel/android/viewcrawler/TrackingDebug;

.field private final mUpdatesFromMixpanel:Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;

.field private final mUpdatesListener:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 1819
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sInstanceMap:Ljava/util/Map;

    .line 1820
    new-instance v0, Lcom/mixpanel/android/mpmetrics/SharedPreferencesLoader;

    invoke-direct {v0}, Lcom/mixpanel/android/mpmetrics/SharedPreferencesLoader;-><init>()V

    sput-object v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sPrefsLoader:Lcom/mixpanel/android/mpmetrics/SharedPreferencesLoader;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Future;Ljava/lang/String;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "token"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/concurrent/Future",
            "<",
            "Landroid/content/SharedPreferences;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "referrerPreferences":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Landroid/content/SharedPreferences;>;"
    const/4 v7, 0x0

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mContext:Landroid/content/Context;

    .line 124
    iput-object p3, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mToken:Ljava/lang/String;

    .line 125
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mEventTimings:Ljava/util/Map;

    .line 126
    new-instance v5, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;

    invoke-direct {v5, p0, v7}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lcom/mixpanel/android/mpmetrics/MixpanelAPI$1;)V

    iput-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPeople:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;

    .line 127
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->getAnalyticsMessages()Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    move-result-object v5

    iput-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mMessages:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    .line 128
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->getConfig()Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v5

    iput-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

    .line 130
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 131
    .local v0, "deviceInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "$android_lib_version"

    const-string v6, "4.5.3"

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    const-string v5, "$android_os"

    const-string v6, "Android"

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    const-string v6, "$android_os_version"

    sget-object v5, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    if-nez v5, :cond_1

    const-string v5, "UNKNOWN"

    :goto_0
    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    const-string v6, "$android_manufacturer"

    sget-object v5, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    if-nez v5, :cond_2

    const-string v5, "UNKNOWN"

    :goto_1
    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    const-string v6, "$android_brand"

    sget-object v5, Landroid/os/Build;->BRAND:Ljava/lang/String;

    if-nez v5, :cond_3

    const-string v5, "UNKNOWN"

    :goto_2
    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    const-string v6, "$android_model"

    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    if-nez v5, :cond_4

    const-string v5, "UNKNOWN"

    :goto_3
    invoke-interface {v0, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    :try_start_0
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    .line 139
    .local v3, "manager":Landroid/content/pm/PackageManager;
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 140
    .local v2, "info":Landroid/content/pm/PackageInfo;
    const-string v5, "$android_app_version"

    iget-object v6, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    const-string v5, "$android_app_version_code"

    iget v6, v2, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 145
    .end local v2    # "info":Landroid/content/pm/PackageInfo;
    .end local v3    # "manager":Landroid/content/pm/PackageManager;
    :goto_4
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v5

    iput-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDeviceInfo:Ljava/util/Map;

    .line 147
    invoke-virtual {p0, p1, p3}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->constructUpdatesFromMixpanel(Landroid/content/Context;Ljava/lang/String;)Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;

    move-result-object v5

    iput-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mUpdatesFromMixpanel:Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;

    .line 148
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->constructTrackingDebug()Lcom/mixpanel/android/viewcrawler/TrackingDebug;

    move-result-object v5

    iput-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mTrackingDebug:Lcom/mixpanel/android/viewcrawler/TrackingDebug;

    .line 149
    invoke-virtual {p0, p1, p2, p3}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->getPersistentIdentity(Landroid/content/Context;Ljava/util/concurrent/Future;Ljava/lang/String;)Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    move-result-object v5

    iput-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    .line 150
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->constructUpdatesListener()Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;

    move-result-object v5

    iput-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mUpdatesListener:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;

    .line 151
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mUpdatesListener:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;

    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mUpdatesFromMixpanel:Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;

    invoke-virtual {p0, p3, v5, v6}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->constructDecideUpdates(Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/DecideMessages$OnNewResultsListener;Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;)Lcom/mixpanel/android/mpmetrics/DecideMessages;

    move-result-object v5

    iput-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDecideMessages:Lcom/mixpanel/android/mpmetrics/DecideMessages;

    .line 155
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    invoke-virtual {v5}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->getPeopleDistinctId()Ljava/lang/String;

    move-result-object v4

    .line 156
    .local v4, "peopleId":Ljava/lang/String;
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDecideMessages:Lcom/mixpanel/android/mpmetrics/DecideMessages;

    invoke-virtual {v5, v4}, Lcom/mixpanel/android/mpmetrics/DecideMessages;->setDistinctId(Ljava/lang/String;)V

    .line 157
    iget-object v5, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mMessages:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    iget-object v6, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDecideMessages:Lcom/mixpanel/android/mpmetrics/DecideMessages;

    invoke-virtual {v5, v6}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->installDecideCheck(Lcom/mixpanel/android/mpmetrics/DecideMessages;)V

    .line 159
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->registerMixpanelActivityLifecycleCallbacks()V

    .line 161
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sendAppOpen()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 162
    const-string v5, "$app_open"

    invoke-virtual {p0, v5, v7}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->track(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 164
    :cond_0
    return-void

    .line 133
    .end local v4    # "peopleId":Ljava/lang/String;
    :cond_1
    sget-object v5, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    goto/16 :goto_0

    .line 134
    :cond_2
    sget-object v5, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    goto/16 :goto_1

    .line 135
    :cond_3
    sget-object v5, Landroid/os/Build;->BRAND:Ljava/lang/String;

    goto/16 :goto_2

    .line 136
    :cond_4
    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    goto :goto_3

    .line 142
    :catch_0
    move-exception v1

    .line 143
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v5, "MixpanelAPI.MixpanelAPI"

    const-string v6, "Exception getting app version name"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4
.end method

.method static synthetic access$100(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lorg/json/JSONArray;)V
    .locals 0
    .param p0, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
    .param p1, "x1"    # Lorg/json/JSONArray;

    .prologue
    .line 112
    invoke-direct {p0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sendAllPeopleRecords(Lorg/json/JSONArray;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mUpdatesListener:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mToken:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mMessages:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/PersistentIdentity;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/DecideMessages;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDecideMessages:Lcom/mixpanel/android/mpmetrics/DecideMessages;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V
    .locals 0
    .param p0, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .prologue
    .line 112
    invoke-direct {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->pushWaitingPeopleRecord()V

    return-void
.end method

.method static synthetic access$700(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDeviceInfo:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lorg/json/JSONObject;)V
    .locals 0
    .param p0, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
    .param p1, "x1"    # Lorg/json/JSONObject;

    .prologue
    .line 112
    invoke-direct {p0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->recordPeopleMessage(Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$900(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)Lcom/mixpanel/android/mpmetrics/MPConfig;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

    return-object v0
.end method

.method static allInstances(Lcom/mixpanel/android/mpmetrics/MixpanelAPI$InstanceProcessor;)V
    .locals 6
    .param p0, "processor"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI$InstanceProcessor;

    .prologue
    .line 1039
    sget-object v3, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sInstanceMap:Ljava/util/Map;

    monitor-enter v3

    .line 1040
    :try_start_0
    sget-object v2, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sInstanceMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 1041
    .local v0, "contextInstances":Ljava/util/Map;, "Ljava/util/Map<Landroid/content/Context;Lcom/mixpanel/android/mpmetrics/MixpanelAPI;>;"
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .line 1042
    .local v1, "instance":Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
    invoke-interface {p0, v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$InstanceProcessor;->process(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V

    goto :goto_0

    .line 1045
    .end local v0    # "contextInstances":Ljava/util/Map;, "Ljava/util/Map<Landroid/content/Context;Lcom/mixpanel/android/mpmetrics/MixpanelAPI;>;"
    .end local v1    # "instance":Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    :cond_1
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1046
    return-void
.end method

.method private static checkIntentForInboundAppLink(Landroid/content/Context;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 1781
    instance-of v5, p0, Landroid/app/Activity;

    if-eqz v5, :cond_0

    .line 1783
    :try_start_0
    const-string v5, "bolts.AppLinks"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 1784
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    move-object v5, v0

    invoke-virtual {v5}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    .line 1785
    .local v4, "intent":Landroid/content/Intent;
    const-string v5, "getTargetUrlFromInboundIntent"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/content/Context;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-class v8, Landroid/content/Intent;

    aput-object v8, v6, v7

    invoke-virtual {v1, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 1786
    .local v3, "getTargetUrlFromInboundIntent":Ljava/lang/reflect/Method;
    const/4 v5, 0x0

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    const/4 v7, 0x1

    aput-object v4, v6, v7

    invoke-virtual {v3, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3

    .line 1799
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "getTargetUrlFromInboundIntent":Ljava/lang/reflect/Method;
    .end local v4    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 1787
    :catch_0
    move-exception v2

    .line 1788
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v5, "MixpanelAPI - App Links (OPTIONAL)"

    const-string v6, "Failed to invoke bolts.AppLinks.getTargetUrlFromInboundIntent() -- Unable to detect inbound App Links"

    invoke-static {v5, v6, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 1789
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_1
    move-exception v2

    .line 1790
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    const-string v5, "MixpanelAPI - App Links (OPTIONAL)"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Please install the Bolts library >= 1.1.2 to track App Links: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1791
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    :catch_2
    move-exception v2

    .line 1792
    .local v2, "e":Ljava/lang/NoSuchMethodException;
    const-string v5, "MixpanelAPI - App Links (OPTIONAL)"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Please install the Bolts library >= 1.1.2 to track App Links: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/NoSuchMethodException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1793
    .end local v2    # "e":Ljava/lang/NoSuchMethodException;
    :catch_3
    move-exception v2

    .line 1794
    .local v2, "e":Ljava/lang/IllegalAccessException;
    const-string v5, "MixpanelAPI - App Links (OPTIONAL)"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to detect inbound App Links: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1797
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :cond_0
    const-string v5, "MixpanelAPI - App Links (OPTIONAL)"

    const-string v6, "Context is not an instance of Activity. To detect inbound App Links, pass an instance of an Activity to getInstance."

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static enableFallbackServer(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "enableIfTrue"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 245
    const-string v0, "MixpanelAPI.MixpanelAPI"

    const-string v1, "MixpanelAPI.enableFallbackServer is deprecated. This call is a no-op.\n    To enable fallback in your application, add\n    <meta-data android:name=\"com.mixpanel.android.MPConfig.DisableFallback\" android:value=\"false\" />\n    to the <application> section of your AndroidManifest.xml."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    return-void
.end method

.method public static getInstance(Landroid/content/Context;Ljava/lang/String;)Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 193
    if-eqz p1, :cond_0

    if-nez p0, :cond_1

    .line 218
    :cond_0
    :goto_0
    return-object v1

    .line 196
    :cond_1
    sget-object v4, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sInstanceMap:Ljava/util/Map;

    monitor-enter v4

    .line 197
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 199
    .local v0, "appContext":Landroid/content/Context;
    sget-object v3, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sReferrerPrefs:Ljava/util/concurrent/Future;

    if-nez v3, :cond_2

    .line 200
    sget-object v3, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sPrefsLoader:Lcom/mixpanel/android/mpmetrics/SharedPreferencesLoader;

    const-string v5, "com.mixpanel.android.mpmetrics.ReferralInfo"

    const/4 v6, 0x0

    invoke-virtual {v3, p0, v5, v6}, Lcom/mixpanel/android/mpmetrics/SharedPreferencesLoader;->loadPreferences(Landroid/content/Context;Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/SharedPreferencesLoader$OnPrefsLoadedListener;)Ljava/util/concurrent/Future;

    move-result-object v3

    sput-object v3, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sReferrerPrefs:Ljava/util/concurrent/Future;

    .line 203
    :cond_2
    sget-object v3, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sInstanceMap:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 204
    .local v2, "instances":Ljava/util/Map;, "Ljava/util/Map<Landroid/content/Context;Lcom/mixpanel/android/mpmetrics/MixpanelAPI;>;"
    if-nez v2, :cond_3

    .line 205
    new-instance v2, Ljava/util/HashMap;

    .end local v2    # "instances":Ljava/util/Map;, "Ljava/util/Map<Landroid/content/Context;Lcom/mixpanel/android/mpmetrics/MixpanelAPI;>;"
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 206
    .restart local v2    # "instances":Ljava/util/Map;, "Ljava/util/Map<Landroid/content/Context;Lcom/mixpanel/android/mpmetrics/MixpanelAPI;>;"
    sget-object v3, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sInstanceMap:Ljava/util/Map;

    invoke-interface {v3, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    :cond_3
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .line 210
    .local v1, "instance":Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
    if-nez v1, :cond_4

    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/ConfigurationChecker;->checkBasicConfiguration(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 211
    new-instance v1, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .end local v1    # "instance":Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
    sget-object v3, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sReferrerPrefs:Ljava/util/concurrent/Future;

    invoke-direct {v1, v0, v3, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;-><init>(Landroid/content/Context;Ljava/util/concurrent/Future;Ljava/lang/String;)V

    .line 212
    .restart local v1    # "instance":Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
    invoke-static {p0, v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->registerAppLinksListeners(Landroid/content/Context;Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V

    .line 213
    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    :cond_4
    invoke-static {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->checkIntentForInboundAppLink(Landroid/content/Context;)V

    .line 218
    monitor-exit v4

    goto :goto_0

    .line 219
    .end local v0    # "appContext":Landroid/content/Context;
    .end local v1    # "instance":Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
    .end local v2    # "instances":Ljava/util/Map;, "Ljava/util/Map<Landroid/content/Context;Lcom/mixpanel/android/mpmetrics/MixpanelAPI;>;"
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method private pushWaitingPeopleRecord()V
    .locals 2

    .prologue
    .line 1723
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->waitingPeopleRecordsForSending()Lorg/json/JSONArray;

    move-result-object v0

    .line 1724
    .local v0, "records":Lorg/json/JSONArray;
    if-eqz v0, :cond_0

    .line 1725
    invoke-direct {p0, v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sendAllPeopleRecords(Lorg/json/JSONArray;)V

    .line 1727
    :cond_0
    return-void
.end method

.method private recordPeopleMessage(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "message"    # Lorg/json/JSONObject;

    .prologue
    .line 1715
    const-string v0, "$distinct_id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1716
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mMessages:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->peopleMessage(Lorg/json/JSONObject;)V

    .line 1720
    :goto_0
    return-void

    .line 1718
    :cond_0
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->storeWaitingPeopleRecord(Lorg/json/JSONObject;)V

    goto :goto_0
.end method

.method private static registerAppLinksListeners(Landroid/content/Context;Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "mixpanel"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .prologue
    .line 1745
    :try_start_0
    const-string v5, "android.support.v4.content.LocalBroadcastManager"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1746
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v5, "getInstance"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/content/Context;

    aput-object v8, v6, v7

    invoke-virtual {v0, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 1747
    .local v3, "methodGetInstance":Ljava/lang/reflect/Method;
    const-string v5, "registerReceiver"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/content/BroadcastReceiver;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const-class v8, Landroid/content/IntentFilter;

    aput-object v8, v6, v7

    invoke-virtual {v0, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 1748
    .local v4, "methodRegisterReceiver":Ljava/lang/reflect/Method;
    const/4 v5, 0x0

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    invoke-virtual {v3, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 1749
    .local v2, "localBroadcastManager":Ljava/lang/Object;
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    new-instance v7, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$2;

    invoke-direct {v7, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$2;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V

    aput-object v7, v5, v6

    const/4 v6, 0x1

    new-instance v7, Landroid/content/IntentFilter;

    const-string v8, "com.parse.bolts.measurement_event"

    invoke-direct {v7, v8}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    aput-object v7, v5, v6

    invoke-virtual {v4, v2, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3

    .line 1775
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "localBroadcastManager":Ljava/lang/Object;
    .end local v3    # "methodGetInstance":Ljava/lang/reflect/Method;
    .end local v4    # "methodRegisterReceiver":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 1766
    :catch_0
    move-exception v1

    .line 1767
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v5, "MixpanelAPI - App Links (OPTIONAL)"

    const-string v6, "Failed to invoke LocalBroadcastManager.registerReceiver() -- App Links tracking will not be enabled due to this exception"

    invoke-static {v5, v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 1768
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_1
    move-exception v1

    .line 1769
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    const-string v5, "MixpanelAPI - App Links (OPTIONAL)"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "To enable App Links tracking android.support.v4 must be installed: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1770
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :catch_2
    move-exception v1

    .line 1771
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    const-string v5, "MixpanelAPI - App Links (OPTIONAL)"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "To enable App Links tracking android.support.v4 must be installed: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/NoSuchMethodException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1772
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    :catch_3
    move-exception v1

    .line 1773
    .local v1, "e":Ljava/lang/IllegalAccessException;
    const-string v5, "MixpanelAPI - App Links (OPTIONAL)"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "App Links tracking will not be enabled due to this exception: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private sendAllPeopleRecords(Lorg/json/JSONArray;)V
    .locals 5
    .param p1, "records"    # Lorg/json/JSONArray;

    .prologue
    .line 1732
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 1734
    :try_start_0
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 1735
    .local v2, "message":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mMessages:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    invoke-virtual {v3, v2}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->peopleMessage(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1732
    .end local v2    # "message":Lorg/json/JSONObject;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1736
    :catch_0
    move-exception v0

    .line 1737
    .local v0, "e":Lorg/json/JSONException;
    const-string v3, "MixpanelAPI.MixpanelAPI"

    const-string v4, "Malformed people record stored pending identity, will not send it."

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 1740
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    return-void
.end method

.method public static setFlushInterval(Landroid/content/Context;J)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "milliseconds"    # J
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 229
    const-string v0, "MixpanelAPI.MixpanelAPI"

    const-string v1, "MixpanelAPI.setFlushInterval is deprecated. Calling is now a no-op.\n    To set a custom Mixpanel flush interval for your application, add\n    <meta-data android:name=\"com.mixpanel.android.MPConfig.FlushInterval\" android:value=\"YOUR_INTERVAL\" />\n    to the <application> section of your AndroidManifest.xml."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    return-void
.end method


# virtual methods
.method public alias(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "original"    # Ljava/lang/String;

    .prologue
    .line 266
    if-nez p2, :cond_0

    .line 267
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->getDistinctId()Ljava/lang/String;

    move-result-object p2

    .line 269
    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 270
    const-string v2, "MixpanelAPI.MixpanelAPI"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Attempted to alias identical distinct_ids "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ". Alias message will not be sent."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    :goto_0
    return-void

    .line 275
    :cond_1
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 276
    .local v1, "j":Lorg/json/JSONObject;
    const-string v2, "alias"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 277
    const-string v2, "original"

    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 278
    const-string v2, "$create_alias"

    invoke-virtual {p0, v2, v1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->track(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 282
    .end local v1    # "j":Lorg/json/JSONObject;
    :goto_1
    invoke-virtual {p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->flush()V

    goto :goto_0

    .line 279
    :catch_0
    move-exception v0

    .line 280
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "MixpanelAPI.MixpanelAPI"

    const-string v3, "Failed to alias"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public clearSuperProperties()V
    .locals 1

    .prologue
    .line 504
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->clearSuperProperties()V

    .line 505
    return-void
.end method

.method constructDecideUpdates(Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/DecideMessages$OnNewResultsListener;Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;)Lcom/mixpanel/android/mpmetrics/DecideMessages;
    .locals 1
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/mixpanel/android/mpmetrics/DecideMessages$OnNewResultsListener;
    .param p3, "updatesFromMixpanel"    # Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;

    .prologue
    .line 1077
    new-instance v0, Lcom/mixpanel/android/mpmetrics/DecideMessages;

    invoke-direct {v0, p1, p2, p3}, Lcom/mixpanel/android/mpmetrics/DecideMessages;-><init>(Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/DecideMessages$OnNewResultsListener;Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;)V

    return-object v0
.end method

.method constructTrackingDebug()Lcom/mixpanel/android/viewcrawler/TrackingDebug;
    .locals 1

    .prologue
    .line 1099
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mUpdatesFromMixpanel:Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;

    instance-of v0, v0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    if-eqz v0, :cond_0

    .line 1100
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mUpdatesFromMixpanel:Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;

    check-cast v0, Lcom/mixpanel/android/viewcrawler/TrackingDebug;

    .line 1103
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructUpdatesFromMixpanel(Landroid/content/Context;Ljava/lang/String;)Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "token"    # Ljava/lang/String;

    .prologue
    .line 1090
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    .line 1091
    const-string v0, "MixpanelAPI.MixpanelAPI"

    const-string v1, "Web Configuration, A/B Testing, and Dynamic Tweaks are not supported on this Android OS Version"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1092
    new-instance v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UnsupportedUpdatesFromMixpanel;

    invoke-direct {v0, p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UnsupportedUpdatesFromMixpanel;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V

    .line 1094
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mToken:Ljava/lang/String;

    invoke-direct {v0, v1, v2, p0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V

    goto :goto_0
.end method

.method constructUpdatesListener()Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1081
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    .line 1082
    const-string v0, "MixpanelAPI.MixpanelAPI"

    const-string v1, "Surveys and Notifications are not supported on this Android OS Version"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1083
    new-instance v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UnsupportedUpdatesListener;

    invoke-direct {v0, p0, v2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UnsupportedUpdatesListener;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lcom/mixpanel/android/mpmetrics/MixpanelAPI$1;)V

    .line 1085
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;

    invoke-direct {v0, p0, v2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$SupportedUpdatesListener;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lcom/mixpanel/android/mpmetrics/MixpanelAPI$1;)V

    goto :goto_0
.end method

.method public flush()V
    .locals 1

    .prologue
    .line 413
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mMessages:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->postToServer()V

    .line 414
    return-void
.end method

.method getAnalyticsMessages()Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;
    .locals 1

    .prologue
    .line 1053
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->getInstance(Landroid/content/Context;)Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    move-result-object v0

    return-object v0
.end method

.method getConfig()Lcom/mixpanel/android/mpmetrics/MPConfig;
    .locals 1

    .prologue
    .line 1057
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getInstance(Landroid/content/Context;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceInfo()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 536
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mDeviceInfo:Ljava/util/Map;

    return-object v0
.end method

.method public getDistinctId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 441
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->getEventsDistinctId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPeople()Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;
    .locals 1

    .prologue
    .line 515
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPeople:Lcom/mixpanel/android/mpmetrics/MixpanelAPI$PeopleImpl;

    return-object v0
.end method

.method getPersistentIdentity(Landroid/content/Context;Ljava/util/concurrent/Future;Ljava/lang/String;)Lcom/mixpanel/android/mpmetrics/PersistentIdentity;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "token"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/concurrent/Future",
            "<",
            "Landroid/content/SharedPreferences;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/mixpanel/android/mpmetrics/PersistentIdentity;"
        }
    .end annotation

    .prologue
    .line 1061
    .local p2, "referrerPreferences":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Landroid/content/SharedPreferences;>;"
    new-instance v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$1;

    invoke-direct {v0, p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$1;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V

    .line 1071
    .local v0, "listener":Lcom/mixpanel/android/mpmetrics/SharedPreferencesLoader$OnPrefsLoadedListener;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "com.mixpanel.android.mpmetrics.MixpanelAPI_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1072
    .local v1, "prefsName":Ljava/lang/String;
    sget-object v3, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->sPrefsLoader:Lcom/mixpanel/android/mpmetrics/SharedPreferencesLoader;

    invoke-virtual {v3, p1, v1, v0}, Lcom/mixpanel/android/mpmetrics/SharedPreferencesLoader;->loadPreferences(Landroid/content/Context;Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/SharedPreferencesLoader$OnPrefsLoadedListener;)Ljava/util/concurrent/Future;

    move-result-object v2

    .line 1073
    .local v2, "storedPreferences":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Landroid/content/SharedPreferences;>;"
    new-instance v3, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    invoke-direct {v3, p2, v2}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;-><init>(Ljava/util/concurrent/Future;Ljava/util/concurrent/Future;)V

    return-object v3
.end method

.method public getSuperProperties()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 423
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->getSuperProperties()Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method public identify(Ljava/lang/String;)V
    .locals 1
    .param p1, "distinctId"    # Ljava/lang/String;

    .prologue
    .line 311
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->setEventsDistinctId(Ljava/lang/String;)V

    .line 312
    return-void
.end method

.method public logPosts()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 999
    const-string v0, "MixpanelAPI.MixpanelAPI"

    const-string v1, "MixpanelAPI.logPosts() is deprecated.\n    To get verbose debug level logging, add\n    <meta-data android:name=\"com.mixpanel.android.MPConfig.EnableDebugLogging\" value=\"true\" />\n    to the <application> section of your AndroidManifest.xml."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1006
    return-void
.end method

.method registerMixpanelActivityLifecycleCallbacks()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 1021
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_0

    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

    .line 1022
    invoke-virtual {v1}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getAutoShowMixpanelUpdates()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1023
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    instance-of v1, v1, Landroid/app/Application;

    if-eqz v1, :cond_1

    .line 1024
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Application;

    .line 1025
    .local v0, "app":Landroid/app/Application;
    new-instance v1, Lcom/mixpanel/android/mpmetrics/MixpanelActivityLifecycleCallbacks;

    invoke-direct {v1, p0}, Lcom/mixpanel/android/mpmetrics/MixpanelActivityLifecycleCallbacks;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V

    invoke-virtual {v0, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 1030
    .end local v0    # "app":Landroid/app/Application;
    :cond_0
    :goto_0
    return-void

    .line 1027
    :cond_1
    const-string v1, "MixpanelAPI.MixpanelAPI"

    const-string v2, "Context is not an Application, Mixpanel will not automatically show surveys or in-app notifications."

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public registerSuperProperties(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "superProperties"    # Lorg/json/JSONObject;

    .prologue
    .line 463
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->registerSuperProperties(Lorg/json/JSONObject;)V

    .line 464
    return-void
.end method

.method public registerSuperPropertiesOnce(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "superProperties"    # Lorg/json/JSONObject;

    .prologue
    .line 490
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->registerSuperPropertiesOnce(Lorg/json/JSONObject;)V

    .line 491
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 526
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->clearPreferences()V

    .line 527
    return-void
.end method

.method sendAppOpen()Z
    .locals 1

    .prologue
    .line 1107
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getDisableAppOpenEvent()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public timeEvent(Ljava/lang/String;)V
    .locals 5
    .param p1, "eventName"    # Ljava/lang/String;

    .prologue
    .line 322
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 323
    .local v0, "writeTime":J
    iget-object v3, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mEventTimings:Ljava/util/Map;

    monitor-enter v3

    .line 324
    :try_start_0
    iget-object v2, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mEventTimings:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v2, p1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    monitor-exit v3

    .line 326
    return-void

    .line 325
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public track(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 28
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "properties"    # Lorg/json/JSONObject;

    .prologue
    .line 346
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mEventTimings:Ljava/util/Map;

    move-object/from16 v24, v0

    monitor-enter v24

    .line 347
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mEventTimings:Ljava/util/Map;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    .line 348
    .local v6, "eventBegin":Ljava/lang/Long;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mEventTimings:Ljava/util/Map;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    monitor-exit v24
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 352
    :try_start_1
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    .line 354
    .local v11, "messageProps":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->getReferrerProperties()Ljava/util/Map;

    move-result-object v13

    .line 355
    .local v13, "referrerProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v13}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :goto_0
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_1

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 356
    .local v5, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 357
    .local v10, "key":Ljava/lang/String;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/String;

    .line 358
    .local v22, "value":Ljava/lang/String;
    move-object/from16 v0, v22

    invoke-virtual {v11, v10, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 396
    .end local v5    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "key":Ljava/lang/String;
    .end local v11    # "messageProps":Lorg/json/JSONObject;
    .end local v13    # "referrerProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v22    # "value":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 397
    .local v4, "e":Lorg/json/JSONException;
    const-string v23, "MixpanelAPI.MixpanelAPI"

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Exception tracking event "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-static {v0, v1, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 399
    .end local v4    # "e":Lorg/json/JSONException;
    :cond_0
    :goto_1
    return-void

    .line 349
    .end local v6    # "eventBegin":Ljava/lang/Long;
    :catchall_0
    move-exception v23

    :try_start_2
    monitor-exit v24
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v23

    .line 361
    .restart local v6    # "eventBegin":Ljava/lang/Long;
    .restart local v11    # "messageProps":Lorg/json/JSONObject;
    .restart local v13    # "referrerProperties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->getSuperProperties()Lorg/json/JSONObject;

    move-result-object v17

    .line 362
    .local v17, "superProperties":Lorg/json/JSONObject;
    invoke-virtual/range {v17 .. v17}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v16

    .line 363
    .local v16, "superIter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_2
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_2

    .line 364
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 365
    .restart local v10    # "key":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v11, v10, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_2

    .line 370
    .end local v10    # "key":Ljava/lang/String;
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v24

    move-wide/from16 v0, v24

    long-to-double v0, v0

    move-wide/from16 v24, v0

    const-wide v26, 0x408f400000000000L    # 1000.0

    div-double v20, v24, v26

    .line 371
    .local v20, "timeSecondsDouble":D
    move-wide/from16 v0, v20

    double-to-long v0, v0

    move-wide/from16 v18, v0

    .line 372
    .local v18, "timeSeconds":J
    const-string v23, "time"

    move-object/from16 v0, v23

    move-wide/from16 v1, v18

    invoke-virtual {v11, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 373
    const-string v23, "distinct_id"

    invoke-virtual/range {p0 .. p0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->getDistinctId()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v11, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 375
    if-eqz v6, :cond_3

    .line 376
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v24

    move-wide/from16 v0, v24

    long-to-double v0, v0

    move-wide/from16 v24, v0

    const-wide v26, 0x408f400000000000L    # 1000.0

    div-double v8, v24, v26

    .line 377
    .local v8, "eventBeginDouble":D
    sub-double v14, v20, v8

    .line 378
    .local v14, "secondsElapsed":D
    const-string v23, "$duration"

    move-object/from16 v0, v23

    invoke-virtual {v11, v0, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 381
    .end local v8    # "eventBeginDouble":D
    .end local v14    # "secondsElapsed":D
    :cond_3
    if-eqz p2, :cond_4

    .line 382
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v12

    .line 383
    .local v12, "propIter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_4

    .line 384
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 385
    .restart local v10    # "key":Ljava/lang/String;
    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v11, v10, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    .line 389
    .end local v10    # "key":Ljava/lang/String;
    .end local v12    # "propIter":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_4
    new-instance v7, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mToken:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-direct {v7, v0, v11, v1}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;-><init>(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 391
    .local v7, "eventDescription":Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mMessages:Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Lcom/mixpanel/android/mpmetrics/AnalyticsMessages;->eventsMessage(Lcom/mixpanel/android/mpmetrics/AnalyticsMessages$EventDescription;)V

    .line 393
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mTrackingDebug:Lcom/mixpanel/android/viewcrawler/TrackingDebug;

    move-object/from16 v23, v0

    if-eqz v23, :cond_0

    .line 394
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mTrackingDebug:Lcom/mixpanel/android/viewcrawler/TrackingDebug;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Lcom/mixpanel/android/viewcrawler/TrackingDebug;->reportTrack(Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_1
.end method

.method public unregisterSuperProperty(Ljava/lang/String;)V
    .locals 1
    .param p1, "superPropertyName"    # Ljava/lang/String;

    .prologue
    .line 477
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->mPersistentIdentity:Lcom/mixpanel/android/mpmetrics/PersistentIdentity;

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/mpmetrics/PersistentIdentity;->unregisterSuperProperty(Ljava/lang/String;)V

    .line 478
    return-void
.end method
