.class public Lco/getair/meerkat/FeatureFlag;
.super Ljava/lang/Object;
.source "FeatureFlag.java"


# static fields
.field public static final PHONE_VERIFICATION:Ljava/lang/String; = "phoneVerification"

.field private static final availableFeatures:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 21
    .local v0, "modifiableAvailableFeatures":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Boolean;>;"
    const-string v1, "phoneVerification"

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Lco/getair/meerkat/FeatureFlag;->availableFeatures:Ljava/util/Map;

    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isFeatureAvailable(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2
    .param p0, "featureName"    # Ljava/lang/String;

    .prologue
    .line 28
    sget-object v1, Lco/getair/meerkat/FeatureFlag;->availableFeatures:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    sget-object v1, Lco/getair/meerkat/FeatureFlag;->availableFeatures:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    move-object v0, v1

    .line 29
    .local v0, "result":Ljava/lang/Boolean;
    :goto_0
    return-object v0

    .line 28
    .end local v0    # "result":Ljava/lang/Boolean;
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method
