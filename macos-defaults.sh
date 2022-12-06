# macOS defaults by Ömer Balyali<omerbalyali@gmail.com>
# All settings have been tested on macOS Ventura 13.0.1

# LOCALIZATION

# ---
# Languages

# English (US)
# defaults write -g AppleLanguages -array "en-US"

# English (GB)
# defaults write -g AppleLanguages -array "en-GB"

# English (US), Deutsch (DE)
defaults write -g AppleLanguages -array "en-US" "de-DE"

# ---
# Locale

# English (DE) - Gregorian Calendar
defaults write -g AppleLocale -string "en_DE"

# Calendar Options
# buddhist, coptic, ethiopic, ethiopic-amete-alem, hebrew, indian, islamic,
# islamic-civil, islamic-tbla, islamic-umalqura, iso8601, japanese, persian
# defaults write -g AppleLocale -string "en_DE@calendar=buddhist"

#---
# First day of week

# Monday (default for the locale)
# defaults delete -g AppleFirstWeekday 

# Tuesday = 3
# Wednesday = 4
# Thursday = 5
# Friday = 6
# Saturday = 7
# Sunday = 1
# defaults write -g AppleFirstWeekday -dict gregorian 1


#---
# Date Format

# DD.MM.YYYY (defaultfor the locale)
# defaults delete -g AppleICUDateFormatStrings

# DD/MM/YYYY
# defaults write -g AppleICUDateFormatStrings -dict \
#		1 "dd/MM/y" \
#		2 "d MMM y" \
#		3 "d MMMM y" \
#		4 "EEEE, d MMMM y"

# MM/DD/YYYY
# defaults write -g AppleICUDateFormatStrings -dict \
#		1 "M/D/yy" \
#		2 "MMM d, y" \
#		3 "MMMM d, y" \
#		4 "EEEE, MMMM d, y"

# YYYY-MM-DD
# defaults write -g AppleICUDateFormatStrings -dict 1 "y-MM-dd"

#---
# Measurement Units

# Centimeters (default for the locale)
# defaults write -g AppleMeasurementUnits Centimeters

# Inches
# defaults write -g AppleMeasurementUnits Inches

#---
# Metric Units (default for the locale)
# defaults write -g AppleMetricUnits -bool true

# Imperial Units
# defaults write -g AppleMetricUnits -bool false

#---
# Temperature

# Celcius (default for the locale)
# defaults write -g AppleTemperatureUnit Celsius

# Fahrenheit
# defaults write -g AppleTemperatureUnit Fahrenheit

#---
# Number Format

# 1.234.567,89 (default for the locale)
# defaults delete -g AppleICUNumberSymbols

# 1,234,567.89
# defaults write -g AppleICUNumberSymbols -dict \
#		0 "." \
#		1 "," \
#		10 "." \
#		17 ","

# ---
# List sort order

# Universal (default)
# defaults delete -g AppleCollationOrder

# German (Austria)
# defaults write -g AppleCollationOrder "de-AT@collation=phonebook"

# German (Phonebook sort order)
# defaults write -g AppleCollationOrder "de@collation=phonebook"

# Turkish
# defaults write -g AppleCollationOrder "tr"

# ---
# Live text

# Enabled (default)
# defaults write -g AppleLiveTextEnabled --bool true

# Disabled
# defaults write -g AppleLiveTextEnabled --bool false
