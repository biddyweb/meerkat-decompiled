.class public Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;
.super Landroid/widget/BaseAdapter;
.source "TimelineListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/twitter/sdk/android/core/models/Tweet;",
        ">",
        "Landroid/widget/BaseAdapter;"
    }
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private final delegate:Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/twitter/sdk/android/tweetui/internal/Timeline;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/twitter/sdk/android/tweetui/internal/Timeline",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter<TT;>;"
    .local p2, "timeline":Lcom/twitter/sdk/android/tweetui/internal/Timeline;, "Lcom/twitter/sdk/android/tweetui/internal/Timeline<TT;>;"
    new-instance v0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;

    invoke-direct {v0, p2}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;-><init>(Lcom/twitter/sdk/android/tweetui/internal/Timeline;)V

    invoke-direct {p0, p1, v0}, Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;-><init>(Landroid/content/Context;Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;)V

    .line 29
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter<TT;>;"
    .local p2, "delegate":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate<TT;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;->context:Landroid/content/Context;

    .line 33
    iput-object p2, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;->delegate:Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;

    .line 34
    invoke-virtual {p2}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->init()V

    .line 35
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 51
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;->delegate:Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->getCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Lcom/twitter/sdk/android/core/models/Tweet;
    .locals 1
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;->delegate:Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;

    invoke-virtual {v0, p1}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->getItem(I)Lcom/twitter/sdk/android/core/models/Tweet;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 16
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter<TT;>;"
    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;->getItem(I)Lcom/twitter/sdk/android/core/models/Tweet;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 61
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;->delegate:Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;

    invoke-virtual {v0, p1}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 39
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter<TT;>;"
    move-object v0, p2

    .line 40
    .local v0, "rowView":Landroid/view/View;
    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;->getItem(I)Lcom/twitter/sdk/android/core/models/Tweet;

    move-result-object v1

    .line 41
    .local v1, "tweet":Lcom/twitter/sdk/android/core/models/Tweet;
    if-nez v0, :cond_0

    .line 42
    new-instance v0, Lcom/twitter/sdk/android/tweetui/CompactTweetView;

    .end local v0    # "rowView":Landroid/view/View;
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;->context:Landroid/content/Context;

    invoke-direct {v0, v2, v1}, Lcom/twitter/sdk/android/tweetui/CompactTweetView;-><init>(Landroid/content/Context;Lcom/twitter/sdk/android/core/models/Tweet;)V

    .line 46
    .restart local v0    # "rowView":Landroid/view/View;
    :goto_0
    return-object v0

    :cond_0
    move-object v2, v0

    .line 44
    check-cast v2, Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    invoke-virtual {v2, v1}, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setTweet(Lcom/twitter/sdk/android/core/models/Tweet;)V

    goto :goto_0
.end method

.method public notifyDataSetChanged()V
    .locals 1

    .prologue
    .line 76
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;->delegate:Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->notifyDataSetChanged()V

    .line 77
    return-void
.end method

.method public notifyDataSetInvalidated()V
    .locals 1

    .prologue
    .line 81
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;->delegate:Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->notifyDataSetInvalidated()V

    .line 82
    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1
    .param p1, "observer"    # Landroid/database/DataSetObserver;

    .prologue
    .line 66
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;->delegate:Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;

    invoke-virtual {v0, p1}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 67
    return-void
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1
    .param p1, "observer"    # Landroid/database/DataSetObserver;

    .prologue
    .line 71
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineListAdapter;->delegate:Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;

    invoke-virtual {v0, p1}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 72
    return-void
.end method
