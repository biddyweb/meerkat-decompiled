.class Lrx/Observable$NeverObservable;
.super Lrx/Observable;
.source "Observable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NeverObservable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/Observable",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9272
    .local p0, "this":Lrx/Observable$NeverObservable;, "Lrx/Observable$NeverObservable<TT;>;"
    new-instance v0, Lrx/Observable$NeverObservable$1;

    invoke-direct {v0}, Lrx/Observable$NeverObservable$1;-><init>()V

    invoke-direct {p0, v0}, Lrx/Observable;-><init>(Lrx/Observable$OnSubscribe;)V

    .line 9280
    return-void
.end method
