.class public final Lcom/mixpanel/android/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final AdsAttrs:[I

.field public static final AdsAttrs_adSize:I = 0x0

.field public static final AdsAttrs_adSizes:I = 0x1

.field public static final AdsAttrs_adUnitId:I = 0x2

.field public static final MapAttrs:[I

.field public static final MapAttrs_cameraBearing:I = 0x1

.field public static final MapAttrs_cameraTargetLat:I = 0x2

.field public static final MapAttrs_cameraTargetLng:I = 0x3

.field public static final MapAttrs_cameraTilt:I = 0x4

.field public static final MapAttrs_cameraZoom:I = 0x5

.field public static final MapAttrs_mapType:I = 0x0

.field public static final MapAttrs_uiCompass:I = 0x7

.field public static final MapAttrs_uiRotateGestures:I = 0x8

.field public static final MapAttrs_uiScrollGestures:I = 0x9

.field public static final MapAttrs_uiTiltGestures:I = 0xa

.field public static final MapAttrs_uiZoomControls:I = 0xb

.field public static final MapAttrs_uiZoomGestures:I = 0xc

.field public static final MapAttrs_useViewLifecycle:I = 0xd

.field public static final MapAttrs_zOrderOnTop:I = 0xe

.field public static final WalletFragmentOptions:[I

.field public static final WalletFragmentOptions_appTheme:I = 0x0

.field public static final WalletFragmentOptions_environment:I = 0x1

.field public static final WalletFragmentOptions_fragmentMode:I = 0x3

.field public static final WalletFragmentOptions_fragmentStyle:I = 0x2

.field public static final WalletFragmentStyle:[I

.field public static final WalletFragmentStyle_buyButtonAppearance:I = 0x3

.field public static final WalletFragmentStyle_buyButtonHeight:I = 0x0

.field public static final WalletFragmentStyle_buyButtonText:I = 0x2

.field public static final WalletFragmentStyle_buyButtonWidth:I = 0x1

.field public static final WalletFragmentStyle_maskedWalletDetailsBackground:I = 0x6

.field public static final WalletFragmentStyle_maskedWalletDetailsButtonBackground:I = 0x8

.field public static final WalletFragmentStyle_maskedWalletDetailsButtonTextAppearance:I = 0x7

.field public static final WalletFragmentStyle_maskedWalletDetailsHeaderTextAppearance:I = 0x5

.field public static final WalletFragmentStyle_maskedWalletDetailsLogoImageType:I = 0xa

.field public static final WalletFragmentStyle_maskedWalletDetailsLogoTextColor:I = 0x9

.field public static final WalletFragmentStyle_maskedWalletDetailsTextAppearance:I = 0x4


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 256
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mixpanel/android/R$styleable;->AdsAttrs:[I

    .line 260
    const/16 v0, 0x10

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/mixpanel/android/R$styleable;->MapAttrs:[I

    .line 275
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/mixpanel/android/R$styleable;->WalletFragmentOptions:[I

    .line 280
    const/16 v0, 0xb

    new-array v0, v0, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/mixpanel/android/R$styleable;->WalletFragmentStyle:[I

    return-void

    .line 256
    nop

    :array_0
    .array-data 4
        0x7f010020
        0x7f010021
        0x7f010022
    .end array-data

    .line 260
    :array_1
    .array-data 4
        0x7f01003c
        0x7f01003d
        0x7f01003e
        0x7f01003f
        0x7f010040
        0x7f010041
        0x7f010042
        0x7f010043
        0x7f010044
        0x7f010045
        0x7f010046
        0x7f010047
        0x7f010048
        0x7f010049
        0x7f01004a
        0x7f01004b
    .end array-data

    .line 275
    :array_2
    .array-data 4
        0x7f0100ef
        0x7f0100f0
        0x7f0100f1
        0x7f0100f2
    .end array-data

    .line 280
    :array_3
    .array-data 4
        0x7f0100f3
        0x7f0100f4
        0x7f0100f5
        0x7f0100f6
        0x7f0100f7
        0x7f0100f8
        0x7f0100f9
        0x7f0100fa
        0x7f0100fb
        0x7f0100fc
        0x7f0100fd
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 255
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
