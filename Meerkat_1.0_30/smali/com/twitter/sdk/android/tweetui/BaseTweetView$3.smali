.class Lcom/twitter/sdk/android/tweetui/BaseTweetView$3;
.super Ljava/lang/Object;
.source "BaseTweetView.java"

# interfaces
.implements Lcom/squareup/picasso/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/tweetui/BaseTweetView;->setErrorImage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/tweetui/BaseTweetView;)V
    .locals 0

    .prologue
    .line 703
    iput-object p1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$3;->this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .locals 0

    .prologue
    .line 710
    return-void
.end method

.method public onSuccess()V
    .locals 2

    .prologue
    .line 706
    iget-object v0, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$3;->this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    iget-object v0, v0, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaPhotoView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/twitter/sdk/android/tweetui/BaseTweetView$3;->this$0:Lcom/twitter/sdk/android/tweetui/BaseTweetView;

    iget v1, v1, Lcom/twitter/sdk/android/tweetui/BaseTweetView;->mediaBgColor:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 707
    return-void
.end method
