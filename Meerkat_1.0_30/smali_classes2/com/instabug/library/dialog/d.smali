.class public final Lcom/instabug/library/dialog/d;
.super Landroid/app/Dialog;
.source "InstabugFeedbackDialog.java"

# interfaces
.implements Lcom/instabug/library/view/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/dialog/d$b;,
        Lcom/instabug/library/dialog/d$a;
    }
.end annotation


# instance fields
.field private a:Landroid/widget/EditText;

.field private b:Landroid/widget/EditText;

.field private c:Landroid/widget/TextView;

.field private d:Landroid/view/View;

.field private e:Lcom/instabug/library/presenter/e;

.field private f:Lcom/instabug/library/dialog/d$a;

.field private g:Ljava/lang/String;

.field private h:Ljava/lang/String;

.field private i:Landroid/widget/TextView;

.field private j:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/instabug/library/dialog/d$a;Lcom/instabug/library/interactor/c;Lcom/instabug/library/model/b;)V
    .locals 10

    .prologue
    .line 56
    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 50
    const-string v0, "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"

    iput-object v0, p0, Lcom/instabug/library/dialog/d;->g:Ljava/lang/String;

    .line 51
    const-string v0, "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"

    iput-object v0, p0, Lcom/instabug/library/dialog/d;->h:Ljava/lang/String;

    .line 57
    iput-object p2, p0, Lcom/instabug/library/dialog/d;->f:Lcom/instabug/library/dialog/d$a;

    .line 58
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/d;->requestWindowFeature(I)Z

    .line 59
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const-string v1, "instabug_lyt_dialog_composer_standalone"

    const-string v3, "layout"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v1, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/d;->setContentView(Landroid/view/View;)V

    const-string v0, "email_separator"

    const-string v1, "id"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v1, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/d;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/dialog/d;->d:Landroid/view/View;

    const-string v0, "user_email"

    const-string v1, "id"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v1, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/d;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/instabug/library/dialog/d;->b:Landroid/widget/EditText;

    const-string v0, "text_composer"

    const-string v1, "id"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v1, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/d;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/instabug/library/dialog/d;->a:Landroid/widget/EditText;

    const-string v0, "send_message"

    const-string v1, "id"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v1, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/d;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/instabug/library/dialog/d;->c:Landroid/widget/TextView;

    const-string v0, "instabug_pbi_text"

    const-string v1, "id"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v1, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/d;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/instabug/library/dialog/d;->i:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/instabug/library/dialog/d;->i:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "&name&"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "&name&"

    const-string v3, "Instabug"

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "  "

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const-string v0, "Feedback Powered by Instabug"

    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/instabug/library/dialog/d;->i:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/instabug/library/dialog/d;->g:Ljava/lang/String;

    const-string v0, "instabug_logo"

    const-string v3, "id"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v0, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/d;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/instabug/library/dialog/d;->j:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/instabug/library/dialog/d;->f:Lcom/instabug/library/dialog/d$a;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/instabug/library/dialog/d;->d:Landroid/view/View;

    iget-object v2, p0, Lcom/instabug/library/dialog/d;->f:Lcom/instabug/library/dialog/d$a;

    iget v2, v2, Lcom/instabug/library/dialog/d$a;->c:I

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, p0, Lcom/instabug/library/dialog/d;->a:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/instabug/library/dialog/d;->f:Lcom/instabug/library/dialog/d$a;

    iget v2, v2, Lcom/instabug/library/dialog/d$a;->b:I

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTextColor(I)V

    iget-object v0, p0, Lcom/instabug/library/dialog/d;->a:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/instabug/library/dialog/d;->f:Lcom/instabug/library/dialog/d$a;

    iget v2, v2, Lcom/instabug/library/dialog/d$a;->c:I

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHintTextColor(I)V

    iget-object v0, p0, Lcom/instabug/library/dialog/d;->b:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/instabug/library/dialog/d;->f:Lcom/instabug/library/dialog/d$a;

    iget v2, v2, Lcom/instabug/library/dialog/d$a;->c:I

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHintTextColor(I)V

    iget-object v0, p0, Lcom/instabug/library/dialog/d;->b:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/instabug/library/dialog/d;->f:Lcom/instabug/library/dialog/d$a;

    iget v2, v2, Lcom/instabug/library/dialog/d$a;->b:I

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTextColor(I)V

    iget-object v0, p0, Lcom/instabug/library/dialog/d;->c:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/instabug/library/dialog/d;->f:Lcom/instabug/library/dialog/d$a;

    iget v2, v2, Lcom/instabug/library/dialog/d$a;->b:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v0, v2, :cond_2

    iget-object v0, p0, Lcom/instabug/library/dialog/d;->c:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v2, p0, Lcom/instabug/library/dialog/d;->f:Lcom/instabug/library/dialog/d$a;

    iget v2, v2, Lcom/instabug/library/dialog/d$a;->a:I

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->OVERLAY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v2, v3}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    :cond_2
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->f:Lcom/instabug/library/dialog/d$a;

    iget v0, v0, Lcom/instabug/library/dialog/d$a;->a:I

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    const-wide v4, 0x3fd322d0e5604189L    # 0.299

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v6

    int-to-double v6, v6

    mul-double/2addr v4, v6

    const-wide v6, 0x3fe2c8b439581062L    # 0.587

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v8

    int-to-double v8, v8

    mul-double/2addr v6, v8

    add-double/2addr v4, v6

    const-wide v6, 0x3fbd2f1a9fbe76c9L    # 0.114

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    int-to-double v8, v0

    mul-double/2addr v6, v8

    add-double/2addr v4, v6

    const-wide v6, 0x406fe00000000000L    # 255.0

    div-double/2addr v4, v6

    sub-double/2addr v2, v4

    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    cmpg-double v0, v2, v4

    if-gez v0, :cond_5

    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/instabug/library/dialog/d;->h:Ljava/lang/String;

    :goto_2
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v0

    const/4 v1, 0x0

    array-length v2, v0

    invoke-static {v0, v1, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/dialog/d;->j:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/Instabug;->getSettingsBundle()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->c()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/instabug/library/dialog/d;->c:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->c:Landroid/widget/TextView;

    new-instance v1, Lcom/instabug/library/dialog/f;

    invoke-direct {v1, p0}, Lcom/instabug/library/dialog/f;-><init>(Lcom/instabug/library/dialog/d;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lcom/instabug/library/dialog/g;

    invoke-direct {v0, p0}, Lcom/instabug/library/dialog/g;-><init>(Lcom/instabug/library/dialog/d;)V

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/d;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 60
    new-instance v0, Lcom/instabug/library/presenter/e;

    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v1

    invoke-virtual {v1}, Lcom/instabug/library/Instabug;->getSettingsBundle()Lcom/instabug/library/x;

    move-result-object v1

    invoke-direct {v0, p0, p3, v1, p4}, Lcom/instabug/library/presenter/e;-><init>(Lcom/instabug/library/view/b;Lcom/instabug/library/interactor/c;Lcom/instabug/library/x;Lcom/instabug/library/model/b;)V

    iput-object v0, p0, Lcom/instabug/library/dialog/d;->e:Lcom/instabug/library/presenter/e;

    move-object v0, p1

    .line 61
    check-cast v0, Landroid/app/Activity;

    invoke-virtual {p0, v0}, Lcom/instabug/library/dialog/d;->setOwnerActivity(Landroid/app/Activity;)V

    move-object v0, p1

    .line 62
    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lcom/instabug/library/dialog/e;

    invoke-direct {v1, p0}, Lcom/instabug/library/dialog/e;-><init>(Lcom/instabug/library/dialog/d;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 69
    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {p1}, Landroid/content/Context;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    :goto_3
    const-string v2, "com.instabug.library.settings"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 70
    new-instance v0, Lcom/instabug/library/dialog/d$b;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lcom/instabug/library/dialog/d$b;-><init>(B)V

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v1, 0x1

    aput-object p0, v2, v1

    invoke-virtual {v0, v2}, Lcom/instabug/library/dialog/d$b;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 71
    return-void

    .line 59
    :cond_4
    const-string v0, "Feedback Powered by Instabug"

    goto/16 :goto_0

    :cond_5
    const/4 v0, 0x1

    goto/16 :goto_1

    .line 69
    :cond_6
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    goto :goto_3

    :cond_7
    move-object v0, v1

    goto/16 :goto_2
.end method

.method static synthetic a(Lcom/instabug/library/dialog/d;)Lcom/instabug/library/presenter/e;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->e:Lcom/instabug/library/presenter/e;

    return-object v0
.end method

.method static synthetic a(Lcom/instabug/library/dialog/d;Lorg/json/JSONObject;)V
    .locals 3

    .prologue
    const/4 v2, 0x4

    .line 43
    if-eqz p1, :cond_0

    const-string v0, "white_label"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/dialog/d;->i:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/instabug/library/dialog/d;->j:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->b:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final a(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->b:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 177
    return-void
.end method

.method public final a(Z)V
    .locals 3

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 160
    if-nez p1, :cond_0

    .line 161
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->b:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 162
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->d:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 167
    :goto_0
    return-void

    .line 164
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->b:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 165
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->d:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public final b()Ljava/lang/String;
    .locals 1

    .prologue
    .line 211
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->a:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final b(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->b:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 187
    return-void
.end method

.method public final c()V
    .locals 1

    .prologue
    .line 232
    invoke-virtual {p0}, Lcom/instabug/library/dialog/d;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Landroid/app/Activity;)V

    .line 233
    invoke-virtual {p0}, Lcom/instabug/library/dialog/d;->dismiss()V

    .line 234
    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->a:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 197
    return-void
.end method

.method public final d(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 216
    invoke-virtual {p0}, Lcom/instabug/library/dialog/d;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 217
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 218
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 219
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->b:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 220
    return-void
.end method

.method public final e(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 224
    invoke-virtual {p0}, Lcom/instabug/library/dialog/d;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 225
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 226
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 227
    iget-object v0, p0, Lcom/instabug/library/dialog/d;->a:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 228
    return-void
.end method

.method public final f(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 238
    invoke-virtual {p0}, Lcom/instabug/library/dialog/d;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Landroid/app/Activity;)V

    .line 239
    invoke-virtual {p0}, Lcom/instabug/library/dialog/d;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 240
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 241
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 242
    invoke-virtual {p0}, Lcom/instabug/library/dialog/d;->dismiss()V

    .line 243
    return-void
.end method
