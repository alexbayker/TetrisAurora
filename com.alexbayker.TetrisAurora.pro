TARGET = com.alexbayker.TetrisAurora

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/actions.cpp \
    src/main.cpp \

HEADERS += \
    src/actions.h

DISTFILES += \
    qml/pages/GamingPage.qml \
    qml/pages/RecordsPage.qml \
    rpm/com.alexbayker.TetrisAurora.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/com.alexbayker.TetrisAurora.ts \
    translations/com.alexbayker.TetrisAurora-ru.ts \
