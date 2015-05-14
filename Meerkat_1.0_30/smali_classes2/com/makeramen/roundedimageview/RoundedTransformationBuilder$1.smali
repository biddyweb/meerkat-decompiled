.class Lcom/makeramen/roundedimageview/RoundedTransformationBuilder$1;
.super Ljava/lang/Object;
.source "RoundedTransformationBuilder.java"

# interfaces
.implements Lcom/squareup/picasso/Transformation;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->build()Lcom/squareup/picasso/Transformation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;


# direct methods
.method constructor <init>(Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;)V
    .locals 0
    .param p1, "this$0"    # Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public key()Ljava/lang/String;
    .locals 2

    .prologue
    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "r:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;

    # getter for: Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->mCornerRadius:F
    invoke-static {v1}, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->access$300(Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;)F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "b:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;

    .line 117
    # getter for: Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->mBorderWidth:F
    invoke-static {v1}, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->access$200(Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;)F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "c:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;

    .line 118
    # getter for: Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->mBorderColor:Landroid/content/res/ColorStateList;
    invoke-static {v1}, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->access$100(Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "o:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;

    .line 119
    # getter for: Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->mOval:Z
    invoke-static {v1}, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->access$000(Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public transform(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 3
    .param p1, "source"    # Landroid/graphics/Bitmap;

    .prologue
    .line 102
    invoke-static {p1}, Lcom/makeramen/roundedimageview/RoundedDrawable;->fromBitmap(Landroid/graphics/Bitmap;)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;

    .line 103
    # getter for: Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->mScaleType:Landroid/widget/ImageView$ScaleType;
    invoke-static {v2}, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->access$400(Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;)Landroid/widget/ImageView$ScaleType;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/makeramen/roundedimageview/RoundedDrawable;->setScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;

    .line 104
    # getter for: Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->mCornerRadius:F
    invoke-static {v2}, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->access$300(Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;)F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/makeramen/roundedimageview/RoundedDrawable;->setCornerRadius(F)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;

    .line 105
    # getter for: Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->mBorderWidth:F
    invoke-static {v2}, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->access$200(Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;)F

    move-result v2

    invoke-virtual {v1, v2}, Lcom/makeramen/roundedimageview/RoundedDrawable;->setBorderWidth(F)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;

    .line 106
    # getter for: Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->mBorderColor:Landroid/content/res/ColorStateList;
    invoke-static {v2}, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->access$100(Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/makeramen/roundedimageview/RoundedDrawable;->setBorderColor(Landroid/content/res/ColorStateList;)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v1

    iget-object v2, p0, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder$1;->this$0:Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;

    .line 107
    # getter for: Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->mOval:Z
    invoke-static {v2}, Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;->access$000(Lcom/makeramen/roundedimageview/RoundedTransformationBuilder;)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/makeramen/roundedimageview/RoundedDrawable;->setOval(Z)Lcom/makeramen/roundedimageview/RoundedDrawable;

    move-result-object v1

    .line 108
    invoke-virtual {v1}, Lcom/makeramen/roundedimageview/RoundedDrawable;->toBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 109
    .local v0, "transformed":Landroid/graphics/Bitmap;
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 110
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 112
    :cond_0
    return-object v0
.end method
