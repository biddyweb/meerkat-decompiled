.class public Lcom/digits/sdk/android/ContactsUploadService;
.super Landroid/app/IntentService;
.source "ContactsUploadService.java"


# static fields
.field private static final THREAD_NAME:Ljava/lang/String; = "UPLOAD_WORKER"

.field private static final TIMEOUT_IN_SECONDS:I = 0x12c

.field public static final UPLOAD_COMPLETE:Ljava/lang/String; = "com.digits.sdk.android.UPLOAD_COMPLETE"

.field public static final UPLOAD_COMPLETE_EXTRA:Ljava/lang/String; = "com.digits.sdk.android.UPLOAD_COMPLETE_EXTRA"

.field public static final UPLOAD_FAILED:Ljava/lang/String; = "com.digits.sdk.android.UPLOAD_FAILED"


# instance fields
.field private contactsClient:Lcom/digits/sdk/android/ContactsClient;

.field private executor:Lcom/digits/sdk/android/concurrent/RetryExecutor;

.field private helper:Lcom/digits/sdk/android/ContactsHelper;

.field private prefManager:Lcom/digits/sdk/android/ContactsPreferenceManager;


# direct methods
.method public constructor <init>()V
    .locals 7

    .prologue
    .line 27
    const-string v0, "UPLOAD_WORKER"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 29
    invoke-static {}, Lcom/digits/sdk/android/Digits;->getInstance()Lcom/digits/sdk/android/Digits;

    move-result-object v0

    invoke-virtual {v0}, Lcom/digits/sdk/android/Digits;->getContactsClient()Lcom/digits/sdk/android/ContactsClient;

    move-result-object v0

    new-instance v1, Lcom/digits/sdk/android/ContactsHelper;

    invoke-direct {v1, p0}, Lcom/digits/sdk/android/ContactsHelper;-><init>(Landroid/content/Context;)V

    new-instance v2, Lcom/digits/sdk/android/ContactsPreferenceManager;

    invoke-direct {v2}, Lcom/digits/sdk/android/ContactsPreferenceManager;-><init>()V

    new-instance v3, Lcom/digits/sdk/android/concurrent/RetryExecutor;

    const/4 v4, 0x2

    new-instance v5, Lcom/digits/sdk/android/concurrent/DigitsRetryPolicy;

    const/4 v6, 0x1

    invoke-direct {v5, v6}, Lcom/digits/sdk/android/concurrent/DigitsRetryPolicy;-><init>(I)V

    invoke-direct {v3, v4, v5}, Lcom/digits/sdk/android/concurrent/RetryExecutor;-><init>(ILcom/digits/sdk/android/concurrent/RetryPolicy;)V

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/digits/sdk/android/ContactsUploadService;->init(Lcom/digits/sdk/android/ContactsClient;Lcom/digits/sdk/android/ContactsHelper;Lcom/digits/sdk/android/ContactsPreferenceManager;Lcom/digits/sdk/android/concurrent/RetryExecutor;)V

    .line 31
    return-void
.end method

.method constructor <init>(Lcom/digits/sdk/android/ContactsClient;Lcom/digits/sdk/android/ContactsHelper;Lcom/digits/sdk/android/ContactsPreferenceManager;Lcom/digits/sdk/android/concurrent/RetryExecutor;)V
    .locals 1
    .param p1, "contactsClient"    # Lcom/digits/sdk/android/ContactsClient;
    .param p2, "helper"    # Lcom/digits/sdk/android/ContactsHelper;
    .param p3, "prefManager"    # Lcom/digits/sdk/android/ContactsPreferenceManager;
    .param p4, "executor"    # Lcom/digits/sdk/android/concurrent/RetryExecutor;

    .prologue
    .line 38
    const-string v0, "UPLOAD_WORKER"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 40
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/digits/sdk/android/ContactsUploadService;->init(Lcom/digits/sdk/android/ContactsClient;Lcom/digits/sdk/android/ContactsHelper;Lcom/digits/sdk/android/ContactsPreferenceManager;Lcom/digits/sdk/android/concurrent/RetryExecutor;)V

    .line 41
    return-void
.end method

.method static synthetic access$000(Lcom/digits/sdk/android/ContactsUploadService;)Lcom/digits/sdk/android/ContactsClient;
    .locals 1
    .param p0, "x0"    # Lcom/digits/sdk/android/ContactsUploadService;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsUploadService;->contactsClient:Lcom/digits/sdk/android/ContactsClient;

    return-object v0
.end method

