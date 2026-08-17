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

  test do
    assert_match "cs #{version}", shell_output("#{bin}/cs --version")
  end
end
