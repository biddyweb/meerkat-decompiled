.class Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;
.super Ljava/lang/Object;
.source "TimelineDelegate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/twitter/sdk/android/core/models/Tweet;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final CHUNK_SIZE:I = 0x28

.field static final MAX_ITEMS:J = 0xc8L

.field private static final TAG:Ljava/lang/String; = "TimelineDelegate"


# instance fields
.field final itemList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<TT;>;"
        }
    .end annotation
.end field

.field private listAdapterObservable:Landroid/database/DataSetObservable;

.field private timeline:Lcom/twitter/sdk/android/tweetui/internal/Timeline;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/twitter/sdk/android/tweetui/internal/Timeline",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/twitter/sdk/android/tweetui/internal/Timeline;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/tweetui/internal/Timeline",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate<TT;>;"
    .local p1, "timeline":Lcom/twitter/sdk/android/tweetui/internal/Timeline;, "Lcom/twitter/sdk/android/tweetui/internal/Timeline<TT;>;"
    const/4 v0, 0x0

    .line 36
    invoke-direct {p0, p1, v0, v0}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;-><init>(Lcom/twitter/sdk/android/tweetui/internal/Timeline;Landroid/database/DataSetObservable;Ljava/util/LinkedList;)V

    .line 37
    return-void
.end method

.method constructor <init>(Lcom/twitter/sdk/android/tweetui/internal/Timeline;Landroid/database/DataSetObservable;Ljava/util/LinkedList;)V
    .locals 2
    .param p2, "observable"    # Landroid/database/DataSetObservable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/tweetui/internal/Timeline",
            "<TT;>;",
            "Landroid/database/DataSetObservable;",
            "Ljava/util/LinkedList",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate<TT;>;"
    .local p1, "timeline":Lcom/twitter/sdk/android/tweetui/internal/Timeline;, "Lcom/twitter/sdk/android/tweetui/internal/Timeline<TT;>;"
    .local p3, "items":Ljava/util/LinkedList;, "Ljava/util/LinkedList<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    if-nez p1, :cond_0

    .line 44
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Timeline must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 46
    :cond_0
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->timeline:Lcom/twitter/sdk/android/tweetui/internal/Timeline;

    .line 47
    iput-object p2, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->listAdapterObservable:Landroid/database/DataSetObservable;

    .line 48
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->listAdapterObservable:Landroid/database/DataSetObservable;

    if-nez v0, :cond_1

    .line 49
    new-instance v0, Landroid/database/DataSetObservable;

    invoke-direct {v0}, Landroid/database/DataSetObservable;-><init>()V

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->listAdapterObservable:Landroid/database/DataSetObservable;

    .line 51
    :cond_1
    if-nez p3, :cond_2

    .line 52
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->itemList:Ljava/util/LinkedList;

    .line 56
    :goto_0
    return-void

    .line 54
    :cond_2
    iput-object p3, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->itemList:Ljava/util/LinkedList;

    goto :goto_0
.end method

.method private loadOlder(Ljava/lang/Long;)V
    .locals 3
    .param p1, "maxId"    # Ljava/lang/Long;

    .prologue
    .line 108
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->timeline:Lcom/twitter/sdk/android/tweetui/internal/Timeline;

    const/16 v1, 0x28

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate$1;

    invoke-direct {v2, p0}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate$1;-><init>(Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;)V

    invoke-interface {v0, v1, p1, v2}, Lcom/twitter/sdk/android/tweetui/internal/Timeline;->older(Ljava/lang/Integer;Ljava/lang/Long;Lcom/twitter/sdk/android/core/Callback;)V

    .line 120
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 70
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->itemList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Lcom/twitter/sdk/android/core/models/Tweet;
    .locals 3
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate<TT;>;"
    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->shouldLoadOlder(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 80
    invoke-virtual {p0, p1}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->getItemId(I)J

    move-result-wide v0

    .line 81
    .local v0, "maxId":J
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->loadOlder(Ljava/lang/Long;)V

    .line 83
    .end local v0    # "maxId":J
    :cond_0
    iget-object v2, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->itemList:Ljava/util/LinkedList;

    invoke-virtual {v2, p1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/twitter/sdk/android/core/models/Tweet;

    return-object v2
.end method

.method public getItemId(I)J
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 92
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate<TT;>;"
    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->itemList:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/twitter/sdk/android/core/models/Tweet;

    .line 93
    .local v0, "tweet":Lcom/twitter/sdk/android/core/models/Tweet;
    iget-wide v2, v0, Lcom/twitter/sdk/android/core/models/Tweet;->id:J

    return-wide v2
.end method

.method public init()V
    .locals 1

    .prologue
    .line 62
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->loadOlder(Ljava/lang/Long;)V

    .line 63
    return-void
.end method

.method public notifyDataSetChanged()V
    .locals 1

    .prologue
    .line 146
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->listAdapterObservable:Landroid/database/DataSetObservable;

    invoke-virtual {v0}, Landroid/database/DataSetObservable;->notifyChanged()V

    .line 147
    return-void
.end method

.method public notifyDataSetInvalidated()V
    .locals 1

    .prologue
    .line 154
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->listAdapterObservable:Landroid/database/DataSetObservable;

    invoke-virtual {v0}, Landroid/database/DataSetObservable;->notifyInvalidated()V

    .line 155
    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1
    .param p1, "observer"    # Landroid/database/DataSetObserver;

    .prologue
    .line 129
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->listAdapterObservable:Landroid/database/DataSetObservable;

    invoke-virtual {v0, p1}, Landroid/database/DataSetObservable;->registerObserver(Ljava/lang/Object;)V

    .line 130
    return-void
.end method

.method shouldLoadOlder(I)Z
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 104
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->itemList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-lt p1, v0, :cond_0

    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->itemList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0xa0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1
    .param p1, "observer"    # Landroid/database/DataSetObserver;

    .prologue
    .line 138
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate<TT;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->listAdapterObservable:Landroid/database/DataSetObservable;

    invoke-virtual {v0, p1}, Landroid/database/DataSetObservable;->unregisterObserver(Ljava/lang/Object;)V

    .line 139
    return-void
.end method
