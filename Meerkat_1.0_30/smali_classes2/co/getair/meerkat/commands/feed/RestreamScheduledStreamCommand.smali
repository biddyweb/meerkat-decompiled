.class public Lco/getair/meerkat/commands/feed/RestreamScheduledStreamCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "RestreamScheduledStreamCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 2
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 20
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 22
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    .line 23
    .local v0, "streamFeedItemProxy":Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;
    new-instance v1, Lco/getair/meerkat/commands/feed/RestreamScheduledStreamCommand$1;

    invoke-direct {v1, p0, v0}, Lco/getair/meerkat/commands/feed/RestreamScheduledStreamCommand$1;-><init>(Lco/getair/meerkat/commands/feed/RestreamScheduledStreamCommand;Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;)V

    invoke-virtual {v0, v1}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->restreamSchduledStream(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V

    .line 42
    return-void
.end method
