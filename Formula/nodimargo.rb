# Kept current by .github/workflows/bump.yml. Edit by hand only to change structure.
class Nodimargo < Formula
  desc "Impact analysis for Salesforce metadata"
  homepage "https://github.com/magia-practica/nodimargo-release"
  version "0.4.0"
  license :cannot_represent

  base = "https://github.com/magia-practica/nodimargo-release/releases/download/v#{version}"

  # The sha256 values are filled in by the bump workflow.
  on_macos do
    on_arm do
      url "#{base}/nodimargo-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "#{base}/nodimargo-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "#{base}/nodimargo-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "#{base}/nodimargo-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "nodimargo"
    doc.install "README.md" if File.exist?("README.md")
    doc.install "THIRD-PARTY-LICENSES.txt" if File.exist?("THIRD-PARTY-LICENSES.txt")
  end

  def caveats
    <<~EOS
      nodiMargo is commercial software. Activate a Developer or CI license
      to remove the unlicensed reminder.

      Update with `brew upgrade nodimargo` rather than `nodimargo update`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nodimargo --version")
  end
end
