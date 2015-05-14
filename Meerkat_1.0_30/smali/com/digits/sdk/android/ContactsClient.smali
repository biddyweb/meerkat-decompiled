.class public Lcom/digits/sdk/android/ContactsClient;
.super Ljava/lang/Object;
.source "ContactsClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/digits/sdk/android/ContactsClient$ContactsService;
    }
.end annotation


# static fields
.field public static final MAX_PAGE_SIZE:I = 0x64


# instance fields
.field private activityClassManagerFactory:Lcom/digits/sdk/android/ActivityClassManagerFactory;

.field private contactsService:Lcom/digits/sdk/android/ContactsClient$ContactsService;

.field private final prefManager:Lcom/digits/sdk/android/ContactsPreferenceManager;

.field private final twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;


# direct methods
.method constructor <init>()V
    .locals 4

    .prologue
    .line 25
    invoke-static {}, Lcom/twitter/sdk/android/core/TwitterCore;->getInstance()Lcom/twitter/sdk/android/core/TwitterCore;

    move-result-object v0

    new-instance v1, Lcom/digits/sdk/android/ContactsPreferenceManager;

    invoke-direct {v1}, Lcom/digits/sdk/android/ContactsPreferenceManager;-><init>()V

    new-instance v2, Lcom/digits/sdk/android/ActivityClassManagerFactory;

    invoke-direct {v2}, Lcom/digits/sdk/android/ActivityClassManagerFactory;-><init>()V

    const/4 v3, 0x0

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/digits/sdk/android/ContactsClient;-><init>(Lcom/twitter/sdk/android/core/TwitterCore;Lcom/digits/sdk/android/ContactsPreferenceManager;Lcom/digits/sdk/android/ActivityClassManagerFactory;Lcom/digits/sdk/android/ContactsClient$ContactsService;)V

    .line 27
    return-void
.end method

.method constructor <init>(Lcom/twitter/sdk/android/core/TwitterCore;Lcom/digits/sdk/android/ContactsPreferenceManager;Lcom/digits/sdk/android/ActivityClassManagerFactory;Lcom/digits/sdk/android/ContactsClient$ContactsService;)V
    .locals 2
    .param p1, "twitterCore"    # Lcom/twitter/sdk/android/core/TwitterCore;
    .param p2, "prefManager"    # Lcom/digits/sdk/android/ContactsPreferenceManager;
    .param p3, "activityClassManagerFactory"    # Lcom/digits/sdk/android/ActivityClassManagerFactory;
    .param p4, "contactsService"    # Lcom/digits/sdk/android/ContactsClient$ContactsService;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    if-nez p1, :cond_0

    .line 33
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "twitter must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 35
    :cond_0
    if-nez p2, :cond_1

    .line 36
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "preference manager must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_1
    if-nez p3, :cond_2

    .line 39
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "activityClassManagerFactory must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_2
    iput-object p1, p0, Lcom/digits/sdk/android/ContactsClient;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    .line 42
    iput-object p2, p0, Lcom/digits/sdk/android/ContactsClient;->prefManager:Lcom/digits/sdk/android/ContactsPreferenceManager;

    .line 43
    iput-object p3, p0, Lcom/digits/sdk/android/ContactsClient;->activityClassManagerFactory:Lcom/digits/sdk/android/ActivityClassManagerFactory;

    .line 44
    iput-object p4, p0, Lcom/digits/sdk/android/ContactsClient;->contactsService:Lcom/digits/sdk/android/ContactsClient$ContactsService;

    .line 45
    return-void
.end method

