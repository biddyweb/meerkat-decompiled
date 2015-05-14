.class final Lcom/instabug/library/internal/module/b;
.super Ljava/lang/Object;
.source "InstabugModule.java"

# interfaces
.implements Lcom/instabug/library/util/a;


# instance fields
.field private synthetic a:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method constructor <init>(Lcom/instabug/library/internal/module/a;Ljava/lang/Thread$UncaughtExceptionHandler;)V
    .locals 0

    .prologue
    .line 64
    iput-object p2, p0, Lcom/instabug/library/internal/module/b;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/instabug/library/internal/module/b;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 68
    return-void
.end method
