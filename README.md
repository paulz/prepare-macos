# Prepare macOS runner

1. change computer name to be unique
2. close notification windows
3. turn on **Do not disturb**
4. disable firewall
5. close Finder windows

How to use:

    - name: Prepare macOS runner
      uses: paulz/prepare-macos@v1

[Example workflow](https://github.com/paulz/prepare-macos/blob/51b000eb8a9e8cd55aa29ed264aeb2b790bab234/.github/workflows/use-action.yml#L14-L15)


# Use with UI Tests

Xcode UI Tests are sensitive to open windows and interruptions.
This action helps to prevent following system alerts during a test run:


1. Alert that computer with this name is already in use, [see example](https://github.com/actions/virtual-environments/issues/978#issuecomment-652704279)
2. Notification Center alerts
3. macOS upgrade is available alerts
4. Firewall prompt to receive incoming connections
5. Finder window blocking screenshot

### Why github action and not shell script?

1. This action can run before checkout to rename computer earlier. It takes macOS a few seconds to report the conflict.
2. Reuse across multiple projects instead of copying shell script.
3. Put together ideas to help avoiding flaky UI tests.