.method private getContactsService()Lcom/digits/sdk/android/ContactsClient$ContactsService;
    .locals 6

    .prologue
    .line 98
    iget-object v1, p0, Lcom/digits/sdk/android/ContactsClient;->contactsService:Lcom/digits/sdk/android/ContactsClient$ContactsService;

    if-eqz v1, :cond_0

    .line 99
    iget-object v1, p0, Lcom/digits/sdk/android/ContactsClient;->contactsService:Lcom/digits/sdk/android/ContactsClient$ContactsService;

    .line 110
    :goto_0
    return-object v1

    .line 102
    :cond_0
    new-instance v1, Lretrofit/RestAdapter$Builder;

    invoke-direct {v1}, Lretrofit/RestAdapter$Builder;-><init>()V

    new-instance v2, Lcom/twitter/sdk/android/core/internal/TwitterApi;

    invoke-direct {v2}, Lcom/twitter/sdk/android/core/internal/TwitterApi;-><init>()V

    invoke-virtual {v2}, Lcom/twitter/sdk/android/core/internal/TwitterApi;->getBaseHostUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lretrofit/RestAdapter$Builder;->setEndpoint(Ljava/lang/String;)Lretrofit/RestAdapter$Builder;

    move-result-object v1

    new-instance v2, Lcom/twitter/sdk/android/core/AuthenticatedClient;

    iget-object v3, p0, Lcom/digits/sdk/android/ContactsClient;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-virtual {v3}, Lcom/twitter/sdk/android/core/TwitterCore;->getAuthConfig()Lcom/twitter/sdk/android/core/TwitterAuthConfig;

    move-result-object v3

    invoke-static {}, Lcom/digits/sdk/android/Digits;->getSessionManager()Lcom/twitter/sdk/android/core/SessionManager;

    move-result-object v4

    invoke-interface {v4}, Lcom/twitter/sdk/android/core/SessionManager;->getActiveSession()Lcom/twitter/sdk/android/core/Session;

    move-result-object v4

    iget-object v5, p0, Lcom/digits/sdk/android/ContactsClient;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-virtual {v5}, Lcom/twitter/sdk/android/core/TwitterCore;->getSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5}, Lcom/twitter/sdk/android/core/AuthenticatedClient;-><init>(Lcom/twitter/sdk/android/core/TwitterAuthConfig;Lcom/twitter/sdk/android/core/Session;Ljavax/net/ssl/SSLSocketFactory;)V

    invoke-virtual {v1, v2}, Lretrofit/RestAdapter$Builder;->setClient(Lretrofit/client/Client;)Lretrofit/RestAdapter$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lretrofit/RestAdapter$Builder;->build()Lretrofit/RestAdapter;

    move-result-object v0

    .line 109
    .local v0, "adapter":Lretrofit/RestAdapter;
    const-class v1, Lcom/digits/sdk/android/ContactsClient$ContactsService;

    invoke-virtual {v0, v1}, Lretrofit/RestAdapter;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/digits/sdk/android/ContactsClient$ContactsService;

    iput-object v1, p0, Lcom/digits/sdk/android/ContactsClient;->contactsService:Lcom/digits/sdk/android/ContactsClient$ContactsService;

    .line 110
    iget-object v1, p0, Lcom/digits/sdk/android/ContactsClient;->contactsService:Lcom/digits/sdk/android/ContactsClient$ContactsService;

    goto :goto_0
.end method

