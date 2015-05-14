.class public Lco/getair/meerkat/utilities/GPSHandlerProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "GPSHandlerProxy.java"

# interfaces
.implements Landroid/location/LocationListener;


# static fields
.field public static final NOTIFICATION_LOCATION_RECEIVED:Ljava/lang/String; = "LocationReceived"


# instance fields
.field private context:Landroid/content/Context;

.field private currentCity:Ljava/lang/String;

.field private currentCountry:Ljava/lang/String;

.field private currentLocation:Landroid/location/Location;

.field private isStarted:Z

.field locationManager:Landroid/location/LocationManager;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentLocation:Landroid/location/Location;

    .line 38
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentCity:Ljava/lang/String;

    .line 39
    const-string v0, ""

    iput-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentCountry:Ljava/lang/String;

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->isStarted:Z

    .line 46
    iput-object p2, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->context:Landroid/content/Context;

    .line 47
    const-string v0, "location"

    invoke-virtual {p2, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/location/LocationManager;

    iput-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->locationManager:Landroid/location/LocationManager;

    .line 48
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/utilities/GPSHandlerProxy;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/utilities/GPSHandlerProxy;

    .prologue
    .line 30
    invoke-direct {p0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->notifyGPSLocation()V

    return-void
.end method

.method static synthetic access$100(Lco/getair/meerkat/utilities/GPSHandlerProxy;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/utilities/GPSHandlerProxy;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->enableLocationSettings(Landroid/content/Context;)V

    return-void
.end method

.method private checkGpsEnabled(Landroid/content/Context;)Z
    .locals 8
    .param p1, "displayContext"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 57
    iget-object v5, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->locationManager:Landroid/location/LocationManager;

    const-string v6, "gps"

    invoke-virtual {v5, v6}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z

    move-result v2

    .line 59
    .local v2, "gpsEnabled":Z
    new-instance v0, Lco/getair/meerkat/utilities/ApplicationPreferences;

    iget-object v5, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->context:Landroid/content/Context;

    invoke-direct {v0, v5}, Lco/getair/meerkat/utilities/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    .line 60
    .local v0, "applicationPreferences":Lco/getair/meerkat/utilities/ApplicationPreferences;
    invoke-virtual {v0}, Lco/getair/meerkat/utilities/ApplicationPreferences;->isFirstTimeRequestingLocation()Z

    move-result v3

    .line 62
    .local v3, "isFirstTimeRequestingLocation":Z
    if-nez v2, :cond_1

    .line 63
    if-eqz v3, :cond_0

    .line 64
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 65
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    const-string v5, "Your GPS is not enabled. Please go to settings to enable it."

    invoke-virtual {v1, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const-string v6, "Go to settings"

    new-instance v7, Lco/getair/meerkat/utilities/GPSHandlerProxy$2;

    invoke-direct {v7, p0, p1}, Lco/getair/meerkat/utilities/GPSHandlerProxy$2;-><init>(Lco/getair/meerkat/utilities/GPSHandlerProxy;Landroid/content/Context;)V

    .line 66
    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    iget-object v6, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->context:Landroid/content/Context;

    .line 72
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f090022

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lco/getair/meerkat/utilities/GPSHandlerProxy$1;

    invoke-direct {v7, p0}, Lco/getair/meerkat/utilities/GPSHandlerProxy$1;-><init>(Lco/getair/meerkat/utilities/GPSHandlerProxy;)V

    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 78
    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 83
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    :goto_0
    invoke-virtual {v0, v4}, Lco/getair/meerkat/utilities/ApplicationPreferences;->saveIsFirstTimeRequestingLocation(Z)V

    .line 87
    :goto_1
    return v4

    .line 80
    :cond_0
    invoke-direct {p0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->notifyGPSLocation()V

    goto :goto_0

    .line 87
    :cond_1
    const/4 v4, 0x1

    goto :goto_1
.end method

.method private enableLocationSettings(Landroid/content/Context;)V
    .locals 2
    .param p1, "displayContext"    # Landroid/content/Context;

    .prologue
    .line 96
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.LOCATION_SOURCE_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 97
    .local v0, "settingsIntent":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 98
    return-void
.end method

.method private notifyGPSLocation()V
    .locals 2

    .prologue
    .line 204
    new-instance v0, Landroid/content/Intent;

    const-string v1, "LocationReceived"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 205
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 206
    return-void
.end method

.method private updateCityCountryTexts()V
    .locals 8

    .prologue
    .line 233
    new-instance v1, Landroid/location/Geocoder;

    iget-object v2, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->context:Landroid/content/Context;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;Ljava/util/Locale;)V

    .line 238
    .local v1, "geocoder":Landroid/location/Geocoder;
    :try_start_0
    iget-object v2, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentLocation:Landroid/location/Location;

    invoke-virtual {v2}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    iget-object v4, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentLocation:Landroid/location/Location;

    invoke-virtual {v4}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    const/4 v6, 0x1

    invoke-virtual/range {v1 .. v6}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object v0

    .line 240
    .local v0, "addresses":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/Address;

    invoke-virtual {v2}, Landroid/location/Address;->getLocality()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentCity:Ljava/lang/String;

    .line 241
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/Address;

    invoke-virtual {v2}, Landroid/location/Address;->getCountryName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentCountry:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 246
    .end local v0    # "addresses":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    :goto_0
    return-void

    .line 243
    :catch_0
    move-exception v7

    .line 244
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getCurrentCity()Ljava/lang/String;
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentCity:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentCity:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public getCurrentCountry()Ljava/lang/String;
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentCountry:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentCountry:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    const-string v0, ""

    goto :goto_0
.end method

.method public getLocationText()Ljava/lang/String;
    .locals 3

    .prologue
    .line 210
    const-string v0, ""

    .line 212
    .local v0, "textToReturn":Ljava/lang/String;
    invoke-virtual {p0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->getCurrentCity()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->getCurrentCountry()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 213
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentCity:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentCountry:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 220
    :cond_0
    :goto_0
    return-object v0

    .line 214
    :cond_1
    invoke-virtual {p0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->getCurrentCountry()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 215
    invoke-virtual {p0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->getCurrentCountry()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 216
    :cond_2
    invoke-virtual {p0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->getCurrentCity()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 217
    invoke-virtual {p0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->getCurrentCity()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getUpdatedLocation()Landroid/location/Location;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentLocation:Landroid/location/Location;

    return-object v0
.end method

.method public isStarted()Z
    .locals 1

    .prologue
    .line 160
    iget-boolean v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->isStarted:Z

    return v0
.end method

.method public onLocationChanged(Landroid/location/Location;)V
    .locals 10
    .param p1, "location"    # Landroid/location/Location;

    .prologue
    .line 169
    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v2

    .line 171
    .local v2, "time":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/32 v8, 0x493e0

    sub-long v0, v6, v8

    .line 173
    .local v0, "minTime":J
    cmp-long v6, v2, v0

    if-gez v6, :cond_1

    .line 184
    :cond_0
    :goto_0
    return-void

    .line 177
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v8

    sub-long v4, v6, v8

    .line 178
    .local v4, "timeDelta":J
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    const-wide/32 v8, 0x927c0

    cmp-long v6, v6, v8

    if-gez v6, :cond_0

    .line 180
    iput-object p1, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentLocation:Landroid/location/Location;

    .line 181
    invoke-direct {p0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->updateCityCountryTexts()V

    .line 182
    invoke-direct {p0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->notifyGPSLocation()V

    goto :goto_0
.end method

.method public onProviderDisabled(Ljava/lang/String;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 193
    return-void
.end method

.method public onProviderEnabled(Ljava/lang/String;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;

    .prologue
    .line 189
    return-void
.end method

.method public onStatusChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "provider"    # Ljava/lang/String;
    .param p2, "status"    # I
    .param p3, "extras"    # Landroid/os/Bundle;

    .prologue
    .line 197
    return-void
.end method

.method public start(Landroid/content/Context;)V
    .locals 11
    .param p1, "displayContext"    # Landroid/content/Context;

    .prologue
    const/4 v10, 0x1

    .line 115
    invoke-direct {p0, p1}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->checkGpsEnabled(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 142
    :goto_0
    return-void

    .line 119
    :cond_0
    const/4 v7, 0x0

    .line 120
    .local v7, "l":Landroid/location/Location;
    const v8, 0x927c0

    .line 121
    .local v8, "maximumTimeSinceLastLocation":I
    iget-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->locationManager:Landroid/location/LocationManager;

    invoke-virtual {v0, v10}, Landroid/location/LocationManager;->getProviders(Z)Ljava/util/List;

    move-result-object v9

    .line 123
    .local v9, "providers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v6, v0, -0x1

    .local v6, "i":I
    :goto_1
    if-ltz v6, :cond_1

    .line 124
    iget-object v1, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->locationManager:Landroid/location/LocationManager;

    invoke-interface {v9, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v7

    .line 125
    if-eqz v7, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {v7}, Landroid/location/Location;->getTime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    int-to-long v2, v8

    cmp-long v0, v0, v2

    if-gez v0, :cond_2

    .line 126
    iput-object v7, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->currentLocation:Landroid/location/Location;

    .line 127
    invoke-direct {p0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->updateCityCountryTexts()V

    .line 128
    invoke-direct {p0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->notifyGPSLocation()V

    .line 135
    :cond_1
    if-nez v7, :cond_3

    .line 136
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v6, v0, -0x1

    :goto_2
    if-ltz v6, :cond_3

    .line 137
    iget-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->locationManager:Landroid/location/LocationManager;

    invoke-interface {v9, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 136
    add-int/lit8 v6, v6, -0x1

    goto :goto_2

    .line 131
    :cond_2
    const/4 v7, 0x0

    .line 123
    add-int/lit8 v6, v6, -0x1

    goto :goto_1

    .line 141
    :cond_3
    iput-boolean v10, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->isStarted:Z

    goto :goto_0
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->locationManager:Landroid/location/LocationManager;

    invoke-virtual {v0, p0}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 150
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy;->isStarted:Z

    .line 151
    return-void
.end method
