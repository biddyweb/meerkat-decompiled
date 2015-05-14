.class public final Lcom/twitter/sdk/android/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/twitter/sdk/android/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final StateButton:[I

.field public static final StateButton_dgts__StateButtonStyle:I = 0x3

.field public static final StateButton_finishStateText:I = 0x0

.field public static final StateButton_progressStateText:I = 0x1

.field public static final StateButton_startStateText:I = 0x2

.field public static final tw__AspectRatioImageView:[I

.field public static final tw__AspectRatioImageView_tw__image_aspect_ratio:I = 0x0

.field public static final tw__AspectRatioImageView_tw__image_dimension_to_adjust:I = 0x1

.field public static final tw__TweetView:[I

.field public static final tw__TweetView_tw__action_color:I = 0x3

.field public static final tw__TweetView_tw__container_bg_color:I = 0x1

.field public static final tw__TweetView_tw__primary_text_color:I = 0x2

.field public static final tw__TweetView_tw__tweet_id:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x4

    .line 312
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/twitter/sdk/android/R$styleable;->StateButton:[I

    .line 317
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/twitter/sdk/android/R$styleable;->tw__AspectRatioImageView:[I

    .line 320
    new-array v0, v1, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/twitter/sdk/android/R$styleable;->tw__TweetView:[I

    return-void

    .line 312
    :array_0
    .array-data 4
        0x7f01006b
        0x7f01006c
        0x7f01006d
        0x7f01006e
    .end array-data

    .line 317
    :array_1
    .array-data 4
        0x7f0100fe
        0x7f0100ff
    .end array-data

    .line 320
    :array_2
    .array-data 4
        0x7f010100
        0x7f010101
        0x7f010102
        0x7f010103
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 311
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
