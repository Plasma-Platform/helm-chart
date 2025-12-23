# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [2.14] - 2025-12-23
### Changed
- WiP add PVC volume(s)

## [2.12] - 2025-11-25
### Changed
- get image pull policy from values, default IfNotPresent

## [2.11] - 2025-08-18
### Changed
- run unit tests first
- retain only two completed or failed cron jobs

## [2.9.0] - 2025-03-28
### Changed
- memcached:1.6.38-bookworm pull IfNotPresent

## [2.10] - 2025-03-28
### Changed
- IfNotPresent now default for fpm,workers and tests 

## [2.9.0] - 2025-03-28
### Changed
- memcached:1.6.38-bookworm pull IfNotPresent

## [2.8.0] - 2025-03-18
### Added
- Memory Limit for Unit Tests

## [1.6.0] - 2024-03-19
### Added
- Volume mounts for workers

## [1.5.0] - 2024-01-03
### Added
- Acceptance tests with selenium
- Conditional run for tests

## [1.0.9] - 2023-10-13
### Removed
- nginx.ingress.kubernetes.io/connection-proxy-header: close
## [1.0.8] - 2023-10-10
### Added
- nginx.ingress.kubernetes.io/proxy-buffer-size: 256k
## [1.0.5] - 2023-09-08
### Changed
- time values for startupProbe
## [1.0.4] - 2023-09-07
### Added
- Default replica count is 2 for main pod
- `cronjobs` list renamed to `cron`
- call php in appsetup for yii
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






