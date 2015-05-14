.class public Lrx/internal/operators/OperatorDoOnSubscribe;
.super Ljava/lang/Object;
.source "OperatorDoOnSubscribe.java"

# interfaces
.implements Lrx/Observable$Operator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Observable$Operator",
        "<TT;TT;>;"
    }
.end annotation


# instance fields
.field private final subscribe:Lrx/functions/Action0;


# direct methods
.method public constructor <init>(Lrx/functions/Action0;)V
    .locals 0
    .param p1, "subscribe"    # Lrx/functions/Action0;

    .prologue
    .line 33
    .local p0, "this":Lrx/internal/operators/OperatorDoOnSubscribe;, "Lrx/internal/operators/OperatorDoOnSubscribe<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lrx/internal/operators/OperatorDoOnSubscribe;->subscribe:Lrx/functions/Action0;

    .line 35
    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 26
    .local p0, "this":Lrx/internal/operators/OperatorDoOnSubscribe;, "Lrx/internal/operators/OperatorDoOnSubscribe<TT;>;"
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorDoOnSubscribe;->call(Lrx/Subscriber;)Lrx/Subscriber;

    move-result-object v0

    return-object v0
.end method

.method public call(Lrx/Subscriber;)Lrx/Subscriber;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)",
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lrx/internal/operators/OperatorDoOnSubscribe;, "Lrx/internal/operators/OperatorDoOnSubscribe<TT;>;"
    .local p1, "child":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    iget-object v0, p0, Lrx/internal/operators/OperatorDoOnSubscribe;->subscribe:Lrx/functions/Action0;

    invoke-interface {v0}, Lrx/functions/Action0;->call()V

    .line 42
    return-object p1
.end method