.method private startContactsActivity(Landroid/content/Context;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "themeResId"    # I

    .prologue
    .line 85
    iget-object v2, p0, Lcom/digits/sdk/android/ContactsClient;->activityClassManagerFactory:Lcom/digits/sdk/android/ActivityClassManagerFactory;

    invoke-virtual {v2, p1, p2}, Lcom/digits/sdk/android/ActivityClassManagerFactory;->createActivityClassManager(Landroid/content/Context;I)Lcom/digits/sdk/android/ActivityClassManager;

    move-result-object v0

    .line 87
    .local v0, "activityClassManager":Lcom/digits/sdk/android/ActivityClassManager;
    new-instance v1, Landroid/content/Intent;

    invoke-interface {v0}, Lcom/digits/sdk/android/ActivityClassManager;->getContactsActivity()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 88
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "THEME_RESOURCE_ID"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 89
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 90
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 91
    return-void
.end method

.method private startContactsService(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 94
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/digits/sdk/android/ContactsUploadService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 95
    return-void
.end method


# virtual methods
.method public deleteAllUploadedContacts(Lcom/digits/sdk/android/ContactsCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/digits/sdk/android/ContactsCallback",
            "<",
            "Lretrofit/client/Response;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 119
    .local p1, "callback":Lcom/digits/sdk/android/ContactsCallback;, "Lcom/digits/sdk/android/ContactsCallback<Lretrofit/client/Response;>;"
    invoke-direct {p0}, Lcom/digits/sdk/android/ContactsClient;->getContactsService()Lcom/digits/sdk/android/ContactsClient$ContactsService;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/digits/sdk/android/ContactsClient$ContactsService;->deleteAll(Lcom/digits/sdk/android/ContactsCallback;)V

    .line 120
    return-void
.end method

.method public hasUserGrantedPermission()Z
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsClient;->prefManager:Lcom/digits/sdk/android/ContactsPreferenceManager;

    invoke-virtual {v0}, Lcom/digits/sdk/android/ContactsPreferenceManager;->hasContactImportPermissionGranted()Z

    move-result v0

    return v0
.end method

.method public lookupContactMatches(Ljava/lang/String;Ljava/lang/Integer;Lcom/digits/sdk/android/ContactsCallback;)V
    .locals 2
    .param p1, "nextCursor"    # Ljava/lang/String;
    .param p2, "count"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Lcom/digits/sdk/android/ContactsCallback",
            "<",
            "Lcom/digits/sdk/android/Contacts;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 132
    .local p3, "callback":Lcom/digits/sdk/android/ContactsCallback;, "Lcom/digits/sdk/android/ContactsCallback<Lcom/digits/sdk/android/Contacts;>;"
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x64

    if-le v0, v1, :cond_1

    .line 133
    :cond_0
    invoke-direct {p0}, Lcom/digits/sdk/android/ContactsClient;->getContactsService()Lcom/digits/sdk/android/ContactsClient$ContactsService;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1, p3}, Lcom/digits/sdk/android/ContactsClient$ContactsService;->usersAndUploadedBy(Ljava/lang/String;Ljava/lang/Integer;Lcom/digits/sdk/android/ContactsCallback;)V

    .line 137
    :goto_0
    return-void

    .line 135
    :cond_1
    invoke-direct {p0}, Lcom/digits/sdk/android/ContactsClient;->getContactsService()Lcom/digits/sdk/android/ContactsClient$ContactsService;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/digits/sdk/android/ContactsClient$ContactsService;->usersAndUploadedBy(Ljava/lang/String;Ljava/lang/Integer;Lcom/digits/sdk/android/ContactsCallback;)V

    goto :goto_0
.end method

.method public startContactsUpload()V
    .locals 1

    .prologue
    .line 53
    sget v0, Lcom/digits/sdk/android/R$style;->Digits_default:I

    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/ContactsClient;->startContactsUpload(I)V

    .line 54
    return-void
.end method

.method public startContactsUpload(I)V
    .locals 1
    .param p1, "themeResId"    # I

    .prologue
    .line 65
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsClient;->twitterCore:Lcom/twitter/sdk/android/core/TwitterCore;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/TwitterCore;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/digits/sdk/android/ContactsClient;->startContactsUpload(Landroid/content/Context;I)V

    .line 66
    return-void
.end method

.method protected startContactsUpload(Landroid/content/Context;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "themeResId"    # I

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/digits/sdk/android/ContactsClient;->hasUserGrantedPermission()Z

    move-result v0

    if-nez v0, :cond_0

    .line 78
    invoke-direct {p0, p1, p2}, Lcom/digits/sdk/android/ContactsClient;->startContactsActivity(Landroid/content/Context;I)V

    .line 82
    :goto_0
    return-void

    .line 80
    :cond_0
    invoke-direct {p0, p1}, Lcom/digits/sdk/android/ContactsClient;->startContactsService(Landroid/content/Context;)V

    goto :goto_0
.end method

.method uploadContacts(Lcom/digits/sdk/android/Vcards;)Lcom/digits/sdk/android/UploadResponse;
    .locals 1
    .param p1, "vcards"    # Lcom/digits/sdk/android/Vcards;

    .prologue
    .line 141
    invoke-direct {p0}, Lcom/digits/sdk/android/ContactsClient;->getContactsService()Lcom/digits/sdk/android/ContactsClient$ContactsService;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/digits/sdk/android/ContactsClient$ContactsService;->upload(Lcom/digits/sdk/android/Vcards;)Lcom/digits/sdk/android/UploadResponse;

    move-result-object v0

    return-object v0
.end method
