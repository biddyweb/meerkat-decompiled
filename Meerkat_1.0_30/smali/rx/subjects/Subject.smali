.class public abstract Lrx/subjects/Subject;
.super Lrx/Observable;
.source "Subject.java"

# interfaces
.implements Lrx/Observer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/Observable",
        "<TR;>;",
        "Lrx/Observer",
        "<TT;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Lrx/Observable$OnSubscribe;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable$OnSubscribe",
            "<TR;>;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lrx/subjects/Subject;, "Lrx/subjects/Subject<TT;TR;>;"
    .local p1, "onSubscribe":Lrx/Observable$OnSubscribe;, "Lrx/Observable$OnSubscribe<TR;>;"
    invoke-direct {p0, p1}, Lrx/Observable;-><init>(Lrx/Observable$OnSubscribe;)V

    .line 28
    return-void
.end method


# virtual methods
.method public abstract hasObservers()Z
.end method

.method public final toSerialized()Lrx/subjects/SerializedSubject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/SerializedSubject",
            "<TT;TR;>;"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lrx/subjects/Subject;, "Lrx/subjects/Subject<TT;TR;>;"
    new-instance v0, Lrx/subjects/SerializedSubject;

    invoke-direct {v0, p0}, Lrx/subjects/SerializedSubject;-><init>(Lrx/subjects/Subject;)V

    return-object v0
.end method
