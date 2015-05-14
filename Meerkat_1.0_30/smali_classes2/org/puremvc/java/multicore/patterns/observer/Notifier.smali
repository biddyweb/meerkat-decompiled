.class public Lorg/puremvc/java/multicore/patterns/observer/Notifier;
.super Ljava/lang/Object;
.source "Notifier.java"


# instance fields
.field protected multitonKey:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notifier;->multitonKey:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 2

    .prologue
    .line 44
    iget-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notifier;->multitonKey:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 45
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Notifier not initialized"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_0
    iget-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notifier;->multitonKey:Ljava/lang/String;

    invoke-static {v0}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->getInstance(Ljava/lang/String;)Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method public initializeNotifier(Ljava/lang/String;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 118
    iput-object p1, p0, Lorg/puremvc/java/multicore/patterns/observer/Notifier;->multitonKey:Ljava/lang/String;

    .line 119
    return-void
.end method

.method public sendNotification(Ljava/lang/String;)V
    .locals 1
    .param p1, "notificationName"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-virtual {p0}, Lorg/puremvc/java/multicore/patterns/observer/Notifier;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;)V

    .line 97
    return-void
.end method

.method public sendNotification(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "notificationName"    # Ljava/lang/String;
    .param p2, "body"    # Ljava/lang/Object;

    .prologue
    .line 82
    invoke-virtual {p0}, Lorg/puremvc/java/multicore/patterns/observer/Notifier;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;)V

    .line 83
    return-void
.end method

.method public sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .param p1, "notificationName"    # Ljava/lang/String;
    .param p2, "body"    # Ljava/lang/Object;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-virtual {p0}, Lorg/puremvc/java/multicore/patterns/observer/Notifier;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lorg/puremvc/java/multicore/patterns/facade/Facade;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    return-void
.end method
