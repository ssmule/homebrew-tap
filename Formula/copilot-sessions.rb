class CopilotSessions < Formula
  include Language::Python::Virtualenv

  desc "Terminal browser for your GitHub Copilot CLI sessions"
  homepage "https://github.com/ssmule/copilot-sessions"
  url "https://github.com/ssmule/copilot-sessions/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9def8940576be2b718757da646d4b5349417b0473c0e07eece8ad110f13074dc"
  license "MIT"

  depends_on "python@3.13"

  # No resources: cs has zero runtime dependencies, standard library only.
  def install
    virtualenv_install_with_resources
  end

  # Homebrew renders this once, immediately after a successful install. It is
  # the only post-install surface a formula controls: brew owns its own output,
  # so a formula cannot animate the install or pace it, and padding one with
  # artificial delay would only make a four-second install feel slower. What a
  # newcomer actually needs at this moment is the first command to type.
  def caveats
    <<~EOS
      cs reads the Copilot CLI session store on this machine. It opens the
      store read-only and never sends anything anywhere.

      Start here:
        cs                 browse recent sessions
        cs recent          what you worked on this week
        cs skills          which skills and agents actually get used
        cs --help          every view

      If cs reports no sessions, the Copilot CLI has not written a store on
      this machine yet. Run a Copilot CLI session first, then try again.
    EOS
  end

  test do
    assert_match "cs #{version}", shell_output("#{bin}/cs --version")
    # Prove the install is genuinely runnable, not merely present: --version can
    # be satisfied by a stub, whereas this exercises argument parsing and the
    # store-discovery path that every real invocation depends on.
    assert_match "usage", shell_output("#{bin}/cs --help").downcase
  end
end
