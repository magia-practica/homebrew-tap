# Kept current by .github/workflows/bump.yml. Edit by hand only to change structure.
class Nodimargo < Formula
  desc "Impact analysis for Salesforce metadata"
  homepage "https://github.com/magia-practica/nodimargo-release"
  version "0.4.0"
  license :cannot_represent

  base = "https://github.com/magia-practica/nodimargo-release/releases/download/v#{version}"

  # FILL IN: replace each ASSET name with the real file name from the v0.4.0
  # release, and each SHA256 with `shasum -a 256 <file>`.
  on_macos do
    on_arm do
      url "#{base}/ASSET_MACOS_ARM64.tar.gz"
      sha256 "SHA256_MACOS_ARM64"
    end
    on_intel do
      url "#{base}/ASSET_MACOS_X86_64.tar.gz"
      sha256 "SHA256_MACOS_X86_64"
    end
  end

  on_linux do
    on_intel do
      url "#{base}/ASSET_LINUX_X86_64.tar.gz"
      sha256 "SHA256_LINUX_X86_64"
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
    assert_match version.to_s, shell_output("#{bin}/nodimargo version")
  end
end
