.class Lcom/digits/sdk/android/ContactsUploadService$1;
.super Ljava/lang/Object;
.source "ContactsUploadService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/digits/sdk/android/ContactsUploadService;->onHandleIntent(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/digits/sdk/android/ContactsUploadService;

.field final synthetic val$successCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field final synthetic val$vCards:Lcom/digits/sdk/android/Vcards;


# direct methods
.method constructor <init>(Lcom/digits/sdk/android/ContactsUploadService;Lcom/digits/sdk/android/Vcards;Ljava/util/concurrent/atomic/AtomicInteger;)V
    .locals 0

    .prologue
    .line 70
    iput-object p1, p0, Lcom/digits/sdk/android/ContactsUploadService$1;->this$0:Lcom/digits/sdk/android/ContactsUploadService;

    iput-object p2, p0, Lcom/digits/sdk/android/ContactsUploadService$1;->val$vCards:Lcom/digits/sdk/android/Vcards;

    iput-object p3, p0, Lcom/digits/sdk/android/ContactsUploadService$1;->val$successCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsUploadService$1;->this$0:Lcom/digits/sdk/android/ContactsUploadService;

    # getter for: Lcom/digits/sdk/android/ContactsUploadService;->contactsClient:Lcom/digits/sdk/android/ContactsClient;
    invoke-static {v0}, Lcom/digits/sdk/android/ContactsUploadService;->access$000(Lcom/digits/sdk/android/ContactsUploadService;)Lcom/digits/sdk/android/ContactsClient;

    move-result-object v0

    iget-object v1, p0, Lcom/digits/sdk/android/ContactsUploadService$1;->val$vCards:Lcom/digits/sdk/android/Vcards;

    invoke-virtual {v0, v1}, Lcom/digits/sdk/android/ContactsClient;->uploadContacts(Lcom/digits/sdk/android/Vcards;)Lcom/digits/sdk/android/UploadResponse;

    .line 74
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsUploadService$1;->val$successCount:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v1, p0, Lcom/digits/sdk/android/ContactsUploadService$1;->val$vCards:Lcom/digits/sdk/android/Vcards;

    iget-object v1, v1, Lcom/digits/sdk/android/Vcards;->vcards:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 75
    return-void
.end method
