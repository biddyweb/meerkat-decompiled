.class public Lco/getair/meerkat/dtos/MixpanelEventParams;
.super Ljava/lang/Object;
.source "MixpanelEventParams.java"


# instance fields
.field private eventName:Ljava/lang/String;

.field private eventProperties:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "eventProperties"    # Lorg/json/JSONObject;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lco/getair/meerkat/dtos/MixpanelEventParams;->eventName:Ljava/lang/String;

    .line 15
    iput-object p2, p0, Lco/getair/meerkat/dtos/MixpanelEventParams;->eventProperties:Lorg/json/JSONObject;

    .line 16
    return-void
.end method


# virtual methods
.method public getEventName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lco/getair/meerkat/dtos/MixpanelEventParams;->eventName:Ljava/lang/String;

    return-object v0
.end method

.method public getEventProperties()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lco/getair/meerkat/dtos/MixpanelEventParams;->eventProperties:Lorg/json/JSONObject;

    return-object v0
.end method
