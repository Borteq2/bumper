# bumper

bumper is a simple command-line tool (CLI) that automatically bumps the version of your project, including major, minor, patch, and build versions.
## Features

- Automatically bumps versions in the pubspec.yaml file.
- Supports major, minor, patch, and build version increments.
- Interactive menu to choose the version type via terminal.
- Color-coded output for better readability.

## Installation

Add bumper to your project dependencies:

```
dart pub add bumper
```

or

```
dependencies:
    bumper: ^0.1.1
```

## Usage

Once installed, you can run the tool from the command line in the root directory of your project.

### Examples

For example, we assume that current project version is `0.0.0+0`

---

#### Major bump
```
dart run bumper major
```

Output:

```
Bumped to: 1.0.0+1
```

---

#### Minor bump


```
dart run bumper minor
```

Output:

```
Bumped to: 0.1.0+1
```

---

#### Patch bump


```
dart run bumper patch
```

Output:

```
Bumped to: 0.0.1+1
```

---

#### Bump Build Version (without changing the app version):

```
dart run bumper patch
```

Output:

```
Bumped to: 0.0.0+1
```

---

### Interactive Version Type Selection

If you run the command without any arguments, you will be presented with a menu:

```
dart run bumper
```

Menu options will be shown:

    -> major
    - minor
    - patch
    - build

Use the arrow keys to navigate and press Enter to select.



Requirements

    Dart SDK 3.5.3 or higher.
    A pubspec.yaml file in the root of your project.

How It Works

    The tool looks for the version: line in your pubspec.yaml file.
    It extracts the current version in the format X.Y.Z+N.
    Depending on the selected version type (major, minor, patch, build), it increments the appropriate part.
    The tool then overwrites the pubspec.yaml file with the new version.

Limitations

    Currently, only the version format X.Y.Z+N is supported.
    Does not support projects without a pubspec.yaml file.
    Does not support package projects (because packages don't have a build number).

Contributing

Contributions are welcome! If you have suggestions or have found an issue:

    Open an issue in the repository.
    Create a pull request with your improvements.

License

This project is licensed under the MIT License. See the LICENSE for more details.
Links

- Pub.dev: https://pub.dev/packages/bumper
- GitHub: https://github.com/Borteq2/bumper