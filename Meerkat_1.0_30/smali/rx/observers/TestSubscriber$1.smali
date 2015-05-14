.class Lrx/observers/TestSubscriber$1;
.super Ljava/lang/Object;
.source "TestSubscriber.java"

# interfaces
.implements Lrx/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/observers/TestSubscriber;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observer",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lrx/observers/TestSubscriber;


# direct methods
.method constructor <init>(Lrx/observers/TestSubscriber;)V
    .locals 0

    .prologue
    .line 42
    .local p0, "this":Lrx/observers/TestSubscriber$1;, "Lrx/observers/TestSubscriber.1;"
    iput-object p1, p0, Lrx/observers/TestSubscriber$1;->this$0:Lrx/observers/TestSubscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 0

    .prologue
    .line 47
    .local p0, "this":Lrx/observers/TestSubscriber$1;, "Lrx/observers/TestSubscriber.1;"
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 52
    .local p0, "this":Lrx/observers/TestSubscriber$1;, "Lrx/observers/TestSubscriber.1;"
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, "this":Lrx/observers/TestSubscriber$1;, "Lrx/observers/TestSubscriber.1;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    return-void
.end method
