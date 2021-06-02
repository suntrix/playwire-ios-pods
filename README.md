# playwire-ios-sdk

This repo contains pre-compiled Playwire SDKs binaries (XCFrameworks).

## Environment Requirements

#### Bundler

`Gemfile` specifies gems dependencies used in the project. It is mandatory to use it while developing a project. For testing and debugging purposes it’s not mandatory

> [Bundler](https://bundler.io) provides a consistent environment for the project by tracking and installing the exact gems and versions that are needed. For usage and installation instructions, visit their website.

#### CocoaPods

`Podfile` lists all dependencies that are used in the workspace.

> [Cocoapods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website.

#### Fastlane

[Fastlane](https://fastlane.tools) is a tool for iOS developers to automate tedious tasks.

## List of available CLI actions

### Setup environment

- Open up Terminal, `cd` into your top-level project directory
- Install gems

```
$ bundle install
```

### Lint pod

> **Note**: Before proceeding further, please verify that `podspec` and `xcframework`'s are presented and up-to-date in top-level project's `Vendor` directory.

- Open up Terminal, `cd` into your top-level project directory

- Lint podspec before pushing to the remote

```ruby
$ bundle exec fastlane lint_pod
```

### Push pod

> **Note**: Before proceeding further, please verify that xcframework binaries are already uploaded to a repository and corresponding commit is tagged with correct version. Also please ensure that you already downloaded private spec repository to local machine using `pod repo add plw-ios-podspec <GIT_URL_TO_PRIVATE_PODSPEC_REPO>`.

- Push specified podspec (`Playwire` / `Playwire_Amazon` / `Playwire_Smaato`) to the remote

```ruby
$ bundle exec fastlane push_pod
```
