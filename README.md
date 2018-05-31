# Preparations

- [ ] 1. Git-pull your `.dotfiles`.
- [ ] 2. Update Brew and upgrade your installed packages for good measure.
- [ ] 3. `brew install terminal-notifier`
- [ ] 5. Download the [latest RubyMine](https://www.jetbrains.com/ruby/download/).
- [ ] 6. Sublime Text: verify you have these packages installed:
  - Origami
  - RubyTest
- [ ] 4. Checkout this repo, and in it:
  - [ ] `bundle`
  - [ ] Add `.ruby-version` (see below).
- [ ] 7. Configure RubyTest (see below).

## Add `.ruby-version`

Because our default `.gitignore` ignores `.ruby-version` (for good reasons), we need to add one manually, otherwise RubyTest did not seem to work:

```
cat >.ruby-version <<EOS
ruby-2.3.1
EOS
```

## Configure RubyTest

RubyTest needs some manual configuration to play nice with `chruby` and `bundler`. In Sublime Text, go to:

Sublime Text > Preferences > Package Settings > RubyTest > Settings - User

Then add:

```json
{
  "check_for_chruby": true,
  "check_for_bundler": true
}
```

In place or `check_for_chruby`, you can also use `check_for_rbenv` or `check_for_rvm`, if you are not using `chruby` yet, but this is untested, so YMMV.

To verify everything is working: open this project's folder in Sublime, open `spec/video_rental_system_spec.rb`, then press ⌘⇧T (run all specs) and the specs should run. Close the test window with ⎋ (ESC).

You can then press ⌘⇧E (run last specs) with any other file open to re-run the full specs.
