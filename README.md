# Starfield Reverse Engineering vcpkg Registry

## CommonLibSF

[![VCPKG_VER](https://img.shields.io/static/v1?label=vcpkg%20registry&message=2023-09-08.1&color=green&style=flat)](https://github.com/Starfield-Reverse-Engineering/Starfield-RE-vcpkg)

### Including CommonLibSF in your project

#### Using the example plugin

( TODO )

#### Starting from scratch

CommonLibSF is available as a vcpkg port. To add it to your project,

1. Create a `vcpkg-configuration.json` file in your project root (next to `vcpkg.json`) with the following OR append to your existing `vcpkg.json`:

```json
{
  "default-registry": {
    "kind": "git",
    "repository": "https://github.com/microsoft/vcpkg",
    "baseline": "962e5e39f8a25f42522f51fffc574e05a3efd26b"
  },
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/Starfield-Reverse-Engineering/Starfield-RE-vcpkg",
      "baseline": "cb5f3457d8a6ace02bead863d72a79d35a064934",
      "packages": ["commonlibsf"]
    }
  ]
}
```

2. Add CommonLibSF to the `"dependencies"` key in `vcpkg.json`:

```json
{
  "dependencies": ["commonlibsf"]
}
```

3. Add the following to your `CMakeLists.txt`:

```cmake
find_package(CommonLibSF CONFIG REQUIRED)
target_link_libraries(${PROJECT_NAME}
        PRIVATE
        CommonLibSF::CommonLibSF)
```
