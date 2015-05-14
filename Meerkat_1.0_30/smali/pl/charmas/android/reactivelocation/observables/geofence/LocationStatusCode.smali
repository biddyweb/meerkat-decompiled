.class public final enum Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;
.super Ljava/lang/Enum;
.source "LocationStatusCode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

.field public static final enum ERROR:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

.field public static final enum GEOFENCE_NOT_AVAILABLE:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

.field public static final enum GEOFENCE_TOO_MANY_GEOFENCES:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

.field public static final enum GEOFENCE_TOO_MANY_PENDING_INTENTS:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

.field public static final enum SUCCESS:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

.field public static final enum UNKNOWN:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;


# instance fields
.field private final name:Ljava/lang/String;

.field private final statusCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 9
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    const-string v1, "SUCCESS"

    const-string v2, "SUCCESS"

    invoke-direct {v0, v1, v5, v5, v2}, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->SUCCESS:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    .line 10
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    const-string v1, "ERROR"

    const-string v2, "ERROR"

    invoke-direct {v0, v1, v6, v6, v2}, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->ERROR:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    .line 11
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    const-string v1, "GEOFENCE_NOT_AVAILABLE"

    const/16 v2, 0x3e8

    const-string v3, "GEOFENCE_NOT_AVAILABLE"

    invoke-direct {v0, v1, v7, v2, v3}, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->GEOFENCE_NOT_AVAILABLE:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    .line 12
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    const-string v1, "GEOFENCE_TOO_MANY_PENDING_INTENTS"

    const/16 v2, 0x3ea

    const-string v3, "GEOFENCE_TOO_MANY_PENDING_INTENTS"

    invoke-direct {v0, v1, v8, v2, v3}, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->GEOFENCE_TOO_MANY_PENDING_INTENTS:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    .line 13
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    const-string v1, "GEOFENCE_TOO_MANY_GEOFENCES"

    const/16 v2, 0x3ea

    const-string v3, "GEOFENCE_TOO_MANY_PENDING_INTENTS"

    invoke-direct {v0, v1, v9, v2, v3}, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->GEOFENCE_TOO_MANY_GEOFENCES:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    .line 14
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x5

    const/4 v3, -0x1

    const-string v4, "STATUS_CODE_UNKNOWN"

    invoke-direct {v0, v1, v2, v3, v4}, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->UNKNOWN:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    .line 8
    const/4 v0, 0x6

    new-array v0, v0, [Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    sget-object v1, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->SUCCESS:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    aput-object v1, v0, v5

    sget-object v1, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->ERROR:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    aput-object v1, v0, v6

    sget-object v1, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->GEOFENCE_NOT_AVAILABLE:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    aput-object v1, v0, v7

    sget-object v1, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->GEOFENCE_TOO_MANY_PENDING_INTENTS:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    aput-object v1, v0, v8

    sget-object v1, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->GEOFENCE_TOO_MANY_GEOFENCES:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    aput-object v1, v0, v9

    const/4 v1, 0x5

    sget-object v2, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->UNKNOWN:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    aput-object v2, v0, v1

    sput-object v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->$VALUES:[Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0
    .param p3, "statusCode"    # I
    .param p4, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 20
    iput p3, p0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->statusCode:I

    .line 21
    iput-object p4, p0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->name:Ljava/lang/String;

    .line 22
    return-void
.end method

.method static fromCode(I)Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;
    .locals 5
    .param p0, "statusCode"    # I

    .prologue
    .line 39
    invoke-static {}, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->values()[Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v0, v2, v1

    .line 40
    .local v0, "code":Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;
    iget v4, v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->statusCode:I

    if-ne v4, p0, :cond_0

    .line 43
    .end local v0    # "code":Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;
    :goto_1
    return-object v0

    .line 39
    .restart local v0    # "code":Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 43
    .end local v0    # "code":Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;
    :cond_1
    sget-object v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->UNKNOWN:Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    return-object v0
.end method

.method public static values()[Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->$VALUES:[Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    invoke-virtual {v0}, [Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .prologue
    .line 28
    iget v0, p0, Lpl/charmas/android/reactivelocation/observables/geofence/LocationStatusCode;->statusCode:I

    return v0
.end method
