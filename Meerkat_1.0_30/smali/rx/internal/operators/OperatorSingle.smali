.class public final Lrx/internal/operators/OperatorSingle;
.super Ljava/lang/Object;
.source "OperatorSingle.java"

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
.field private final defaultValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final hasDefaultValue:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 34
    .local p0, "this":Lrx/internal/operators/OperatorSingle;, "Lrx/internal/operators/OperatorSingle<TT;>;"
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lrx/internal/operators/OperatorSingle;-><init>(ZLjava/lang/Object;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lrx/internal/operators/OperatorSingle;, "Lrx/internal/operators/OperatorSingle<TT;>;"
    .local p1, "defaultValue":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lrx/internal/operators/OperatorSingle;-><init>(ZLjava/lang/Object;)V

    .line 39
    return-void
.end method

.method private constructor <init>(ZLjava/lang/Object;)V
    .locals 0
    .param p1, "hasDefaultValue"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZTT;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lrx/internal/operators/OperatorSingle;, "Lrx/internal/operators/OperatorSingle<TT;>;"
    .local p2, "defaultValue":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-boolean p1, p0, Lrx/internal/operators/OperatorSingle;->hasDefaultValue:Z

    .line 43
    iput-object p2, p0, Lrx/internal/operators/OperatorSingle;->defaultValue:Ljava/lang/Object;

    .line 44
    return-void
.end method

.method static synthetic access$000(Lrx/internal/operators/OperatorSingle;)Z
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorSingle;

    .prologue
    .line 28
    iget-boolean v0, p0, Lrx/internal/operators/OperatorSingle;->hasDefaultValue:Z

    return v0
.end method

.method static synthetic access$100(Lrx/internal/operators/OperatorSingle;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lrx/internal/operators/OperatorSingle;

    .prologue
    .line 28
    iget-object v0, p0, Lrx/internal/operators/OperatorSingle;->defaultValue:Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 28
    .local p0, "this":Lrx/internal/operators/OperatorSingle;, "Lrx/internal/operators/OperatorSingle<TT;>;"
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorSingle;->call(Lrx/Subscriber;)Lrx/Subscriber;

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
    .line 48
    .local p0, "this":Lrx/internal/operators/OperatorSingle;, "Lrx/internal/operators/OperatorSingle<TT;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorSingle$1;

    invoke-direct {v0, p0, p1, p1}, Lrx/internal/operators/OperatorSingle$1;-><init>(Lrx/internal/operators/OperatorSingle;Lrx/Subscriber;Lrx/Subscriber;)V

    return-object v0
.end method
