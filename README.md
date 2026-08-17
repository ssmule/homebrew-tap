# ssmule/homebrew-tap

Homebrew formulae for my tools.

## cs — copilot-sessions

A terminal browser for your GitHub Copilot CLI sessions: search, inspect and
resume any past session, entirely on your own machine.

Install with the **full `owner/tap/formula` name** — that taps and installs in
one step:

```bash
brew install ssmule/tap/copilot-sessions
cs --version
cs
```

Upgrade with `brew update && brew upgrade copilot-sessions`, remove with
`brew uninstall copilot-sessions` (and `brew untap ssmule/tap` to forget the
tap as well).

### Do not tap first

Homebrew 6 refuses to load a formula from a third-party tap you have not
trusted, so the two-step everyone reaches for fails:

```console
$ brew tap ssmule/tap && brew install copilot-sessions
Error: Refusing to load formula ssmule/tap/copilot-sessions from untrusted tap ssmule/tap.
```

The one-liner above is unaffected — naming the tap explicitly is itself the
trust signal. To tap first anyway, trust it once:

```bash
brew trust ssmule/tap
brew install copilot-sessions
```

The formula builds from the tagged release of
[ssmule/copilot-sessions](https://github.com/ssmule/copilot-sessions), which has
**no runtime dependencies** — Python standard library only. Homebrew still
installs it into its own virtualenv on `python@3.13`, so it never touches your
system Python or your other environments.

If `cs` runs but reports a different version than you installed, something
earlier in your `PATH` is shadowing it. Homebrew says so at install time; check
with `which -a cs`.

## Maintenance

`Formula/copilot-sessions.rb` is kept in step with upstream by
[`.github/workflows/bump.yml`](.github/workflows/bump.yml), which checks for a
newer release once a day, rewrites the `url` and `sha256`, and commits. The
checksum is always computed from the release tarball it just downloaded, so the
formula cannot be committed with a checksum that does not match the file it
points at.

Run it by hand from the Actions tab if you want a release picked up
immediately, or check what it would do without committing by running it with
**dry run** ticked.
