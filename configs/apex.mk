# Anything including updatable_apex.mk should have done so by now.
ifeq ($(TARGET_FLATTEN_APEX), false)
$(call inherit-product-if-exists, vendor/partner_modules/build/mainline_modules.mk)

ifneq ($(filter NowPlayingOverlay, $(modules-get-list)),)
PRODUCT_PACKAGES += \
	ApexNowPlayingOverlay
else
PRODUCT_PACKAGES += \
	ApexOverlay
endif

# Overlay
PRODUCT_PACKAGES += \
	ApexSettingsOverlay \
	NetworkStackOverlay \
	MediaProviderOverlay \
	PixelConfigOverlayCommonExtra \
	PixelDocumentsUIGoogleOverlayExtra \
	PixelTetheringOverlay \
	CaptivePortalLoginOverlayExtra \
	CellBroadcastReceiverOverlay \
	CellBroadcastServiceOverlayExtra \
	GoogleConfigBluetoothOverlay \
	GoogleConfigOverlayExtra \
	GooglePermissionControllerOverlayExtra

else
$(call inherit-product-if-exists, vendor/partner_modules/build/mainline_modules_flatten_apex.mk)
endif
