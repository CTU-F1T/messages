# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/).

## Unreleased
### Added
- `autoware_auto_msgs` a partial port of ROS2 package, to be used for trajectories.

## 0.1.0 - 2022-02-25
### Added
- LICENSE file.

### Removed
- `vesc_msgs`.

## 0.0.9 - 2022-02-25
### Added
- Formed a new metapackage from our custom messages.
    - `f1tenth_race==0.0.1`
    - `trajectory==0.0.3`
    - `obstacle_msgs==0.1.0`
    - `vesc_msgs==0.0.1`
    - `plan_msgs==0.0.2`
    - `command_msgs==0.0.2`

### Deprecated
- `vesc_msgs` will be removed and replaced with the whole vesc repository.
- Starting from v0.1.0 this metapackage will be available only on GitHub. This is the last version here.
