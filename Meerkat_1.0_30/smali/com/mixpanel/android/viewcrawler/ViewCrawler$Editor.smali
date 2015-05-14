.class Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;
.super Ljava/lang/Object;
.source "ViewCrawler.java"

# interfaces
.implements Lcom/mixpanel/android/viewcrawler/EditorConnection$Editor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/viewcrawler/ViewCrawler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Editor"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;


# direct methods
.method private constructor <init>(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)V
    .locals 0

    .prologue
    .line 692
    iput-object p1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mixpanel/android/viewcrawler/ViewCrawler;Lcom/mixpanel/android/viewcrawler/ViewCrawler$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler;
    .param p2, "x1"    # Lcom/mixpanel/android/viewcrawler/ViewCrawler$1;

    .prologue
    .line 692
    invoke-direct {p0, p1}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;-><init>(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)V

    return-void
.end method


# virtual methods
.method public bindEvents(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "message"    # Lorg/json/JSONObject;

    .prologue
    .line 710
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;
    invoke-static {v1}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 711
    .local v0, "msg":Landroid/os/Message;
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 712
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;
    invoke-static {v1}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendMessage(Landroid/os/Message;)Z

    .line 713
    return-void
.end method

.method public cleanup()V
    .locals 3

    .prologue
    .line 723
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;
    invoke-static {v1}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 724
    .local v0, "msg":Landroid/os/Message;
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;
    invoke-static {v1}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendMessage(Landroid/os/Message;)Z

    .line 725
    return-void
.end method

.method public performEdit(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "message"    # Lorg/json/JSONObject;

    .prologue
    .line 703
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;
    invoke-static {v1}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 704
    .local v0, "msg":Landroid/os/Message;
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 705
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;
    invoke-static {v1}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendMessage(Landroid/os/Message;)Z

    .line 706
    return-void
.end method

.method public sendDeviceInfo()V
    .locals 3

    .prologue
    .line 717
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;
    invoke-static {v1}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 718
    .local v0, "msg":Landroid/os/Message;
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;
    invoke-static {v1}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendMessage(Landroid/os/Message;)Z

    .line 719
    return-void
.end method

.method public sendSnapshot(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "message"    # Lorg/json/JSONObject;

    .prologue
    .line 696
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;
    invoke-static {v1}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 697
    .local v0, "msg":Landroid/os/Message;
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 698
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewCrawler$Editor;->this$0:Lcom/mixpanel/android/viewcrawler/ViewCrawler;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewCrawler;->mMessageThreadHandler:Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;
    invoke-static {v1}, Lcom/mixpanel/android/viewcrawler/ViewCrawler;->access$000(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler;->sendMessage(Landroid/os/Message;)Z

    .line 699
    return-void
.end method
