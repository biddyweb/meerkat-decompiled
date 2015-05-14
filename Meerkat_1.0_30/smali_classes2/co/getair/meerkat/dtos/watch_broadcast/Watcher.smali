.class public Lco/getair/meerkat/dtos/watch_broadcast/Watcher;
.super Ljava/lang/Object;
.source "Watcher.java"


# instance fields
.field public displayName:Ljava/lang/String;

.field public follow:Ljava/lang/String;

.field public id:Ljava/lang/String;

.field public photoHiResUrl:Ljava/lang/String;

.field public photoUrl:Ljava/lang/String;

.field public profile:Ljava/lang/String;

.field public profileThumbImage:Ljava/lang/String;

.field public username:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 22
    move-object v0, p1

    check-cast v0, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;

    .line 24
    .local v0, "otherWatcher":Lco/getair/meerkat/dtos/watch_broadcast/Watcher;
    iget-object v1, p0, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;->id:Ljava/lang/String;

    iget-object v2, v0, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 26
    const/4 v1, 0x1

    .line 28
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    .line 35
    const/16 v2, 0x1f

    .line 36
    .local v2, "prime":I
    const/4 v0, 0x7

    .line 37
    .local v0, "hash":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;->id:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 38
    mul-int/lit8 v3, v0, 0x1f

    iget-object v4, p0, Lco/getair/meerkat/dtos/watch_broadcast/Watcher;->id:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    add-int v0, v3, v4

    .line 37
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 41
    :cond_0
    return v0
.end method
