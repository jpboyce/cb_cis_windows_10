name 'cb_cis_windows_10'
maintainer 'Jesse Boyce'
maintainer_email 'jesse@jpboyce.org'
license 'MIT'
description 'Installs/Configures cb_cis_windows_10'
long_description 'Installs/Configures cb_cis_windows_10'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

supports windows
depends 'windows', '>= 4.0'
depends 'windows-security-policy', '>= 0.3.7'
depends 'windows_firewall', '>= 3.0'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/jpboyce/cb_cis_windows_10/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/jpboyce/cb_cis_windows_10'
