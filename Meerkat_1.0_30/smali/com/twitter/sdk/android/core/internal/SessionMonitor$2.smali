.class Lcom/twitter/sdk/android/core/internal/SessionMonitor$2;
.super Ljava/lang/Object;
.source "SessionMonitor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/core/internal/SessionMonitor;->triggerVerificationIfNecessary()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/core/internal/SessionMonitor;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/internal/SessionMonitor;)V
    .locals 0

    .prologue
    .line 79
    .local p0, "this":Lcom/twitter/sdk/android/core/internal/SessionMonitor$2;, "Lcom/twitter/sdk/android/core/internal/SessionMonitor.2;"
    iput-object p1, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$2;->this$0:Lcom/twitter/sdk/android/core/internal/SessionMonitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 82
    .local p0, "this":Lcom/twitter/sdk/android/core/internal/SessionMonitor$2;, "Lcom/twitter/sdk/android/core/internal/SessionMonitor.2;"
    iget-object v0, p0, Lcom/twitter/sdk/android/core/internal/SessionMonitor$2;->this$0:Lcom/twitter/sdk/android/core/internal/SessionMonitor;

    invoke-virtual {v0}, Lcom/twitter/sdk/android/core/internal/SessionMonitor;->verifyAll()V

    .line 83
    return-void
.end method
