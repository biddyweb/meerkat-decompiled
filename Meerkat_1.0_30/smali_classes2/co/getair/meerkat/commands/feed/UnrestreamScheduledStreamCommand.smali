.class public Lco/getair/meerkat/commands/feed/UnrestreamScheduledStreamCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "UnrestreamScheduledStreamCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 1
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 15
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 17
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;

    .line 18
    .local v0, "streamFeedItemProxy":Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;
    invoke-virtual {v0}, Lco/getair/meerkat/dtos/feed/StreamFeedScheduledItemProxy;->unrestreamScheduledStream()V

    .line 19
    return-void
.end method
