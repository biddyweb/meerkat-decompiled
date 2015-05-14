.class public Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;
.super Landroid/widget/BaseAdapter;
.source "TweetViewAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/twitter/sdk/android/tweetui/BaseTweetView;",
        ">",
        "Landroid/widget/BaseAdapter;"
    }
.end annotation


# instance fields
.field protected final context:Landroid/content/Context;

.field protected tweets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;, "Lcom/twitter/sdk/android/tweetui/TweetViewAdapter<TT;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->context:Landroid/content/Context;

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->tweets:Ljava/util/List;

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;, "Lcom/twitter/sdk/android/tweetui/TweetViewAdapter<TT;>;"
    .local p2, "tweets":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/models/Tweet;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->context:Landroid/content/Context;

    .line 36
    iput-object p2, p0, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->tweets:Ljava/util/List;

    .line 37
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 49
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;, "Lcom/twitter/sdk/android/tweetui/TweetViewAdapter<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->tweets:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->tweets:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getItem(I)Lcom/twitter/sdk/android/core/models/Tweet;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 54
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;, "Lcom/twitter/sdk/android/tweetui/TweetViewAdapter<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->tweets:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/models/Tweet;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 15
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;, "Lcom/twitter/sdk/android/tweetui/TweetViewAdapter<TT;>;"
    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->getItem(I)Lcom/twitter/sdk/android/core/models/Tweet;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 59
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;, "Lcom/twitter/sdk/android/tweetui/TweetViewAdapter<TT;>;"
    int-to-long v0, p1

    return-wide v0
.end method

.method public getTweetView(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;)Lcom/twitter/sdk/android/tweetui/BaseTweetView;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "tweet"    # Lcom/twitter/sdk/android/core/models/Tweet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;, "Lcom/twitter/sdk/android/tweetui/TweetViewAdapter<TT;>;"
    new-instance v0, Lcom/twitter/sdk/android/tweetui/CompactTweetView;

    invoke-direct {v0, p1, p2}, Lcom/twitter/sdk/android/tweetui/CompactTweetView;-><init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;)V

    return-object v0
.end method

.method public getTweets()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;"
        }
    .end annotation

    .prologue
    .line 78
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;, "Lcom/twitter/sdk/android/tweetui/TweetViewAdapter<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->tweets:Ljava/util/List;

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 64
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;, "Lcom/twitter/sdk/android/tweetui/TweetViewAdapter<TT;>;"
    move-object v0, p2

    .line 65
    .local v0, "rowView":Landroid/view/View;
    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->getItem(I)Lcom/twitter/sdk/android/core/models/Tweet;

    move-result-object v1

    .line 66
    .local v1, "tweet":Lcom/twitter/sdk/android/core/models/Tweet;
    if-nez v0, :cond_0

    .line 67
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->context:Landroid/content/Context;

    invoke-virtual {p0, v2, v1}, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->getTweetView(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;)Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    move-result-object v0

    .line 71
    :goto_0
    return-object v0

    :cond_0
    move-object v2, v0

    .line 69
    check-cast v2, Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    invoke-virtual {v2, v1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setTweet(Lcom/twitter/sdk/android/core/models/Tweet;)V

    goto :goto_0
.end method

.method public setTweets(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/twitter/sdk/android/core/models/Tweet;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;, "Lcom/twitter/sdk/android/tweetui/TweetViewAdapter<TT;>;"
    .local p1, "tweets":Ljava/util/List;, "Ljava/util/List<Lcom/twitter/sdk/android/core/models/Tweet;>;"
    if-nez p1, :cond_0

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->tweets:Ljava/util/List;

    .line 90
    :goto_0
    invoke-virtual {p0}, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->notifyDataSetChanged()V

    .line 91
    return-void

    .line 88
    :cond_0
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/TweetViewAdapter;->tweets:Ljava/util/List;

    goto :goto_0
.end method
