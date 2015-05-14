.class final Lcom/instabug/library/util/crash/b;
.super Ljava/lang/Object;
.source "IBUncaughtExceptionHandler.java"

# interfaces
.implements Lcom/instabug/library/interactor/a$a;


# instance fields
.field private synthetic a:Ljava/lang/Thread;

.field private synthetic b:Ljava/lang/Throwable;

.field private synthetic c:Lcom/instabug/library/util/crash/a;


# direct methods
.method constructor <init>(Lcom/instabug/library/util/crash/a;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 0

    .prologue
    .line 62
    iput-object p1, p0, Lcom/instabug/library/util/crash/b;->c:Lcom/instabug/library/util/crash/a;

    iput-object p2, p0, Lcom/instabug/library/util/crash/b;->a:Ljava/lang/Thread;

    iput-object p3, p0, Lcom/instabug/library/util/crash/b;->b:Ljava/lang/Throwable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .prologue
    .line 65
    const-string v0, "Crash persisted for upload at next startup"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Lcom/instabug/library/util/crash/b;->c:Lcom/instabug/library/util/crash/a;

    invoke-static {v0}, Lcom/instabug/library/util/crash/a;->a(Lcom/instabug/library/util/crash/a;)Lcom/instabug/library/util/a;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/util/crash/b;->a:Ljava/lang/Thread;

    iget-object v2, p0, Lcom/instabug/library/util/crash/b;->b:Ljava/lang/Throwable;

    invoke-interface {v0, v1, v2}, Lcom/instabug/library/util/a;->a(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 67
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Exception handlling Error: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 72
    iget-object v0, p0, Lcom/instabug/library/util/crash/b;->c:Lcom/instabug/library/util/crash/a;

    invoke-static {v0}, Lcom/instabug/library/util/crash/a;->a(Lcom/instabug/library/util/crash/a;)Lcom/instabug/library/util/a;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/util/crash/b;->a:Ljava/lang/Thread;

    iget-object v2, p0, Lcom/instabug/library/util/crash/b;->b:Ljava/lang/Throwable;

    invoke-interface {v0, v1, v2}, Lcom/instabug/library/util/a;->a(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 73
    return-void
.end method
