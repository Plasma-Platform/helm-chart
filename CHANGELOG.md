# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [1.0.3] - 2023-07-26
### Added
- memory limits for memcache and workers' containers
## [1.0.2] - 2023-07-26
### Added
- startupProbe and both probes can be disabled
## [1.0] - 2023-06-26
First production release
### Removed
- secrets for initContainer
### Added
- readinessProbe & startupProbe
- terminationGracePeriodSeconds: 120
- lifecycle postStart & preStop for grace shutdown






