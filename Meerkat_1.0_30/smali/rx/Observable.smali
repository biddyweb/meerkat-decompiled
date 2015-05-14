.class public Lrx/Observable;
.super Ljava/lang/Object;
.source "Observable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/Observable$ThrowObservable;,
        Lrx/Observable$NeverObservable;,
        Lrx/Observable$Transformer;,
        Lrx/Observable$Operator;,
        Lrx/Observable$OnSubscribe;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final EMPTY:Lrx/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Observable",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final hook:Lrx/plugins/RxJavaObservableExecutionHook;


# instance fields
.field final onSubscribe:Lrx/Observable$OnSubscribe;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/Observable$OnSubscribe",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    invoke-static {}, Lrx/plugins/RxJavaPlugins;->getInstance()Lrx/plugins/RxJavaPlugins;

    move-result-object v0

    invoke-virtual {v0}, Lrx/plugins/RxJavaPlugins;->getObservableExecutionHook()Lrx/plugins/RxJavaObservableExecutionHook;

    move-result-object v0

    sput-object v0, Lrx/Observable;->hook:Lrx/plugins/RxJavaObservableExecutionHook;

    .line 1033
    new-instance v0, Lrx/Observable$2;

    invoke-direct {v0}, Lrx/Observable$2;-><init>()V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    sput-object v0, Lrx/Observable;->EMPTY:Lrx/Observable;

    return-void
.end method

