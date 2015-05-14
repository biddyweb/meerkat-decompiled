.class public Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;
.super Lcom/twitter/sdk/android/core/TwitterApiClient;
.source "MeerkatTwitterApiClient.java"


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/core/TwitterSession;)V
    .locals 0
    .param p1, "session"    # Lcom/twitter/sdk/android/core/TwitterSession;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/twitter/sdk/android/core/TwitterApiClient;-><init>(Lcom/twitter/sdk/android/core/Session;)V

    .line 20
    return-void
.end method


# virtual methods
.method public getCustomService()Lco/getair/meerkat/utilities/CustomService;
    .locals 1

    .prologue
    .line 23
    const-class v0, Lco/getair/meerkat/utilities/CustomService;

    invoke-virtual {p0, v0}, Lco/getair/meerkat/utilities/MeerkatTwitterApiClient;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/utilities/CustomService;

    return-object v0
.end method
