.class public Lcom/twitter/sdk/android/Twitter;
.super Lio/fabric/sdk/android/Kit;
.source "Twitter.java"

# interfaces
.implements Lio/fabric/sdk/android/KitGroup;


# instance fields
.field public final core:Lcom/twitter/sdk/android/core/TwitterCore;

.field public final digits:Lcom/digits/sdk/android/Digits;

.field public final kits:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<+",
            "Lio/fabric/sdk/android/Kit;",
            ">;"
        }
    .end annotation
.end field

.field public final tweetComposer:Lcom/twitter/sdk/android/tweetcomposer/TweetComposer;

.field public final tweetUi:Lcom/twitter/sdk/android/tweetui/TweetUi;


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;)V
    .locals 3
    .param p1, "config"    # Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    .prologue
    .line 47
    invoke-direct {p0}, Lio/fabric/sdk/android/Kit;-><init>()V

    .line 48
    new-instance v0, Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-direct {v0, p1}, Lcom/twitter/sdk/android/core/TwitterCore;-><init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;)V

    iput-object v0, p0, Lcom/twitter/sdk/android/Twitter;->core:Lcom/twitter/sdk/android/core/TwitterCore;

    .line 49
    new-instance v0, Lcom/twitter/sdk/android/tweetui/TweetUi;

    invoke-direct {v0}, Lcom/twitter/sdk/android/tweetui/TweetUi;-><init>()V

    iput-object v0, p0, Lcom/twitter/sdk/android/Twitter;->tweetUi:Lcom/twitter/sdk/android/tweetui/TweetUi;

    .line 50
    new-instance v0, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer;

    invoke-direct {v0}, Lcom/twitter/sdk/android/tweetcomposer/TweetComposer;-><init>()V

    iput-object v0, p0, Lcom/twitter/sdk/android/Twitter;->tweetComposer:Lcom/twitter/sdk/android/tweetcomposer/TweetComposer;

    .line 51
    new-instance v0, Lcom/digits/sdk/android/Digits;

    invoke-direct {v0}, Lcom/digits/sdk/android/Digits;-><init>()V

    iput-object v0, p0, Lcom/twitter/sdk/android/Twitter;->digits:Lcom/digits/sdk/android/Digits;

    .line 52
    const/4 v0, 0x4

    new-array v0, v0, [Lio/fabric/sdk/android/Kit;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/twitter/sdk/android/Twitter;->core:Lcom/twitter/sdk/android/core/TwitterCore;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/twitter/sdk/android/Twitter;->tweetUi:Lcom/twitter/sdk/android/tweetui/TweetUi;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/twitter/sdk/android/Twitter;->tweetComposer:Lcom/twitter/sdk/android/tweetcomposer/TweetComposer;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/twitter/sdk/android/Twitter;->digits:Lcom/digits/sdk/android/Digits;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lcom/twitter/sdk/android/Twitter;->kits:Ljava/util/Collection;

    .line 54
    return-void
.end method

.method private static checkInitialized()V
    .locals 2

    .prologue
    .line 42
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getInstance()Lcom/twitter/sdk/android/Twitter;

    move-result-object v0

    if-nez v0, :cond_0

    .line 43
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Must start Twitter Kit with Fabric.with() first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_0
    return-void
.end method

.method public static getApiClient()Lcom/twitter/sdk/android/core/TwitterApiClient;
    .locals 1

    .prologue
    .line 124
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->checkInitialized()V

    .line 125
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getInstance()Lcom/twitter/sdk/android/Twitter;

    move-result-object v0

    iget-object v0, v0, Lcom/twitter/sdk/android/Twitter;->core:Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getApiClient()Lcom/twitter/sdk/android/core/TwitterApiClient;

    move-result-object v0

    return-object v0
.end method

.method public static getApiClient(Lcom/twitter/sdk/android/core/Session;)Lcom/twitter/sdk/android/core/TwitterApiClient;
    .locals 1
    .param p0, "session"    # Lcom/twitter/sdk/android/core/Session;

    .prologue
    .line 139
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->checkInitialized()V

    .line 140
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getInstance()Lcom/twitter/sdk/android/Twitter;

    move-result-object v0

    iget-object v0, v0, Lcom/twitter/sdk/android/Twitter;->core:Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-virtual {v0, p0}, Lcom/twitter/sdk/android/core/TwitterCore;->getApiClient(Lcom/twitter/sdk/android/core/Session;)Lcom/twitter/sdk/android/core/TwitterApiClient;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance()Lcom/twitter/sdk/android/Twitter;
    .locals 1

    .prologue
    .line 38
    const-class v0, Lcom/twitter/sdk/android/Twitter;

    invoke-static {v0}, Lio/fabric/sdk/android/Fabric;->getKit(Ljava/lang/Class;)Lio/fabric/sdk/android/Kit;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/Twitter;

    return-object v0
.end method

.method public static getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/twitter/sdk/android/core/SessionManager",
            "<",
            "Lcom/twitter/sdk/android/core/TwitterSession;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->checkInitialized()V

    .line 111
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getInstance()Lcom/twitter/sdk/android/Twitter;

    move-result-object v0

    iget-object v0, v0, Lcom/twitter/sdk/android/Twitter;->core:Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v0

    return-object v0
.end method

.method public static logIn(Landroid/app/Activity;Lcom/twitter/sdk/android/core/Callback;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/twitter/sdk/android/core/Callback",
            "<",
            "Lcom/twitter/sdk/android/core/TwitterSession;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p1, "callback":Lcom/twitter/sdk/android/core/Callback;, "Lcom/twitter/sdk/android/core/Callback<Lcom/twitter/sdk/android/core/TwitterSession;>;"
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->checkInitialized()V

    .line 88
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getInstance()Lcom/twitter/sdk/android/Twitter;

    move-result-object v0

    iget-object v0, v0, Lcom/twitter/sdk/android/Twitter;->core:Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-virtual {v0, p0, p1}, Lcom/twitter/sdk/android/core/TwitterCore;->logIn(Landroid/app/Activity;Lcom/twitter/sdk/android/core/Callback;)V

    .line 89
    return-void
.end method

.method public static logOut()V
    .locals 1

    .prologue
    .line 99
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->checkInitialized()V

    .line 100
    invoke-static {}, Lcom/twitter/sdk/android/Twitter;->getInstance()Lcom/twitter/sdk/android/Twitter;

    move-result-object v0

    iget-object v0, v0, Lcom/twitter/sdk/android/Twitter;->core:Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->logOut()V

    .line 101
    return-void
.end method


# virtual methods
.method protected doInBackground()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x0

    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    const-string v0, "com.twitter.sdk.android:twitter"

    return-object v0
.end method

.method public getKits()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<+",
            "Lio/fabric/sdk/android/Kit;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    iget-object v0, p0, Lcom/twitter/sdk/android/Twitter;->kits:Ljava/util/Collection;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    const-string v0, "1.3.137"

    return-object v0
.end method