.method private init(Lcom/digits/sdk/android/ContactsClient;Lcom/digits/sdk/android/ContactsHelper;Lcom/digits/sdk/android/ContactsPreferenceManager;Lcom/digits/sdk/android/concurrent/RetryExecutor;)V
    .locals 1
    .param p1, "contactsClient"    # Lcom/digits/sdk/android/ContactsClient;
    .param p2, "helper"    # Lcom/digits/sdk/android/ContactsHelper;
    .param p3, "prefManager"    # Lcom/digits/sdk/android/ContactsPreferenceManager;
    .param p4, "executor"    # Lcom/digits/sdk/android/concurrent/RetryExecutor;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/digits/sdk/android/ContactsUploadService;->contactsClient:Lcom/digits/sdk/android/ContactsClient;

    .line 46
    iput-object p2, p0, Lcom/digits/sdk/android/ContactsUploadService;->helper:Lcom/digits/sdk/android/ContactsHelper;

    .line 47
    iput-object p3, p0, Lcom/digits/sdk/android/ContactsUploadService;->prefManager:Lcom/digits/sdk/android/ContactsPreferenceManager;

    .line 48
    iput-object p4, p0, Lcom/digits/sdk/android/ContactsUploadService;->executor:Lcom/digits/sdk/android/concurrent/RetryExecutor;

    .line 50
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/ContactsUploadService;->setIntentRedelivery(Z)V

    .line 51
    return-void
.end method


# virtual methods
.method getAllCards()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 104
    const/4 v1, 0x0

    .line 105
    .local v1, "cursor":Landroid/database/Cursor;
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 108
    .local v0, "allCards":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_0
    iget-object v2, p0, Lcom/digits/sdk/android/ContactsUploadService;->helper:Lcom/digits/sdk/android/ContactsHelper;

    invoke-virtual {v2}, Lcom/digits/sdk/android/ContactsHelper;->getContactsCursor()Landroid/database/Cursor;

    move-result-object v1

    .line 109
    iget-object v2, p0, Lcom/digits/sdk/android/ContactsUploadService;->helper:Lcom/digits/sdk/android/ContactsHelper;

    invoke-virtual {v2, v1}, Lcom/digits/sdk/android/ContactsHelper;->createContactList(Landroid/database/Cursor;)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 111
    if-eqz v1, :cond_0

    .line 112
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 116
    :cond_0
    return-object v0

    .line 111
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_1

    .line 112
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_1
    throw v2
.end method

