.class Lco/getair/meerkat/mediators/FeedMediator$8;
.super Ljava/lang/Object;
.source "FeedMediator.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/FeedMediator;->handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/FeedMediator;

.field final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/FeedMediator;Landroid/widget/EditText;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/FeedMediator;

    .prologue
    .line 298
    iput-object p1, p0, Lco/getair/meerkat/mediators/FeedMediator$8;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    iput-object p2, p0, Lco/getair/meerkat/mediators/FeedMediator$8;->val$input:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    const/4 v3, 0x1

    .line 300
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$8;->val$input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    .line 301
    .local v1, "value":Landroid/text/Editable;
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$8;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # setter for: Lco/getair/meerkat/mediators/FeedMediator;->searchingForUser:Z
    invoke-static {v2, v3}, Lco/getair/meerkat/mediators/FeedMediator;->access$1002(Lco/getair/meerkat/mediators/FeedMediator;Z)Z

    .line 302
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 304
    .local v0, "userToFollow":Ljava/lang/String;
    const-string v2, "@"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 305
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/mediators/FeedMediator$8;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    # invokes: Lco/getair/meerkat/mediators/FeedMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    invoke-static {v2}, Lco/getair/meerkat/mediators/FeedMediator;->access$1100(Lco/getair/meerkat/mediators/FeedMediator;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    const-string v3, "searchForUserCommand"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v0, v4}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 306
    return-void
.end method
