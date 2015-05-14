.class public Lcom/mixpanel/android/viewcrawler/ViewCrawler;
.super Ljava/lang/Object;
.source "ViewCrawler.java"

# interfaces
.implements Lcom/mixpanel/android/viewcrawler/TrackingDebug;
.implements Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;,
        Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;,
        Lcom/mixpanel/android/viewcrawler/ViewCrawler$LifecycleCallbacks;,
        Lcom/mixpanel/android/viewcrawler/ViewCrawler$EmulatorConnector;
    }
.end annotation


# static fields
.field private static final EMULATOR_CONNECT_ATTEMPT_INTERVAL_MILLIS:I = 0x7530

.field private static final LOGTAG:Ljava/lang/String; = "MixpanelAPI.ViewCrawler"

.field private static final MESSAGE_CONNECT_TO_EDITOR:I = 0x1

.field private static final MESSAGE_EVENT_BINDINGS_RECEIVED:I = 0x6

.field private static final MESSAGE_HANDLE_EDITOR_BINDINGS_RECEIVED:I = 0x8

.field private static final MESSAGE_HANDLE_EDITOR_CHANGES_RECEIVED:I = 0x3

.field private static final MESSAGE_HANDLE_EDITOR_CLOSED:I = 0xa

.field private static final MESSAGE_INITIALIZE_CHANGES:I = 0x0

.field private static final MESSAGE_SEND_DEVICE_INFO:I = 0x4

.field private static final MESSAGE_SEND_EVENT_TRACKED:I = 0x9

.field private static final MESSAGE_SEND_STATE_FOR_EDITING:I = 0x2

.field private static final SHARED_PREF_BINDINGS_KEY:Ljava/lang/String; = "mixpanel.viewcrawler.bindings"

.field private static final SHARED_PREF_CHANGES_KEY:Ljava/lang/String; = "mixpanel.viewcrawler.changes"

.field private static final SHARED_PREF_EDITS_FILE:Ljava/lang/String; = "mixpanel.viewcrawler.changes"


# instance fields
.field private final mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

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

.field private final mEditState:Lcom/mixpanel/android/viewcrawler/EditState;

.field private final mEditorChanges:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mEditorEventBindings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

.field private final mPersistentChanges:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mPersistentEventBindings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mProtocol:Lcom/mixpanel/android/viewcrawler/EditProtocol;

.field private final mSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

.field private final mTracker:Lcom/mixpanel/android/viewcrawler/DynamicEventTracker;

