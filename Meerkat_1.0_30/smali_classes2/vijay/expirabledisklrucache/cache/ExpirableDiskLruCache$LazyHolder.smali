.class Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache$LazyHolder;
.super Ljava/lang/Object;
.source "ExpirableDiskLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LazyHolder"
.end annotation


# static fields
.field private static final INSTANCE:Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 110
    new-instance v0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;-><init>(Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache$1;)V

    sput-object v0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache$LazyHolder;->INSTANCE:Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100()Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;
    .locals 1

    .prologue
    .line 109
    sget-object v0, Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache$LazyHolder;->INSTANCE:Lvijay/expirabledisklrucache/cache/ExpirableDiskLruCache;

    return-object v0
.end method
