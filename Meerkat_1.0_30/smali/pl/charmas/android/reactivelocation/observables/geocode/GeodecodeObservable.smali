.class public Lpl/charmas/android/reactivelocation/observables/geocode/GeodecodeObservable;
.super Ljava/lang/Object;
.source "GeodecodeObservable.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<",
        "Ljava/util/List",
        "<",
        "Landroid/location/Address;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final ctx:Landroid/content/Context;

.field private final latitude:D

.field private final longitude:D

.field private final maxResults:I


# direct methods
.method private constructor <init>(Landroid/content/Context;DDI)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "latitude"    # D
    .param p4, "longitude"    # D
    .param p6, "maxResults"    # I

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lpl/charmas/android/reactivelocation/observables/geocode/GeodecodeObservable;->ctx:Landroid/content/Context;

    .line 25
    iput-wide p2, p0, Lpl/charmas/android/reactivelocation/observables/geocode/GeodecodeObservable;->latitude:D

    .line 26
    iput-wide p4, p0, Lpl/charmas/android/reactivelocation/observables/geocode/GeodecodeObservable;->longitude:D

    .line 27
    iput p6, p0, Lpl/charmas/android/reactivelocation/observables/geocode/GeodecodeObservable;->maxResults:I

    .line 28
    return-void
.end method

.method public static createObservable(Landroid/content/Context;DDI)Lrx/Observable;
    .locals 7
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "latitude"    # D
    .param p3, "longitude"    # D
    .param p5, "maxResults"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "DDI)",
            "Lrx/Observable",
            "<",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 20
    new-instance v0, Lpl/charmas/android/reactivelocation/observables/geocode/GeodecodeObservable;

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lpl/charmas/android/reactivelocation/observables/geocode/GeodecodeObservable;-><init>(Landroid/content/Context;DDI)V

    invoke-static {v0}, Lrx/Observable;->create(Lrx/Observable$OnSubscribe;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 13
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lpl/charmas/android/reactivelocation/observables/geocode/GeodecodeObservable;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Ljava/util/List",
            "<",
            "Landroid/location/Address;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Ljava/util/List<Landroid/location/Address;>;>;"
    new-instance v1, Landroid/location/Geocoder;

    iget-object v2, p0, Lpl/charmas/android/reactivelocation/observables/geocode/GeodecodeObservable;->ctx:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    .line 34
    .local v1, "geocoder":Landroid/location/Geocoder;
    :try_start_0
    iget-wide v2, p0, Lpl/charmas/android/reactivelocation/observables/geocode/GeodecodeObservable;->latitude:D

    iget-wide v4, p0, Lpl/charmas/android/reactivelocation/observables/geocode/GeodecodeObservable;->longitude:D

    iget v6, p0, Lpl/charmas/android/reactivelocation/observables/geocode/GeodecodeObservable;->maxResults:I

    invoke-virtual/range {v1 .. v6}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object v2

    invoke-virtual {p1, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 35
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    :goto_0
    return-void

    .line 36
    :catch_0
    move-exception v0

    .line 37
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p1, v0}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
