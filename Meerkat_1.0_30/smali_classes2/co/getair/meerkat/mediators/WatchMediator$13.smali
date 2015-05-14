.class Lco/getair/meerkat/mediators/WatchMediator$13;
.super Ljava/lang/Object;
.source "WatchMediator.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/WatchMediator;->handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/WatchMediator;

.field final synthetic val$broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

.field final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/WatchMediator;Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;Landroid/widget/EditText;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/WatchMediator;

    .prologue
    .line 295
    iput-object p1, p0, Lco/getair/meerkat/mediators/WatchMediator$13;->this$0:Lco/getair/meerkat/mediators/WatchMediator;

    iput-object p2, p0, Lco/getair/meerkat/mediators/WatchMediator$13;->val$broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    iput-object p3, p0, Lco/getair/meerkat/mediators/WatchMediator$13;->val$input:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 298
    iget-object v3, p0, Lco/getair/meerkat/mediators/WatchMediator$13;->val$broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    .line 299
    invoke-virtual {v3}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getBroadcaster()Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;

    move-result-object v3

    .line 300
    invoke-virtual {v3}, Lco/getair/meerkat/dtos/watch_broadcast/Broadcaster;->getUsername()Ljava/lang/String;

    move-result-object v0

    .line 302
    .local v0, "broadcasterUsername":Ljava/lang/String;
    iget-object v3, p0, Lco/getair/meerkat/mediators/WatchMediator$13;->val$input:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 304
    .local v1, "message":Ljava/lang/String;
    new-instance v2, Lco/getair/meerkat/dtos/twitter/ReplyParams;

    iget-object v3, p0, Lco/getair/meerkat/mediators/WatchMediator$13;->val$broadcastSummary:Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;

    .line 305
    invoke-virtual {v3}, Lco/getair/meerkat/dtos/feed/LiveBroadcastSummary;->getTweetId()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v1, v3, v0}, Lco/getair/meerkat/dtos/twitter/ReplyParams;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    .local v2, "replyParams":Lco/getair/meerkat/dtos/twitter/ReplyParams;
    iget-object v3, p0, Lco/getair/meerkat/mediators/WatchMediator$13;->this$0:Lco/getair/meerkat/mediators/WatchMediator;

    const-string v4, "commandReplyToTweet"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v2, v5}, Lco/getair/meerkat/mediators/WatchMediator;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 309
    return-void
.end method