.field private final mTweaks:Lcom/mixpanel/android/mpmetrics/Tweaks;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "token"    # Ljava/lang/String;
    .param p3, "mixpanel"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    invoke-static {p1}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getInstance(Landroid/content/Context;)Lcom/mixpanel/android/mpmetrics/MPConfig;

    move-result-object v7

    iput-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

    .line 56
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentChanges:Ljava/util/List;

    .line 57
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorChanges:Ljava/util/List;

    .line 58
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentEventBindings:Ljava/util/List;

    .line 59
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorEventBindings:Ljava/util/List;

    .line 61
    iget-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

    invoke-virtual {v7}, Lcom/mixpanel/android/mpmetrics/MPConfig;->getResourcePackageName()Ljava/lang/String;

    move-result-object v4

    .line 62
    .local v4, "resourcePackage":Ljava/lang/String;
    if-nez v4, :cond_0

    .line 63
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 66
    :cond_0
    new-instance v3, Lcom/mixpanel/android/mpmetrics/ResourceReader$Ids;

    invoke-direct {v3, v4, p1}, Lcom/mixpanel/android/mpmetrics/ResourceReader$Ids;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 67
    .local v3, "resourceIds":Lcom/mixpanel/android/mpmetrics/ResourceIds;
    new-instance v7, Lcom/mixpanel/android/viewcrawler/EditProtocol;

    invoke-direct {v7, v3}, Lcom/mixpanel/android/viewcrawler/EditProtocol;-><init>(Lcom/mixpanel/android/mpmetrics/ResourceIds;)V

    iput-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mProtocol:Lcom/mixpanel/android/viewcrawler/EditProtocol;

    .line 68
    new-instance v7, Lcom/mixpanel/android/viewcrawler/EditState;

    invoke-direct {v7}, Lcom/mixpanel/android/viewcrawler/EditState;-><init>()V

    iput-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditState:Lcom/mixpanel/android/viewcrawler/EditState;

    .line 69
    new-instance v7, Lcom/mixpanel/android/mpmetrics/Tweaks;

    invoke-direct {v7}, Lcom/mixpanel/android/mpmetrics/Tweaks;-><init>()V

    iput-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mTweaks:Lcom/mixpanel/android/mpmetrics/Tweaks;

    .line 70
    invoke-virtual {p3}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->getDeviceInfo()Ljava/util/Map;

    move-result-object v7

    iput-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mDeviceInfo:Ljava/util/Map;

    .line 72
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Application;

    .line 73
    .local v0, "app":Landroid/app/Application;
    new-instance v7, Lcom/mixpanel/android/viewcrawler/ViewCrawler$LifecycleCallbacks;

    invoke-direct {v7, p0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$LifecycleCallbacks;-><init>(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)V

    invoke-virtual {v0, v7}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 75
    new-instance v6, Landroid/os/HandlerThread;

    const-class v7, Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    invoke-virtual {v7}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 76
    .local v6, "thread":Landroid/os/HandlerThread;
    const/16 v7, 0xa

    invoke-virtual {v6, v7}, Landroid/os/HandlerThread;->setPriority(I)V

    .line 77
    invoke-virtual {v6}, Landroid/os/HandlerThread;->start()V

    .line 78
    new-instance v7, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    invoke-virtual {v6}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v8

    invoke-direct {v7, p0, p1, p2, v8}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;-><init>(Lcom/mixpanel/android/viewcrawler/ViewCrawler;Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;)V

    iput-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    .line 79
    iget-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    iget-object v8, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendMessage(Landroid/os/Message;)Z

    .line 81
    new-instance v7, Lcom/mixpanel/android/viewcrawler/DynamicEventTracker;

    iget-object v8, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    invoke-direct {v7, p3, v8}, Lcom/mixpanel/android/viewcrawler/DynamicEventTracker;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Landroid/os/Handler;)V

    iput-object v7, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mTracker:Lcom/mixpanel/android/viewcrawler/DynamicEventTracker;

    .line 88
    :try_start_0
    const-string v7, "TLS"

    invoke-static {v7}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v5

    .line 89
    .local v5, "sslContext":Ljavax/net/ssl/SSLContext;
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {v5, v7, v8, v9}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 90
    invoke-virtual {v5}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 95
    .end local v5    # "sslContext":Ljavax/net/ssl/SSLContext;
    .local v2, "foundSSLFactory":Ljavax/net/ssl/SSLSocketFactory;
    :goto_0
    iput-object v2, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    .line 96
    return-void

    .line 91
    .end local v2    # "foundSSLFactory":Ljavax/net/ssl/SSLSocketFactory;
    :catch_0
    move-exception v1

    .line 92
    .local v1, "e":Ljava/security/GeneralSecurityException;
    const-string v7, "MixpanelAPI.ViewCrawler"

    const-string v8, "System has no SSL support. Built-in events editor will not be available"

    invoke-static {v7, v8, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 93
    const/4 v2, 0x0

    .restart local v2    # "foundSSLFactory":Ljavax/net/ssl/SSLSocketFactory;
    goto :goto_0
.end method

.method static synthetic access$000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/EditState;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditState:Lcom/mixpanel/android/viewcrawler/EditState;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorChanges:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mEditorEventBindings:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/DynamicEventTracker;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mTracker:Lcom/mixpanel/android/viewcrawler/DynamicEventTracker;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/mpmetrics/MPConfig;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mConfig:Lcom/mixpanel/android/mpmetrics/MPConfig;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentChanges:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mPersistentEventBindings:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljavax/net/ssl/SSLSocketFactory;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mSSLSocketFactory:Ljavax/net/ssl/SSLSocketFactory;

    return-object v0
.end method

.method static synthetic access$700(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/mpmetrics/Tweaks;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mTweaks:Lcom/mixpanel/android/mpmetrics/Tweaks;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mDeviceInfo:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$900(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/EditProtocol;
    .locals 1
    .param p0, "x0"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mProtocol:Lcom/mixpanel/android/viewcrawler/EditProtocol;

    return-object v0
.end method


# virtual methods
.method public getTweaks()Lcom/mixpanel/android/mpmetrics/Tweaks;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mTweaks:Lcom/mixpanel/android/mpmetrics/Tweaks;

    return-object v0
.end method

.method public reportTrack(Ljava/lang/String;)V
    .locals 2
    .param p1, "eventName"    # Ljava/lang/String;

    .prologue
    .line 112
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    invoke-virtual {v1}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 113
    .local v0, "m":Landroid/os/Message;
    const/16 v1, 0x9

    iput v1, v0, Landroid/os/Message;->what:I

    .line 114
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 116
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    invoke-virtual {v1, v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendMessage(Landroid/os/Message;)Z

    .line 117
    return-void
.end method

.method public setEventBindings(Lorg/json/JSONArray;)V
    .locals 3
    .param p1, "bindings"    # Lorg/json/JSONArray;

    .prologue
    .line 105
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    const/4 v2, 0x6

    invoke-virtual {v1, v2}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 106
    .local v0, "msg":Landroid/os/Message;
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 107
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    invoke-virtual {v1, v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendMessage(Landroid/os/Message;)Z

    .line 108
    return-void
.end method
