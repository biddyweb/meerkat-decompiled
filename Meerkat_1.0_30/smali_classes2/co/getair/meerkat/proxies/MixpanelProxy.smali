.class public Lco/getair/meerkat/proxies/MixpanelProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "MixpanelProxy.java"


# instance fields
.field private meerkatApplication:Lco/getair/meerkat/MeerkatApplication;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lco/getair/meerkat/MeerkatApplication;)V
    .locals 0
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "meerkatApplication"    # Lco/getair/meerkat/MeerkatApplication;

    .prologue
    .line 18
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 19
    iput-object p2, p0, Lco/getair/meerkat/proxies/MixpanelProxy;->meerkatApplication:Lco/getair/meerkat/MeerkatApplication;

    .line 20
    return-void
.end method


# virtual methods
.method public decrementPeopleProperty(Ljava/lang/String;)V
    .locals 4
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 48
    iget-object v0, p0, Lco/getair/meerkat/proxies/MixpanelProxy;->meerkatApplication:Lco/getair/meerkat/MeerkatApplication;

    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->getPeople()Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;

    move-result-object v0

    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    invoke-interface {v0, p1, v2, v3}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;->increment(Ljava/lang/String;D)V

    .line 49
    return-void
.end method

.method public identify(Ljava/lang/String;)V
    .locals 1
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 31
    iget-object v0, p0, Lco/getair/meerkat/proxies/MixpanelProxy;->meerkatApplication:Lco/getair/meerkat/MeerkatApplication;

    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->identify(Ljava/lang/String;)V

    .line 32
    iget-object v0, p0, Lco/getair/meerkat/proxies/MixpanelProxy;->meerkatApplication:Lco/getair/meerkat/MeerkatApplication;

    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->getPeople()Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;->identify(Ljava/lang/String;)V

    .line 33
    return-void
.end method

.method public incrementPeopleProperty(Ljava/lang/String;)V
    .locals 4
    .param p1, "propertyName"    # Ljava/lang/String;

    .prologue
    .line 44
    iget-object v0, p0, Lco/getair/meerkat/proxies/MixpanelProxy;->meerkatApplication:Lco/getair/meerkat/MeerkatApplication;

    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->getPeople()Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;

    move-result-object v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-interface {v0, p1, v2, v3}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;->increment(Ljava/lang/String;D)V

    .line 45
    return-void
.end method

.method public setPeopleProperties(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "peopleProperties"    # Lorg/json/JSONObject;

    .prologue
    .line 23
    iget-object v0, p0, Lco/getair/meerkat/proxies/MixpanelProxy;->meerkatApplication:Lco/getair/meerkat/MeerkatApplication;

    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->getPeople()Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;->set(Lorg/json/JSONObject;)V

    .line 24
    return-void
.end method

.method public setSuperProperties(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "superProperties"    # Lorg/json/JSONObject;

    .prologue
    .line 36
    iget-object v0, p0, Lco/getair/meerkat/proxies/MixpanelProxy;->meerkatApplication:Lco/getair/meerkat/MeerkatApplication;

    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->registerSuperProperties(Lorg/json/JSONObject;)V

    .line 37
    return-void
.end method

.method public timeEvent(Ljava/lang/String;)V
    .locals 1
    .param p1, "eventName"    # Ljava/lang/String;

    .prologue
    .line 40
    iget-object v0, p0, Lco/getair/meerkat/proxies/MixpanelProxy;->meerkatApplication:Lco/getair/meerkat/MeerkatApplication;

    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->timeEvent(Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public trackEvent(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "properties"    # Lorg/json/JSONObject;

    .prologue
    .line 27
    iget-object v0, p0, Lco/getair/meerkat/proxies/MixpanelProxy;->meerkatApplication:Lco/getair/meerkat/MeerkatApplication;

    invoke-virtual {v0}, Lco/getair/meerkat/MeerkatApplication;->getMixpanelAPI()Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI;->track(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 28
    return-void
.end method
