.class Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;
.super Ljava/lang/Object;
.source "ScheduledBroadcastSummary.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Location"
.end annotation


# instance fields
.field private city:Ljava/lang/String;

.field private country:Ljava/lang/String;

.field final synthetic this$0:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;


# direct methods
.method constructor <init>(Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    .prologue
    .line 42
    iput-object p1, p0, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;->this$0:Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;

    .prologue
    .line 42
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;->country:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;

    .prologue
    .line 42
    iget-object v0, p0, Lco/getair/meerkat/dtos/feed/ScheduledBroadcastSummary$Location;->city:Ljava/lang/String;

    return-object v0
.end method
