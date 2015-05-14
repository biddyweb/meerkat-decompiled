.class public Lco/getair/meerkat/views/LoginSuccessfulView;
.super Landroid/widget/RelativeLayout;
.source "LoginSuccessfulView.java"


# instance fields
.field private linksWillOpenInAppText:Landroid/widget/TextView;

.field private logInSuccessfulImage:Landroid/widget/ImageView;

.field private yourLoggedInText:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 25
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lco/getair/meerkat/views/LoginSuccessfulView;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lco/getair/meerkat/views/LoginSuccessfulView;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    invoke-direct {p0, p1, p2, p3}, Lco/getair/meerkat/views/LoginSuccessfulView;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 39
    const-string v1, "layout_inflater"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .line 40
    .local v0, "layoutInflater":Landroid/view/LayoutInflater;
    const v1, 0x7f040040

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 41
    const v1, 0x7f0e0146

    invoke-virtual {p0, v1}, Lco/getair/meerkat/views/LoginSuccessfulView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/views/LoginSuccessfulView;->yourLoggedInText:Landroid/widget/TextView;

    .line 42
    const v1, 0x7f0e0148

    invoke-virtual {p0, v1}, Lco/getair/meerkat/views/LoginSuccessfulView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/views/LoginSuccessfulView;->linksWillOpenInAppText:Landroid/widget/TextView;

    .line 43
    const v1, 0x7f0e0147

    invoke-virtual {p0, v1}, Lco/getair/meerkat/views/LoginSuccessfulView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lco/getair/meerkat/views/LoginSuccessfulView;->logInSuccessfulImage:Landroid/widget/ImageView;

    .line 44
    return-void
.end method
