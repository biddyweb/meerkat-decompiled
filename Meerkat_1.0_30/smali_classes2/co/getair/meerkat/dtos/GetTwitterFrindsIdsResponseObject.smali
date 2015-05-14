.class public Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;
.super Ljava/lang/Object;
.source "GetTwitterFrindsIdsResponseObject.java"


# instance fields
.field private ids:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private next_cursor:J

.field private next_cursor_str:Ljava/lang/String;

.field private previous_cursor:J

.field private previous_cursor_str:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 16
    iget-object v0, p0, Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;->ids:Ljava/util/List;

    return-object v0
.end method

.method public getNext_cursor()J
    .locals 2

    .prologue
    .line 20
    iget-wide v0, p0, Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;->next_cursor:J

    return-wide v0
.end method

.method public getPrevious_cursor()J
    .locals 2

    .prologue
    .line 24
    iget-wide v0, p0, Lco/getair/meerkat/dtos/GetTwitterFrindsIdsResponseObject;->previous_cursor:J

    return-wide v0
.end method
