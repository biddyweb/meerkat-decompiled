.class public final Lcom/makeramen/roundedimageview/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/makeramen/roundedimageview/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final RoundedImageView:[I

.field public static final RoundedImageView_android_scaleType:I = 0x0

.field public static final RoundedImageView_riv_border_color:I = 0x3

.field public static final RoundedImageView_riv_border_width:I = 0x2

.field public static final RoundedImageView_riv_corner_radius:I = 0x1

.field public static final RoundedImageView_riv_mutate_background:I = 0x4

.field public static final RoundedImageView_riv_oval:I = 0x5

.field public static final RoundedImageView_riv_tile_mode:I = 0x6

.field public static final RoundedImageView_riv_tile_mode_x:I = 0x7

.field public static final RoundedImageView_riv_tile_mode_y:I = 0x8


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/makeramen/roundedimageview/R$styleable;->RoundedImageView:[I

    return-void

    :array_0
    .array-data 4
        0x101011d
        0x7f010053
        0x7f010054
        0x7f010055
        0x7f010056
        0x7f010057
        0x7f010058
        0x7f010059
        0x7f01005a
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
