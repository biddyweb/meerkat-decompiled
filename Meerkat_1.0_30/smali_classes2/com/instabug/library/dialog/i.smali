.class public final Lcom/instabug/library/dialog/i;
.super Lcom/instabug/library/dialog/h;
.source "InstabugSwipeLeftAnimationDialog.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0, p1, p2}, Lcom/instabug/library/dialog/h;-><init>(Landroid/content/Context;I)V

    .line 12
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/res/Resources;Ljava/lang/String;)[Lcom/instabug/library/internal/view/AnimatedImageView$a;
    .locals 6

    .prologue
    const/16 v5, 0x32

    .line 16
    const/16 v0, 0x16

    new-array v0, v0, [Lcom/instabug/library/internal/view/AnimatedImageView$a;

    .line 17
    const/4 v1, 0x0

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_1"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 18
    const/4 v1, 0x1

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_2"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 19
    const/4 v1, 0x2

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_3"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 20
    const/4 v1, 0x3

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_4"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 21
    const/4 v1, 0x4

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_5"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 22
    const/4 v1, 0x5

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_6"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 23
    const/4 v1, 0x6

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_7"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 24
    const/4 v1, 0x7

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_8"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 25
    const/16 v1, 0x8

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_9"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 26
    const/16 v1, 0x9

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_10"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 27
    const/16 v1, 0xa

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_11"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 28
    const/16 v1, 0xb

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_12"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 29
    const/16 v1, 0xc

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_13"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 30
    const/16 v1, 0xd

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_14"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 31
    const/16 v1, 0xe

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_15"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 32
    const/16 v1, 0xf

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_16"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 33
    const/16 v1, 0x10

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_17"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 34
    const/16 v1, 0x11

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_18"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 35
    const/16 v1, 0x12

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_19"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 36
    const/16 v1, 0x13

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_20"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 37
    const/16 v1, 0x14

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_21"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 38
    const/16 v1, 0x15

    new-instance v2, Lcom/instabug/library/internal/view/AnimatedImageView$a;

    const-string v3, "instabug_twoswipeleft_frame_22"

    const-string v4, "drawable"

    invoke-virtual {p1, v3, v4, p2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-direct {v2, v3, v5}, Lcom/instabug/library/internal/view/AnimatedImageView$a;-><init>(II)V

    aput-object v2, v0, v1

    .line 39
    return-object v0
.end method
