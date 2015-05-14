.class public Lco/getair/meerkat/dtos/User$Stats;
.super Ljava/lang/Object;
.source "User.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/dtos/User;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Stats"
.end annotation


# instance fields
.field followersCount:I

.field followingCount:I

.field score:I

.field streamsCount:I

.field final synthetic this$0:Lco/getair/meerkat/dtos/User;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/dtos/User;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/dtos/User;

    .prologue
    .line 187
    iput-object p1, p0, Lco/getair/meerkat/dtos/User$Stats;->this$0:Lco/getair/meerkat/dtos/User;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFollowersCount()I
    .locals 1

    .prologue
    .line 195
    iget v0, p0, Lco/getair/meerkat/dtos/User$Stats;->followersCount:I

    return v0
.end method

.method public getFollowingCount()I
    .locals 1

    .prologue
    .line 199
    iget v0, p0, Lco/getair/meerkat/dtos/User$Stats;->followingCount:I

    return v0
.end method

.method public getScore()I
    .locals 1

    .prologue
    .line 203
    iget v0, p0, Lco/getair/meerkat/dtos/User$Stats;->score:I

    return v0
.end method

.method public getStreamsCount()I
    .locals 1

    .prologue
    .line 207
    iget v0, p0, Lco/getair/meerkat/dtos/User$Stats;->streamsCount:I

    return v0
.end method
