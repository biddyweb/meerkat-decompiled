.class Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand$1;
.super Landroid/os/AsyncTask;
.source "UploadContactsCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;

    .prologue
    .line 34
    iput-object p1, p0, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand$1;->this$0:Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;

    iput-object p2, p0, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 34
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 4
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 38
    iget-object v2, p0, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand$1;->this$0:Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;

    iget-object v3, p0, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand$1;->val$context:Landroid/content/Context;

    # invokes: Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;->getContactsPhoneNumbers(Landroid/content/Context;)Ljava/util/List;
    invoke-static {v2, v3}, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;->access$000(Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 40
    .local v1, "phoneNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 41
    iget-object v2, p0, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand$1;->this$0:Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;

    # invokes: Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v2}, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;->access$100(Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    invoke-static {}, Lco/getair/meerkat/proxies/AddressbookUploadProxy;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->retrieveProxy(Ljava/lang/String;)Lorg/puremvc/java/multicore/interfaces/IProxy;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/proxies/AddressbookUploadProxy;

    .line 42
    .local v0, "addressbookUploadProxy":Lco/getair/meerkat/proxies/AddressbookUploadProxy;
    invoke-virtual {v0, v1}, Lco/getair/meerkat/proxies/AddressbookUploadProxy;->uploadAddressBook(Ljava/util/List;)V

    .line 45
    .end local v0    # "addressbookUploadProxy":Lco/getair/meerkat/proxies/AddressbookUploadProxy;
    :cond_0
    const/4 v2, 0x0

    return-object v2
.end method