.method getNumberOfPages(I)I
    .locals 1
    .param p1, "numCards"    # I

    .prologue
    .line 100
    add-int/lit8 v0, p1, 0x64

    add-int/lit8 v0, v0, -0x1

    div-int/lit8 v0, v0, 0x64

    return v0
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 15
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 55
    iget-object v11, p0, Lcom/digits/sdk/android/ContactsUploadService;->prefManager:Lcom/digits/sdk/android/ContactsPreferenceManager;

    invoke-virtual {v11}, Lcom/digits/sdk/android/ContactsPreferenceManager;->setContactImportPermissionGranted()V

    .line 58
    :try_start_0
    invoke-virtual {p0}, Lcom/digits/sdk/android/ContactsUploadService;->getAllCards()Ljava/util/List;

    move-result-object v0

    .line 59
    .local v0, "allCards":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v9

    .line 60
    .local v9, "totalCount":I
    invoke-virtual {p0, v9}, Lcom/digits/sdk/android/ContactsUploadService;->getNumberOfPages(I)I

    move-result v4

    .line 61
    .local v4, "pages":I
    new-instance v8, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v11, 0x0

    invoke-direct {v8, v11}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 63
    .local v8, "successCount":Ljava/util/concurrent/atomic/AtomicInteger;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v4, :cond_0

    .line 64
    mul-int/lit8 v5, v3, 0x64

    .line 65
    .local v5, "startIndex":I
    add-int/lit8 v11, v5, 0x64

    invoke-static {v9, v11}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 68
    .local v1, "endIndex":I
    invoke-interface {v0, v5, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v6

    .line 69
    .local v6, "subList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v10, Lcom/digits/sdk/android/Vcards;

    invoke-direct {v10, v6}, Lcom/digits/sdk/android/Vcards;-><init>(Ljava/util/List;)V

    .line 70
    .local v10, "vCards":Lcom/digits/sdk/android/Vcards;
    iget-object v11, p0, Lcom/digits/sdk/android/ContactsUploadService;->executor:Lcom/digits/sdk/android/concurrent/RetryExecutor;

    new-instance v12, Lcom/digits/sdk/android/ContactsUploadService$1;

    invoke-direct {v12, p0, v10, v8}, Lcom/digits/sdk/android/ContactsUploadService$1;-><init>(Lcom/digits/sdk/android/ContactsUploadService;Lcom/digits/sdk/android/Vcards;Ljava/util/concurrent/atomic/AtomicInteger;)V

    invoke-virtual {v11, v12}, Lcom/digits/sdk/android/concurrent/RetryExecutor;->execute(Ljava/lang/Runnable;)V

    .line 63
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 79
    .end local v1    # "endIndex":I
    .end local v5    # "startIndex":I
    .end local v6    # "subList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "vCards":Lcom/digits/sdk/android/Vcards;
    :cond_0
    iget-object v11, p0, Lcom/digits/sdk/android/ContactsUploadService;->executor:Lcom/digits/sdk/android/concurrent/RetryExecutor;

    invoke-virtual {v11}, Lcom/digits/sdk/android/concurrent/RetryExecutor;->shutdown()V

    .line 80
    iget-object v11, p0, Lcom/digits/sdk/android/ContactsUploadService;->executor:Lcom/digits/sdk/android/concurrent/RetryExecutor;

    const-wide/16 v12, 0x12c

    sget-object v14, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v11, v12, v13, v14}, Lcom/digits/sdk/android/concurrent/RetryExecutor;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    move-result v7

    .line 82
    .local v7, "success":Z
    if-nez v7, :cond_1

    .line 83
    iget-object v11, p0, Lcom/digits/sdk/android/ContactsUploadService;->executor:Lcom/digits/sdk/android/concurrent/RetryExecutor;

    invoke-virtual {v11}, Lcom/digits/sdk/android/concurrent/RetryExecutor;->shutdownNow()Ljava/util/List;

    .line 84
    invoke-virtual {p0}, Lcom/digits/sdk/android/ContactsUploadService;->sendFailureBroadcast()V

    .line 97
    .end local v0    # "allCards":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "i":I
    .end local v4    # "pages":I
    .end local v7    # "success":Z
    .end local v8    # "successCount":Ljava/util/concurrent/atomic/AtomicInteger;
    .end local v9    # "totalCount":I
    :goto_1
    return-void

    .line 85
    .restart local v0    # "allCards":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v3    # "i":I
    .restart local v4    # "pages":I
    .restart local v7    # "success":Z
    .restart local v8    # "successCount":Ljava/util/concurrent/atomic/AtomicInteger;
    .restart local v9    # "totalCount":I
    :cond_1
    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v11

    if-nez v11, :cond_2

    .line 86
    invoke-virtual {p0}, Lcom/digits/sdk/android/ContactsUploadService;->sendFailureBroadcast()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 92
    .end local v0    # "allCards":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "i":I
    .end local v4    # "pages":I
    .end local v7    # "success":Z
    .end local v8    # "successCount":Ljava/util/concurrent/atomic/AtomicInteger;
    .end local v9    # "totalCount":I
    :catch_0
    move-exception v2

    .line 93
    .local v2, "ex":Ljava/lang/InterruptedException;
    invoke-virtual {p0}, Lcom/digits/sdk/android/ContactsUploadService;->sendFailureBroadcast()V

    goto :goto_1

    .line 88
    .end local v2    # "ex":Ljava/lang/InterruptedException;
    .restart local v0    # "allCards":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v3    # "i":I
    .restart local v4    # "pages":I
    .restart local v7    # "success":Z
    .restart local v8    # "successCount":Ljava/util/concurrent/atomic/AtomicInteger;
    .restart local v9    # "totalCount":I
    :cond_2
    :try_start_1
    iget-object v11, p0, Lcom/digits/sdk/android/ContactsUploadService;->prefManager:Lcom/digits/sdk/android/ContactsPreferenceManager;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    invoke-virtual {v11, v12, v13}, Lcom/digits/sdk/android/ContactsPreferenceManager;->setContactsReadTimestamp(J)V

    .line 89
    iget-object v11, p0, Lcom/digits/sdk/android/ContactsUploadService;->prefManager:Lcom/digits/sdk/android/ContactsPreferenceManager;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v12

    invoke-virtual {v11, v12}, Lcom/digits/sdk/android/ContactsPreferenceManager;->setContactsUploaded(I)V

    .line 90
    new-instance v11, Lcom/digits/sdk/android/ContactsUploadResult;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v12

    invoke-direct {v11, v12, v9}, Lcom/digits/sdk/android/ContactsUploadResult;-><init>(II)V

    invoke-virtual {p0, v11}, Lcom/digits/sdk/android/ContactsUploadService;->sendSuccessBroadcast(Lcom/digits/sdk/android/ContactsUploadResult;)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 94
    .end local v0    # "allCards":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "i":I
    .end local v4    # "pages":I
    .end local v7    # "success":Z
    .end local v8    # "successCount":Ljava/util/concurrent/atomic/AtomicInteger;
    .end local v9    # "totalCount":I
    :catch_1
    move-exception v2

    .line 95
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/digits/sdk/android/ContactsUploadService;->sendFailureBroadcast()V

    goto :goto_1
.end method

.method sendFailureBroadcast()V
    .locals 2

    .prologue
    .line 120
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.digits.sdk.android.UPLOAD_FAILED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 121
    .local v0, "localIntent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/ContactsUploadService;->sendBroadcast(Landroid/content/Intent;)V

    .line 122
    return-void
.end method

.method sendSuccessBroadcast(Lcom/digits/sdk/android/ContactsUploadResult;)V
    .locals 2
    .param p1, "extra"    # Lcom/digits/sdk/android/ContactsUploadResult;

    .prologue
    .line 125
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.digits.sdk.android.UPLOAD_COMPLETE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 126
    .local v0, "localIntent":Landroid/content/Intent;
    const-string v1, "com.digits.sdk.android.UPLOAD_COMPLETE_EXTRA"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 127
    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/ContactsUploadService;->sendBroadcast(Landroid/content/Intent;)V

    .line 128
    return-void
.end method