.method protected constructor <init>(Lrx/Observable$OnSubscribe;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable$OnSubscribe",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "f":Lrx/Observable$OnSubscribe;, "Lrx/Observable$OnSubscribe<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lrx/Observable;->onSubscribe:Lrx/Observable$OnSubscribe;

    .line 61
    return-void
.end method

.method static synthetic access$000()Lrx/plugins/RxJavaObservableExecutionHook;
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lrx/Observable;->hook:Lrx/plugins/RxJavaObservableExecutionHook;

    return-object v0
.end method

.method public static final amb(Ljava/lang/Iterable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lrx/Observable",
            "<+TT;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 222
    .local p0, "sources":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lrx/Observable<+TT;>;>;"
    invoke-static {p0}, Lrx/internal/operators/OnSubscribeAmb;->amb(Ljava/lang/Iterable;)Lrx/Observable$OnSubscribe;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final amb(Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 244
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1}, Lrx/internal/operators/OnSubscribeAmb;->amb(Lrx/Observable;Lrx/Observable;)Lrx/Observable$OnSubscribe;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 268
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1, p2}, Lrx/internal/operators/OnSubscribeAmb;->amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable$OnSubscribe;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 294
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1, p2, p3}, Lrx/internal/operators/OnSubscribeAmb;->amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable$OnSubscribe;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 322
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1, p2, p3, p4}, Lrx/internal/operators/OnSubscribeAmb;->amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable$OnSubscribe;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 352
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "o6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static/range {p0 .. p5}, Lrx/internal/operators/OnSubscribeAmb;->amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable$OnSubscribe;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 384
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "o6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p6, "o7":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static/range {p0 .. p6}, Lrx/internal/operators/OnSubscribeAmb;->amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable$OnSubscribe;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 418
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "o6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p6, "o7":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p7, "o8":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static/range {p0 .. p7}, Lrx/internal/operators/OnSubscribeAmb;->amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable$OnSubscribe;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 454
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "o6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p6, "o7":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p7, "o8":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p8, "o9":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static/range {p0 .. p8}, Lrx/internal/operators/OnSubscribeAmb;->amb(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable$OnSubscribe;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final combineLatest(Ljava/util/List;Lrx/functions/FuncN;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<+",
            "Lrx/Observable",
            "<+TT;>;>;",
            "Lrx/functions/FuncN",
            "<+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 749
    .local p0, "sources":Ljava/util/List;, "Ljava/util/List<+Lrx/Observable<+TT;>;>;"
    .local p1, "combineFunction":Lrx/functions/FuncN;, "Lrx/functions/FuncN<+TR;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeCombineLatest;

    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OnSubscribeCombineLatest;-><init>(Ljava/util/List;Lrx/functions/FuncN;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final combineLatest(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func9;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "T9:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/Observable",
            "<+TT4;>;",
            "Lrx/Observable",
            "<+TT5;>;",
            "Lrx/Observable",
            "<+TT6;>;",
            "Lrx/Observable",
            "<+TT7;>;",
            "Lrx/Observable",
            "<+TT8;>;",
            "Lrx/Observable",
            "<+TT9;>;",
            "Lrx/functions/Func9",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;-TT9;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 725
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT4;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT5;>;"
    .local p5, "o6":Lrx/Observable;, "Lrx/Observable<+TT6;>;"
    .local p6, "o7":Lrx/Observable;, "Lrx/Observable<+TT7;>;"
    .local p7, "o8":Lrx/Observable;, "Lrx/Observable<+TT8;>;"
    .local p8, "o9":Lrx/Observable;, "Lrx/Observable<+TT9;>;"
    .local p9, "combineFunction":Lrx/functions/Func9;, "Lrx/functions/Func9<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;-TT9;+TR;>;"
    const/16 v0, 0x9

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    const/4 v1, 0x7

    aput-object p7, v0, v1

    const/16 v1, 0x8

    aput-object p8, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p9}, Lrx/functions/Functions;->fromFunc(Lrx/functions/Func9;)Lrx/functions/FuncN;

    move-result-object v1

    invoke-static {v0, v1}, Lrx/Observable;->combineLatest(Ljava/util/List;Lrx/functions/FuncN;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final combineLatest(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func8;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/Observable",
            "<+TT4;>;",
            "Lrx/Observable",
            "<+TT5;>;",
            "Lrx/Observable",
            "<+TT6;>;",
            "Lrx/Observable",
            "<+TT7;>;",
            "Lrx/Observable",
            "<+TT8;>;",
            "Lrx/functions/Func8",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 683
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT4;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT5;>;"
    .local p5, "o6":Lrx/Observable;, "Lrx/Observable<+TT6;>;"
    .local p6, "o7":Lrx/Observable;, "Lrx/Observable<+TT7;>;"
    .local p7, "o8":Lrx/Observable;, "Lrx/Observable<+TT8;>;"
    .local p8, "combineFunction":Lrx/functions/Func8;, "Lrx/functions/Func8<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;+TR;>;"
    const/16 v0, 0x8

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    const/4 v1, 0x7

    aput-object p7, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p8}, Lrx/functions/Functions;->fromFunc(Lrx/functions/Func8;)Lrx/functions/FuncN;

    move-result-object v1

    invoke-static {v0, v1}, Lrx/Observable;->combineLatest(Ljava/util/List;Lrx/functions/FuncN;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final combineLatest(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func7;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/Observable",
            "<+TT4;>;",
            "Lrx/Observable",
            "<+TT5;>;",
            "Lrx/Observable",
            "<+TT6;>;",
            "Lrx/Observable",
            "<+TT7;>;",
            "Lrx/functions/Func7",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 644
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT4;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT5;>;"
    .local p5, "o6":Lrx/Observable;, "Lrx/Observable<+TT6;>;"
    .local p6, "o7":Lrx/Observable;, "Lrx/Observable<+TT7;>;"
    .local p7, "combineFunction":Lrx/functions/Func7;, "Lrx/functions/Func7<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;+TR;>;"
    const/4 v0, 0x7

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p7}, Lrx/functions/Functions;->fromFunc(Lrx/functions/Func7;)Lrx/functions/FuncN;

    move-result-object v1

    invoke-static {v0, v1}, Lrx/Observable;->combineLatest(Ljava/util/List;Lrx/functions/FuncN;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final combineLatest(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func6;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/Observable",
            "<+TT4;>;",
            "Lrx/Observable",
            "<+TT5;>;",
            "Lrx/Observable",
            "<+TT6;>;",
            "Lrx/functions/Func6",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 607
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT4;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT5;>;"
    .local p5, "o6":Lrx/Observable;, "Lrx/Observable<+TT6;>;"
    .local p6, "combineFunction":Lrx/functions/Func6;, "Lrx/functions/Func6<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;+TR;>;"
    const/4 v0, 0x6

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p6}, Lrx/functions/Functions;->fromFunc(Lrx/functions/Func6;)Lrx/functions/FuncN;

    move-result-object v1

    invoke-static {v0, v1}, Lrx/Observable;->combineLatest(Ljava/util/List;Lrx/functions/FuncN;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final combineLatest(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func5;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/Observable",
            "<+TT4;>;",
            "Lrx/Observable",
            "<+TT5;>;",
            "Lrx/functions/Func5",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 572
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT4;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT5;>;"
    .local p5, "combineFunction":Lrx/functions/Func5;, "Lrx/functions/Func5<-TT1;-TT2;-TT3;-TT4;-TT5;+TR;>;"
    const/4 v0, 0x5

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p5}, Lrx/functions/Functions;->fromFunc(Lrx/functions/Func5;)Lrx/functions/FuncN;

    move-result-object v1

    invoke-static {v0, v1}, Lrx/Observable;->combineLatest(Ljava/util/List;Lrx/functions/FuncN;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final combineLatest(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func4;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/Observable",
            "<+TT4;>;",
            "Lrx/functions/Func4",
            "<-TT1;-TT2;-TT3;-TT4;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 539
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT4;>;"
    .local p4, "combineFunction":Lrx/functions/Func4;, "Lrx/functions/Func4<-TT1;-TT2;-TT3;-TT4;+TR;>;"
    const/4 v0, 0x4

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p4}, Lrx/functions/Functions;->fromFunc(Lrx/functions/Func4;)Lrx/functions/FuncN;

    move-result-object v1

    invoke-static {v0, v1}, Lrx/Observable;->combineLatest(Ljava/util/List;Lrx/functions/FuncN;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final combineLatest(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func3;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/functions/Func3",
            "<-TT1;-TT2;-TT3;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 508
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "combineFunction":Lrx/functions/Func3;, "Lrx/functions/Func3<-TT1;-TT2;-TT3;+TR;>;"
    const/4 v0, 0x3

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p3}, Lrx/functions/Functions;->fromFunc(Lrx/functions/Func3;)Lrx/functions/FuncN;

    move-result-object v1

    invoke-static {v0, v1}, Lrx/Observable;->combineLatest(Ljava/util/List;Lrx/functions/FuncN;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final combineLatest(Lrx/Observable;Lrx/Observable;Lrx/functions/Func2;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/functions/Func2",
            "<-TT1;-TT2;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 480
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "combineFunction":Lrx/functions/Func2;, "Lrx/functions/Func2<-TT1;-TT2;+TR;>;"
    const/4 v0, 0x2

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p2}, Lrx/functions/Functions;->fromFunc(Lrx/functions/Func2;)Lrx/functions/FuncN;

    move-result-object v1

    invoke-static {v0, v1}, Lrx/Observable;->combineLatest(Ljava/util/List;Lrx/functions/FuncN;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final concat(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+",
            "Lrx/Observable",
            "<+TT;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 769
    .local p0, "observables":Lrx/Observable;, "Lrx/Observable<+Lrx/Observable<+TT;>;>;"
    invoke-static {}, Lrx/internal/operators/OperatorConcat;->instance()Lrx/internal/operators/OperatorConcat;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 791
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->concat(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final concat(Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 815
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1, p2}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->concat(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final concat(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 841
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1, p2, p3}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->concat(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final concat(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 869
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1, p2, p3, p4}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->concat(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final concat(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 899
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "t6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static/range {p0 .. p5}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->concat(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final concat(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 931
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "t6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p6, "t7":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static/range {p0 .. p6}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->concat(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final concat(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 965
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "t6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p6, "t7":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p7, "t8":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static/range {p0 .. p7}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->concat(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final concat(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1001
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "t6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p6, "t7":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p7, "t8":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p8, "t9":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static/range {p0 .. p8}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->concat(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final create(Lrx/Observable$OnSubscribe;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable$OnSubscribe",
            "<TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, "f":Lrx/Observable$OnSubscribe;, "Lrx/Observable$OnSubscribe<TT;>;"
    new-instance v0, Lrx/Observable;

    sget-object v1, Lrx/Observable;->hook:Lrx/plugins/RxJavaObservableExecutionHook;

    invoke-virtual {v1, p0}, Lrx/plugins/RxJavaObservableExecutionHook;->onCreate(Lrx/Observable$OnSubscribe;)Lrx/Observable$OnSubscribe;

    move-result-object v1

    invoke-direct {v0, v1}, Lrx/Observable;-><init>(Lrx/Observable$OnSubscribe;)V

    return-object v0
.end method

.method public static final defer(Lrx/functions/Func0;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func0",
            "<",
            "Lrx/Observable",
            "<TT;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1029
    .local p0, "observableFactory":Lrx/functions/Func0;, "Lrx/functions/Func0<Lrx/Observable<TT;>;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeDefer;

    invoke-direct {v0, p0}, Lrx/internal/operators/OnSubscribeDefer;-><init>(Lrx/functions/Func0;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final empty()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1058
    sget-object v0, Lrx/Observable;->EMPTY:Lrx/Observable;

    return-object v0
.end method

.method public static final error(Ljava/lang/Throwable;)Lrx/Observable;
    .locals 1
    .param p0, "exception"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Throwable;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1080
    new-instance v0, Lrx/Observable$ThrowObservable;

    invoke-direct {v0, p0}, Lrx/Observable$ThrowObservable;-><init>(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static final from(Ljava/lang/Iterable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1188
    .local p0, "iterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TT;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeFromIterable;

    invoke-direct {v0, p0}, Lrx/internal/operators/OnSubscribeFromIterable;-><init>(Ljava/lang/Iterable;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final from(Ljava/util/concurrent/Future;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1107
    .local p0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<+TT;>;"
    invoke-static {p0}, Lrx/internal/operators/OnSubscribeToObservableFuture;->toObservableFuture(Ljava/util/concurrent/Future;)Lrx/Observable$OnSubscribe;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final from(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future",
            "<+TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1138
    .local p0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<+TT;>;"
    invoke-static {p0, p1, p2, p3}, Lrx/internal/operators/OnSubscribeToObservableFuture;->toObservableFuture(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)Lrx/Observable$OnSubscribe;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final from(Ljava/util/concurrent/Future;Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future",
            "<+TT;>;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1167
    .local p0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<+TT;>;"
    invoke-static {p0}, Lrx/internal/operators/OnSubscribeToObservableFuture;->toObservableFuture(Ljava/util/concurrent/Future;)Lrx/Observable$OnSubscribe;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final from([Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1208
    .local p0, "array":[Ljava/lang/Object;, "[TT;"
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final interval(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 2
    .param p0, "interval"    # J
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1228
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lrx/Observable;->interval(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final interval(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 8
    .param p0, "interval"    # J
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p3, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1251
    new-instance v1, Lrx/internal/operators/OnSubscribeTimerPeriodically;

    move-wide v2, p0

    move-wide v4, p0

    move-object v6, p2

    move-object v7, p3

    invoke-direct/range {v1 .. v7}, Lrx/internal/operators/OnSubscribeTimerPeriodically;-><init>(JJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-static {v1}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final just(Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1279
    .local p0, "value":Ljava/lang/Object;, "TT;"
    invoke-static {p0}, Lrx/internal/util/ScalarSynchronousObservable;->create(Ljava/lang/Object;)Lrx/internal/util/ScalarSynchronousObservable;

    move-result-object v0

    return-object v0
.end method

.method public static final just(Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1303
    .local p0, "t1":Ljava/lang/Object;, "TT;"
    .local p1, "t2":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1329
    .local p0, "t1":Ljava/lang/Object;, "TT;"
    .local p1, "t2":Ljava/lang/Object;, "TT;"
    .local p2, "t3":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1357
    .local p0, "t1":Ljava/lang/Object;, "TT;"
    .local p1, "t2":Ljava/lang/Object;, "TT;"
    .local p2, "t3":Ljava/lang/Object;, "TT;"
    .local p3, "t4":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1387
    .local p0, "t1":Ljava/lang/Object;, "TT;"
    .local p1, "t2":Ljava/lang/Object;, "TT;"
    .local p2, "t3":Ljava/lang/Object;, "TT;"
    .local p3, "t4":Ljava/lang/Object;, "TT;"
    .local p4, "t5":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1419
    .local p0, "t1":Ljava/lang/Object;, "TT;"
    .local p1, "t2":Ljava/lang/Object;, "TT;"
    .local p2, "t3":Ljava/lang/Object;, "TT;"
    .local p3, "t4":Ljava/lang/Object;, "TT;"
    .local p4, "t5":Ljava/lang/Object;, "TT;"
    .local p5, "t6":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1453
    .local p0, "t1":Ljava/lang/Object;, "TT;"
    .local p1, "t2":Ljava/lang/Object;, "TT;"
    .local p2, "t3":Ljava/lang/Object;, "TT;"
    .local p3, "t4":Ljava/lang/Object;, "TT;"
    .local p4, "t5":Ljava/lang/Object;, "TT;"
    .local p5, "t6":Ljava/lang/Object;, "TT;"
    .local p6, "t7":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1489
    .local p0, "t1":Ljava/lang/Object;, "TT;"
    .local p1, "t2":Ljava/lang/Object;, "TT;"
    .local p2, "t3":Ljava/lang/Object;, "TT;"
    .local p3, "t4":Ljava/lang/Object;, "TT;"
    .local p4, "t5":Ljava/lang/Object;, "TT;"
    .local p5, "t6":Ljava/lang/Object;, "TT;"
    .local p6, "t7":Ljava/lang/Object;, "TT;"
    .local p7, "t8":Ljava/lang/Object;, "TT;"
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    const/4 v1, 0x7

    aput-object p7, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1527
    .local p0, "t1":Ljava/lang/Object;, "TT;"
    .local p1, "t2":Ljava/lang/Object;, "TT;"
    .local p2, "t3":Ljava/lang/Object;, "TT;"
    .local p3, "t4":Ljava/lang/Object;, "TT;"
    .local p4, "t5":Ljava/lang/Object;, "TT;"
    .local p5, "t6":Ljava/lang/Object;, "TT;"
    .local p6, "t7":Ljava/lang/Object;, "TT;"
    .local p7, "t8":Ljava/lang/Object;, "TT;"
    .local p8, "t9":Ljava/lang/Object;, "TT;"
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    const/4 v1, 0x7

    aput-object p7, v0, v1

    const/16 v1, 0x8

    aput-object p8, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1567
    .local p0, "t1":Ljava/lang/Object;, "TT;"
    .local p1, "t2":Ljava/lang/Object;, "TT;"
    .local p2, "t3":Ljava/lang/Object;, "TT;"
    .local p3, "t4":Ljava/lang/Object;, "TT;"
    .local p4, "t5":Ljava/lang/Object;, "TT;"
    .local p5, "t6":Ljava/lang/Object;, "TT;"
    .local p6, "t7":Ljava/lang/Object;, "TT;"
    .local p7, "t8":Ljava/lang/Object;, "TT;"
    .local p8, "t9":Ljava/lang/Object;, "TT;"
    .local p9, "t10":Ljava/lang/Object;, "TT;"
    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    const/4 v1, 0x7

    aput-object p7, v0, v1

    const/16 v1, 0x8

    aput-object p8, v0, v1

    const/16 v1, 0x9

    aput-object p9, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method private final mapNotification(Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func0;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+TR;>;",
            "Lrx/functions/Func1",
            "<-",
            "Ljava/lang/Throwable;",
            "+TR;>;",
            "Lrx/functions/Func0",
            "<+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 5117
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onNext":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TR;>;"
    .local p2, "onError":Lrx/functions/Func1;, "Lrx/functions/Func1<-Ljava/lang/Throwable;+TR;>;"
    .local p3, "onCompleted":Lrx/functions/Func0;, "Lrx/functions/Func0<+TR;>;"
    new-instance v0, Lrx/internal/operators/OperatorMapNotification;

    invoke-direct {v0, p1, p2, p3}, Lrx/internal/operators/OperatorMapNotification;-><init>(Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func0;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final merge(Ljava/lang/Iterable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lrx/Observable",
            "<+TT;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1589
    .local p0, "sequences":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lrx/Observable<+TT;>;>;"
    invoke-static {p0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final merge(Ljava/lang/Iterable;I)Lrx/Observable;
    .locals 1
    .param p1, "maxConcurrent"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lrx/Observable",
            "<+TT;>;>;I)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1616
    .local p0, "sequences":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lrx/Observable<+TT;>;>;"
    invoke-static {p0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p1}, Lrx/Observable;->merge(Lrx/Observable;I)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final merge(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+",
            "Lrx/Observable",
            "<+TT;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1639
    .local p0, "source":Lrx/Observable;, "Lrx/Observable<+Lrx/Observable<+TT;>;>;"
    const/4 v0, 0x0

    invoke-static {v0}, Lrx/internal/operators/OperatorMerge;->instance(Z)Lrx/internal/operators/OperatorMerge;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final merge(Lrx/Observable;I)Lrx/Observable;
    .locals 1
    .param p1, "maxConcurrent"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+",
            "Lrx/Observable",
            "<+TT;>;>;I)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1667
    .local p0, "source":Lrx/Observable;, "Lrx/Observable<+Lrx/Observable<+TT;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorMergeMaxConcurrent;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorMergeMaxConcurrent;-><init>(I)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final merge(Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1691
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    const/4 v0, 0x2

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final merge(Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1717
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    const/4 v0, 0x3

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final merge(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1745
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    const/4 v0, 0x4

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final merge(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1775
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    const/4 v0, 0x5

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final merge(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1807
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "t6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    const/4 v0, 0x6

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final merge(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1841
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "t6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p6, "t7":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    const/4 v0, 0x7

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final merge(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1877
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "t6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p6, "t7":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p7, "t8":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    const/16 v0, 0x8

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    const/4 v1, 0x7

    aput-object p7, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final merge(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1915
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "t6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p6, "t7":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p7, "t8":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p8, "t9":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    const/16 v0, 0x9

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    const/4 v1, 0x7

    aput-object p7, v0, v1

    const/16 v1, 0x8

    aput-object p8, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final merge([Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1936
    .local p0, "sequences":[Lrx/Observable;, "[Lrx/Observable<+TT;>;"
    invoke-static {p0}, Lrx/Observable;->from([Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final mergeDelayError(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+",
            "Lrx/Observable",
            "<+TT;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1964
    .local p0, "source":Lrx/Observable;, "Lrx/Observable<+Lrx/Observable<+TT;>;>;"
    const/4 v0, 0x1

    invoke-static {v0}, Lrx/internal/operators/OperatorMerge;->instance(Z)Lrx/internal/operators/OperatorMerge;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final mergeDelayError(Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1993
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->mergeDelayError(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final mergeDelayError(Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 2025
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1, p2}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->mergeDelayError(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final mergeDelayError(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 2059
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1, p2, p3}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->mergeDelayError(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final mergeDelayError(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 2095
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1, p2, p3, p4}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->mergeDelayError(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final mergeDelayError(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 2133
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "t6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static/range {p0 .. p5}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->mergeDelayError(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final mergeDelayError(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 2174
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "t6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p6, "t7":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static/range {p0 .. p6}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->mergeDelayError(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final mergeDelayError(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 2217
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "t6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p6, "t7":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p7, "t8":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static/range {p0 .. p7}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->mergeDelayError(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final mergeDelayError(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 2261
    .local p0, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "t2":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "t3":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p3, "t4":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p4, "t5":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p5, "t6":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p6, "t7":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p7, "t8":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p8, "t9":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static/range {p0 .. p8}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->mergeDelayError(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final never()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 2298
    new-instance v0, Lrx/Observable$NeverObservable;

    invoke-direct {v0}, Lrx/Observable$NeverObservable;-><init>()V

    return-object v0
.end method

.method public static final range(II)Lrx/Observable;
    .locals 2
    .param p0, "start"    # I
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2321
    if-gez p1, :cond_0

    .line 2322
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Count can not be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2324
    :cond_0
    if-nez p1, :cond_1

    .line 2325
    invoke-static {}, Lrx/Observable;->empty()Lrx/Observable;

    move-result-object v0

    .line 2333
    :goto_0
    return-object v0

    .line 2327
    :cond_1
    const v0, 0x7fffffff

    sub-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x1

    if-le p0, v0, :cond_2

    .line 2328
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "start + count can not exceed Integer.MAX_VALUE"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2330
    :cond_2
    const/4 v0, 0x1

    if-ne p1, v0, :cond_3

    .line 2331
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    goto :goto_0

    .line 2333
    :cond_3
    new-instance v0, Lrx/internal/operators/OnSubscribeRange;

    add-int/lit8 v1, p1, -0x1

    add-int/2addr v1, p0

    invoke-direct {v0, p0, v1}, Lrx/internal/operators/OnSubscribeRange;-><init>(II)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public static final range(IILrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p0, "start"    # I
    .param p1, "count"    # I
    .param p2, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2356
    invoke-static {p0, p1}, Lrx/Observable;->range(II)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0, p2}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final sequenceEqual(Lrx/Observable;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2379
    .local p0, "first":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "second":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    new-instance v0, Lrx/Observable$3;

    invoke-direct {v0}, Lrx/Observable$3;-><init>()V

    invoke-static {p0, p1, v0}, Lrx/Observable;->sequenceEqual(Lrx/Observable;Lrx/Observable;Lrx/functions/Func2;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final sequenceEqual(Lrx/Observable;Lrx/Observable;Lrx/functions/Func2;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/functions/Func2",
            "<-TT;-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2414
    .local p0, "first":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p1, "second":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    .local p2, "equality":Lrx/functions/Func2;, "Lrx/functions/Func2<-TT;-TT;Ljava/lang/Boolean;>;"
    invoke-static {p0, p1, p2}, Lrx/internal/operators/OperatorSequenceEqual;->sequenceEqual(Lrx/Observable;Lrx/Observable;Lrx/functions/Func2;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final switchOnNext(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+",
            "Lrx/Observable",
            "<+TT;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 2440
    .local p0, "sequenceOfSequences":Lrx/Observable;, "Lrx/Observable<+Lrx/Observable<+TT;>;>;"
    invoke-static {}, Lrx/internal/operators/OperatorSwitch;->instance()Lrx/internal/operators/OperatorSwitch;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final timer(JJLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 6
    .param p0, "initialDelay"    # J
    .param p2, "period"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2467
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v5

    move-wide v0, p0

    move-wide v2, p2

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lrx/Observable;->timer(JJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final timer(JJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 8
    .param p0, "initialDelay"    # J
    .param p2, "period"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2496
    new-instance v1, Lrx/internal/operators/OnSubscribeTimerPeriodically;

    move-wide v2, p0

    move-wide v4, p2

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Lrx/internal/operators/OnSubscribeTimerPeriodically;-><init>(JJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-static {v1}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final timer(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 2
    .param p0, "delay"    # J
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2519
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lrx/Observable;->timer(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final timer(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 2
    .param p0, "delay"    # J
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p3, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2546
    new-instance v0, Lrx/internal/operators/OnSubscribeTimerOnce;

    invoke-direct {v0, p0, p1, p2, p3}, Lrx/internal/operators/OnSubscribeTimerOnce;-><init>(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final using(Lrx/functions/Func0;Lrx/functions/Func1;Lrx/functions/Action1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "Resource:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func0",
            "<TResource;>;",
            "Lrx/functions/Func1",
            "<-TResource;+",
            "Lrx/Observable",
            "<+TT;>;>;",
            "Lrx/functions/Action1",
            "<-TResource;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 2571
    .local p0, "resourceFactory":Lrx/functions/Func0;, "Lrx/functions/Func0<TResource;>;"
    .local p1, "observableFactory":Lrx/functions/Func1;, "Lrx/functions/Func1<-TResource;+Lrx/Observable<+TT;>;>;"
    .local p2, "disposeAction":Lrx/functions/Action1;, "Lrx/functions/Action1<-TResource;>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lrx/Observable;->using(Lrx/functions/Func0;Lrx/functions/Func1;Lrx/functions/Action1;Z)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final using(Lrx/functions/Func0;Lrx/functions/Func1;Lrx/functions/Action1;Z)Lrx/Observable;
    .locals 1
    .param p3, "disposeEagerly"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "Resource:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func0",
            "<TResource;>;",
            "Lrx/functions/Func1",
            "<-TResource;+",
            "Lrx/Observable",
            "<+TT;>;>;",
            "Lrx/functions/Action1",
            "<-TResource;>;Z)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lrx/annotations/Experimental;
    .end annotation

    .prologue
    .line 2608
    .local p0, "resourceFactory":Lrx/functions/Func0;, "Lrx/functions/Func0<TResource;>;"
    .local p1, "observableFactory":Lrx/functions/Func1;, "Lrx/functions/Func1<-TResource;+Lrx/Observable<+TT;>;>;"
    .local p2, "disposeAction":Lrx/functions/Action1;, "Lrx/functions/Action1<-TResource;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeUsing;

    invoke-direct {v0, p0, p1, p2, p3}, Lrx/internal/operators/OnSubscribeUsing;-><init>(Lrx/functions/Func0;Lrx/functions/Func1;Lrx/functions/Action1;Z)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final zip(Ljava/lang/Iterable;Lrx/functions/FuncN;)Lrx/Observable;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+",
            "Lrx/Observable",
            "<*>;>;",
            "Lrx/functions/FuncN",
            "<+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 2638
    .local p0, "ws":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lrx/Observable<*>;>;"
    .local p1, "zipFunction":Lrx/functions/FuncN;, "Lrx/functions/FuncN<+TR;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 2639
    .local v2, "os":Ljava/util/List;, "Ljava/util/List<Lrx/Observable<*>;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lrx/Observable;

    .line 2640
    .local v1, "o":Lrx/Observable;, "Lrx/Observable<*>;"
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2642
    .end local v1    # "o":Lrx/Observable;, "Lrx/Observable<*>;"
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lrx/Observable;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v3

    new-instance v4, Lrx/internal/operators/OperatorZip;

    invoke-direct {v4, p1}, Lrx/internal/operators/OperatorZip;-><init>(Lrx/functions/FuncN;)V

    invoke-virtual {v3, v4}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v3

    return-object v3
.end method

.method public static final zip(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func9;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "T9:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/Observable",
            "<+TT4;>;",
            "Lrx/Observable",
            "<+TT5;>;",
            "Lrx/Observable",
            "<+TT6;>;",
            "Lrx/Observable",
            "<+TT7;>;",
            "Lrx/Observable",
            "<+TT8;>;",
            "Lrx/Observable",
            "<+TT9;>;",
            "Lrx/functions/Func9",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;-TT9;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 3006
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT4;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT5;>;"
    .local p5, "o6":Lrx/Observable;, "Lrx/Observable<+TT6;>;"
    .local p6, "o7":Lrx/Observable;, "Lrx/Observable<+TT7;>;"
    .local p7, "o8":Lrx/Observable;, "Lrx/Observable<+TT8;>;"
    .local p8, "o9":Lrx/Observable;, "Lrx/Observable<+TT9;>;"
    .local p9, "zipFunction":Lrx/functions/Func9;, "Lrx/functions/Func9<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;-TT9;+TR;>;"
    const/16 v0, 0x9

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    const/4 v1, 0x7

    aput-object p7, v0, v1

    const/16 v1, 0x8

    aput-object p8, v0, v1

    invoke-static {v0}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/internal/operators/OperatorZip;

    invoke-direct {v1, p9}, Lrx/internal/operators/OperatorZip;-><init>(Lrx/functions/Func9;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final zip(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func8;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/Observable",
            "<+TT4;>;",
            "Lrx/Observable",
            "<+TT5;>;",
            "Lrx/Observable",
            "<+TT6;>;",
            "Lrx/Observable",
            "<+TT7;>;",
            "Lrx/Observable",
            "<+TT8;>;",
            "Lrx/functions/Func8",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 2958
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT4;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT5;>;"
    .local p5, "o6":Lrx/Observable;, "Lrx/Observable<+TT6;>;"
    .local p6, "o7":Lrx/Observable;, "Lrx/Observable<+TT7;>;"
    .local p7, "o8":Lrx/Observable;, "Lrx/Observable<+TT8;>;"
    .local p8, "zipFunction":Lrx/functions/Func8;, "Lrx/functions/Func8<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;+TR;>;"
    const/16 v0, 0x8

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    const/4 v1, 0x7

    aput-object p7, v0, v1

    invoke-static {v0}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/internal/operators/OperatorZip;

    invoke-direct {v1, p8}, Lrx/internal/operators/OperatorZip;-><init>(Lrx/functions/Func8;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final zip(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func7;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/Observable",
            "<+TT4;>;",
            "Lrx/Observable",
            "<+TT5;>;",
            "Lrx/Observable",
            "<+TT6;>;",
            "Lrx/Observable",
            "<+TT7;>;",
            "Lrx/functions/Func7",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 2912
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT4;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT5;>;"
    .local p5, "o6":Lrx/Observable;, "Lrx/Observable<+TT6;>;"
    .local p6, "o7":Lrx/Observable;, "Lrx/Observable<+TT7;>;"
    .local p7, "zipFunction":Lrx/functions/Func7;, "Lrx/functions/Func7<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;+TR;>;"
    const/4 v0, 0x7

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    const/4 v1, 0x6

    aput-object p6, v0, v1

    invoke-static {v0}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/internal/operators/OperatorZip;

    invoke-direct {v1, p7}, Lrx/internal/operators/OperatorZip;-><init>(Lrx/functions/Func7;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final zip(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func6;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/Observable",
            "<+TT4;>;",
            "Lrx/Observable",
            "<+TT5;>;",
            "Lrx/Observable",
            "<+TT6;>;",
            "Lrx/functions/Func6",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 2868
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT4;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT5;>;"
    .local p5, "o6":Lrx/Observable;, "Lrx/Observable<+TT6;>;"
    .local p6, "zipFunction":Lrx/functions/Func6;, "Lrx/functions/Func6<-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;+TR;>;"
    const/4 v0, 0x6

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    const/4 v1, 0x5

    aput-object p5, v0, v1

    invoke-static {v0}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/internal/operators/OperatorZip;

    invoke-direct {v1, p6}, Lrx/internal/operators/OperatorZip;-><init>(Lrx/functions/Func6;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final zip(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func5;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/Observable",
            "<+TT4;>;",
            "Lrx/Observable",
            "<+TT5;>;",
            "Lrx/functions/Func5",
            "<-TT1;-TT2;-TT3;-TT4;-TT5;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 2826
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT4;>;"
    .local p4, "o5":Lrx/Observable;, "Lrx/Observable<+TT5;>;"
    .local p5, "zipFunction":Lrx/functions/Func5;, "Lrx/functions/Func5<-TT1;-TT2;-TT3;-TT4;-TT5;+TR;>;"
    const/4 v0, 0x5

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    const/4 v1, 0x4

    aput-object p4, v0, v1

    invoke-static {v0}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/internal/operators/OperatorZip;

    invoke-direct {v1, p5}, Lrx/internal/operators/OperatorZip;-><init>(Lrx/functions/Func5;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final zip(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func4;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/Observable",
            "<+TT4;>;",
            "Lrx/functions/Func4",
            "<-TT1;-TT2;-TT3;-TT4;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 2786
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "o4":Lrx/Observable;, "Lrx/Observable<+TT4;>;"
    .local p4, "zipFunction":Lrx/functions/Func4;, "Lrx/functions/Func4<-TT1;-TT2;-TT3;-TT4;+TR;>;"
    const/4 v0, 0x4

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    const/4 v1, 0x3

    aput-object p3, v0, v1

    invoke-static {v0}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/internal/operators/OperatorZip;

    invoke-direct {v1, p4}, Lrx/internal/operators/OperatorZip;-><init>(Lrx/functions/Func4;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final zip(Lrx/Observable;Lrx/Observable;Lrx/Observable;Lrx/functions/Func3;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/Observable",
            "<+TT3;>;",
            "Lrx/functions/Func3",
            "<-TT1;-TT2;-TT3;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 2748
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "o3":Lrx/Observable;, "Lrx/Observable<+TT3;>;"
    .local p3, "zipFunction":Lrx/functions/Func3;, "Lrx/functions/Func3<-TT1;-TT2;-TT3;+TR;>;"
    const/4 v0, 0x3

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const/4 v1, 0x2

    aput-object p2, v0, v1

    invoke-static {v0}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/internal/operators/OperatorZip;

    invoke-direct {v1, p3}, Lrx/internal/operators/OperatorZip;-><init>(Lrx/functions/Func3;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final zip(Lrx/Observable;Lrx/Observable;Lrx/functions/Func2;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT1;>;",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/functions/Func2",
            "<-TT1;-TT2;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 2712
    .local p0, "o1":Lrx/Observable;, "Lrx/Observable<+TT1;>;"
    .local p1, "o2":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "zipFunction":Lrx/functions/Func2;, "Lrx/functions/Func2<-TT1;-TT2;+TR;>;"
    const/4 v0, 0x2

    new-array v0, v0, [Lrx/Observable;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    invoke-static {v0}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/internal/operators/OperatorZip;

    invoke-direct {v1, p2}, Lrx/internal/operators/OperatorZip;-><init>(Lrx/functions/Func2;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public static final zip(Lrx/Observable;Lrx/functions/FuncN;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+",
            "Lrx/Observable",
            "<*>;>;",
            "Lrx/functions/FuncN",
            "<+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 2672
    .local p0, "ws":Lrx/Observable;, "Lrx/Observable<+Lrx/Observable<*>;>;"
    .local p1, "zipFunction":Lrx/functions/FuncN;, "Lrx/functions/FuncN<+TR;>;"
    invoke-virtual {p0}, Lrx/Observable;->toList()Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/Observable$4;

    invoke-direct {v1}, Lrx/Observable$4;-><init>()V

    invoke-virtual {v0, v1}, Lrx/Observable;->map(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/internal/operators/OperatorZip;

    invoke-direct {v1, p1}, Lrx/internal/operators/OperatorZip;-><init>(Lrx/functions/FuncN;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public final all(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3026
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "predicate":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;Ljava/lang/Boolean;>;"
    new-instance v0, Lrx/internal/operators/OperatorAll;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorAll;-><init>(Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final ambWith(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3046
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1}, Lrx/Observable;->amb(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final asObservable()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3061
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/internal/operators/OperatorAsObservable;->instance()Lrx/internal/operators/OperatorAsObservable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(I)Lrx/Observable;
    .locals 1
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 3109
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0, p1, p1}, Lrx/Observable;->buffer(II)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(II)Lrx/Observable;
    .locals 1
    .param p1, "count"    # I
    .param p2, "skip"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 3135
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorBufferWithSize;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorBufferWithSize;-><init>(II)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(JJLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "timeshift"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 3165
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v7

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    invoke-virtual/range {v1 .. v7}, Lrx/Observable;->buffer(JJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(JJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "timeshift"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 3197
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v1, Lrx/internal/operators/OperatorBufferWithTime;

    const v7, 0x7fffffff

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    move-object v8, p6

    invoke-direct/range {v1 .. v8}, Lrx/internal/operators/OperatorBufferWithTime;-><init>(JJLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)V

    invoke-virtual {p0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 7
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 3225
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    const v5, 0x7fffffff

    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v6

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    invoke-virtual/range {v1 .. v6}, Lrx/Observable;->buffer(JLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(JLjava/util/concurrent/TimeUnit;I)Lrx/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "I)",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 3257
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v1, Lrx/internal/operators/OperatorBufferWithTime;

    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v8

    move-wide v2, p1

    move-wide v4, p1

    move-object v6, p3

    move v7, p4

    invoke-direct/range {v1 .. v8}, Lrx/internal/operators/OperatorBufferWithTime;-><init>(JJLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)V

    invoke-virtual {p0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(JLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)Lrx/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "count"    # I
    .param p5, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "I",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 3292
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v1, Lrx/internal/operators/OperatorBufferWithTime;

    move-wide v2, p1

    move-wide v4, p1

    move-object v6, p3

    move v7, p4

    move-object v8, p5

    invoke-direct/range {v1 .. v8}, Lrx/internal/operators/OperatorBufferWithTime;-><init>(JJLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)V

    invoke-virtual {p0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 3323
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p1

    move-object v6, p3

    move-object v7, p4

    invoke-virtual/range {v1 .. v7}, Lrx/Observable;->buffer(JJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<TB;>;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 3380
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "boundary":Lrx/Observable;, "Lrx/Observable<TB;>;"
    const/16 v0, 0x10

    invoke-virtual {p0, p1, v0}, Lrx/Observable;->buffer(Lrx/Observable;I)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(Lrx/Observable;I)Lrx/Observable;
    .locals 1
    .param p2, "initialCapacity"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<TB;>;I)",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 3412
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "boundary":Lrx/Observable;, "Lrx/Observable<TB;>;"
    new-instance v0, Lrx/internal/operators/OperatorBufferWithSingleObservable;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorBufferWithSingleObservable;-><init>(Lrx/Observable;I)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(Lrx/Observable;Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TOpening:",
            "Ljava/lang/Object;",
            "TClosing:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TTOpening;>;",
            "Lrx/functions/Func1",
            "<-TTOpening;+",
            "Lrx/Observable",
            "<+TTClosing;>;>;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 3350
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "bufferOpenings":Lrx/Observable;, "Lrx/Observable<+TTOpening;>;"
    .local p2, "bufferClosingSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TTOpening;+Lrx/Observable<+TTClosing;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorBufferWithStartEndObservable;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorBufferWithStartEndObservable;-><init>(Lrx/Observable;Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final buffer(Lrx/functions/Func0;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TClosing:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func0",
            "<+",
            "Lrx/Observable",
            "<+TTClosing;>;>;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 3087
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "bufferClosingSelector":Lrx/functions/Func0;, "Lrx/functions/Func0<+Lrx/Observable<+TTClosing;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorBufferWithSingleObservable;

    const/16 v1, 0x10

    invoke-direct {v0, p1, v1}, Lrx/internal/operators/OperatorBufferWithSingleObservable;-><init>(Lrx/functions/Func0;I)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final cache()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3446
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeCache;

    invoke-direct {v0, p0}, Lrx/internal/operators/OnSubscribeCache;-><init>(Lrx/Observable;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final cache(I)Lrx/Observable;
    .locals 1
    .param p1, "capacity"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3481
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeCache;

    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OnSubscribeCache;-><init>(Lrx/Observable;I)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final cast(Ljava/lang/Class;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 3502
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TR;>;"
    new-instance v0, Lrx/internal/operators/OperatorCast;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorCast;-><init>(Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final collect(Lrx/functions/Func0;Lrx/functions/Action2;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func0",
            "<TR;>;",
            "Lrx/functions/Action2",
            "<TR;-TT;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 3530
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "stateFactory":Lrx/functions/Func0;, "Lrx/functions/Func0<TR;>;"
    .local p2, "collector":Lrx/functions/Action2;, "Lrx/functions/Action2<TR;-TT;>;"
    new-instance v0, Lrx/Observable$5;

    invoke-direct {v0, p0, p2}, Lrx/Observable$5;-><init>(Lrx/Observable;Lrx/functions/Action2;)V

    .line 3546
    .local v0, "accumulator":Lrx/functions/Func2;, "Lrx/functions/Func2<TR;TT;TR;>;"
    new-instance v1, Lrx/internal/operators/OperatorScan;

    invoke-direct {v1, p1, v0}, Lrx/internal/operators/OperatorScan;-><init>(Lrx/functions/Func0;Lrx/functions/Func2;)V

    invoke-virtual {p0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v1

    invoke-virtual {v1}, Lrx/Observable;->last()Lrx/Observable;

    move-result-object v1

    return-object v1
.end method

.method public compose(Lrx/Observable$Transformer;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable$Transformer",
            "<-TT;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 187
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "transformer":Lrx/Observable$Transformer;, "Lrx/Observable$Transformer<-TT;+TR;>;"
    invoke-interface {p1, p0}, Lrx/Observable$Transformer;->call(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrx/Observable;

    return-object v0
.end method

.method public final concatMap(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<+TR;>;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 3568
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "func":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<+TR;>;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->map(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->concat(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final concatWith(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3588
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final contains(Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3608
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/Observable$6;

    invoke-direct {v0, p0, p1}, Lrx/Observable$6;-><init>(Lrx/Observable;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->exists(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final count()Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3633
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-instance v1, Lrx/Observable$7;

    invoke-direct {v1, p0}, Lrx/Observable$7;-><init>(Lrx/Observable;)V

    invoke-virtual {p0, v0, v1}, Lrx/Observable;->reduce(Ljava/lang/Object;Lrx/functions/Func2;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final countLong()Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3660
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    new-instance v1, Lrx/Observable$8;

    invoke-direct {v1, p0}, Lrx/Observable$8;-><init>(Lrx/Observable;)V

    invoke-virtual {p0, v0, v1}, Lrx/Observable;->reduce(Ljava/lang/Object;Lrx/functions/Func2;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final debounce(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3730
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/Observable;->debounce(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final debounce(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3772
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorDebounceWithTime;

    invoke-direct {v0, p1, p2, p3, p4}, Lrx/internal/operators/OperatorDebounceWithTime;-><init>(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final debounce(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<TU;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3691
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "debounceSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<TU;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorDebounceWithSelector;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorDebounceWithSelector;-><init>(Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final defaultIfEmpty(Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3792
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "defaultValue":Ljava/lang/Object;, "TT;"
    new-instance v0, Lrx/internal/operators/OperatorDefaultIfEmpty;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorDefaultIfEmpty;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delay(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 1
    .param p1, "delay"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3894
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/Observable;->delay(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delay(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 7
    .param p1, "delay"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3917
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorDelay;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lrx/internal/operators/OperatorDelay;-><init>(Lrx/Observable;JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delay(Lrx/functions/Func0;Lrx/functions/Func1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func0",
            "<+",
            "Lrx/Observable",
            "<TU;>;>;",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<TV;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3846
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "subscriptionDelay":Lrx/functions/Func0;, "Lrx/functions/Func0<+Lrx/Observable<TU;>;>;"
    .local p2, "itemDelay":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<TV;>;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->delaySubscription(Lrx/functions/Func0;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/internal/operators/OperatorDelayWithSelector;

    invoke-direct {v1, p0, p2}, Lrx/internal/operators/OperatorDelayWithSelector;-><init>(Lrx/Observable;Lrx/functions/Func1;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delay(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<TU;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3873
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "itemDelay":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<TU;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorDelayWithSelector;

    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OperatorDelayWithSelector;-><init>(Lrx/Observable;Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delaySubscription(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 1
    .param p1, "delay"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3937
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/Observable;->delaySubscription(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delaySubscription(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 7
    .param p1, "delay"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3961
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeDelaySubscription;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lrx/internal/operators/OnSubscribeDelaySubscription;-><init>(Lrx/Observable;JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final delaySubscription(Lrx/functions/Func0;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func0",
            "<+",
            "Lrx/Observable",
            "<TU;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 3982
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "subscriptionDelay":Lrx/functions/Func0;, "Lrx/functions/Func0<+Lrx/Observable<TU;>;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeDelaySubscriptionWithSelector;

    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OnSubscribeDelaySubscriptionWithSelector;-><init>(Lrx/Observable;Lrx/functions/Func0;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final dematerialize()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T2:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/Observable",
            "<TT2;>;"
        }
    .end annotation

    .prologue
    .line 4004
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/internal/operators/OperatorDematerialize;->instance()Lrx/internal/operators/OperatorDematerialize;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final distinct()Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4021
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorDistinct;

    invoke-static {}, Lrx/internal/util/UtilityFunctions;->identity()Lrx/functions/Func1;

    move-result-object v1

    invoke-direct {v0, v1}, Lrx/internal/operators/OperatorDistinct;-><init>(Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final distinct(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+TU;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4041
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "keySelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TU;>;"
    new-instance v0, Lrx/internal/operators/OperatorDistinct;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorDistinct;-><init>(Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final distinctUntilChanged()Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4059
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorDistinctUntilChanged;

    invoke-static {}, Lrx/internal/util/UtilityFunctions;->identity()Lrx/functions/Func1;

    move-result-object v1

    invoke-direct {v0, v1}, Lrx/internal/operators/OperatorDistinctUntilChanged;-><init>(Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final distinctUntilChanged(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+TU;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4080
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "keySelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TU;>;"
    new-instance v0, Lrx/internal/operators/OperatorDistinctUntilChanged;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorDistinctUntilChanged;-><init>(Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doOnCompleted(Lrx/functions/Action0;)Lrx/Observable;
    .locals 2
    .param p1, "onCompleted"    # Lrx/functions/Action0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action0;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4098
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/Observable$9;

    invoke-direct {v0, p0, p1}, Lrx/Observable$9;-><init>(Lrx/Observable;Lrx/functions/Action0;)V

    .line 4114
    .local v0, "observer":Lrx/Observer;, "Lrx/Observer<TT;>;"
    new-instance v1, Lrx/internal/operators/OperatorDoOnEach;

    invoke-direct {v1, v0}, Lrx/internal/operators/OperatorDoOnEach;-><init>(Lrx/Observer;)V

    invoke-virtual {p0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v1

    return-object v1
.end method

.method public final doOnEach(Lrx/Observer;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observer",
            "<-TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4168
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "observer":Lrx/Observer;, "Lrx/Observer<-TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorDoOnEach;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorDoOnEach;-><init>(Lrx/Observer;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doOnEach(Lrx/functions/Action1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<",
            "Lrx/Notification",
            "<-TT;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4132
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onNotification":Lrx/functions/Action1;, "Lrx/functions/Action1<Lrx/Notification<-TT;>;>;"
    new-instance v0, Lrx/Observable$10;

    invoke-direct {v0, p0, p1}, Lrx/Observable$10;-><init>(Lrx/Observable;Lrx/functions/Action1;)V

    .line 4150
    .local v0, "observer":Lrx/Observer;, "Lrx/Observer<TT;>;"
    new-instance v1, Lrx/internal/operators/OperatorDoOnEach;

    invoke-direct {v1, v0}, Lrx/internal/operators/OperatorDoOnEach;-><init>(Lrx/Observer;)V

    invoke-virtual {p0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v1

    return-object v1
.end method

.method public final doOnError(Lrx/functions/Action1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4186
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onError":Lrx/functions/Action1;, "Lrx/functions/Action1<Ljava/lang/Throwable;>;"
    new-instance v0, Lrx/Observable$11;

    invoke-direct {v0, p0, p1}, Lrx/Observable$11;-><init>(Lrx/Observable;Lrx/functions/Action1;)V

    .line 4202
    .local v0, "observer":Lrx/Observer;, "Lrx/Observer<TT;>;"
    new-instance v1, Lrx/internal/operators/OperatorDoOnEach;

    invoke-direct {v1, v0}, Lrx/internal/operators/OperatorDoOnEach;-><init>(Lrx/Observer;)V

    invoke-virtual {p0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v1

    return-object v1
.end method

.method public final doOnNext(Lrx/functions/Action1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<-TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4220
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onNext":Lrx/functions/Action1;, "Lrx/functions/Action1<-TT;>;"
    new-instance v0, Lrx/Observable$12;

    invoke-direct {v0, p0, p1}, Lrx/Observable$12;-><init>(Lrx/Observable;Lrx/functions/Action1;)V

    .line 4236
    .local v0, "observer":Lrx/Observer;, "Lrx/Observer<TT;>;"
    new-instance v1, Lrx/internal/operators/OperatorDoOnEach;

    invoke-direct {v1, v0}, Lrx/internal/operators/OperatorDoOnEach;-><init>(Lrx/Observer;)V

    invoke-virtual {p0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v1

    return-object v1
.end method

.method public final doOnRequest(Lrx/functions/Action1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<",
            "Ljava/lang/Long;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lrx/annotations/Beta;
    .end annotation

    .prologue
    .line 4255
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onRequest":Lrx/functions/Action1;, "Lrx/functions/Action1<Ljava/lang/Long;>;"
    new-instance v0, Lrx/internal/operators/OperatorDoOnRequest;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorDoOnRequest;-><init>(Lrx/functions/Action1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doOnSubscribe(Lrx/functions/Action0;)Lrx/Observable;
    .locals 1
    .param p1, "subscribe"    # Lrx/functions/Action0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action0;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4276
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorDoOnSubscribe;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorDoOnSubscribe;-><init>(Lrx/functions/Action0;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final doOnTerminate(Lrx/functions/Action0;)Lrx/Observable;
    .locals 2
    .param p1, "onTerminate"    # Lrx/functions/Action0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action0;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4299
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/Observable$13;

    invoke-direct {v0, p0, p1}, Lrx/Observable$13;-><init>(Lrx/Observable;Lrx/functions/Action0;)V

    .line 4316
    .local v0, "observer":Lrx/Observer;, "Lrx/Observer<TT;>;"
    new-instance v1, Lrx/internal/operators/OperatorDoOnEach;

    invoke-direct {v1, v0}, Lrx/internal/operators/OperatorDoOnEach;-><init>(Lrx/Observer;)V

    invoke-virtual {p0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v1

    return-object v1
.end method

.method public final doOnUnsubscribe(Lrx/functions/Action0;)Lrx/Observable;
    .locals 1
    .param p1, "unsubscribe"    # Lrx/functions/Action0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action0;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4337
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorDoOnUnsubscribe;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorDoOnUnsubscribe;-><init>(Lrx/functions/Action0;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final elementAt(I)Lrx/Observable;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4361
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorElementAt;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorElementAt;-><init>(I)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final elementAtOrDefault(ILjava/lang/Object;)Lrx/Observable;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4385
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p2, "defaultValue":Ljava/lang/Object;, "TT;"
    new-instance v0, Lrx/internal/operators/OperatorElementAt;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorElementAt;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final exists(Lrx/functions/Func1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4409
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "predicate":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;Ljava/lang/Boolean;>;"
    new-instance v0, Lrx/internal/operators/OperatorAny;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lrx/internal/operators/OperatorAny;-><init>(Lrx/functions/Func1;Z)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final filter(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4429
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "predicate":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;Ljava/lang/Boolean;>;"
    new-instance v0, Lrx/internal/operators/OperatorFilter;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorFilter;-><init>(Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final finallyDo(Lrx/functions/Action0;)Lrx/Observable;
    .locals 1
    .param p1, "action"    # Lrx/functions/Action0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action0;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4450
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorFinally;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorFinally;-><init>(Lrx/functions/Action0;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final first()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4468
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lrx/Observable;->take(I)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0}, Lrx/Observable;->single()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final first(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4488
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "predicate":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;Ljava/lang/Boolean;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->takeFirst(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0}, Lrx/Observable;->single()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final firstOrDefault(Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4508
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "defaultValue":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lrx/Observable;->take(I)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lrx/Observable;->singleOrDefault(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final firstOrDefault(Ljava/lang/Object;Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lrx/functions/Func1",
            "<-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4531
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "defaultValue":Ljava/lang/Object;, "TT;"
    .local p2, "predicate":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;Ljava/lang/Boolean;>;"
    invoke-virtual {p0, p2}, Lrx/Observable;->takeFirst(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lrx/Observable;->singleOrDefault(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<+TR;>;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 4554
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "func":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<+TR;>;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->map(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lrx/functions/Func1;I)Lrx/Observable;
    .locals 1
    .param p2, "maxConcurrent"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<+TR;>;>;I)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation build Lrx/annotations/Beta;
    .end annotation

    .prologue
    .line 4582
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "func":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<+TR;>;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->map(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p2}, Lrx/Observable;->merge(Lrx/Observable;I)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func0;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<+TR;>;>;",
            "Lrx/functions/Func1",
            "<-",
            "Ljava/lang/Throwable;",
            "+",
            "Lrx/Observable",
            "<+TR;>;>;",
            "Lrx/functions/Func0",
            "<+",
            "Lrx/Observable",
            "<+TR;>;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 4613
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onNext":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<+TR;>;>;"
    .local p2, "onError":Lrx/functions/Func1;, "Lrx/functions/Func1<-Ljava/lang/Throwable;+Lrx/Observable<+TR;>;>;"
    .local p3, "onCompleted":Lrx/functions/Func0;, "Lrx/functions/Func0<+Lrx/Observable<+TR;>;>;"
    invoke-direct {p0, p1, p2, p3}, Lrx/Observable;->mapNotification(Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func0;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func0;I)Lrx/Observable;
    .locals 1
    .param p4, "maxConcurrent"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<+TR;>;>;",
            "Lrx/functions/Func1",
            "<-",
            "Ljava/lang/Throwable;",
            "+",
            "Lrx/Observable",
            "<+TR;>;>;",
            "Lrx/functions/Func0",
            "<+",
            "Lrx/Observable",
            "<+TR;>;>;I)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation build Lrx/annotations/Beta;
    .end annotation

    .prologue
    .line 4648
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onNext":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<+TR;>;>;"
    .local p2, "onError":Lrx/functions/Func1;, "Lrx/functions/Func1<-Ljava/lang/Throwable;+Lrx/Observable<+TR;>;>;"
    .local p3, "onCompleted":Lrx/functions/Func0;, "Lrx/functions/Func0<+Lrx/Observable<+TR;>;>;"
    invoke-direct {p0, p1, p2, p3}, Lrx/Observable;->mapNotification(Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func0;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p4}, Lrx/Observable;->merge(Lrx/Observable;I)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lrx/functions/Func1;Lrx/functions/Func2;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<+TU;>;>;",
            "Lrx/functions/Func2",
            "<-TT;-TU;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 4676
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "collectionSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<+TU;>;>;"
    .local p2, "resultSelector":Lrx/functions/Func2;, "Lrx/functions/Func2<-TT;-TU;+TR;>;"
    new-instance v0, Lrx/internal/operators/OperatorMapPair;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorMapPair;-><init>(Lrx/functions/Func1;Lrx/functions/Func2;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMap(Lrx/functions/Func1;Lrx/functions/Func2;I)Lrx/Observable;
    .locals 1
    .param p3, "maxConcurrent"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<+TU;>;>;",
            "Lrx/functions/Func2",
            "<-TT;-TU;+TR;>;I)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation build Lrx/annotations/Beta;
    .end annotation

    .prologue
    .line 4708
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "collectionSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<+TU;>;>;"
    .local p2, "resultSelector":Lrx/functions/Func2;, "Lrx/functions/Func2<-TT;-TU;+TR;>;"
    new-instance v0, Lrx/internal/operators/OperatorMapPair;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorMapPair;-><init>(Lrx/functions/Func1;Lrx/functions/Func2;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p3}, Lrx/Observable;->merge(Lrx/Observable;I)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMapIterable(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Ljava/lang/Iterable",
            "<+TR;>;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 4731
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "collectionSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Ljava/lang/Iterable<+TR;>;>;"
    invoke-static {p1}, Lrx/internal/operators/OperatorMapPair;->convertSelector(Lrx/functions/Func1;)Lrx/functions/Func1;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->map(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->merge(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final flatMapIterable(Lrx/functions/Func1;Lrx/functions/Func2;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Ljava/lang/Iterable",
            "<+TU;>;>;",
            "Lrx/functions/Func2",
            "<-TT;-TU;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 4760
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "collectionSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Ljava/lang/Iterable<+TU;>;>;"
    .local p2, "resultSelector":Lrx/functions/Func2;, "Lrx/functions/Func2<-TT;-TU;+TR;>;"
    invoke-static {p1}, Lrx/internal/operators/OperatorMapPair;->convertSelector(Lrx/functions/Func1;)Lrx/functions/Func1;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lrx/Observable;->flatMap(Lrx/functions/Func1;Lrx/functions/Func2;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final forEach(Lrx/functions/Action1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 4781
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onNext":Lrx/functions/Action1;, "Lrx/functions/Action1<-TT;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->subscribe(Lrx/functions/Action1;)Lrx/Subscription;

    .line 4782
    return-void
.end method

.method public final forEach(Lrx/functions/Action1;Lrx/functions/Action1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<-TT;>;",
            "Lrx/functions/Action1",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4804
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onNext":Lrx/functions/Action1;, "Lrx/functions/Action1<-TT;>;"
    .local p2, "onError":Lrx/functions/Action1;, "Lrx/functions/Action1<Ljava/lang/Throwable;>;"
    invoke-virtual {p0, p1, p2}, Lrx/Observable;->subscribe(Lrx/functions/Action1;Lrx/functions/Action1;)Lrx/Subscription;

    .line 4805
    return-void
.end method

.method public final forEach(Lrx/functions/Action1;Lrx/functions/Action1;Lrx/functions/Action0;)V
    .locals 0
    .param p3, "onComplete"    # Lrx/functions/Action0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<-TT;>;",
            "Lrx/functions/Action1",
            "<",
            "Ljava/lang/Throwable;",
            ">;",
            "Lrx/functions/Action0;",
            ")V"
        }
    .end annotation

    .prologue
    .line 4829
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onNext":Lrx/functions/Action1;, "Lrx/functions/Action1<-TT;>;"
    .local p2, "onError":Lrx/functions/Action1;, "Lrx/functions/Action1<Ljava/lang/Throwable;>;"
    invoke-virtual {p0, p1, p2, p3}, Lrx/Observable;->subscribe(Lrx/functions/Action1;Lrx/functions/Action1;Lrx/functions/Action0;)Lrx/Subscription;

    .line 4830
    return-void
.end method

.method public final groupBy(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+TK;>;)",
            "Lrx/Observable",
            "<",
            "Lrx/observables/GroupedObservable",
            "<TK;TT;>;>;"
        }
    .end annotation

    .prologue
    .line 4889
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "keySelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TK;>;"
    new-instance v0, Lrx/internal/operators/OperatorGroupBy;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorGroupBy;-><init>(Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final groupBy(Lrx/functions/Func1;Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+TK;>;",
            "Lrx/functions/Func1",
            "<-TT;+TR;>;)",
            "Lrx/Observable",
            "<",
            "Lrx/observables/GroupedObservable",
            "<TK;TR;>;>;"
        }
    .end annotation

    .prologue
    .line 4861
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "keySelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TK;>;"
    .local p2, "elementSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TR;>;"
    new-instance v0, Lrx/internal/operators/OperatorGroupBy;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorGroupBy;-><init>(Lrx/functions/Func1;Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final groupJoin(Lrx/Observable;Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func2;)Lrx/Observable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T2:",
            "Ljava/lang/Object;",
            "D1:",
            "Ljava/lang/Object;",
            "D2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<TT2;>;",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<TD1;>;>;",
            "Lrx/functions/Func1",
            "<-TT2;+",
            "Lrx/Observable",
            "<TD2;>;>;",
            "Lrx/functions/Func2",
            "<-TT;-",
            "Lrx/Observable",
            "<TT2;>;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 4919
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "right":Lrx/Observable;, "Lrx/Observable<TT2;>;"
    .local p2, "leftDuration":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<TD1;>;>;"
    .local p3, "rightDuration":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT2;+Lrx/Observable<TD2;>;>;"
    .local p4, "resultSelector":Lrx/functions/Func2;, "Lrx/functions/Func2<-TT;-Lrx/Observable<TT2;>;+TR;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeGroupJoin;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lrx/internal/operators/OnSubscribeGroupJoin;-><init>(Lrx/Observable;Lrx/Observable;Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func2;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final ignoreElements()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 4936
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/internal/util/UtilityFunctions;->alwaysFalse()Lrx/functions/Func1;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->filter(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final isEmpty()Lrx/Observable;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4955
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorAny;

    invoke-static {}, Lrx/internal/util/UtilityFunctions;->alwaysTrue()Lrx/functions/Func1;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lrx/internal/operators/OperatorAny;-><init>(Lrx/functions/Func1;Z)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final join(Lrx/Observable;Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func2;)Lrx/Observable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TRight:",
            "Ljava/lang/Object;",
            "T",
            "LeftDuration:Ljava/lang/Object;",
            "TRightDuration:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<TTRight;>;",
            "Lrx/functions/Func1",
            "<TT;",
            "Lrx/Observable",
            "<TT",
            "LeftDuration;",
            ">;>;",
            "Lrx/functions/Func1",
            "<TTRight;",
            "Lrx/Observable",
            "<TTRightDuration;>;>;",
            "Lrx/functions/Func2",
            "<TT;TTRight;TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 4985
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "right":Lrx/Observable;, "Lrx/Observable<TTRight;>;"
    .local p2, "leftDurationSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<TT;Lrx/Observable<TTLeftDuration;>;>;"
    .local p3, "rightDurationSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<TTRight;Lrx/Observable<TTRightDuration;>;>;"
    .local p4, "resultSelector":Lrx/functions/Func2;, "Lrx/functions/Func2<TT;TTRight;TR;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeJoin;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lrx/internal/operators/OnSubscribeJoin;-><init>(Lrx/Observable;Lrx/Observable;Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func2;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final last()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5003
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lrx/Observable;->takeLast(I)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0}, Lrx/Observable;->single()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final last(Lrx/functions/Func1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5025
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "predicate":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;Ljava/lang/Boolean;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->filter(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lrx/Observable;->takeLast(I)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0}, Lrx/Observable;->single()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final lastOrDefault(Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5045
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "defaultValue":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lrx/Observable;->takeLast(I)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lrx/Observable;->singleOrDefault(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final lastOrDefault(Ljava/lang/Object;Lrx/functions/Func1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lrx/functions/Func1",
            "<-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5068
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "defaultValue":Ljava/lang/Object;, "TT;"
    .local p2, "predicate":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;Ljava/lang/Boolean;>;"
    invoke-virtual {p0, p2}, Lrx/Observable;->filter(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lrx/Observable;->takeLast(I)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lrx/Observable;->singleOrDefault(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final lift(Lrx/Observable$Operator;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable$Operator",
            "<+TR;-TT;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 136
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "lift":Lrx/Observable$Operator;, "Lrx/Observable$Operator<+TR;-TT;>;"
    new-instance v0, Lrx/Observable;

    new-instance v1, Lrx/Observable$1;

    invoke-direct {v1, p0, p1}, Lrx/Observable$1;-><init>(Lrx/Observable;Lrx/Observable$Operator;)V

    invoke-direct {v0, v1}, Lrx/Observable;-><init>(Lrx/Observable$OnSubscribe;)V

    return-object v0
.end method

.method public final limit(I)Lrx/Observable;
    .locals 1
    .param p1, "num"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5093
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->take(I)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final map(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 5113
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "func":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TR;>;"
    new-instance v0, Lrx/internal/operators/OperatorMap;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorMap;-><init>(Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final materialize()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Lrx/Notification",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 5135
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/internal/operators/OperatorMaterialize;->instance()Lrx/internal/operators/OperatorMaterialize;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final mergeWith(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5156
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "t1":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {p0, p1}, Lrx/Observable;->merge(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final nest()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 2278
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {p0}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final observeOn(Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5178
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    instance-of v0, p0, Lrx/internal/util/ScalarSynchronousObservable;

    if-eqz v0, :cond_0

    .line 5179
    check-cast p0, Lrx/internal/util/ScalarSynchronousObservable;

    .end local p0    # "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0, p1}, Lrx/internal/util/ScalarSynchronousObservable;->scalarScheduleOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    .line 5181
    :goto_0
    return-object v0

    .restart local p0    # "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    :cond_0
    new-instance v0, Lrx/internal/operators/OperatorObserveOn;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorObserveOn;-><init>(Lrx/Scheduler;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public final ofType(Ljava/lang/Class;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 5199
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<TR;>;"
    new-instance v0, Lrx/Observable$14;

    invoke-direct {v0, p0, p1}, Lrx/Observable$14;-><init>(Lrx/Observable;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->filter(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lrx/Observable;->cast(Ljava/lang/Class;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onBackpressureBlock()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lrx/annotations/Experimental;
    .end annotation

    .prologue
    .line 5354
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    sget v0, Lrx/internal/util/RxRingBuffer;->SIZE:I

    invoke-virtual {p0, v0}, Lrx/Observable;->onBackpressureBlock(I)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onBackpressureBlock(I)Lrx/Observable;
    .locals 1
    .param p1, "maxQueueLength"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lrx/annotations/Experimental;
    .end annotation

    .prologue
    .line 5332
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorOnBackpressureBlock;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorOnBackpressureBlock;-><init>(I)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onBackpressureBuffer()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5221
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorOnBackpressureBuffer;

    invoke-direct {v0}, Lrx/internal/operators/OperatorOnBackpressureBuffer;-><init>()V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onBackpressureBuffer(J)Lrx/Observable;
    .locals 1
    .param p1, "capacity"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lrx/annotations/Beta;
    .end annotation

    .prologue
    .line 5242
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorOnBackpressureBuffer;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorOnBackpressureBuffer;-><init>(J)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onBackpressureBuffer(JLrx/functions/Action0;)Lrx/Observable;
    .locals 1
    .param p1, "capacity"    # J
    .param p3, "onOverflow"    # Lrx/functions/Action0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lrx/functions/Action0;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lrx/annotations/Beta;
    .end annotation

    .prologue
    .line 5263
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorOnBackpressureBuffer;

    invoke-direct {v0, p1, p2, p3}, Lrx/internal/operators/OperatorOnBackpressureBuffer;-><init>(JLrx/functions/Action0;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onBackpressureDrop()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5307
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/internal/operators/OperatorOnBackpressureDrop;->instance()Lrx/internal/operators/OperatorOnBackpressureDrop;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onBackpressureDrop(Lrx/functions/Action1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<-TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lrx/annotations/Experimental;
    .end annotation

    .prologue
    .line 5287
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onDrop":Lrx/functions/Action1;, "Lrx/functions/Action1<-TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorOnBackpressureDrop;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorOnBackpressureDrop;-><init>(Lrx/functions/Action1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onErrorResumeNext(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5420
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "resumeSequence":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorOnErrorResumeNextViaObservable;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorOnErrorResumeNextViaObservable;-><init>(Lrx/Observable;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onErrorResumeNext(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<",
            "Ljava/lang/Throwable;",
            "+",
            "Lrx/Observable",
            "<+TT;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5387
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "resumeFunction":Lrx/functions/Func1;, "Lrx/functions/Func1<Ljava/lang/Throwable;+Lrx/Observable<+TT;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorOnErrorResumeNextViaFunction;-><init>(Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onErrorReturn(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<",
            "Ljava/lang/Throwable;",
            "+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5450
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "resumeFunction":Lrx/functions/Func1;, "Lrx/functions/Func1<Ljava/lang/Throwable;+TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorOnErrorReturn;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorOnErrorReturn;-><init>(Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final onExceptionResumeNext(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5486
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "resumeSequence":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorOnExceptionResumeNextViaObservable;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorOnExceptionResumeNextViaObservable;-><init>(Lrx/Observable;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final publish(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<TT;>;+",
            "Lrx/Observable",
            "<TR;>;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 5528
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "selector":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<TT;>;+Lrx/Observable<TR;>;>;"
    invoke-static {p0, p1}, Lrx/internal/operators/OperatorPublish;->create(Lrx/Observable;Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final publish()Lrx/observables/ConnectableObservable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5505
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {p0}, Lrx/internal/operators/OperatorPublish;->create(Lrx/Observable;)Lrx/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public final reduce(Ljava/lang/Object;Lrx/functions/Func2;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(TR;",
            "Lrx/functions/Func2",
            "<TR;-TT;TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 5600
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "initialValue":Ljava/lang/Object;, "TR;"
    .local p2, "accumulator":Lrx/functions/Func2;, "Lrx/functions/Func2<TR;-TT;TR;>;"
    invoke-virtual {p0, p1, p2}, Lrx/Observable;->scan(Ljava/lang/Object;Lrx/functions/Func2;)Lrx/Observable;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lrx/Observable;->takeLast(I)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final reduce(Lrx/functions/Func2;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func2",
            "<TT;TT;TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5567
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "accumulator":Lrx/functions/Func2;, "Lrx/functions/Func2<TT;TT;TT;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->scan(Lrx/functions/Func2;)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0}, Lrx/Observable;->last()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final repeat()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5616
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {p0}, Lrx/internal/operators/OnSubscribeRedo;->repeat(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final repeat(J)Lrx/Observable;
    .locals 1
    .param p1, "count"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5658
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {p0, p1, p2}, Lrx/internal/operators/OnSubscribeRedo;->repeat(Lrx/Observable;J)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final repeat(JLrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "count"    # J
    .param p3, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5681
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {p0, p1, p2, p3}, Lrx/internal/operators/OnSubscribeRedo;->repeat(Lrx/Observable;JLrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final repeat(Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5635
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {p0, p1}, Lrx/internal/operators/OnSubscribeRedo;->repeat(Lrx/Observable;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final repeatWhen(Lrx/functions/Func1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<+",
            "Ljava/lang/Void;",
            ">;+",
            "Lrx/Observable",
            "<*>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5740
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "notificationHandler":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<+Ljava/lang/Void;>;+Lrx/Observable<*>;>;"
    new-instance v0, Lrx/Observable$16;

    invoke-direct {v0, p0, p1}, Lrx/Observable$16;-><init>(Lrx/Observable;Lrx/functions/Func1;)V

    .line 5751
    .local v0, "dematerializedNotificationHandler":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<+Lrx/Notification<*>;>;+Lrx/Observable<*>;>;"
    invoke-static {p0, v0}, Lrx/internal/operators/OnSubscribeRedo;->repeat(Lrx/Observable;Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v1

    return-object v1
.end method

.method public final repeatWhen(Lrx/functions/Func1;Lrx/Scheduler;)Lrx/Observable;
    .locals 2
    .param p2, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<+",
            "Ljava/lang/Void;",
            ">;+",
            "Lrx/Observable",
            "<*>;>;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5706
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "notificationHandler":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<+Ljava/lang/Void;>;+Lrx/Observable<*>;>;"
    new-instance v0, Lrx/Observable$15;

    invoke-direct {v0, p0, p1}, Lrx/Observable$15;-><init>(Lrx/Observable;Lrx/functions/Func1;)V

    .line 5717
    .local v0, "dematerializedNotificationHandler":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<+Lrx/Notification<*>;>;+Lrx/Observable<*>;>;"
    invoke-static {p0, v0, p2}, Lrx/internal/operators/OnSubscribeRedo;->repeat(Lrx/Observable;Lrx/functions/Func1;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v1

    return-object v1
.end method

.method public final replay(Lrx/functions/Func1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<TT;>;+",
            "Lrx/Observable",
            "<TR;>;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 5809
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "selector":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<TT;>;+Lrx/Observable<TR;>;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeMulticastSelector;

    new-instance v1, Lrx/Observable$18;

    invoke-direct {v1, p0}, Lrx/Observable$18;-><init>(Lrx/Observable;)V

    invoke-direct {v0, p0, v1, p1}, Lrx/internal/operators/OnSubscribeMulticastSelector;-><init>(Lrx/Observable;Lrx/functions/Func0;Lrx/functions/Func1;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lrx/functions/Func1;I)Lrx/Observable;
    .locals 2
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<TT;>;+",
            "Lrx/Observable",
            "<TR;>;>;I)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 5845
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "selector":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<TT;>;+Lrx/Observable<TR;>;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeMulticastSelector;

    new-instance v1, Lrx/Observable$19;

    invoke-direct {v1, p0, p2}, Lrx/Observable$19;-><init>(Lrx/Observable;I)V

    invoke-direct {v0, p0, v1, p1}, Lrx/internal/operators/OnSubscribeMulticastSelector;-><init>(Lrx/Observable;Lrx/functions/Func0;Lrx/functions/Func1;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lrx/functions/Func1;IJLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 9
    .param p2, "bufferSize"    # I
    .param p3, "time"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<TT;>;+",
            "Lrx/Observable",
            "<TR;>;>;IJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 5886
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "selector":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<TT;>;+Lrx/Observable<TR;>;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v7

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    move-object v6, p5

    invoke-virtual/range {v1 .. v7}, Lrx/Observable;->replay(Lrx/functions/Func1;IJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lrx/functions/Func1;IJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 9
    .param p2, "bufferSize"    # I
    .param p3, "time"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<TT;>;+",
            "Lrx/Observable",
            "<TR;>;>;IJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 5926
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "selector":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<TT;>;+Lrx/Observable<TR;>;>;"
    if-gez p2, :cond_0

    .line 5927
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bufferSize < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 5929
    :cond_0
    new-instance v7, Lrx/internal/operators/OnSubscribeMulticastSelector;

    new-instance v0, Lrx/Observable$20;

    move-object v1, p0

    move-wide v2, p3

    move-object v4, p5

    move v5, p2

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lrx/Observable$20;-><init>(Lrx/Observable;JLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)V

    invoke-direct {v7, p0, v0, p1}, Lrx/internal/operators/OnSubscribeMulticastSelector;-><init>(Lrx/Observable;Lrx/functions/Func0;Lrx/functions/Func1;)V

    invoke-static {v7}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lrx/functions/Func1;ILrx/Scheduler;)Lrx/Observable;
    .locals 2
    .param p2, "bufferSize"    # I
    .param p3, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<TT;>;+",
            "Lrx/Observable",
            "<TR;>;>;I",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 5967
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "selector":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<TT;>;+Lrx/Observable<TR;>;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeMulticastSelector;

    new-instance v1, Lrx/Observable$21;

    invoke-direct {v1, p0, p2, p3}, Lrx/Observable$21;-><init>(Lrx/Observable;ILrx/Scheduler;)V

    invoke-direct {v0, p0, v1, p1}, Lrx/internal/operators/OnSubscribeMulticastSelector;-><init>(Lrx/Observable;Lrx/functions/Func0;Lrx/functions/Func1;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lrx/functions/Func1;JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 6
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<TT;>;+",
            "Lrx/Observable",
            "<TR;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 6005
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "selector":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<TT;>;+Lrx/Observable<TR;>;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lrx/Observable;->replay(Lrx/functions/Func1;JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lrx/functions/Func1;JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 8
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<TT;>;+",
            "Lrx/Observable",
            "<TR;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 6040
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "selector":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<TT;>;+Lrx/Observable<TR;>;>;"
    new-instance v6, Lrx/internal/operators/OnSubscribeMulticastSelector;

    new-instance v0, Lrx/Observable$22;

    move-object v1, p0

    move-wide v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lrx/Observable$22;-><init>(Lrx/Observable;JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-direct {v6, p0, v0, p1}, Lrx/internal/operators/OnSubscribeMulticastSelector;-><init>(Lrx/Observable;Lrx/functions/Func0;Lrx/functions/Func1;)V

    invoke-static {v6}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(Lrx/functions/Func1;Lrx/Scheduler;)Lrx/Observable;
    .locals 2
    .param p2, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<TT;>;+",
            "Lrx/Observable",
            "<TR;>;>;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 6075
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "selector":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<TT;>;+Lrx/Observable<TR;>;>;"
    new-instance v0, Lrx/internal/operators/OnSubscribeMulticastSelector;

    new-instance v1, Lrx/Observable$23;

    invoke-direct {v1, p0, p2}, Lrx/Observable$23;-><init>(Lrx/Observable;Lrx/Scheduler;)V

    invoke-direct {v0, p0, v1, p1}, Lrx/internal/operators/OnSubscribeMulticastSelector;-><init>(Lrx/Observable;Lrx/functions/Func0;Lrx/functions/Func1;)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final replay()Lrx/observables/ConnectableObservable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 5775
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorMulticast;

    new-instance v1, Lrx/Observable$17;

    invoke-direct {v1, p0}, Lrx/Observable$17;-><init>(Lrx/Observable;)V

    invoke-direct {v0, p0, v1}, Lrx/internal/operators/OperatorMulticast;-><init>(Lrx/Observable;Lrx/functions/Func0;)V

    return-object v0
.end method

.method public final replay(I)Lrx/observables/ConnectableObservable;
    .locals 2
    .param p1, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6106
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorMulticast;

    new-instance v1, Lrx/Observable$24;

    invoke-direct {v1, p0, p1}, Lrx/Observable$24;-><init>(Lrx/Observable;I)V

    invoke-direct {v0, p0, v1}, Lrx/internal/operators/OperatorMulticast;-><init>(Lrx/Observable;Lrx/functions/Func0;)V

    return-object v0
.end method

.method public final replay(IJLjava/util/concurrent/TimeUnit;)Lrx/observables/ConnectableObservable;
    .locals 6
    .param p1, "bufferSize"    # I
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6144
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v5

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lrx/Observable;->replay(IJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(IJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/observables/ConnectableObservable;
    .locals 8
    .param p1, "bufferSize"    # I
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6179
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    if-gez p1, :cond_0

    .line 6180
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bufferSize < 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 6182
    :cond_0
    new-instance v7, Lrx/internal/operators/OperatorMulticast;

    new-instance v0, Lrx/Observable$25;

    move-object v1, p0

    move-wide v2, p2

    move-object v4, p4

    move v5, p1

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lrx/Observable$25;-><init>(Lrx/Observable;JLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)V

    invoke-direct {v7, p0, v0}, Lrx/internal/operators/OperatorMulticast;-><init>(Lrx/Observable;Lrx/functions/Func0;)V

    return-object v7
.end method

.method public final replay(ILrx/Scheduler;)Lrx/observables/ConnectableObservable;
    .locals 2
    .param p1, "bufferSize"    # I
    .param p2, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lrx/Scheduler;",
            ")",
            "Lrx/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6217
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorMulticast;

    new-instance v1, Lrx/Observable$26;

    invoke-direct {v1, p0, p1, p2}, Lrx/Observable$26;-><init>(Lrx/Observable;ILrx/Scheduler;)V

    invoke-direct {v0, p0, v1}, Lrx/internal/operators/OperatorMulticast;-><init>(Lrx/Observable;Lrx/functions/Func0;)V

    return-object v0
.end method

.method public final replay(JLjava/util/concurrent/TimeUnit;)Lrx/observables/ConnectableObservable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6252
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/Observable;->replay(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/observables/ConnectableObservable;

    move-result-object v0

    return-object v0
.end method

.method public final replay(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/observables/ConnectableObservable;
    .locals 7
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6282
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v6, Lrx/internal/operators/OperatorMulticast;

    new-instance v0, Lrx/Observable$27;

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lrx/Observable$27;-><init>(Lrx/Observable;JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-direct {v6, p0, v0}, Lrx/internal/operators/OperatorMulticast;-><init>(Lrx/Observable;Lrx/functions/Func0;)V

    return-object v6
.end method

.method public final replay(Lrx/Scheduler;)Lrx/observables/ConnectableObservable;
    .locals 2
    .param p1, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Scheduler;",
            ")",
            "Lrx/observables/ConnectableObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6316
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorMulticast;

    new-instance v1, Lrx/Observable$28;

    invoke-direct {v1, p0, p1}, Lrx/Observable$28;-><init>(Lrx/Observable;Lrx/Scheduler;)V

    invoke-direct {v0, p0, v1}, Lrx/internal/operators/OperatorMulticast;-><init>(Lrx/Observable;Lrx/functions/Func0;)V

    return-object v0
.end method

.method public final retry()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6348
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {p0}, Lrx/internal/operators/OnSubscribeRedo;->retry(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final retry(J)Lrx/Observable;
    .locals 1
    .param p1, "count"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6376
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {p0, p1, p2}, Lrx/internal/operators/OnSubscribeRedo;->retry(Lrx/Observable;J)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final retry(Lrx/functions/Func2;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func2",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6397
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "predicate":Lrx/functions/Func2;, "Lrx/functions/Func2<Ljava/lang/Integer;Ljava/lang/Throwable;Ljava/lang/Boolean;>;"
    invoke-virtual {p0}, Lrx/Observable;->nest()Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/internal/operators/OperatorRetryWithPredicate;

    invoke-direct {v1, p1}, Lrx/internal/operators/OperatorRetryWithPredicate;-><init>(Lrx/functions/Func2;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final retryWhen(Lrx/functions/Func1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<+",
            "Ljava/lang/Throwable;",
            ">;+",
            "Lrx/Observable",
            "<*>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6449
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "notificationHandler":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<+Ljava/lang/Throwable;>;+Lrx/Observable<*>;>;"
    new-instance v0, Lrx/Observable$29;

    invoke-direct {v0, p0, p1}, Lrx/Observable$29;-><init>(Lrx/Observable;Lrx/functions/Func1;)V

    .line 6460
    .local v0, "dematerializedNotificationHandler":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<+Lrx/Notification<*>;>;+Lrx/Observable<*>;>;"
    invoke-static {p0, v0}, Lrx/internal/operators/OnSubscribeRedo;->retry(Lrx/Observable;Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v1

    return-object v1
.end method

.method public final retryWhen(Lrx/functions/Func1;Lrx/Scheduler;)Lrx/Observable;
    .locals 2
    .param p2, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-",
            "Lrx/Observable",
            "<+",
            "Ljava/lang/Throwable;",
            ">;+",
            "Lrx/Observable",
            "<*>;>;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6487
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "notificationHandler":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<+Ljava/lang/Throwable;>;+Lrx/Observable<*>;>;"
    new-instance v0, Lrx/Observable$30;

    invoke-direct {v0, p0, p1}, Lrx/Observable$30;-><init>(Lrx/Observable;Lrx/functions/Func1;)V

    .line 6498
    .local v0, "dematerializedNotificationHandler":Lrx/functions/Func1;, "Lrx/functions/Func1<-Lrx/Observable<+Lrx/Notification<*>;>;+Lrx/Observable<*>;>;"
    invoke-static {p0, v0, p2}, Lrx/internal/operators/OnSubscribeRedo;->retry(Lrx/Observable;Lrx/functions/Func1;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v1

    return-object v1
.end method

.method public final sample(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 1
    .param p1, "period"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6524
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/Observable;->sample(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final sample(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "period"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6552
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorSampleWithTime;

    invoke-direct {v0, p1, p2, p3, p4}, Lrx/internal/operators/OperatorSampleWithTime;-><init>(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final sample(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<TU;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6577
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "sampler":Lrx/Observable;, "Lrx/Observable<TU;>;"
    new-instance v0, Lrx/internal/operators/OperatorSampleWithObservable;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorSampleWithObservable;-><init>(Lrx/Observable;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final scan(Ljava/lang/Object;Lrx/functions/Func2;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(TR;",
            "Lrx/functions/Func2",
            "<TR;-TT;TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 6633
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "initialValue":Ljava/lang/Object;, "TR;"
    .local p2, "accumulator":Lrx/functions/Func2;, "Lrx/functions/Func2<TR;-TT;TR;>;"
    new-instance v0, Lrx/internal/operators/OperatorScan;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorScan;-><init>(Ljava/lang/Object;Lrx/functions/Func2;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final scan(Lrx/functions/Func2;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func2",
            "<TT;TT;TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6602
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "accumulator":Lrx/functions/Func2;, "Lrx/functions/Func2<TT;TT;TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorScan;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorScan;-><init>(Lrx/functions/Func2;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final serialize()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6657
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/internal/operators/OperatorSerialize;->instance()Lrx/internal/operators/OperatorSerialize;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final share()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6682
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0}, Lrx/Observable;->publish()Lrx/observables/ConnectableObservable;

    move-result-object v0

    invoke-virtual {v0}, Lrx/observables/ConnectableObservable;->refCount()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final single()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6704
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorSingle;

    invoke-direct {v0}, Lrx/internal/operators/OperatorSingle;-><init>()V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final single(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6730
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "predicate":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;Ljava/lang/Boolean;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->filter(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0}, Lrx/Observable;->single()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final singleOrDefault(Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6753
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "defaultValue":Ljava/lang/Object;, "TT;"
    new-instance v0, Lrx/internal/operators/OperatorSingle;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorSingle;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final singleOrDefault(Ljava/lang/Object;Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lrx/functions/Func1",
            "<-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6779
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "defaultValue":Ljava/lang/Object;, "TT;"
    .local p2, "predicate":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;Ljava/lang/Boolean;>;"
    invoke-virtual {p0, p2}, Lrx/Observable;->filter(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lrx/Observable;->singleOrDefault(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skip(I)Lrx/Observable;
    .locals 1
    .param p1, "num"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6799
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorSkip;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorSkip;-><init>(I)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skip(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6821
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/Observable;->skip(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skip(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6845
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorSkipTimed;

    invoke-direct {v0, p1, p2, p3, p4}, Lrx/internal/operators/OperatorSkipTimed;-><init>(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skipLast(I)Lrx/Observable;
    .locals 1
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6871
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorSkipLast;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorSkipLast;-><init>(I)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skipLast(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6895
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/Observable;->skipLast(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skipLast(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6921
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorSkipLastTimed;

    invoke-direct {v0, p1, p2, p3, p4}, Lrx/internal/operators/OperatorSkipLastTimed;-><init>(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skipUntil(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<TU;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6942
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "other":Lrx/Observable;, "Lrx/Observable<TU;>;"
    new-instance v0, Lrx/internal/operators/OperatorSkipUntil;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorSkipUntil;-><init>(Lrx/Observable;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final skipWhile(Lrx/functions/Func1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6962
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "predicate":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;Ljava/lang/Boolean;>;"
    new-instance v0, Lrx/internal/operators/OperatorSkipWhile;

    invoke-static {p1}, Lrx/internal/operators/OperatorSkipWhile;->toPredicate2(Lrx/functions/Func1;)Lrx/functions/Func2;

    move-result-object v1

    invoke-direct {v0, v1}, Lrx/internal/operators/OperatorSkipWhile;-><init>(Lrx/functions/Func2;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Ljava/lang/Iterable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7002
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    invoke-static {p1}, Lrx/Observable;->from(Ljava/lang/Iterable;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p0}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7022
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "t1":Ljava/lang/Object;, "TT;"
    invoke-static {p1}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p0}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7044
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "t1":Ljava/lang/Object;, "TT;"
    .local p2, "t2":Ljava/lang/Object;, "TT;"
    invoke-static {p1, p2}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p0}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7068
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "t1":Ljava/lang/Object;, "TT;"
    .local p2, "t2":Ljava/lang/Object;, "TT;"
    .local p3, "t3":Ljava/lang/Object;, "TT;"
    invoke-static {p1, p2, p3}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p0}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7094
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "t1":Ljava/lang/Object;, "TT;"
    .local p2, "t2":Ljava/lang/Object;, "TT;"
    .local p3, "t3":Ljava/lang/Object;, "TT;"
    .local p4, "t4":Ljava/lang/Object;, "TT;"
    invoke-static {p1, p2, p3, p4}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p0}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7122
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "t1":Ljava/lang/Object;, "TT;"
    .local p2, "t2":Ljava/lang/Object;, "TT;"
    .local p3, "t3":Ljava/lang/Object;, "TT;"
    .local p4, "t4":Ljava/lang/Object;, "TT;"
    .local p5, "t5":Ljava/lang/Object;, "TT;"
    invoke-static {p1, p2, p3, p4, p5}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p0}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7152
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "t1":Ljava/lang/Object;, "TT;"
    .local p2, "t2":Ljava/lang/Object;, "TT;"
    .local p3, "t3":Ljava/lang/Object;, "TT;"
    .local p4, "t4":Ljava/lang/Object;, "TT;"
    .local p5, "t5":Ljava/lang/Object;, "TT;"
    .local p6, "t6":Ljava/lang/Object;, "TT;"
    invoke-static/range {p1 .. p6}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p0}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7184
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "t1":Ljava/lang/Object;, "TT;"
    .local p2, "t2":Ljava/lang/Object;, "TT;"
    .local p3, "t3":Ljava/lang/Object;, "TT;"
    .local p4, "t4":Ljava/lang/Object;, "TT;"
    .local p5, "t5":Ljava/lang/Object;, "TT;"
    .local p6, "t6":Ljava/lang/Object;, "TT;"
    .local p7, "t7":Ljava/lang/Object;, "TT;"
    invoke-static/range {p1 .. p7}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p0}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7218
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "t1":Ljava/lang/Object;, "TT;"
    .local p2, "t2":Ljava/lang/Object;, "TT;"
    .local p3, "t3":Ljava/lang/Object;, "TT;"
    .local p4, "t4":Ljava/lang/Object;, "TT;"
    .local p5, "t5":Ljava/lang/Object;, "TT;"
    .local p6, "t6":Ljava/lang/Object;, "TT;"
    .local p7, "t7":Ljava/lang/Object;, "TT;"
    .local p8, "t8":Ljava/lang/Object;, "TT;"
    invoke-static/range {p1 .. p8}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p0}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7254
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "t1":Ljava/lang/Object;, "TT;"
    .local p2, "t2":Ljava/lang/Object;, "TT;"
    .local p3, "t3":Ljava/lang/Object;, "TT;"
    .local p4, "t4":Ljava/lang/Object;, "TT;"
    .local p5, "t5":Ljava/lang/Object;, "TT;"
    .local p6, "t6":Ljava/lang/Object;, "TT;"
    .local p7, "t7":Ljava/lang/Object;, "TT;"
    .local p8, "t8":Ljava/lang/Object;, "TT;"
    .local p9, "t9":Ljava/lang/Object;, "TT;"
    invoke-static/range {p1 .. p9}, Lrx/Observable;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0, p0}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final startWith(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 6982
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "values":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {p1, p0}, Lrx/Observable;->concat(Lrx/Observable;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final subscribe()Lrx/Subscription;
    .locals 1

    .prologue
    .line 7271
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/Observable$31;

    invoke-direct {v0, p0}, Lrx/Observable$31;-><init>(Lrx/Observable;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public final subscribe(Lrx/Observer;)Lrx/Subscription;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observer",
            "<-TT;>;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 7451
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "observer":Lrx/Observer;, "Lrx/Observer<-TT;>;"
    instance-of v0, p1, Lrx/Subscriber;

    if-eqz v0, :cond_0

    .line 7452
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "observer":Lrx/Observer;, "Lrx/Observer<-TT;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    move-result-object v0

    .line 7454
    :goto_0
    return-object v0

    .restart local p1    # "observer":Lrx/Observer;, "Lrx/Observer<-TT;>;"
    :cond_0
    new-instance v0, Lrx/Observable$35;

    invoke-direct {v0, p0, p1}, Lrx/Observable$35;-><init>(Lrx/Observable;Lrx/Observer;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    move-result-object v0

    goto :goto_0
.end method

.method public final subscribe(Lrx/Subscriber;)Lrx/Subscription;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 7558
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    if-nez p1, :cond_0

    .line 7559
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "observer can not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 7561
    :cond_0
    iget-object v4, p0, Lrx/Observable;->onSubscribe:Lrx/Observable$OnSubscribe;

    if-nez v4, :cond_1

    .line 7562
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "onSubscribe function can not be null."

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 7570
    :cond_1
    invoke-virtual {p1}, Lrx/Subscriber;->onStart()V

    .line 7577
    instance-of v4, p1, Lrx/observers/SafeSubscriber;

    if-nez v4, :cond_2

    .line 7579
    new-instance v3, Lrx/observers/SafeSubscriber;

    invoke-direct {v3, p1}, Lrx/observers/SafeSubscriber;-><init>(Lrx/Subscriber;)V

    .end local p1    # "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    .local v3, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    move-object p1, v3

    .line 7585
    .end local v3    # "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    .restart local p1    # "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    :cond_2
    :try_start_0
    sget-object v4, Lrx/Observable;->hook:Lrx/plugins/RxJavaObservableExecutionHook;

    iget-object v5, p0, Lrx/Observable;->onSubscribe:Lrx/Observable$OnSubscribe;

    invoke-virtual {v4, p0, v5}, Lrx/plugins/RxJavaObservableExecutionHook;->onSubscribeStart(Lrx/Observable;Lrx/Observable$OnSubscribe;)Lrx/Observable$OnSubscribe;

    move-result-object v4

    invoke-interface {v4, p1}, Lrx/Observable$OnSubscribe;->call(Ljava/lang/Object;)V

    .line 7586
    sget-object v4, Lrx/Observable;->hook:Lrx/plugins/RxJavaObservableExecutionHook;

    invoke-virtual {v4, p1}, Lrx/plugins/RxJavaObservableExecutionHook;->onSubscribeReturn(Lrx/Subscription;)Lrx/Subscription;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 7605
    :goto_0
    return-object v4

    .line 7587
    :catch_0
    move-exception v0

    .line 7589
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lrx/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 7592
    :try_start_1
    sget-object v4, Lrx/Observable;->hook:Lrx/plugins/RxJavaObservableExecutionHook;

    invoke-virtual {v4, v0}, Lrx/plugins/RxJavaObservableExecutionHook;->onSubscribeError(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v4

    invoke-virtual {p1, v4}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_1
    .catch Lrx/exceptions/OnErrorNotImplementedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    .line 7605
    invoke-static {}, Lrx/subscriptions/Subscriptions;->unsubscribed()Lrx/Subscription;

    move-result-object v4

    goto :goto_0

    .line 7593
    :catch_1
    move-exception v1

    .line 7595
    .local v1, "e2":Lrx/exceptions/OnErrorNotImplementedException;
    throw v1

    .line 7596
    .end local v1    # "e2":Lrx/exceptions/OnErrorNotImplementedException;
    :catch_2
    move-exception v1

    .line 7599
    .local v1, "e2":Ljava/lang/Throwable;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error occurred attempting to subscribe ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] and then again while trying to pass to onError."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 7601
    .local v2, "r":Ljava/lang/RuntimeException;
    sget-object v4, Lrx/Observable;->hook:Lrx/plugins/RxJavaObservableExecutionHook;

    invoke-virtual {v4, v2}, Lrx/plugins/RxJavaObservableExecutionHook;->onSubscribeError(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 7603
    throw v2
.end method

.method public final subscribe(Lrx/functions/Action1;)Lrx/Subscription;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<-TT;>;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 7309
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onNext":Lrx/functions/Action1;, "Lrx/functions/Action1<-TT;>;"
    if-nez p1, :cond_0

    .line 7310
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "onNext can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7313
    :cond_0
    new-instance v0, Lrx/Observable$32;

    invoke-direct {v0, p0, p1}, Lrx/Observable$32;-><init>(Lrx/Observable;Lrx/functions/Action1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public final subscribe(Lrx/functions/Action1;Lrx/functions/Action1;)Lrx/Subscription;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<-TT;>;",
            "Lrx/functions/Action1",
            "<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 7354
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onNext":Lrx/functions/Action1;, "Lrx/functions/Action1<-TT;>;"
    .local p2, "onError":Lrx/functions/Action1;, "Lrx/functions/Action1<Ljava/lang/Throwable;>;"
    if-nez p1, :cond_0

    .line 7355
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "onNext can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7357
    :cond_0
    if-nez p2, :cond_1

    .line 7358
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "onError can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7361
    :cond_1
    new-instance v0, Lrx/Observable$33;

    invoke-direct {v0, p0, p2, p1}, Lrx/Observable$33;-><init>(Lrx/Observable;Lrx/functions/Action1;Lrx/functions/Action1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public final subscribe(Lrx/functions/Action1;Lrx/functions/Action1;Lrx/functions/Action0;)Lrx/Subscription;
    .locals 2
    .param p3, "onComplete"    # Lrx/functions/Action0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Action1",
            "<-TT;>;",
            "Lrx/functions/Action1",
            "<",
            "Ljava/lang/Throwable;",
            ">;",
            "Lrx/functions/Action0;",
            ")",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 7406
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "onNext":Lrx/functions/Action1;, "Lrx/functions/Action1<-TT;>;"
    .local p2, "onError":Lrx/functions/Action1;, "Lrx/functions/Action1<Ljava/lang/Throwable;>;"
    if-nez p1, :cond_0

    .line 7407
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "onNext can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7409
    :cond_0
    if-nez p2, :cond_1

    .line 7410
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "onError can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7412
    :cond_1
    if-nez p3, :cond_2

    .line 7413
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "onComplete can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7416
    :cond_2
    new-instance v0, Lrx/Observable$34;

    invoke-direct {v0, p0, p3, p2, p1}, Lrx/Observable$34;-><init>(Lrx/Observable;Lrx/functions/Action0;Lrx/functions/Action1;Lrx/functions/Action1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public final subscribeOn(Lrx/Scheduler;)Lrx/Observable;
    .locals 2
    .param p1, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7627
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    instance-of v0, p0, Lrx/internal/util/ScalarSynchronousObservable;

    if-eqz v0, :cond_0

    .line 7628
    check-cast p0, Lrx/internal/util/ScalarSynchronousObservable;

    .end local p0    # "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0, p1}, Lrx/internal/util/ScalarSynchronousObservable;->scalarScheduleOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    .line 7630
    :goto_0
    return-object v0

    .restart local p0    # "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    :cond_0
    invoke-virtual {p0}, Lrx/Observable;->nest()Lrx/Observable;

    move-result-object v0

    new-instance v1, Lrx/internal/operators/OperatorSubscribeOn;

    invoke-direct {v1, p1}, Lrx/internal/operators/OperatorSubscribeOn;-><init>(Lrx/Scheduler;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    goto :goto_0
.end method

.method public final switchIfEmpty(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lrx/annotations/Experimental;
    .end annotation

    .prologue
    .line 3812
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "alternate":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorSwitchIfEmpty;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorSwitchIfEmpty;-><init>(Lrx/Observable;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final switchMap(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<+TR;>;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 7651
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "func":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<+TR;>;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->map(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    invoke-static {v0}, Lrx/Observable;->switchOnNext(Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final take(I)Lrx/Observable;
    .locals 1
    .param p1, "num"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7674
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorTake;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorTake;-><init>(I)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final take(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7695
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/Observable;->take(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final take(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7719
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorTakeTimed;

    invoke-direct {v0, p1, p2, p3, p4}, Lrx/internal/operators/OperatorTakeTimed;-><init>(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeFirst(Lrx/functions/Func1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7740
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "predicate":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;Ljava/lang/Boolean;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->filter(Lrx/functions/Func1;)Lrx/Observable;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lrx/Observable;->take(I)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLast(I)Lrx/Observable;
    .locals 1
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7761
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorTakeLast;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorTakeLast;-><init>(I)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLast(IJLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 6
    .param p1, "count"    # I
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7785
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v5

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lrx/Observable;->takeLast(IJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLast(IJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 6
    .param p1, "count"    # I
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7815
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorTakeLastTimed;

    move v1, p1

    move-wide v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lrx/internal/operators/OperatorTakeLastTimed;-><init>(IJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLast(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7837
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/Observable;->takeLast(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLast(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 7863
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorTakeLastTimed;

    invoke-direct {v0, p1, p2, p3, p4}, Lrx/internal/operators/OperatorTakeLastTimed;-><init>(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLastBuffer(I)Lrx/Observable;
    .locals 1
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 7883
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0, p1}, Lrx/Observable;->takeLast(I)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0}, Lrx/Observable;->toList()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLastBuffer(IJLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 2
    .param p1, "count"    # I
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 7908
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0, p1, p2, p3, p4}, Lrx/Observable;->takeLast(IJLjava/util/concurrent/TimeUnit;)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0}, Lrx/Observable;->toList()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLastBuffer(IJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 2
    .param p1, "count"    # I
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 7936
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual/range {p0 .. p5}, Lrx/Observable;->takeLast(IJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0}, Lrx/Observable;->toList()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLastBuffer(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 7958
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0, p1, p2, p3}, Lrx/Observable;->takeLast(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0}, Lrx/Observable;->toList()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeLastBuffer(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 7984
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0, p1, p2, p3, p4}, Lrx/Observable;->takeLast(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    invoke-virtual {v0}, Lrx/Observable;->toList()Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeUntil(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TE;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8006
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "other":Lrx/Observable;, "Lrx/Observable<+TE;>;"
    new-instance v0, Lrx/internal/operators/OperatorTakeUntil;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorTakeUntil;-><init>(Lrx/Observable;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeUntil(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .annotation build Lrx/annotations/Experimental;
    .end annotation

    .prologue
    .line 8050
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "stopPredicate":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;Ljava/lang/Boolean;>;"
    new-instance v0, Lrx/internal/operators/OperatorTakeUntilPredicate;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorTakeUntilPredicate;-><init>(Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final takeWhile(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func1",
            "<-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8027
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "predicate":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;Ljava/lang/Boolean;>;"
    new-instance v0, Lrx/internal/operators/OperatorTakeWhile;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorTakeWhile;-><init>(Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final throttleFirst(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 1
    .param p1, "windowDuration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8077
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/Observable;->throttleFirst(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final throttleFirst(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "skipDuration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8107
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorThrottleFirst;

    invoke-direct {v0, p1, p2, p3, p4}, Lrx/internal/operators/OperatorThrottleFirst;-><init>(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final throttleLast(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 1
    .param p1, "intervalDuration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8136
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0, p1, p2, p3}, Lrx/Observable;->sample(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final throttleLast(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "intervalDuration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8168
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0, p1, p2, p3, p4}, Lrx/Observable;->sample(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final throttleWithTimeout(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8206
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0, p1, p2, p3}, Lrx/Observable;->debounce(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final throttleWithTimeout(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8248
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0, p1, p2, p3, p4}, Lrx/Observable;->debounce(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeInterval()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Lrx/schedulers/TimeInterval",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 8265
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->immediate()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->timeInterval(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeInterval(Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Lrx/schedulers/TimeInterval",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 8284
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorTimeInterval;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorTimeInterval;-><init>(Lrx/Scheduler;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8434
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    const/4 v5, 0x0

    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v6

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    invoke-virtual/range {v1 .. v6}, Lrx/Observable;->timeout(JLjava/util/concurrent/TimeUnit;Lrx/Observable;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(JLjava/util/concurrent/TimeUnit;Lrx/Observable;)Lrx/Observable;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8458
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p4, "other":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v6

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v1 .. v6}, Lrx/Observable;->timeout(JLjava/util/concurrent/TimeUnit;Lrx/Observable;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(JLjava/util/concurrent/TimeUnit;Lrx/Observable;Lrx/Scheduler;)Lrx/Observable;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .param p5, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Observable",
            "<+TT;>;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8485
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p4, "other":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    new-instance v1, Lrx/internal/operators/OperatorTimeout;

    move-wide v2, p1

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v1 .. v6}, Lrx/internal/operators/OperatorTimeout;-><init>(JLjava/util/concurrent/TimeUnit;Lrx/Observable;Lrx/Scheduler;)V

    invoke-virtual {p0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 7
    .param p1, "timeout"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8511
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    const/4 v5, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v6, p4

    invoke-virtual/range {v1 .. v6}, Lrx/Observable;->timeout(JLjava/util/concurrent/TimeUnit;Lrx/Observable;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(Lrx/functions/Func0;Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func0",
            "<+",
            "Lrx/Observable",
            "<TU;>;>;",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<TV;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8315
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "firstTimeoutSelector":Lrx/functions/Func0;, "Lrx/functions/Func0<+Lrx/Observable<TU;>;>;"
    .local p2, "timeoutSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<TV;>;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lrx/Observable;->timeout(Lrx/functions/Func0;Lrx/functions/Func1;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(Lrx/functions/Func0;Lrx/functions/Func1;Lrx/Observable;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func0",
            "<+",
            "Lrx/Observable",
            "<TU;>;>;",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<TV;>;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8350
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "firstTimeoutSelector":Lrx/functions/Func0;, "Lrx/functions/Func0<+Lrx/Observable<TU;>;>;"
    .local p2, "timeoutSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<TV;>;>;"
    .local p3, "other":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    if-nez p2, :cond_0

    .line 8351
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "timeoutSelector is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 8353
    :cond_0
    new-instance v0, Lrx/internal/operators/OperatorTimeoutWithSelector;

    invoke-direct {v0, p1, p2, p3}, Lrx/internal/operators/OperatorTimeoutWithSelector;-><init>(Lrx/functions/Func0;Lrx/functions/Func1;Lrx/Observable;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<TV;>;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "timeoutSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<TV;>;>;"
    const/4 v0, 0x0

    .line 8381
    invoke-virtual {p0, v0, p1, v0}, Lrx/Observable;->timeout(Lrx/functions/Func0;Lrx/functions/Func1;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timeout(Lrx/functions/Func1;Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+",
            "Lrx/Observable",
            "<TV;>;>;",
            "Lrx/Observable",
            "<+TT;>;)",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8411
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "timeoutSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+Lrx/Observable<TV;>;>;"
    .local p2, "other":Lrx/Observable;, "Lrx/Observable<+TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, p2}, Lrx/Observable;->timeout(Lrx/functions/Func0;Lrx/functions/Func1;Lrx/Observable;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timestamp()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Lrx/schedulers/Timestamped",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 8528
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->immediate()Lrx/Scheduler;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->timestamp(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final timestamp(Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Lrx/schedulers/Timestamped",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 8548
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorTimestamp;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorTimestamp;-><init>(Lrx/Scheduler;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final toBlocking()Lrx/observables/BlockingObservable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/observables/BlockingObservable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8562
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {p0}, Lrx/observables/BlockingObservable;->from(Lrx/Observable;)Lrx/observables/BlockingObservable;

    move-result-object v0

    return-object v0
.end method

.method public final toList()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 8591
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/internal/operators/OperatorToObservableList;->instance()Lrx/internal/operators/OperatorToObservableList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final toMap(Lrx/functions/Func1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+TK;>;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/Map",
            "<TK;TT;>;>;"
        }
    .end annotation

    .prologue
    .line 8615
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "keySelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TK;>;"
    new-instance v0, Lrx/internal/operators/OperatorToMap;

    invoke-static {}, Lrx/internal/util/UtilityFunctions;->identity()Lrx/functions/Func1;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lrx/internal/operators/OperatorToMap;-><init>(Lrx/functions/Func1;Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final toMap(Lrx/functions/Func1;Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+TK;>;",
            "Lrx/functions/Func1",
            "<-TT;+TV;>;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/Map",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 8642
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "keySelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TK;>;"
    .local p2, "valueSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TV;>;"
    new-instance v0, Lrx/internal/operators/OperatorToMap;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorToMap;-><init>(Lrx/functions/Func1;Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final toMap(Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func0;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+TK;>;",
            "Lrx/functions/Func1",
            "<-TT;+TV;>;",
            "Lrx/functions/Func0",
            "<+",
            "Ljava/util/Map",
            "<TK;TV;>;>;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/Map",
            "<TK;TV;>;>;"
        }
    .end annotation

    .prologue
    .line 8668
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "keySelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TK;>;"
    .local p2, "valueSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TV;>;"
    .local p3, "mapFactory":Lrx/functions/Func0;, "Lrx/functions/Func0<+Ljava/util/Map<TK;TV;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorToMap;

    invoke-direct {v0, p1, p2, p3}, Lrx/internal/operators/OperatorToMap;-><init>(Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func0;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final toMultimap(Lrx/functions/Func1;)Lrx/Observable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+TK;>;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TT;>;>;>;"
        }
    .end annotation

    .prologue
    .line 8690
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "keySelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TK;>;"
    new-instance v0, Lrx/internal/operators/OperatorToMultimap;

    invoke-static {}, Lrx/internal/util/UtilityFunctions;->identity()Lrx/functions/Func1;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lrx/internal/operators/OperatorToMultimap;-><init>(Lrx/functions/Func1;Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final toMultimap(Lrx/functions/Func1;Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+TK;>;",
            "Lrx/functions/Func1",
            "<-TT;+TV;>;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;"
        }
    .end annotation

    .prologue
    .line 8715
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "keySelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TK;>;"
    .local p2, "valueSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TV;>;"
    new-instance v0, Lrx/internal/operators/OperatorToMultimap;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorToMultimap;-><init>(Lrx/functions/Func1;Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final toMultimap(Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func0;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+TK;>;",
            "Lrx/functions/Func1",
            "<-TT;+TV;>;",
            "Lrx/functions/Func0",
            "<+",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;"
        }
    .end annotation

    .prologue
    .line 8742
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "keySelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TK;>;"
    .local p2, "valueSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TV;>;"
    .local p3, "mapFactory":Lrx/functions/Func0;, "Lrx/functions/Func0<+Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorToMultimap;

    invoke-direct {v0, p1, p2, p3}, Lrx/internal/operators/OperatorToMultimap;-><init>(Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func0;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final toMultimap(Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func0;Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func1",
            "<-TT;+TK;>;",
            "Lrx/functions/Func1",
            "<-TT;+TV;>;",
            "Lrx/functions/Func0",
            "<+",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;",
            "Lrx/functions/Func1",
            "<-TK;+",
            "Ljava/util/Collection",
            "<TV;>;>;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/Map",
            "<TK;",
            "Ljava/util/Collection",
            "<TV;>;>;>;"
        }
    .end annotation

    .prologue
    .line 8771
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "keySelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TK;>;"
    .local p2, "valueSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TT;+TV;>;"
    .local p3, "mapFactory":Lrx/functions/Func0;, "Lrx/functions/Func0<+Ljava/util/Map<TK;Ljava/util/Collection<TV;>;>;>;"
    .local p4, "collectionFactory":Lrx/functions/Func1;, "Lrx/functions/Func1<-TK;+Ljava/util/Collection<TV;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorToMultimap;

    invoke-direct {v0, p1, p2, p3, p4}, Lrx/internal/operators/OperatorToMultimap;-><init>(Lrx/functions/Func1;Lrx/functions/Func1;Lrx/functions/Func0;Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final toSortedList()Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 8795
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorToObservableSortedList;

    invoke-direct {v0}, Lrx/internal/operators/OperatorToObservableSortedList;-><init>()V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final toSortedList(Lrx/functions/Func2;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/functions/Func2",
            "<-TT;-TT;",
            "Ljava/lang/Integer;",
            ">;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 8818
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "sortFunction":Lrx/functions/Func2;, "Lrx/functions/Func2<-TT;-TT;Ljava/lang/Integer;>;"
    new-instance v0, Lrx/internal/operators/OperatorToObservableSortedList;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorToObservableSortedList;-><init>(Lrx/functions/Func2;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final unsafeSubscribe(Lrx/Subscriber;)Lrx/Subscription;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)",
            "Lrx/Subscription;"
        }
    .end annotation

    .prologue
    .line 7493
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    :try_start_0
    invoke-virtual {p1}, Lrx/Subscriber;->onStart()V

    .line 7495
    sget-object v3, Lrx/Observable;->hook:Lrx/plugins/RxJavaObservableExecutionHook;

    iget-object v4, p0, Lrx/Observable;->onSubscribe:Lrx/Observable$OnSubscribe;

    invoke-virtual {v3, p0, v4}, Lrx/plugins/RxJavaObservableExecutionHook;->onSubscribeStart(Lrx/Observable;Lrx/Observable$OnSubscribe;)Lrx/Observable$OnSubscribe;

    move-result-object v3

    invoke-interface {v3, p1}, Lrx/Observable$OnSubscribe;->call(Ljava/lang/Object;)V

    .line 7496
    sget-object v3, Lrx/Observable;->hook:Lrx/plugins/RxJavaObservableExecutionHook;

    invoke-virtual {v3, p1}, Lrx/plugins/RxJavaObservableExecutionHook;->onSubscribeReturn(Lrx/Subscription;)Lrx/Subscription;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 7515
    :goto_0
    return-object v3

    .line 7497
    :catch_0
    move-exception v0

    .line 7499
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lrx/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 7502
    :try_start_1
    sget-object v3, Lrx/Observable;->hook:Lrx/plugins/RxJavaObservableExecutionHook;

    invoke-virtual {v3, v0}, Lrx/plugins/RxJavaObservableExecutionHook;->onSubscribeError(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {p1, v3}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_1
    .catch Lrx/exceptions/OnErrorNotImplementedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    .line 7515
    invoke-static {}, Lrx/subscriptions/Subscriptions;->unsubscribed()Lrx/Subscription;

    move-result-object v3

    goto :goto_0

    .line 7503
    :catch_1
    move-exception v1

    .line 7505
    .local v1, "e2":Lrx/exceptions/OnErrorNotImplementedException;
    throw v1

    .line 7506
    .end local v1    # "e2":Lrx/exceptions/OnErrorNotImplementedException;
    :catch_2
    move-exception v1

    .line 7509
    .local v1, "e2":Ljava/lang/Throwable;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error occurred attempting to subscribe ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] and then again while trying to pass to onError."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 7511
    .local v2, "r":Ljava/lang/RuntimeException;
    sget-object v3, Lrx/Observable;->hook:Lrx/plugins/RxJavaObservableExecutionHook;

    invoke-virtual {v3, v2}, Lrx/plugins/RxJavaObservableExecutionHook;->onSubscribeError(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 7513
    throw v2
.end method

.method public final unsubscribeOn(Lrx/Scheduler;)Lrx/Observable;
    .locals 1
    .param p1, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 8836
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorUnsubscribeOn;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorUnsubscribeOn;-><init>(Lrx/Scheduler;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(I)Lrx/Observable;
    .locals 1
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/Observable",
            "<",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 8911
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-virtual {p0, p1, p1}, Lrx/Observable;->window(II)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(II)Lrx/Observable;
    .locals 1
    .param p1, "count"    # I
    .param p2, "skip"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lrx/Observable",
            "<",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 8938
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorWindowWithSize;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorWindowWithSize;-><init>(II)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JJLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "timeshift"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 8966
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    const v7, 0x7fffffff

    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v8

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    invoke-virtual/range {v1 .. v8}, Lrx/Observable;->window(JJLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JJLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)Lrx/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "timeshift"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "count"    # I
    .param p7, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "I",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 9029
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    new-instance v1, Lrx/internal/operators/OperatorWindowWithTime;

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    move v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v1 .. v8}, Lrx/internal/operators/OperatorWindowWithTime;-><init>(JJLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)V

    invoke-virtual {p0, v1}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "timeshift"    # J
    .param p5, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p6, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 8996
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    const v7, 0x7fffffff

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move-object v6, p5

    move-object v8, p6

    invoke-virtual/range {v1 .. v8}, Lrx/Observable;->window(JJLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;)Lrx/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/Observable",
            "<",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 9056
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v7

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p1

    move-object v6, p3

    invoke-virtual/range {v1 .. v7}, Lrx/Observable;->window(JJLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;I)Lrx/Observable;
    .locals 7
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "I)",
            "Lrx/Observable",
            "<",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 9087
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Lrx/Scheduler;

    move-result-object v6

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v1 .. v6}, Lrx/Observable;->window(JLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)Lrx/Observable;
    .locals 9
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "count"    # I
    .param p5, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "I",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 9120
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p1

    move-object v6, p3

    move v7, p4

    move-object v8, p5

    invoke-virtual/range {v1 .. v8}, Lrx/Observable;->window(JJLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;Lrx/Scheduler;)Lrx/Observable;
    .locals 7
    .param p1, "timespan"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p4, "scheduler"    # Lrx/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/Scheduler;",
            ")",
            "Lrx/Observable",
            "<",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 9149
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    const v5, 0x7fffffff

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    move-object v6, p4

    invoke-virtual/range {v1 .. v6}, Lrx/Observable;->window(JLjava/util/concurrent/TimeUnit;ILrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(Lrx/Observable;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<TU;>;)",
            "Lrx/Observable",
            "<",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 9203
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "boundary":Lrx/Observable;, "Lrx/Observable<TU;>;"
    new-instance v0, Lrx/internal/operators/OperatorWindowWithObservable;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorWindowWithObservable;-><init>(Lrx/Observable;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(Lrx/Observable;Lrx/functions/Func1;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TOpening:",
            "Ljava/lang/Object;",
            "TClosing:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TTOpening;>;",
            "Lrx/functions/Func1",
            "<-TTOpening;+",
            "Lrx/Observable",
            "<+TTClosing;>;>;)",
            "Lrx/Observable",
            "<",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 9176
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "windowOpenings":Lrx/Observable;, "Lrx/Observable<+TTOpening;>;"
    .local p2, "closingSelector":Lrx/functions/Func1;, "Lrx/functions/Func1<-TTOpening;+Lrx/Observable<+TTClosing;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorWindowWithStartEndObservable;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorWindowWithStartEndObservable;-><init>(Lrx/Observable;Lrx/functions/Func1;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final window(Lrx/functions/Func0;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TClosing:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/functions/Func0",
            "<+",
            "Lrx/Observable",
            "<+TTClosing;>;>;)",
            "Lrx/Observable",
            "<",
            "Lrx/Observable",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 8887
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "closingSelector":Lrx/functions/Func0;, "Lrx/functions/Func0<+Lrx/Observable<+TTClosing;>;>;"
    new-instance v0, Lrx/internal/operators/OperatorWindowWithObservable;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorWindowWithObservable;-><init>(Lrx/functions/Func0;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final withLatestFrom(Lrx/Observable;Lrx/functions/Func2;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TU;>;",
            "Lrx/functions/Func2",
            "<-TT;-TU;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .annotation build Lrx/annotations/Experimental;
    .end annotation

    .prologue
    .line 8861
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "other":Lrx/Observable;, "Lrx/Observable<+TU;>;"
    .local p2, "resultSelector":Lrx/functions/Func2;, "Lrx/functions/Func2<-TT;-TU;+TR;>;"
    new-instance v0, Lrx/internal/operators/OperatorWithLatestFrom;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorWithLatestFrom;-><init>(Lrx/Observable;Lrx/functions/Func2;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final zipWith(Ljava/lang/Iterable;Lrx/functions/Func2;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable",
            "<+TT2;>;",
            "Lrx/functions/Func2",
            "<-TT;-TT2;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 9233
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "other":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TT2;>;"
    .local p2, "zipFunction":Lrx/functions/Func2;, "Lrx/functions/Func2<-TT;-TT2;+TR;>;"
    new-instance v0, Lrx/internal/operators/OperatorZipIterable;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorZipIterable;-><init>(Ljava/lang/Iterable;Lrx/functions/Func2;)V

    invoke-virtual {p0, v0}, Lrx/Observable;->lift(Lrx/Observable$Operator;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public final zipWith(Lrx/Observable;Lrx/functions/Func2;)Lrx/Observable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/Observable",
            "<+TT2;>;",
            "Lrx/functions/Func2",
            "<-TT;-TT2;+TR;>;)",
            "Lrx/Observable",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 9260
    .local p0, "this":Lrx/Observable;, "Lrx/Observable<TT;>;"
    .local p1, "other":Lrx/Observable;, "Lrx/Observable<+TT2;>;"
    .local p2, "zipFunction":Lrx/functions/Func2;, "Lrx/functions/Func2<-TT;-TT2;+TR;>;"
    invoke-static {p0, p1, p2}, Lrx/Observable;->zip(Lrx/Observable;Lrx/Observable;Lrx/functions/Func2;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
