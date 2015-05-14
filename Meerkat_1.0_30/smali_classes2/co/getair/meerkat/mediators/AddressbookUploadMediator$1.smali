.class Lco/getair/meerkat/mediators/AddressbookUploadMediator$1;
.super Ljava/lang/Object;
.source "AddressbookUploadMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/AddressbookUploadMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/AddressbookUploadMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/AddressbookUploadMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/AddressbookUploadMediator;

    .prologue
    .line 52
    iput-object p1, p0, Lco/getair/meerkat/mediators/AddressbookUploadMediator$1;->this$0:Lco/getair/meerkat/mediators/AddressbookUploadMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 55
    iget-object v0, p0, Lco/getair/meerkat/mediators/AddressbookUploadMediator$1;->this$0:Lco/getair/meerkat/mediators/AddressbookUploadMediator;

    const-string v1, "commandUploadContacts"

    iget-object v2, p0, Lco/getair/meerkat/mediators/AddressbookUploadMediator$1;->this$0:Lco/getair/meerkat/mediators/AddressbookUploadMediator;

    # invokes: Lco/getair/meerkat/mediators/AddressbookUploadMediator;->getOwnerActivity()Landroid/app/Activity;
    invoke-static {v2}, Lco/getair/meerkat/mediators/AddressbookUploadMediator;->access$000(Lco/getair/meerkat/mediators/AddressbookUploadMediator;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/mediators/AddressbookUploadMediator;->sendNotification(Ljava/lang/String;Ljava/lang/Object;)V

    .line 56
    return-void
.end method
