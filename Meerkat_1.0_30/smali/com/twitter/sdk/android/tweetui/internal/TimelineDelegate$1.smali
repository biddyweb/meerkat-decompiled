.class Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate$1;
.super Lcom/twitter/sdk/android/core/Callback;
.source "TimelineDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->loadOlder(Ljava/lang/Long;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/twitter/sdk/android/core/Callback",
        "<",
        "Ljava/util/List",
        "<TT;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;)V
    .locals 0

    .prologue
    .line 108
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate$1;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate.1;"
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate$1;->this$0:Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;

    invoke-direct {p0}, Lcom/twitter/sdk/android/core/Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public failure(Lcom/twitter/sdk/android/core/TwitterException;)V
    .locals 0
    .param p1, "exception"    # Lcom/twitter/sdk/android/core/TwitterException;

    .prologue
    .line 118
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate$1;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate.1;"
    return-void
.end method

.method public success(Lcom/twitter/sdk/android/core/Result;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/twitter/sdk/android/core/Result",
            "<",
            "Ljava/util/List",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 111
    .local p0, "this":Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate$1;, "Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate.1;"
    .local p1, "result":Lcom/twitter/sdk/android/core/Result;, "Lcom/twitter/sdk/android/core/Result<Ljava/util/List<TT;>;>;"
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate$1;->this$0:Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;

    iget-object v1, v0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->itemList:Ljava/util/LinkedList;

    iget-object v0, p1, Lcom/twitter/sdk/android/core/Result;->data:Ljava/lang/Object;

    check-cast v0, Ljava/util/Collection;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 112
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate$1;->this$0:Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/tweetui/internal/TimelineDelegate;->notifyDataSetChanged()V

    .line 113
    return-void
.end method
