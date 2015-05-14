.class Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;
.super Ljava/lang/Object;
.source "Resources_cs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/ocpsoft/prettytime/i18n/Resources_cs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CsTimeFormatBuilder"
.end annotation


# instance fields
.field private names:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;",
            ">;"
        }
    .end annotation
.end field

.field private resourceKeyPrefix:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "resourceKeyPrefix"    # Ljava/lang/String;

    .prologue
    .line 228
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 224
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->names:Ljava/util/List;

    .line 229
    iput-object p1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->resourceKeyPrefix:Ljava/lang/String;

    .line 230
    return-void
.end method

.method private addName(ZLjava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;
    .locals 3
    .param p1, "isFuture"    # Z
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "limit"    # J

    .prologue
    .line 241
    if-nez p2, :cond_0

    .line 242
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 244
    :cond_0
    iget-object v0, p0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->names:Ljava/util/List;

    new-instance v1, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v1, p1, p2, v2}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsName;-><init>(ZLjava/lang/String;Ljava/lang/Long;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    return-object p0
.end method


# virtual methods
.method addFutureName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "limit"    # J

    .prologue
    .line 233
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addName(ZLjava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    return-object v0
.end method

.method addPastName(Ljava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "limit"    # J

    .prologue
    .line 237
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->addName(ZLjava/lang/String;J)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;

    move-result-object v0

    return-object v0
.end method

.method build(Ljava/util/ResourceBundle;)Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormat;
    .locals 3
    .param p1, "bundle"    # Ljava/util/ResourceBundle;

    .prologue
    .line 249
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormat;

    iget-object v1, p0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->resourceKeyPrefix:Ljava/lang/String;

    iget-object v2, p0, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormatBuilder;->names:Ljava/util/List;

    invoke-direct {v0, v1, p1, v2}, Lorg/ocpsoft/prettytime/i18n/Resources_cs$CsTimeFormat;-><init>(Ljava/lang/String;Ljava/util/ResourceBundle;Ljava/util/Collection;)V

    return-object v0
.end method
