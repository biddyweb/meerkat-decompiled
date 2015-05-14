.class public Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;
.super Ljava/lang/Object;
.source "ScribeConfig.java"


# static fields
.field public static final BASE_URL:Ljava/lang/String; = "https://api.twitter.com"

.field public static final DEFAULT_MAX_FILES_TO_KEEP:I = 0x64

.field public static final DEFAULT_SEND_INTERVAL_SECONDS:I = 0x258


# instance fields
.field public final baseUrl:Ljava/lang/String;

.field public final isEnabled:Z

.field public final maxFilesToKeep:I

.field public final pathType:Ljava/lang/String;

.field public final pathVersion:Ljava/lang/String;

.field public final sendIntervalSeconds:I

.field public final sequence:Ljava/lang/String;

.field public final userAgent:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 0
    .param p1, "isEnabled"    # Z
    .param p2, "baseUrl"    # Ljava/lang/String;
    .param p3, "pathVersion"    # Ljava/lang/String;
    .param p4, "pathType"    # Ljava/lang/String;
    .param p5, "sequence"    # Ljava/lang/String;
    .param p6, "userAgent"    # Ljava/lang/String;
    .param p7, "maxFilesToKeep"    # I
    .param p8, "sendIntervalSeconds"    # I

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-boolean p1, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->isEnabled:Z

    .line 46
    iput-object p2, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->baseUrl:Ljava/lang/String;

    .line 47
    iput-object p3, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->pathVersion:Ljava/lang/String;

    .line 48
    iput-object p4, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->pathType:Ljava/lang/String;

    .line 49
    iput-object p5, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->sequence:Ljava/lang/String;

    .line 50
    iput-object p6, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->userAgent:Ljava/lang/String;

    .line 51
    iput p7, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->maxFilesToKeep:I

    .line 52
    iput p8, p0, Lcom/twitter/sdk/android/core/internal/scribe/ScribeConfig;->sendIntervalSeconds:I

    .line 53
    return-void
.end method
