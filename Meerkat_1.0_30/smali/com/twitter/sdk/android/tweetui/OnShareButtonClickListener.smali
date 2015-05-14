.class Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;
.super Ljava/lang/Object;
.source "OnShareButtonClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final tweet:Lcom/twitter/sdk/android/core/models/Tweet;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/models/Tweet;)V
    .locals 0
    .param p1, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    .line 17
    return-void
.end method


# virtual methods
.method getShareContent(Landroid/content/res/Resources;)Ljava/lang/String;
    .locals 6
    .param p1, "resources"    # Landroid/content/res/Resources;

    .prologue
    .line 36
    sget v0, Lcom/twitter/sdk/android/tweetui/R$string;->tw__share_content_format:I

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    iget-object v3, v3, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    iget-object v3, v3, Lcom/twitter/sdk/android/core/models/User;->screenName:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    iget-wide v4, v3, Lcom/twitter/sdk/android/core/models/Tweet;->id:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getShareIntent(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .param p1, "subject"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;

    .prologue
    .line 50
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 51
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "android.intent.action.SEND"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 52
    const-string v1, "android.intent.extra.SUBJECT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 54
    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 55
    return-object v0
.end method

.method getShareSubject(Landroid/content/res/Resources;)Ljava/lang/String;
    .locals 4
    .param p1, "resources"    # Landroid/content/res/Resources;

    .prologue
    .line 41
    sget v0, Lcom/twitter/sdk/android/tweetui/R$string;->tw__share_subject_format:I

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    iget-object v3, v3, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    iget-object v3, v3, Lcom/twitter/sdk/android/core/models/User;->name:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    iget-object v3, v3, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    iget-object v3, v3, Lcom/twitter/sdk/android/core/models/User;->screenName:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method launchShareIntent(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 0
    .param p1, "chooser"    # Landroid/content/Intent;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 47
    return-void
.end method

.method onClick(Landroid/content/Context;Landroid/content/res/Resources;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resources"    # Landroid/content/res/Resources;

    .prologue
    .line 25
    iget-object v5, p0, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;->tweet:Lcom/twitter/sdk/android/core/models/Tweet;

    iget-object v5, v5, Lcom/twitter/sdk/android/core/models/Tweet;->user:Lcom/twitter/sdk/android/core/models/User;

    if-nez v5, :cond_1

    .line 33
    :cond_0
    :goto_0
    return-void

    .line 27
    :cond_1
    invoke-virtual {p0, p2}, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;->getShareSubject(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v3

    .line 28
    .local v3, "shareSubject":Ljava/lang/String;
    invoke-virtual {p0, p2}, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;->getShareContent(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v1

    .line 29
    .local v1, "shareContent":Ljava/lang/String;
    invoke-virtual {p0, v3, v1}, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;->getShareIntent(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 30
    .local v2, "shareIntent":Landroid/content/Intent;
    sget v5, Lcom/twitter/sdk/android/tweetui/R$string;->tw__share_tweet:I

    invoke-virtual {p2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 31
    .local v4, "shareText":Ljava/lang/String;
    invoke-static {v2, v4}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    .line 32
    .local v0, "chooser":Landroid/content/Intent;
    invoke-virtual {p0, v0, p1}, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;->launchShareIntent(Landroid/content/Intent;Landroid/content/Context;)V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/twitter/sdk/android/tweetui/OnShareButtonClickListener;->onClick(Landroid/content/Context;Landroid/content/res/Resources;)V

    .line 22
    return-void
.end method
